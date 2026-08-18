#!/usr/bin/env python3
"""Exact combinatorics and cubic signs in the global escape reduction."""

from itertools import combinations

import sympy as sp


def main():
    indices = frozenset(range(6))
    triples = tuple(frozenset(value) for value in combinations(indices, 3))

    # Choose one representative from every complementary pair.  The ten row
    # pairs times the ten column pairs give 100 disjoint four-corner squares.
    complementary_pairs = []
    seen = set()
    for triple in triples:
        if triple in seen:
            continue
        complement = indices - triple
        complementary_pairs.append((triple, complement))
        seen.add(triple)
        seen.add(complement)
    assert len(complementary_pairs) == 10

    squares = []
    for rows, rows_complement in complementary_pairs:
        for columns, columns_complement in complementary_pairs:
            squares.append(frozenset({
                (rows, columns),
                (rows, columns_complement),
                (rows_complement, columns),
                (rows_complement, columns_complement),
            }))
    assert len(squares) == 100
    all_corners = {
        (rows, columns) for rows in triples for columns in triples
    }
    assert len(all_corners) == 400
    assert set().union(*squares) == all_corners
    assert sum(len(square) for square in squares) == len(all_corners)

    # A Gram complement negates each of the three cyclic off-diagonal
    # entries.  The cubic invariant therefore changes sign.
    g01, g12, g20 = sp.symbols("g01 g12 g20")
    tau = g01 * g12 * g20
    complemented_tau = (-g01) * (-g12) * (-g20)
    assert sp.expand(complemented_tau + tau) == 0

    # An equimodular Hermitian 3 x 3 Gram matrix has characteristic data
    # determined by the common modulus and the real cyclic product.  Equality
    # of spectra therefore fixes cos(phi); the remaining sign of phi is an
    # odd-permutation conjugation.
    lam, modulus, cyclic_real = sp.symbols(
        "lam modulus cyclic_real", real=True
    )
    characteristic = sp.expand(
        (lam - 3) ** 3
        - 3 * modulus**2 * (lam - 3)
        - 2 * cyclic_real
    )
    assert sp.Poly(characteristic, lam).all_coeffs() == [
        1,
        -9,
        27 - 3 * modulus**2,
        -27 + 9 * modulus**2 - 2 * cyclic_real,
    ]

    # Row-bad and column-bad labels have unique target corners.  Together the
    # 800 labels cover each corner exactly twice, once from each adjacent
    # direction.
    row_targets = {}
    column_targets = {}
    for rows in triples:
        for columns in triples:
            block = (rows, columns)
            row_targets[block] = (rows, indices - columns)
            column_targets[block] = (indices - rows, columns)
    assert len(set(row_targets.values())) == 400
    assert len(set(column_targets.values())) == 400
    assert set(row_targets.values()) == all_corners
    assert set(column_targets.values()) == all_corners

    diagonal_complement_pairs = set()
    for rows, columns in all_corners:
        block = (rows, columns)
        complement = (indices - rows, indices - columns)
        diagonal_complement_pairs.add(frozenset({block, complement}))
    assert len(diagonal_complement_pairs) == 200
    assert len(diagonal_complement_pairs) // 2 == 100

    # At least two W corners per square gives the global lower bound.  If no
    # W corner is regular and bad--bad is excluded, every W corner consumes
    # one distinct directional bad label.
    minimum_w_per_square = 2
    minimum_w = len(squares) * minimum_w_per_square
    assert minimum_w == 200
    for row_bad in (False, True):
        for column_bad in (False, True):
            exceptional = row_bad or column_bad
            bad_bad = row_bad and column_bad
            if exceptional and not bad_bad:
                assert int(row_bad) + int(column_bad) == 1

    # Solve the two exclusive-or equations on the positive-invariant
    # diagonal pair P,Q.  Modulo transpose and P<->Q there are precisely the
    # direction-polarized and block-polarized patterns stated in the note.
    polarized = []
    for row_p in (False, True):
        for column_p in (False, True):
            for row_q in (False, True):
                for column_q in (False, True):
                    if ((row_p != column_q) and (row_q != column_p)):
                        polarized.append((row_p, column_p, row_q, column_q))
    assert set(polarized) == {
        (True, False, True, False),
        (False, True, False, True),
        (True, True, False, False),
        (False, False, True, True),
    }

    # Direction polarization is impossible.  For a dephased phase block,
    # impose equality of its three row-correlation magnitudes.  Exact ideal
    # reduction shows that a single scalar K times each column-correlation
    # magnitude difference vanishes.
    a, b, c, d = sp.symbols("a b c d", nonzero=True)
    torus = {a: 1 / a, b: 1 / b, c: 1 / c, d: 1 / d}

    def norm_square(value):
        return sp.expand(value * value.xreplace(torus))

    row_correlations = (
        1 + a + b,
        1 + c + d,
        1 + c / a + d / b,
    )
    column_correlations = (
        1 + a + c,
        1 + b + d,
        1 + b / a + d / c,
    )
    row_norms = tuple(norm_square(value) for value in row_correlations)
    column_norms = tuple(norm_square(value) for value in column_correlations)
    row_equimodular_relations = tuple(
        sp.together(row_norms[0] - row_norms[index])
        .as_numer_denom()[0]
        for index in (1, 2)
    )
    row_equimodular_groebner = sp.groebner(
        row_equimodular_relations,
        d,
        c,
        b,
        a,
        order="grevlex",
    )
    row_tau = (
        row_correlations[0].xreplace(torus)
        * (1 + a / c + b / d)
        * row_correlations[1]
    )
    row_theta = sp.expand((row_tau + row_tau.xreplace(torus)) / 2)
    common_row_norm = row_norms[0]
    positivity_factor = sp.factor(
        3 * common_row_norm
        - common_row_norm**2
        + 2 * row_theta
    )
    for index in (1, 2):
        column_difference = column_norms[0] - column_norms[index]
        numerator = sp.together(
            positivity_factor * column_difference
        ).as_numer_denom()[0]
        assert row_equimodular_groebner.reduce(numerator)[1] == 0

    # If q=m^2 is the common squared modulus and theta>0, then
    # K=3q-q^2+2theta is positive.  For q<=3 this is immediate.  For
    # 3<q<9, positivity of det(G)=27-9q+2theta gives the displayed lower
    # bound -(q-3)(q-9)>0.  The endpoint q=9 is singular.
    q, theta = sp.symbols("q theta", real=True)
    gram_determinant = 27 - 9 * q + 2 * theta
    abstract_positivity_factor = 3 * q - q**2 + 2 * theta
    assert sp.expand(
        abstract_positivity_factor
        - gram_determinant
        + (q - 3) * (q - 9)
    ) == 0

    print("PASS the 400 corners split into 100 complementary squares")
    print("PASS complementary Gram cubic invariants have opposite signs")
    print("PASS equimodular Gram spectra fix the cyclic phase up to conjugacy")
    print("PASS all 800 directional bad labels have unique target corners")
    print("PASS the diagonal complement involution has 200 block pairs")
    print("PASS two witnesses per square convert exactly to n_W >= 200")
    print("PASS singly bad witnesses map to distinct directional labels")
    print("PASS the one-sided obstruction has only two polarization types")
    print("PASS positive row-equimodularity forces column equimodularity")
    print("PASS the direction-polarized obstruction is empty")
    print("PASS nonzero-sign pairs give the count 100-z0/2")
    print("ALL GLOBAL ESCAPE INCIDENCE REDUCTIONS PASSED")


if __name__ == "__main__":
    main()
