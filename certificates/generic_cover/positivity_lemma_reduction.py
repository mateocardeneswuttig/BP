#!/usr/bin/env python3
"""Exact algebraic identities used by the regular-seed positivity lemma."""

from __future__ import annotations

import sympy as sp


def main() -> None:
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
    f0, f1, f2 = (first.nth(k) for k in range(3))
    g0, g1, g2 = (second.nth(k) for k in range(3))
    haagerup_a = sp.expand(f2 * g0 - f0 * g2)
    haagerup_b = sp.expand(f2 * g1 - f1 * g2)

    def star(expression):
        return expression.subs(
            {x: 1 / x, s: sb, sb: s, t: tb, tb: t, r: rb, rb: r},
            simultaneous=True,
        )

    fundamental = sp.Poly(
        sp.expand(x**3 * (haagerup_a * star(haagerup_a)
                         - haagerup_b * star(haagerup_b))),
        x,
    )
    coefficients = [fundamental.nth(k) for k in range(7)]
    product_sum = sp.cancel(
        (coefficients[4] - s**2 * coefficients[6])
        / (sb * coefficients[6])
    )
    product_product = sp.cancel(coefficients[0] / coefficients[6])
    omega_n = sp.cancel(product_sum**2 / product_product - 4)

    # Gauge the three Gram entries to s=S, t=T, r=R*z.  Here S,T,R are
    # nonnegative and z is a phase; q=z+z^-1 is real on the physical torus.
    S, T, R, z = sp.symbols("S T R z", nonzero=True)
    gauged_omega = sp.cancel(
        omega_n.subs({s: S, sb: S, t: T, tb: T, r: R*z, rb: R/z})
    )
    X, Y, Z = S**2, T**2, R**2
    q = z + 1/z
    J = S*T*R*q
    p = X + Y + Z
    e2 = X*Y + X*Z + Y*Z
    e3 = X*Y*Z

    det_g = 27 - 3*p + J
    Q = sp.expand(
        4*J**2 - (p**2 - 14*p + 81)*J
        - p**3 + 45*p**2 - 567*p + 2187
        + (30 - 2*p)*e2 + (2*p - 30)*e3
    )
    L = sp.expand(
        2*R**4 - R**2*S**2*T**2
        + 5*R**2*S**2 + 5*R**2*T**2 - 45*R**2
        + 2*S**4 + 5*S**2*T**2 - 45*S**2
        + 2*T**4 - 45*T**2 + 243
    )

    p1 = R**2*T - R*S*T**2*z + 3*R*S*z + S**2*T*z**2
    p1_sharp = R**2*T*z**2 - R*S*T**2*z + 3*R*S*z + S**2*T
    p2 = -R**2*S*T*z + R*S**2 + R*T**2*z**2 + 3*S*T*z
    p2_sharp = -R**2*S*T*z + R*S**2*z**2 + R*T**2 + 3*S*T*z
    norm_denominator = sp.cancel(p1*p1_sharp*p2*p2_sharp/z**4)

    claimed = sp.cancel(
        (R**2-T**2)**2 * (L**2-det_g*Q) / norm_denominator
    )
    assert sp.cancel(gauged_omega-claimed) == 0
    assert sp.cancel(p1_sharp-z**2*p1.subs(z, 1/z)) == 0
    assert sp.cancel(p2_sharp-z**2*p2.subs(z, 1/z)) == 0

    # The fixed-Gram data of the corner E itself have the same X,Y,Z and the
    # opposite triangle invariant.  These two one-line identities implement
    # the sign split in the proof.
    det_e = 27 - 3*p - J
    # Substitute J abstractly to verify the intended sign comparison without
    # relying on the z presentation.
    j0, p0, e20, e30 = sp.symbols("j0 p0 e20 e30")
    q0 = (
        4*j0**2 - (p0**2-14*p0+81)*j0
        - p0**3+45*p0**2-567*p0+2187
        +(30-2*p0)*e20+(2*p0-30)*e30
    )
    assert sp.expand(det_g-det_e-2*J) == 0
    assert sp.expand(
        q0-q0.xreplace({j0: -j0})+2*j0*((p0-7)**2+32)
    ) == 0

    print("PASS exact normalized-product-discriminant identity")
    print("PASS denominator is the product of two torus norms")
    print("PASS det(G) = 27 - 3(X+Y+Z) + J isolated")
    print("PASS det(G) - det(E E*) = 2J")
    print("PASS Q(J)-Q(-J) = -2J((p-7)^2+32)")
    print("ALL POSITIVITY-REDUCTION IDENTITIES PASSED")


if __name__ == "__main__":
    main()
