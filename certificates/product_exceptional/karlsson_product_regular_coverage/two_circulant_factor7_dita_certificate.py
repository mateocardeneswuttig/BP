#!/usr/bin/env python3
"""Exact reduction of nine primary two-circulant divisors to Diţă.

On the physical torus, the divisor gamma+phi=0 splits into

    (gamma,epsilon,phi)=(-beta^2, i beta, beta^2),
    (gamma,epsilon,phi)=(-beta^2,-i beta, beta^2).

The divisor epsilon+gamma*phi=0 similarly splits into

    (gamma,epsilon,phi)=(-beta^2, i beta, i/beta),
    (gamma,epsilon,phi)=(-beta^2,-i beta,-i/beta).

The corresponding X_6 matrices are explicitly equivalent to Diţă matrices
with parameters drawn from beta^-3 and i*beta^-3.  Together with
``dita_product_regular_slice.py``, this proves that every class on this
divisor is product regular except the already known class [H_x].

Factors 8 and 17 reduce to a four-unit-phasor equation.  The elementary
opposite-pair lemma splits that equation into six explicitly listed
one-parameter branches for each factor.  Every branch is again matched
exactly to Diţă's family below.
"""

from __future__ import annotations

import sympy as sp

import dita_product_regular_slice as D
import two_circulant_guard_pullback as G


BETA = G.B
U = sp.symbols("u", nonzero=True)
I = sp.I


FACTOR7_BRANCHES = (
    {
        "substitution": {G.G: -BETA**2, G.E: I*BETA, G.P: BETA**2},
        "dita_parameter": I/BETA**3,
        "rows": (0, 2, 3, 4, 1, 5),
        "columns": (5, 1, 2, 0, 3, 4),
    },
    {
        "substitution": {G.G: -BETA**2, G.E: -I*BETA, G.P: BETA**2},
        "dita_parameter": 1/BETA**3,
        "rows": (0, 2, 3, 4, 1, 5),
        "columns": (2, 0, 5, 1, 4, 3),
    },
)


FACTOR18_BRANCHES = (
    {
        "substitution": {G.G: -BETA**2, G.E: I*BETA, G.P: I/BETA},
        "dita_parameter": 1/BETA**3,
        "rows": (0, 1, 2, 4, 3, 5),
        "columns": (1, 0, 5, 3, 4, 2),
    },
    {
        "substitution": {G.G: -BETA**2, G.E: -I*BETA, G.P: -I/BETA},
        "dita_parameter": I/BETA**3,
        "rows": (0, 1, 2, 4, 3, 5),
        "columns": (5, 3, 1, 0, 2, 4),
    },
)


FACTOR16_BRANCHES = (
    {
        "substitution": {G.G: -1/BETA, G.E: I*BETA, G.P: BETA**2},
        "dita_parameter": 1/BETA**3,
        "rows": (0, 1, 2, 4, 5, 3),
        "columns": (2, 4, 0, 1, 3, 5),
    },
    {
        "substitution": {G.G: -1/BETA, G.E: -I*BETA, G.P: BETA**2},
        "dita_parameter": I/BETA**3,
        "rows": (0, 1, 2, 4, 5, 3),
        "columns": (0, 1, 2, 4, 5, 3),
    },
)


def quadrilateral_branches(gamma, witnesses):
    """Build the six branches of the common factors-8/17 equation."""
    answer = []
    specifications = (
        (1, 1/BETA**2, I/BETA),
        (-1, 1/BETA**2, -I/BETA),
        (1, I*BETA, BETA**2),
        (-1, -I*BETA, BETA**2),
        (1, I*BETA, I/BETA),
        (-1, -I*BETA, -I/BETA),
    )
    for (sign, epsilon, phi), witness in zip(specifications, witnesses):
        rows, columns, dita_constant = witness
        answer.append({
            "substitution": {G.G: gamma, G.E: epsilon, G.P: phi},
            "dita_parameter": dita_constant/BETA**3,
            "rows": rows,
            "columns": columns,
        })
    return tuple(answer)


FACTOR17_BRANCHES = quadrilateral_branches(-BETA**2, (
    ((0, 3, 1, 4, 2, 5), (5, 2, 3, 0, 1, 4), I),
    ((0, 3, 1, 4, 2, 5), (3, 0, 5, 2, 4, 1), 1),
    ((0, 2, 3, 4, 1, 5), (5, 1, 2, 0, 3, 4), I),
    ((0, 2, 3, 4, 1, 5), (2, 0, 5, 1, 4, 3), 1),
    ((0, 1, 2, 4, 3, 5), (1, 0, 5, 3, 4, 2), 1),
    ((0, 1, 2, 4, 3, 5), (5, 3, 1, 0, 2, 4), I),
))


FACTOR8_BRANCHES = quadrilateral_branches(-1/BETA, (
    ((0, 2, 3, 4, 5, 1), (3, 4, 0, 2, 1, 5), 1),
    ((0, 2, 3, 4, 5, 1), (0, 2, 3, 4, 5, 1), I),
    ((0, 1, 2, 4, 5, 3), (2, 4, 0, 1, 3, 5), 1),
    ((0, 1, 2, 4, 5, 3), (0, 1, 2, 4, 5, 3), I),
    ((0, 3, 1, 4, 5, 2), (0, 3, 1, 4, 5, 2), I),
    ((0, 3, 1, 4, 5, 2), (1, 4, 0, 3, 2, 5), 1),
))


FACTOR9_BRANCHES = (
    {
        "substitution": {
            G.B: -U**2, G.G: U, G.E: I/U, G.P: 1/U**2,
        },
        "dita_parameter": I/U**3,
        "rows": (0, 2, 1, 5, 3, 4),
        "columns": (4, 3, 2, 0, 1, 5),
    },
    {
        "substitution": {
            G.B: -U**2, G.G: U, G.E: -I/U, G.P: 1/U**2,
        },
        "dita_parameter": 1/U**3,
        "rows": (0, 2, 1, 5, 3, 4),
        "columns": (2, 0, 4, 3, 5, 1),
    },
)


def dephase_after_permutation(matrix, rows, columns):
    source = matrix.extract(rows, columns)
    pivot = source[0, 0]
    return sp.Matrix(6, 6, lambda i, j: sp.cancel(
        source[i, j]*pivot/(source[i, 0]*source[0, j])
    ))


def verify_factor7_physical_branch_reduction():
    """Verify the algebra behind the factor-7 unit-circle argument."""
    relation_on_divisor = sp.factor(G.family_relation().subs(G.P, -G.G))
    expected = -G.G*(BETA**2*G.E-BETA*G.E**2+BETA*G.G+G.E*G.G)
    assert sp.expand(relation_on_divisor-expected) == 0

    # Since beta, epsilon and gamma are phases, the bracket equation gives
    # gamma=beta*epsilon*(epsilon-beta)/(beta+epsilon).  The denominator
    # cannot vanish: epsilon=-beta would make the bracket -2*beta^3.
    bracket = BETA**2*G.E-BETA*G.E**2+BETA*G.G+G.E*G.G
    assert sp.factor(bracket.subs(G.E, -BETA)) == -2*BETA**3
    solved_gamma = BETA*G.E*(G.E-BETA)/(BETA+G.E)
    assert sp.factor(bracket.subs(G.G, solved_gamma)) == 0

    # |gamma|=1 is therefore equivalent to
    # |epsilon-beta|=|epsilon+beta|.  For phases this says
    # Re(epsilon/beta)=0, hence epsilon/beta is i or -i.  Substitution into
    # the rational formula gives gamma=-beta^2 and phi=beta^2.
    for epsilon in (I*BETA, -I*BETA):
        assert sp.cancel(solved_gamma.subs(G.E, epsilon)+BETA**2) == 0


def verify_factor18_physical_branch_reduction():
    """Factor 18 yields exactly the same two physical branches."""
    # epsilon=-gamma*phi reduces the family equation to the bracket below.
    relation = sp.factor(G.family_relation().subs(G.E, -G.G*G.P))
    bracket = BETA**2*G.P+BETA*G.G*G.P**2-BETA+G.G*G.P
    assert sp.expand(relation+G.G*G.P*bracket) == 0

    # Put u=beta*phi.  Solving the bracket for gamma gives
    # gamma=beta*(1-u)/(phi*(1+u)); its denominator cannot vanish because
    # u=-1 makes the unsolved bracket equal -2*beta.
    assert sp.factor(bracket.subs(G.P, -1/BETA)) == -2*BETA
    solved_gamma = BETA*(1-BETA*G.P)/(G.P*(1+BETA*G.P))
    assert sp.factor(bracket.subs(G.G, solved_gamma)) == 0

    # The phase condition |gamma|=1 forces |1-u|=|1+u|, hence u=+-i.
    # Substitution gives precisely the branches used above.
    for sign in (1, -1):
        phi = sign*I/BETA
        gamma = sp.cancel(solved_gamma.subs(G.P, phi))
        epsilon = sp.cancel(-gamma*phi)
        assert sp.cancel(gamma+BETA**2) == 0
        assert sp.cancel(epsilon-sign*I*BETA) == 0
        assert sp.cancel(phi-sign*I/BETA) == 0


def verify_factor16_physical_branch_reduction():
    """Factor 16 also consists of two Diţă branches on the phase torus."""
    # beta=-gamma*phi, hence phi=-beta/gamma.  The family relation becomes
    # a nonzero monomial times the following bracket.
    relation = sp.factor(G.family_relation().subs(G.P, -BETA/G.G))
    bracket = G.E**2*G.G-BETA*G.E*G.G-G.E-BETA
    assert sp.cancel(relation-BETA*bracket) == 0

    # Solving for gamma gives (epsilon+beta)/(epsilon*(epsilon-beta)).
    # epsilon=beta is impossible, and equality of moduli again forces
    # epsilon/beta=+-i.
    assert sp.factor(bracket.subs(G.E, BETA)) == -2*BETA
    solved_gamma = (G.E+BETA)/(G.E*(G.E-BETA))
    assert sp.factor(bracket.subs(G.G, solved_gamma)) == 0
    for sign in (1, -1):
        epsilon = sign*I*BETA
        gamma = sp.cancel(solved_gamma.subs(G.E, epsilon))
        phi = sp.cancel(-BETA/gamma)
        assert sp.cancel(gamma+1/BETA) == 0
        assert sp.cancel(phi-BETA**2) == 0


def verify_quadrilateral_physical_branch_reduction():
    """Verify the common equation and its three opposite-pair splittings."""
    core = BETA**2*G.E*G.P-G.E**2-G.E*G.P**2-G.P
    relation8 = sp.factor(G.family_relation().subs(G.G, -1/BETA))
    relation17 = sp.factor(G.family_relation().subs(G.G, -BETA**2))
    assert sp.cancel(relation8-core) == 0
    assert sp.cancel(relation17-BETA**3*core) == 0

    # Dividing core=0 by epsilon*phi gives
    # epsilon/phi + phi + 1/epsilon - beta^2 = 0.
    # Four unit complex numbers with zero sum form two opposite pairs.
    # Its three pairings give exactly the six sign choices listed above.
    for branches in (FACTOR8_BRANCHES, FACTOR17_BRANCHES):
        for branch in branches:
            assert sp.cancel(core.subs(branch["substitution"])) == 0


def verify_additional_quadrilateral_divisors():
    """Factors 9, 11, 12 and 21 reduce to already certified branches."""
    relation = G.family_relation()

    # Factor 9: phi=-1/beta.  Its four phasors have only the third
    # opposite-pairing, which gives beta=-gamma^2 and epsilon=+-i/gamma.
    core9 = BETA*G.E**2*G.G-BETA*G.E-G.E*G.G**2-G.G
    assert sp.cancel(relation.subs(G.P, -1/BETA)-core9) == 0
    for branch in FACTOR9_BRANCHES:
        assert sp.cancel(core9.subs(branch["substitution"])) == 0

    # Factor 11: beta*phi=-epsilon*gamma.  Its sole physical pairing is
    # gamma=-1/beta, epsilon=+-i*beta, phi=+-i/beta (matching factor 8 C).
    core11 = BETA*G.E*G.G+BETA-G.E**2*G.G+G.E
    sub11 = {G.P: -G.E*G.G/BETA}
    assert sp.cancel(relation.subs(sub11)+G.E*G.G**2*core11/BETA) == 0
    for branch in FACTOR8_BRANCHES[4:]:
        assert sp.cancel(core11.subs(branch["substitution"])) == 0

    # Factors 12 and 21 share a four-phasor core.  Only one pairing survives,
    # giving epsilon=beta^-2 and phi=+-i/beta; gamma distinguishes the two
    # copies and matches factor 17 A or factor 8 A respectively.
    core12 = BETA**2*G.E*G.P-BETA*G.E-BETA*G.P**2-G.P
    assert sp.cancel(relation.subs(G.G, -1/G.E)-core12) == 0
    assert sp.cancel(relation.subs(G.G, -BETA*G.E)-BETA*G.E**2*core12) == 0
    for branch in FACTOR17_BRANCHES[:2]+FACTOR8_BRANCHES[:2]:
        assert sp.cancel(core12.subs(branch["substitution"])) == 0


def verify_dita_equivalences():
    source = G.x_matrix()
    branches = (
        FACTOR7_BRANCHES+FACTOR8_BRANCHES+FACTOR16_BRANCHES
        +FACTOR17_BRANCHES+FACTOR18_BRANCHES+FACTOR9_BRANCHES
    )
    for branch in branches:
        matrix = source.subs(branch["substitution"])
        normalized = dephase_after_permutation(
            matrix, branch["rows"], branch["columns"]
        )
        target = D.dita(branch["dita_parameter"])
        for actual, expected in zip(normalized, target):
            assert sp.cancel(actual-expected) == 0


def main():
    factors = G.primary_irreducible_factors()
    assert sp.expand(factors[6]-(G.G+G.P)) == 0
    assert sp.expand(factors[7]-(G.B*G.G+1)) == 0
    assert sp.expand(factors[8]-(G.B*G.P+1)) == 0
    assert sp.expand(factors[10]-(G.B*G.P+G.E*G.G)) == 0
    assert sp.expand(factors[11]-(G.E*G.G+1)) == 0
    assert sp.expand(factors[15]-(G.B+G.G*G.P)) == 0
    assert sp.expand(factors[16]-(G.B**2+G.G)) == 0
    assert sp.expand(factors[17]-(G.E+G.G*G.P)) == 0
    assert sp.expand(factors[20]-(G.B*G.E+G.G)) == 0
    verify_factor7_physical_branch_reduction()
    verify_factor16_physical_branch_reduction()
    verify_factor18_physical_branch_reduction()
    verify_quadrilateral_physical_branch_reduction()
    verify_additional_quadrilateral_divisors()
    verify_dita_equivalences()
    D.verify_guard_factorization()
    D.verify_exceptional_equivalences()
    print("PASS factors 7-9, 11-12, 16-18 and 21 split into phase branches")
    print("PASS all distinct branches are explicitly equivalent to Dita(c)")
    print("CERTIFIED: all nine divisors are product regular away from [H_x]")


if __name__ == "__main__":
    main()
