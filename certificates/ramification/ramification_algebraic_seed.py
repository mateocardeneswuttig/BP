#!/usr/bin/env python3
"""Exact branch certificate and numerical completion for an algebraic seed.

Take a=b=c=i and d=(1+i*xi)/(1-i*xi), where xi is the unique real root
of the irreducible degree-seven polynomial P below.  The exact calculation
shows that the residual product discriminant specializes to (xi+1)P(xi),
up to a nonzero rational scalar and cleared denominators.  The root xi=-1
is the separate cyclotomic/degenerate solution; the root of P gives the
regular example recorded in RAMIFICATION_SUBCLASS.md.
"""

from __future__ import annotations

import numpy as np
import sympy as sp

from ramification_subclass_examples import reconstruct
from scan_lower_block_pairing import build_symbolic_functions


def residual_branch_polynomial():
    x, y = sp.symbols("x y", nonzero=True)
    s, sb, t, tb, r, rb = sp.symbols("s sb t tb r rb", nonzero=True)
    h = (x - s) * (1 / y - tb) * (y / x - r)
    hb = (1 / x - sb) * (y - t) * (x / y - rb)
    sigma2 = (x - s) * (1 / x - sb)
    delta2 = (y - t) * (1 / y - tb)
    psi2 = (y / x - r) * (x / y - rb)
    first = sp.Poly(sp.cancel(x * y * (h - hb)), y)
    second = sp.Poly(
        sp.cancel(x * y * (h - 4 + sigma2 + delta2 + psi2)), y
    )
    f0, f1, f2 = (first.coeff_monomial(y**k) for k in range(3))
    g0, g1, g2 = (second.coeff_monomial(y**k) for k in range(3))
    A = sp.expand(f2 * g0 - f0 * g2)
    B = sp.expand(f2 * g1 - f1 * g2)

    def star(expr):
        return expr.subs(
            {x: 1 / x, s: sb, sb: s, t: tb, tb: t, r: rb, rb: r},
            simultaneous=True,
        )

    fundamental = sp.Poly(
        sp.expand(x**3 * (A * star(A) - B * star(B))), x
    )
    coefficients = [fundamental.coeff_monomial(x**k) for k in range(7)]
    discriminant = sp.expand(
        (coefficients[4] - s**2 * coefficients[6]) ** 2
        - 4 * sb**2 * coefficients[6] * coefficients[0]
    )
    omega = sp.cancel(discriminant / (sb**2 * (r * rb - t * tb) ** 2))
    return (s, sb, t, tb, r, rb), omega


def primitive_integer_polynomial(poly):
    primitive = sp.Poly(sp.primitive(poly)[1], poly.gens[0])
    denominator = sp.ilcm(*[coefficient.q for coefficient in primitive.all_coeffs()])
    coefficients = [int(coefficient * denominator) for coefficient in primitive.all_coeffs()]
    content = abs(sp.igcd(*coefficients))
    coefficients = [coefficient // content for coefficient in coefficients]
    if coefficients[0] < 0:
        coefficients = [-coefficient for coefficient in coefficients]
    return sp.Poly.from_list(coefficients, poly.gens[0])


def main():
    xi, d = sp.symbols("xi d", real=True)
    P = sp.Poly(
        16 * xi**7
        + 120 * xi**6
        + 428 * xi**5
        + 952 * xi**4
        + 1363 * xi**3
        + 1231 * xi**2
        + 664 * xi
        + 176,
        xi,
    )
    factorization = sp.factor_list(P)
    if factorization != (1, [(P, 1)]):
        raise AssertionError("degree-seven seed polynomial is reducible")
    if P.count_roots(-sp.oo, sp.oo) != 1:
        raise AssertionError("degree-seven seed polynomial lacks a unique real root")

    (s, sb, t, tb, r, rb), omega = residual_branch_polynomial()
    phase = sp.I
    substitution = {
        s: -(1 + phase + phase),
        sb: -(1 + 1 / phase + 1 / phase),
        t: -(1 + phase + d),
        tb: -(1 + 1 / phase + 1 / d),
        r: -(1 + phase / phase + d / phase),
        rb: -(1 + phase / phase + phase / d),
    }
    specialized = sp.cancel(omega.subs(substitution))
    numerator = sp.together(specialized).as_numer_denom()[0]
    cayley = sp.cancel(numerator.subs(d, (1 + sp.I * xi) / (1 - sp.I * xi)))
    cayley_numerator = sp.expand(sp.together(cayley).as_numer_denom()[0])
    real_part = sp.Poly(sp.re(cayley_numerator.expand(complex=True)), xi, domain=sp.QQ)
    imaginary_part = sp.Poly(sp.im(cayley_numerator.expand(complex=True)), xi, domain=sp.QQ)
    common = primitive_integer_polynomial(sp.gcd(real_part, imaginary_part))
    expected = sp.Poly((xi + 1) * P.as_expr(), xi)
    if common != expected:
        raise AssertionError("algebraic seed branch polynomial changed")

    real_root = next(
        root
        for root in sp.nroots(P, n=40, maxsteps=200)
        if abs(sp.im(root)) < sp.Rational(1, 10) ** 30
    )
    xi_numeric = float(sp.re(real_root))
    d_numeric = (1 + 1j * xi_numeric) / (1 - 1j * xi_numeric)
    coefficient_function = build_symbolic_functions()
    example = reconstruct(
        [np.pi / 2, np.pi / 2, np.pi / 2, np.angle(d_numeric)],
        coefficient_function,
    )
    if example["hadamard_residual"] >= 1e-10:
        raise AssertionError("algebraic seed completion is not numerically Hadamard")
    if example["minimum_karlsson_equation"] <= 1e-2:
        raise AssertionError("algebraic seed is too close to the Karlsson locus")
    if example["tao_cross_ratio_witness"] <= 1e-2:
        raise AssertionError("algebraic seed is too close to the Tao orbit")

    print("PASS exact residual branch specialization is (xi+1)P(xi)")
    print("PASS P is irreducible over Q and has exactly one real root")
    print(f"xi = {xi_numeric:.15f}")
    print(f"d = {d_numeric.real:.15f} {d_numeric.imag:+.15f}i")
    print(f"Hadamard residual {example['hadamard_residual']:.3e}")
    print(f"minimum Karlsson equation {example['minimum_karlsson_equation']:.3e}")
    print(f"Tao cross-ratio witness {example['tao_cross_ratio_witness']:.3e}")
    print("ALL ALGEBRAIC RAMIFICATION-SEED CHECKS PASSED")


if __name__ == "__main__":
    main()
