#!/usr/bin/env python3
"""Exact rescue-frame certificate for primary two-circulant factor 10.

On epsilon*gamma=1, the base rescue frame (023,013) is regular outside the
previously certified primary divisors, except for one zero-dimensional
branch.  That branch consists of six cube-root points, all covered by the
single exact rescue frame rows=(1,2,5), columns=(0,1,3).

The individual unit-ideal checks are intentionally recomputed over QQ.  The
script is slower than the finite cyclotomic checks but leaves no numerical
or genericity assumption in the result.
"""

from __future__ import annotations

import sympy as sp

import two_circulant_guard_pullback as G
import two_circulant_factor4_rescue_certificate as F4


Q, Z = sp.symbols("q z")
B, GAMMA, EPSILON, PHI = G.B, G.G, G.E, G.P
VARIABLES = (Z, Q, PHI, EPSILON, GAMMA, B)
RESOLVED_FACTORS = (1, 2, 3, 4, 5, 7, 8, 9, 11, 12, 14, 16, 17, 18, 21)
BASE_RESCUE = ((0, 2, 3), (0, 1, 3))
FINITE_RESCUE = ((1, 2, 5), (0, 1, 3))

ALL_FACTORS = G.primary_irreducible_factors()
FAMILY = G.family_relation()
PRIMARY = ALL_FACTORS[9]
RESOLVED_PRODUCT = sp.prod(
    ALL_FACTORS[index-1] for index in RESOLVED_FACTORS
)


def reciprocal_numerator(expression):
    return sp.together(expression.xreplace({
        B: 1/B, GAMMA: 1/GAMMA, EPSILON: 1/EPSILON, PHI: 1/PHI,
    })).as_numer_denom()[0]


def equations(extra=()):
    return (
        FAMILY, reciprocal_numerator(FAMILY),
        PRIMARY, reciprocal_numerator(PRIMARY),
        Q*B*GAMMA*EPSILON*PHI-1,
        Z*RESOLVED_PRODUCT-1,
        *extra,
    )


def basis_for(guard, order="grevlex"):
    return sp.groebner(equations((
        guard, reciprocal_numerator(guard),
    )), *VARIABLES, order=order, domain=sp.QQ)


def is_unit_ideal(basis):
    return len(basis.polys) == 1 and basis.polys[0].as_expr() == 1


def verify_base_rescue_reduction():
    assert sp.expand(PRIMARY-(EPSILON*GAMMA-1)) == 0
    guards = F4.irreducible_guard_factors(*BASE_RESCUE)
    assert len(guards) == 21
    for index, guard in enumerate(guards, start=1):
        if index == 11:
            continue
        print(f"checking factor-10 rescue guard {index}/21", flush=True)
        assert is_unit_ideal(basis_for(guard)), f"guard {index} did not close"

    residual = basis_for(guards[10], order="lex")
    consequences = (
        PHI+B**2+GAMMA,
        EPSILON+B**2*GAMMA+B,
        GAMMA**2+B**2*GAMMA+B,
        B**3-1,
        GAMMA**3-1,
        PHI**3-1,
        EPSILON**3-1,
    )
    for consequence in consequences:
        assert residual.reduce(consequence)[1] == 0
    return guards


RESIDUAL_POINTS_3 = (
    (0, 1, 2, 2),
    (0, 2, 1, 1),
    (1, 0, 0, 1),
    (1, 1, 2, 0),
    (2, 0, 0, 2),
    (2, 2, 1, 0),
)


def verify_finite_rescue():
    family = sp.Poly(G.family_relation(), *F4.PHASE_VARIABLES, domain=sp.QQ)
    primary = sp.Poly(
        PRIMARY, *F4.PHASE_VARIABLES, domain=sp.QQ
    )
    guards = tuple(
        G.numerator(expression).as_expr()
        for expression in F4.frame_guard_expressions(*FINITE_RESCUE)
    )
    assert len(guards) == 11
    for point in RESIDUAL_POINTS_3:
        assert F4.evaluate_at_cube_roots(family, point) == F4.ZERO3
        assert F4.evaluate_at_cube_roots(primary, point) == F4.ZERO3
        assert all(
            F4.evaluate_at_cube_roots(guard, point) != F4.ZERO3
            for guard in guards
        )


def main():
    verify_base_rescue_reduction()
    verify_finite_rescue()
    print("PASS factor 10 base-rescue unit-ideal reduction")
    print("PASS six residual cube-root points have one exact rescue frame")
    print("CERTIFIED: factor 10 is product regular away from [H_x]")


if __name__ == "__main__":
    main()
