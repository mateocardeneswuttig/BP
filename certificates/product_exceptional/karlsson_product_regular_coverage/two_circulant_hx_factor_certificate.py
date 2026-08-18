#!/usr/bin/env python3
"""Exact certificate for the two finite bad divisors of the X_6 model.

For the primary ordered frame of ``two_circulant_guard_pullback.py``, guard
factors 5 and 14 look different before imposing the two-circulant family
equation.  On the physical algebraic torus they define the same degree-12
scheme.  This script proves, using exact rational Groebner reduction, that:

* both saturated ideals have the displayed six-element reduced basis;
* every complex solution has beta, gamma, epsilon and phi among the twelfth
  roots of unity;
* exactly twelve phase quadruples solve either system; and
* the corresponding twelve X_6 matrices are all equivalent to H_x.

No floating-point calculation or numerical root matching is used.
"""

from __future__ import annotations

from itertools import product

import sympy as sp

import exact_product_exceptional_karlsson as HX
import two_circulant_guard_pullback as G


Q = sp.symbols("q")
B, GAMMA, EPSILON, PHI = G.B, G.G, G.E, G.P
VARIABLES = (Q, PHI, EPSILON, GAMMA, B)


def reciprocal_numerator(expression):
    return sp.together(expression.xreplace({
        B: 1/B, GAMMA: 1/GAMMA, EPSILON: 1/EPSILON, PHI: 1/PHI,
    })).as_numer_denom()[0]


EXPECTED_BASIS = (
    -B**2*EPSILON-B*PHI+Q+1,
    B**2*EPSILON**2+PHI**2,
    -B**2*EPSILON-B*PHI+EPSILON*PHI+1,
    B**2*EPSILON-B*EPSILON**2+EPSILON**3-1,
    B**2+GAMMA,
    (B-1)*(B**2+B+1),
)


EXPECTED_SOLUTIONS = (
    (0, 6, 9, 0),
    (0, 6, 0, 3),
    (0, 6, 0, 9),
    (0, 6, 3, 0),
    (4, 2, 1, 8),
    (4, 2, 4, 11),
    (4, 2, 4, 5),
    (4, 2, 7, 8),
    (8, 10, 5, 4),
    (8, 10, 8, 7),
    (8, 10, 8, 1),
    (8, 10, 11, 4),
)


# For each of the four solutions above a fixed beta value, these row and
# column permutations redephase X_6 to the displayed representative H_x.
EQUIVALENCE_WITNESSES = (
    ((0, 1, 4, 3, 2, 5), (5, 3, 0, 2, 1, 4)),
    ((0, 1, 2, 3, 4, 5), (0, 1, 2, 3, 4, 5)),
    ((0, 1, 3, 5, 2, 4), (1, 2, 4, 3, 0, 5)),
    ((0, 1, 2, 4, 5, 3), (1, 5, 3, 2, 0, 4)),
)*3


def saturated_generators(factor):
    family = G.family_relation()
    return (
        family,
        reciprocal_numerator(family),
        factor,
        reciprocal_numerator(factor),
        Q*B*GAMMA*EPSILON*PHI-1,
    )


def certify_groebner_basis(factor):
    generators = saturated_generators(factor)
    basis = sp.groebner(generators, *VARIABLES, order="lex", domain=sp.QQ)
    actual = tuple(sp.expand(item.as_expr()) for item in basis.polys)
    expected = tuple(sp.expand(item) for item in EXPECTED_BASIS)
    assert actual == expected

    # Record both ideal containments explicitly rather than relying only on
    # the printed shape of SymPy's reduced basis.
    expected_basis = sp.groebner(expected, *VARIABLES, order="lex", domain=sp.QQ)
    assert all(expected_basis.reduce(item)[1] == 0 for item in generators)
    assert all(basis.reduce(item)[1] == 0 for item in expected)

    # These reductions make the finite enumeration below exhaustive over C.
    for variable in (B, GAMMA, EPSILON, PHI, Q):
        assert basis.reduce(variable**12-1)[1] == 0
    return basis


def exact_polynomial_value(polynomial, exponents):
    """Evaluate a QQ polynomial at powers of zeta_12 in HX's exact ring."""
    answer = HX.ZERO
    poly = sp.Poly(polynomial, Q, B, GAMMA, EPSILON, PHI, domain=sp.QQ)
    for monomial, coefficient in poly.terms():
        assert coefficient.q == 1
        exponent = sum(power*value for power, value in zip(monomial, exponents))
        answer = HX.add(answer, HX.scale(int(coefficient), HX.ROOTS[exponent % 12]))
    return answer


def enumerate_phase_solutions(factor):
    generators = saturated_generators(factor)
    solutions = []
    for b, gamma, epsilon, phi in product(range(12), repeat=4):
        q = (-b-gamma-epsilon-phi) % 12
        values = (q, b, gamma, epsilon, phi)
        if all(exact_polynomial_value(item, values) == HX.ZERO for item in generators):
            solutions.append((b, gamma, epsilon, phi))
    return tuple(solutions)


def x_exponents(parameters):
    """The X_6(beta,gamma,epsilon,phi) entries as zeta_12 exponents."""
    b, gamma, epsilon, phi = parameters
    return tuple(tuple(value % 12 for value in row) for row in (
        (0, 0, 0, 0, 0, 0),
        (0, 6, 6-gamma-epsilon, 6-b-phi, -gamma-epsilon, -b-phi),
        (0, 6+epsilon-b, 6, 6+epsilon-gamma-phi,
         epsilon-gamma-phi, epsilon-b),
        (0, 6+phi-gamma, 6+phi-b-epsilon, 6,
         phi-gamma, phi-b-epsilon),
        (0, epsilon-b, phi-b-epsilon, -b-phi, -b-gamma, gamma-2*b),
        (0, phi-gamma, -gamma-epsilon, epsilon-gamma-phi,
         b-2*gamma, -b-gamma),
    ))


def redephase_exponents(matrix, row_order, column_order):
    return tuple(tuple(
        (matrix[row_order[i]][column_order[j]]
         +matrix[row_order[0]][column_order[0]]
         -matrix[row_order[i]][column_order[0]]
         -matrix[row_order[0]][column_order[j]]) % 12
        for j in range(6)
    ) for i in range(6))


def certify_equivalence_to_hx():
    assert len(EXPECTED_SOLUTIONS) == len(EQUIVALENCE_WITNESSES) == 12
    for parameters, (row_order, column_order) in zip(
        EXPECTED_SOLUTIONS, EQUIVALENCE_WITNESSES
    ):
        matrix = x_exponents(parameters)
        assert redephase_exponents(matrix, row_order, column_order) == HX.EXPONENTS


def main():
    factors = G.primary_irreducible_factors()
    factor_5, factor_14 = factors[4], factors[13]
    basis_5 = certify_groebner_basis(factor_5)
    basis_14 = certify_groebner_basis(factor_14)
    assert tuple(item.as_expr() for item in basis_5.polys) == tuple(
        item.as_expr() for item in basis_14.polys
    )

    solutions_5 = enumerate_phase_solutions(factor_5)
    solutions_14 = enumerate_phase_solutions(factor_14)
    assert tuple(sorted(solutions_5)) == tuple(sorted(EXPECTED_SOLUTIONS))
    assert tuple(sorted(solutions_14)) == tuple(sorted(EXPECTED_SOLUTIONS))
    certify_equivalence_to_hx()

    print("factor 5 saturated degree: 12")
    print("factor 14 saturated degree: 12")
    print("physical phase solutions: 12")
    print("equivalence classes represented: 1 ([H_x])")
    print("TWO-CIRCULANT H_X FACTOR CERTIFICATE PASSED")


if __name__ == "__main__":
    main()
