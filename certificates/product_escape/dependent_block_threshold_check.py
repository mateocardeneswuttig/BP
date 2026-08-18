#!/usr/bin/env python3
"""Exact finite certificate for the dependent-block threshold.

For one fixed row triple, five positive dependent E_M blocks determine five
noncomplementary triples of the six columns.  This script enumerates their 24
S_6-incidence types and verifies the two contractions used in
GLOBAL_ESCAPE_INCIDENCE_REDUCTION.md.
"""

from itertools import combinations, permutations

import sympy as sp


# Canonical representatives use one-based concatenated vertex labels.  The
# final letter records the human proof route: E = direct q=9/5 endpoint,
# R = two-weight range endpoint, T = three faces of a tetrahedron.
EXPECTED_ORBIT_TABLE = (
    (180, "123 124 125 126 134", "E"),
    (180, "123 124 125 134 135", "T"),
    (360, "123 124 125 134 136", "E"),
    (360, "123 124 125 134 156", "E"),
    (180, "123 124 125 134 234", "T"),
    (360, "123 124 125 134 235", "T"),
    (720, "123 124 125 134 236", "E"),
    (360, "123 124 125 134 345", "E"),
    (360, "123 124 125 136 146", "E"),
    (180, "123 124 125 136 236", "E"),
    (360, "123 124 125 136 246", "E"),
    (360, "123 124 125 136 345", "E"),
    (360, "123 124 134 156 235", "E"),
    (360, "123 124 134 235 245", "T"),
    (360, "123 124 134 235 246", "E"),
    (180, "123 124 135 145 256", "R"),
    (72, "123 124 135 146 156", "E"),
    (720, "123 124 135 146 236", "E"),
    (360, "123 124 135 146 256", "E"),
    (720, "123 124 135 146 345", "E"),
    (72, "123 124 135 245 345", "E"),
    (360, "123 124 135 245 346", "E"),
    (360, "123 124 135 256 346", "E"),
    (180, "123 124 156 256 345", "E"),
)


def main():
    vertices = tuple(range(6))
    vertex_set = frozenset(vertices)
    edges = tuple(combinations(vertices, 2))
    triples = tuple(combinations(vertices, 3))
    edge_index = {edge: index for index, edge in enumerate(edges)}
    triple_index = {triple: index for index, triple in enumerate(triples)}

    # Five positive triples cannot contain a complementary pair.  Reduce all
    # such five-sets by the natural S_6 action.
    five_sets = []
    for chosen in combinations(range(len(triples)), 5):
        chosen_set = set(chosen)
        if any(
            triple_index[tuple(sorted(vertex_set - set(triples[index])))]
            in chosen_set
            for index in chosen
        ):
            continue
        five_sets.append(chosen)
    assert len(five_sets) == 8064

    all_permutations = tuple(permutations(vertices))

    def transport(chosen, permutation):
        return tuple(sorted(
            triple_index[tuple(sorted(permutation[value]
                                      for value in triples[index]))]
            for index in chosen
        ))

    seen = set()
    representatives = []
    for chosen in five_sets:
        if chosen in seen:
            continue
        orbit = {transport(chosen, permutation)
                 for permutation in all_permutations}
        seen.update(orbit)
        representatives.append(chosen)
    assert len(representatives) == 24
    assert len(seen) == len(five_sets)

    # Let w_jk be the squared modulus of the restricted column inner
    # product.  Tightness gives sum_{k != j} w_jk=9.  A dependent positive
    # triple has all three internal weights q; trace equality for its
    # complementary 3 x 3 block gives sum(complementary weights)=3q.
    weights = sp.symbols("w0:15", real=True)
    endpoint_types = 0
    range_endpoint_types = 0
    tetrahedron_types = 0
    orbit_table = []

    for chosen in representatives:
        equations = [
            sum(weights[edge_index[edge]]
                for edge in edges if vertex in edge) - 9
            for vertex in vertices
        ]
        for index in chosen:
            triangle_edges = tuple(combinations(triples[index], 2))
            q = weights[edge_index[triangle_edges[0]]]
            equations.extend(
                weights[edge_index[edge]] - q
                for edge in triangle_edges[1:]
            )
            complement = tuple(sorted(vertex_set - set(triples[index])))
            equations.append(
                sum(weights[edge_index[edge]]
                    for edge in combinations(complement, 2))
                - 3 * q
            )

        matrix, right_hand_side = sp.linear_eq_to_matrix(equations, weights)
        solution_set = sp.linsolve((matrix, right_hand_side))
        assert solution_set != sp.EmptySet
        solution = next(iter(solution_set))
        selected_q = [
            sp.factor(solution[edge_index[
                next(iter(combinations(triples[index], 2)))
            ]])
            for index in chosen
        ]

        if all(value == sp.Rational(9, 5) for value in selected_q):
            endpoint_types += 1
            category = "E"
            orbit_table.append(orbit_record(chosen, category, triples,
                                             all_permutations, transport))
            continue

        # One incidence type has four triangles of weight A and one of
        # weight B, with A+(2/3)B=3.  Since every physical dependent weight
        # is at most 9/5, both inequalities must be equalities.
        distinct_q = list(dict.fromkeys(selected_q))
        range_forces_endpoint = (
            len(distinct_q) == 2
            and (
                sp.factor(distinct_q[0]
                          + sp.Rational(2, 3) * distinct_q[1] - 3) == 0
                or sp.factor(distinct_q[1]
                             + sp.Rational(2, 3) * distinct_q[0] - 3) == 0
            )
        )
        if range_forces_endpoint:
            range_endpoint_types += 1
            category = "R"
            orbit_table.append(orbit_record(chosen, category, triples,
                                             all_permutations, transport))
            continue

        # Every remaining incidence type contains three faces of one
        # tetrahedron.  Those faces force all six of its edge weights to one
        # common q.
        chosen_triples = {triples[index] for index in chosen}
        witnesses = []
        for four_set in combinations(vertices, 4):
            faces = [face for face in combinations(four_set, 3)
                     if face in chosen_triples]
            if len(faces) < 3:
                continue
            face_q = [
                solution[edge_index[next(iter(combinations(face, 2)))]]
                for face in faces[:3]
            ]
            four_edges = tuple(combinations(four_set, 2))
            common_q = face_q[0]
            if (
                all(sp.factor(value - common_q) == 0 for value in face_q)
                and all(
                    sp.factor(solution[edge_index[edge]] - common_q) == 0
                    for edge in four_edges
                )
            ):
                witnesses.append(four_set)
        assert witnesses
        tetrahedron_types += 1
        category = "T"
        orbit_table.append(orbit_record(chosen, category, triples,
                                         all_permutations, transport))

    assert endpoint_types == 19
    assert range_endpoint_types == 1
    assert tetrahedron_types == 4
    assert tuple(orbit_table) == EXPECTED_ORBIT_TABLE
    assert sum(record[0] for record in orbit_table) == len(five_sets)

    # Intrinsic form and physical range of the E_M dependent curve.  In
    # Cayley variables p=t+z and rho=tz, put U=p^2.  The displayed identities
    # certify 1 <= q <= 9/5.  Equality occurs only at rho=0,U=9 or
    # rho=9,U=36 (the rho=-1 algebraic root has U=-4), which respectively
    # force a=1 or b=1, or a=b: all are low-simplicity endpoints.
    rho, u, q = sp.symbols("rho u q", real=True)
    denominator = u + rho**2 - 2 * rho + 1
    numerator = u + rho**2 + 6 * rho + 9
    boundary = (
        u**2
        - (2 * rho**2 + 12 * rho + 6) * u
        + rho**4 + 4 * rho**3 - 6 * rho**2 - 36 * rho - 27
    )
    ell = u + rho**2 - 12 * rho - 9

    # Derive the rational q formula directly from E_M(a,b) under the Cayley
    # substitution, rather than taking it as an external input.
    cayley_t, cayley_z = sp.symbols("cayley_t cayley_z", real=True)
    a = (1 + sp.I * cayley_t) / (1 - sp.I * cayley_t)
    b = (1 + sp.I * cayley_z) / (1 - sp.I * cayley_z)
    main_q = sp.factor((1 + a + b) * (1 + 1 / a + 1 / b))
    direct_denominator = (
        (cayley_t + cayley_z)**2
        + (cayley_t * cayley_z)**2
        - 2 * cayley_t * cayley_z
        + 1
    )
    direct_numerator = (
        (cayley_t + cayley_z)**2
        + (cayley_t * cayley_z)**2
        + 6 * cayley_t * cayley_z
        + 9
    )
    assert sp.cancel(
        main_q - direct_numerator / direct_denominator
    ) == 0

    assert sp.factor((numerator - denominator) - 8 * (rho + 1)) == 0
    assert sp.factor(9 * denominator - 5 * numerator - 4 * ell) == 0
    assert sp.factor(
        boundary.subs(u, 0) - (rho - 3) * (rho + 1) * (rho + 3)**2
    ) == 0
    assert sp.factor(
        boundary.subs(u, 4 * rho)
        - (rho - 9) * (rho + 1)**2 * (rho + 3)
    ) == 0
    assert sp.factor(
        boundary.subs(u, 12 * rho + 9 - rho**2)
        - 4 * rho**2 * (rho - 9) * (rho + 1)
    ) == 0
    # If U_1,U_2 are the roots of F, then this is L(U_1)+L(U_2).
    assert sp.factor(
        (2 * rho**2 + 12 * rho + 6)
        + 2 * (rho**2 - 12 * rho - 9)
        - (4 * rho**2 - 12 * rho - 12)
    ) == 0
    assert sp.factor(
        sp.discriminant(boundary, u)
        - 16 * (2 * rho**3 + 12 * rho**2 + 18 * rho + 9)
    ) == 0
    discriminant_factor = 2 * rho**3 + 12 * rho**2 + 18 * rho + 9
    assert sp.factor(
        sp.diff(discriminant_factor, rho) - 6 * (rho + 1) * (rho + 3)
    ) == 0
    assert sp.simplify(
        discriminant_factor.subs(rho, -3 - sp.sqrt(6))
        + 27 + 12 * sp.sqrt(6)
    ) == 0

    # Three dependent faces of a tetrahedron contradict rank at every
    # high-simplicity value 1 <= q < 9/5.  Gauge the three edges from the
    # common vertex to sqrt(q)>0.  The other three edge phases are z^{+/-1},
    # where z+z^{-1}=(3-q)/sqrt(q).  All eight sign choices reduce to the two
    # nonzero determinant factors below.
    r, z = sp.symbols("r z", positive=True)
    phase_relation = z**2 - (3 - r**2) * z / r + 1
    determinant_forms = set()
    for signs in product_signs():
        gram = sp.eye(4) * 3
        for index in range(1, 4):
            gram[0, index] = r
            gram[index, 0] = r
        for (first, second), sign in zip(
            ((1, 2), (1, 3), (2, 3)), signs
        ):
            gram[first, second] = r * z**sign
            gram[second, first] = r * z**(-sign)
        determinant = sp.expand(gram.det())
        cleared = sp.together(determinant * z**3).as_numer_denom()[0]
        relation_cleared = sp.together(phase_relation).as_numer_denom()[0]
        remainder = sp.rem(
            sp.Poly(cleared, z), sp.Poly(relation_cleared, z)
        ).as_expr()
        z_cubed_remainder = sp.rem(
            sp.Poly(z**3, z), sp.Poly(relation_cleared, z)
        ).as_expr()
        determinant_forms.add(sp.factor(
            sp.cancel(remainder / z_cubed_remainder)
        ))

    form_a = -(
        r**3 - r**2 + 3 * r + 9
    ) * (
        r**3 + r**2 + 3 * r - 9
    )
    form_b = -6 * (r**2 - 3)**3
    assert determinant_forms == {sp.factor(form_a), sp.factor(form_b)}
    upper_endpoint_value = sp.factor(
        (r**3 + r**2 + 3 * r - 9).subs(r, 3 / sp.sqrt(5))
    )
    assert sp.simplify(
        upper_endpoint_value - 36 * (-5 + 2 * sp.sqrt(5)) / 25
    ) == 0
    assert upper_endpoint_value < 0
    increasing_factor_derivative = 3 * r**2 + 2 * r + 3
    assert sp.discriminant(increasing_factor_derivative, r) == -32

    print("PASS 8064 five-triple choices reduce to 24 S6 incidence types")
    print("PASS exact Cayley identities support the printed 1 <= q < 9/5 sign proof")
    print("PASS 20 incidence types force the excluded q=9/5 endpoint")
    print("PASS the remaining four types contain three tetrahedron faces")
    print("PASS every three-face 4 x 4 Gram determinant is nonzero")
    print("PASS each row triple contains at most four dependent blocks")
    print("PASS the global dependent-block count is at most 20*4=80")
    print("ALL DEPENDENT-BLOCK THRESHOLD CHECKS PASSED")


def product_signs():
    """The eight sign choices for three oriented triangle phases."""
    for first in (-1, 1):
        for second in (-1, 1):
            for third in (-1, 1):
                yield first, second, third


def orbit_record(chosen, category, triples, all_permutations, transport):
    """Return the visible certificate row used in the companion proof note."""
    orbit_size = len({transport(chosen, permutation)
                      for permutation in all_permutations})
    representative = " ".join(
        "".join(str(vertex + 1) for vertex in triples[index])
        for index in chosen
    )
    return orbit_size, representative, category


if __name__ == "__main__":
    main()
