#!/usr/bin/env python3
"""Exact equality of horizontal and vertical residual discriminants."""

import sympy as sp


def main():
    x, y = sp.symbols("x y", nonzero=True)
    s, sb, t, tb, r, rb = sp.symbols("s sb t tb r rb", nonzero=True)
    a, b, c, d = sp.symbols("a b c d", nonzero=True)

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
            {
                x: 1 / x,
                s: sb,
                sb: s,
                t: tb,
                tb: t,
                r: rb,
                rb: r,
            },
            simultaneous=True,
        )

    fundamental = sp.Poly(
        sp.expand(x**3 * (A * star(A) - B * star(B))), x
    )
    coefficients = [
        fundamental.coeff_monomial(x**k) for k in range(7)
    ]
    numerator_u = coefficients[4] - s**2 * coefficients[6]
    discriminant = sp.expand(
        numerator_u**2 - 4 * sb**2 * coefficients[6] * coefficients[0]
    )
    omega_fraction = sp.cancel(
        discriminant / (sb**2 * (r * rb - t * tb) ** 2)
    )
    omega, denominator = omega_fraction.as_numer_denom()
    if denominator != 1:
        raise AssertionError("residual discriminant is not polynomial")

    horizontal_data = {
        s: -(1 + a + b),
        sb: -(1 + 1 / a + 1 / b),
        t: -(1 + c + d),
        tb: -(1 + 1 / c + 1 / d),
        r: -(1 + c / a + d / b),
        rb: -(1 + a / c + b / d),
    }
    horizontal = sp.cancel(omega.subs(horizontal_data))
    vertical = horizontal.xreplace({b: c, c: b})
    difference = sp.cancel(horizontal - vertical)
    if difference != 0:
        raise AssertionError(
            "horizontal and vertical residual discriminants differ:\n"
            f"{sp.factor(difference)}"
        )

    print("PASS horizontal residual discriminant")
    print("PASS vertical residual obtained by b<->c")
    print("PASS exact horizontal-vertical residual equality")
    print("PASS horizontal and vertical quadratic covers have the same square class")
    print("ALL HORIZONTAL-VERTICAL COVER CHECKS PASSED")


if __name__ == "__main__":
    main()
