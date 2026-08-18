#!/usr/bin/env python3
"""Exact rescue-frame certificate for primary two-circulant factor 4.

The primary divisor is beta*phi=1.  After the two-circulant and reciprocal
relations are imposed it forces beta^3=1 and phi=beta^2.  We use the rescue
frame rows=(0,2,3), columns=(0,1,3).  Away from the nine Diţă divisors
already covered by ``two_circulant_factor7_dita_certificate.py``, failure of
this frame reduces to:

* six phase points, all explicitly equivalent to H_x; or
* twelve cube-root points, covered exactly by two further rescue frames.

Every ideal computation is over QQ.  Torus impossibility uses the lopsided
relation q^2+4q+1=0, which cannot hold for |q|=1 because 4>1+1.
"""

from __future__ import annotations

import sympy as sp

import exact_product_exceptional_karlsson as HX
import two_circulant_guard_pullback as G


Q, Z, W = sp.symbols("q z w")
B, GAMMA, EPSILON, PHI = G.B, G.G, G.E, G.P
PHASE_VARIABLES = (B, GAMMA, EPSILON, PHI)
VARIABLES = (Z, Q, PHI, EPSILON, GAMMA, B)

PRIMARY_FACTOR = 4
DITA_FACTORS = (7, 8, 9, 11, 12, 16, 17, 18, 21)
BASE_RESCUE = ((0, 2, 3), (0, 1, 3))
FINITE_RESCUES = (
    ((0, 2, 3), (1, 2, 4)),
    ((1, 2, 4), (0, 2, 5)),
)


def reciprocal_numerator(expression):
    return sp.together(expression.xreplace({
        B: 1/B, GAMMA: 1/GAMMA, EPSILON: 1/EPSILON, PHI: 1/PHI,
    })).as_numer_denom()[0]


def frame_guard_expressions(rows, columns):
    chart = G.redephase(G.x_matrix(), rows, columns)
    return (
        chart[:3, :3].det(),
        chart[:3, 3:].det(),
        chart[3:, :3].det(),
        *G.side_guards(chart[:3, 3:]),
        *G.side_guards(chart[3:, :3].T),
    )


def irreducible_guard_factors(rows, columns):
    answer = {}
    for expression in frame_guard_expressions(rows, columns):
        polynomial = G.numerator(expression)
        for factor, _multiplicity in sp.factor_list(polynomial.as_expr())[1]:
            item = sp.Poly(factor, *PHASE_VARIABLES, domain=sp.QQ)
            if len(item.terms()) == 1:
                continue
            monic = item.monic()
            answer[tuple(sorted(monic.rep.to_dict().items()))] = monic.as_expr()
    return tuple(answer.values())


def base_equations(extra=()):
    factors = G.primary_irreducible_factors()
    family = G.family_relation()
    primary = factors[PRIMARY_FACTOR-1]
    known = sp.prod(factors[index-1] for index in DITA_FACTORS)
    return (
        family,
        reciprocal_numerator(family),
        primary,
        reciprocal_numerator(primary),
        Q*B*GAMMA*EPSILON*PHI-1,
        Z*known-1,
        *extra,
    )


def basis_for(guard, extra=(), variables=VARIABLES, order="grevlex"):
    return sp.groebner(base_equations((
        guard, reciprocal_numerator(guard), *extra,
    )), *variables, order=order, domain=sp.QQ)


def is_unit_ideal(basis):
    return len(basis.polys) == 1 and basis.polys[0].as_expr() == 1


def verify_lopsided_witness(basis):
    witness = Q**2+4*Q+1
    assert basis.reduce(witness)[1] == 0
    # Since q is a phase, |4q|=4 but |q^2+1|<=2.


def verify_rescue_reduction():
    factors = G.primary_irreducible_factors()
    assert sp.expand(factors[3]-(B*PHI-1)) == 0
    guards = irreducible_guard_factors(*BASE_RESCUE)
    assert len(guards) == 21

    unit_indices = (5, 9, 10, 13, 14, 16, 18, 21)
    lopsided_indices = (1, 2, 3, 4, 11, 15, 20)
    for index in unit_indices:
        assert is_unit_ideal(basis_for(guards[index-1]))
    for index in lopsided_indices:
        verify_lopsided_witness(basis_for(guards[index-1]))

    # Guard 6 has no additional physical branch away from guard 12.
    guard6, guard12 = guards[5], guards[11]
    variables = (W,)+VARIABLES
    basis6 = basis_for(
        guard6, extra=(W*guard12-1,), variables=variables
    )
    verify_lopsided_witness(basis6)

    return guards


def assert_reductions(basis, equations):
    for equation in equations:
        assert basis.reduce(equation)[1] == 0


def verify_structured_residuals(guards):
    # Guards 7, 8 and 17 have the same physical consequence: six points.
    hx_equations = (
        PHI-B**2,
        EPSILON+B,
        GAMMA**2+B,
        B**3-1,
    )
    for index in (7, 8, 17):
        basis = basis_for(guards[index-1], order="lex")
        assert_reductions(basis, hx_equations)
        assert basis.reduce(GAMMA**12-1)[1] == 0

    # Guards 12 and 19 each leave six cube-root solutions.
    common = (PHI-B**2, GAMMA**2+B**2*GAMMA+B, B**3-1, GAMMA**3-1)
    basis12 = basis_for(guards[11], order="lex")
    assert_reductions(basis12, common+(EPSILON-B**2*GAMMA,))
    basis19 = basis_for(guards[18], order="lex")
    assert_reductions(basis19, common+(EPSILON+B**2*GAMMA+B,))


HX_POINTS_36 = (
    (0, 9, 18, 0),
    (0, 27, 18, 0),
    (12, 15, 30, 24),
    (12, 33, 30, 24),
    (24, 3, 6, 12),
    (24, 21, 6, 12),
)

HX_WITNESSES = (
    ((0, 1, 3, 5, 4, 2), (0, 3, 5, 4, 1, 2)),
    ((0, 3, 2, 5, 1, 4), (0, 5, 2, 4, 3, 1)),
    ((0, 3, 2, 5, 1, 4), (0, 5, 2, 4, 3, 1)),
    ((0, 1, 3, 5, 4, 2), (0, 3, 5, 4, 1, 2)),
    ((0, 3, 2, 5, 1, 4), (0, 5, 2, 4, 3, 1)),
    ((0, 1, 3, 5, 4, 2), (0, 3, 5, 4, 1, 2)),
)


def x_exponents(parameters, modulus=36):
    b, gamma, epsilon, phi = parameters
    minus = modulus//2
    return tuple(tuple(value % modulus for value in row) for row in (
        (0, 0, 0, 0, 0, 0),
        (0, minus, minus-gamma-epsilon, minus-b-phi,
         -gamma-epsilon, -b-phi),
        (0, minus+epsilon-b, minus, minus+epsilon-gamma-phi,
         epsilon-gamma-phi, epsilon-b),
        (0, minus+phi-gamma, minus+phi-b-epsilon, minus,
         phi-gamma, phi-b-epsilon),
        (0, epsilon-b, phi-b-epsilon, -b-phi, -b-gamma, gamma-2*b),
        (0, phi-gamma, -gamma-epsilon, epsilon-gamma-phi,
         b-2*gamma, -b-gamma),
    ))


def redephase_exponents(matrix, rows, columns, modulus=36):
    return tuple(tuple((
        matrix[rows[i]][columns[j]]+matrix[rows[0]][columns[0]]
        -matrix[rows[i]][columns[0]]-matrix[rows[0]][columns[j]]
    ) % modulus for j in range(6)) for i in range(6))


def verify_hx_equivalences():
    target = tuple(tuple(3*value % 36 for value in row) for row in HX.EXPONENTS)
    for point, (rows, columns) in zip(HX_POINTS_36, HX_WITNESSES):
        assert redephase_exponents(x_exponents(point), rows, columns) == target


REGULAR_POINTS_3 = (
    (0, 1, 1, 0), (0, 2, 1, 0),
    (0, 1, 2, 0), (0, 2, 2, 0),
    (1, 0, 0, 2), (1, 1, 0, 2),
    (1, 0, 2, 2), (1, 1, 2, 2),
    (2, 0, 0, 1), (2, 2, 0, 1),
    (2, 0, 1, 1), (2, 2, 1, 1),
)

# Frame 0 or 1 from FINITE_RESCUES for each point above.
REGULAR_FRAME_INDEX = (1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0)


ROOT3 = ((sp.Integer(1), sp.Integer(0)),
         (sp.Integer(0), sp.Integer(1)),
         (sp.Integer(-1), sp.Integer(-1)))
ZERO3 = (sp.Integer(0), sp.Integer(0))


def add3(left, right):
    return (left[0]+right[0], left[1]+right[1])


def scale3(value, item):
    return (value*item[0], value*item[1])


def evaluate_at_cube_roots(polynomial, exponents):
    poly = sp.Poly(polynomial, *PHASE_VARIABLES, domain=sp.QQ)
    answer = ZERO3
    for monomial, coefficient in poly.terms():
        exponent = sum(a*b for a, b in zip(monomial, exponents)) % 3
        answer = add3(answer, scale3(coefficient, ROOT3[exponent]))
    return answer


def verify_finite_rescue_frames():
    family = sp.Poly(G.family_relation(), *PHASE_VARIABLES, domain=sp.QQ)
    primary = sp.Poly(
        G.primary_irreducible_factors()[3], *PHASE_VARIABLES, domain=sp.QQ
    )
    guard_sets = tuple(tuple(
        G.numerator(expression).as_expr()
        for expression in frame_guard_expressions(*frame)
    ) for frame in FINITE_RESCUES)
    assert all(len(items) == 11 for items in guard_sets)

    for point, frame_index in zip(REGULAR_POINTS_3, REGULAR_FRAME_INDEX):
        assert evaluate_at_cube_roots(family, point) == ZERO3
        assert evaluate_at_cube_roots(primary, point) == ZERO3
        assert all(
            evaluate_at_cube_roots(guard, point) != ZERO3
            for guard in guard_sets[frame_index]
        )


def main():
    guards = verify_rescue_reduction()
    verify_structured_residuals(guards)
    verify_hx_equivalences()
    verify_finite_rescue_frames()
    print("PASS factor 4 base-rescue ideal reduction")
    print("PASS six residual points are equivalent to H_x")
    print("PASS twelve residual points have exact product-regular rescue frames")
    print("CERTIFIED: factor 4 is product regular away from [H_x]")


if __name__ == "__main__":
    main()
