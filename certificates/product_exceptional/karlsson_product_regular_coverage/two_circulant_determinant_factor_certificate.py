#!/usr/bin/env python3
"""Exact proof that primary two-circulant factors 1--3 have no phase zero.

The three factors are the determinant guards of the primary frame.  After
adjoining the family equation, reciprocal-conjugate equations and the torus
saturation q*beta*gamma*epsilon*phi=1, exact Groebner reduction produces a
lopsided relation.  A Laurent polynomial in phases cannot vanish when one
coefficient is larger in modulus than the sum of all remaining coefficients.
"""

from __future__ import annotations

import sympy as sp

import two_circulant_guard_pullback as G


Q = sp.symbols("q")
B, GAMMA, EPSILON, PHI = G.B, G.G, G.E, G.P
VARIABLES = (Q, PHI, EPSILON, GAMMA, B)


def reciprocal_numerator(expression):
    return sp.together(expression.xreplace({
        B: 1/B, GAMMA: 1/GAMMA, EPSILON: 1/EPSILON, PHI: 1/PHI,
    })).as_numer_denom()[0]


def ideal_basis(factor):
    family = G.family_relation()
    return sp.groebner((
        family,
        reciprocal_numerator(family),
        factor,
        reciprocal_numerator(factor),
        Q*B*GAMMA*EPSILON*PHI-1,
    ), *VARIABLES, order="grevlex", domain=sp.QQ)


def verify_lopsided(polynomial, dominant_coefficient):
    coefficients = [abs(value) for _monomial, value in sp.Poly(
        polynomial, *VARIABLES, domain=sp.QQ
    ).terms()]
    assert dominant_coefficient in coefficients
    assert dominant_coefficient > sum(coefficients)-dominant_coefficient


def main():
    factors = G.primary_irreducible_factors()
    witnesses = (
        B*GAMMA+15*B*PHI*Q+3*B*PHI+4*Q+1,
        Q**2+4*Q+1,
        Q**2+4*Q+1,
    )
    dominant = (sp.Integer(15), sp.Integer(4), sp.Integer(4))
    for index, (factor, witness, coefficient) in enumerate(
        zip(factors[:3], witnesses, dominant), start=1
    ):
        basis = ideal_basis(factor)
        assert basis.reduce(witness)[1] == 0
        verify_lopsided(witness, coefficient)
        print(f"PASS factor {index}: lopsided torus contradiction")
    print("CERTIFIED: determinant factors 1--3 have no physical zeros")


if __name__ == "__main__":
    main()
