#!/usr/bin/env python3
"""Exact product-regular guard pullback on affine-Fourier frames.

This module constructs the *actual-lift* guards, rather than only the
finite-fibre guards used by the earlier Fourier-containment certificate.
It is intentionally separate from the manuscript certificates until the
common-zero calculation is complete.
"""

from __future__ import annotations

from pathlib import Path
import sys

import sympy as sp


ATLAS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ATLAS))

import exact_lower_block_specialization as EL  # noqa: E402
from fourier_boundary_witness_reduction import (  # noqa: E402
    OMEGA,
    Z1,
    Z2,
    fourier_matrix,
    redephase,
    star,
)

# Some pivot orderings normalize a Q(omega) polynomial by a coefficient that
# SymPy represents using i and sqrt(3) separately.  Work in the harmless
# exact overfield Q(i,sqrt(3)) so all orderings share one coefficient domain.
EXTENSION = [sp.I, sp.sqrt(3)]
NORMALIZATION_DOMAIN = sp.QQ.algebraic_field(*EXTENSION)
DOMAIN = sp.QQ.algebraic_field(OMEGA)


def monic_numerator(expression):
    numerator = sp.together(expression).as_numer_denom()[0]
    expanded = sp.expand(numerator)
    try:
        polynomial = sp.Poly(expanded, Z1, Z2, domain=DOMAIN)
    except sp.polys.polyerrors.CoercionFailed:
        # Clearing a denominator can multiply an otherwise Q(omega)
        # polynomial by i or sqrt(3).  Monic normalization in the overfield
        # removes that irrelevant scalar; the result must descend again.
        normalized = sp.Poly(
            expanded, Z1, Z2, domain=NORMALIZATION_DOMAIN
        ).monic().as_expr()
        polynomial = sp.Poly(normalized, Z1, Z2, domain=DOMAIN)
    return polynomial.monic().as_expr()


def moments(block):
    xs = tuple(block[1, j] for j in range(3))
    ys = tuple(block[2, j] for j in range(3))
    s = sum(xs)
    t = sum(ys)
    r = sum(star(xs[j])*ys[j] for j in range(3))
    return xs, ys, {
        EL.s: s,
        EL.sb: star(s),
        EL.t: t,
        EL.tb: star(t),
        EL.r: r,
        EL.rb: star(r),
    }


def side_guards(block):
    xs, ys, substitution = moments(block)
    c6 = EL.FUNDAMENTAL_COEFFICIENTS[6].subs(substitution)
    delta = EL.r*EL.rb-EL.t*EL.tb
    delta = delta.subs(substitution)
    companion_denominator = EL.B_GENERIC.subs(substitution)

    guards = [c6, delta]
    guards.extend(xs[i]-xs[j] for i in range(3) for j in range(i+1, 3))
    guards.extend(
        companion_denominator.subs(EL.x, root)
        for root in xs
    )

    # The actual entries must satisfy the uncancelled companion relation.
    companion_numerator = EL.A_GENERIC.subs(substitution)
    for root, companion in zip(xs, ys):
        identity = sp.together(
            companion_numerator.subs(EL.x, root)
            + companion*companion_denominator.subs(EL.x, root)
        ).as_numer_denom()[0]
        if sp.Poly(
            sp.expand(identity), Z1, Z2, domain=NORMALIZATION_DOMAIN
        ).as_expr() != 0:
            raise AssertionError("actual Fourier companion identity failed")
    return [monic_numerator(guard) for guard in guards]


def frame_guards(rows, columns, transpose=False):
    matrix = fourier_matrix()
    if transpose:
        matrix = matrix.T
    chart = redephase(matrix, rows, columns)
    e, b, c = chart[:3, :3], chart[:3, 3:], chart[3:, :3]
    guards = [monic_numerator(e.det()), monic_numerator(b.det()), monic_numerator(c.det())]
    guards.extend(side_guards(b))
    guards.extend(side_guards(c.T))
    if len(guards) != 19 or any(guard == 0 for guard in guards):
        raise AssertionError("incomplete or identically singular product frame")
    return guards


def main():
    frame = ((0, 2, 5), (0, 2, 5))
    for transpose in (False, True):
        guards = frame_guards(*frame, transpose=transpose)
        print(f"{'transpose' if transpose else 'affine'}: {len(guards)} nonzero guards")
        for index, guard in enumerate(guards, start=1):
            factors = sp.factor_list(guard, Z1, Z2, domain=DOMAIN)[1]
            degree = sp.Poly(guard, Z1, Z2, domain=DOMAIN).total_degree()
            print(f"  G{index}: degree={degree}, irreducible_factors={len(factors)}")
    print("FOURIER PRODUCT-GUARD REDUCTION PASSED")


if __name__ == "__main__":
    main()
