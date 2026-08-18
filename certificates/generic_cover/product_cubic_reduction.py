#!/usr/bin/env python3
"""Exact product-cubic reduction of Szollosi's fundamental sextic.

The calculation is performed with independent fixed-Gram variables.  Bars
are represented by separate symbols and the torus involution swaps each
symbol with its barred partner while sending x to 1/x.
"""

import sympy as sp


def zero(expr, label):
    value = sp.factor(expr)
    if value != 0:
        raise AssertionError(f"{label} failed:\n{value}")
    print(f"PASS {label}")


def main():
    x, y = sp.symbols("x y", nonzero=True)
    s, sb, t, tb, r, rb = sp.symbols(
        "s sb t tb r rb", nonzero=True
    )

    # The two uncancelled Haagerup equations used in the classification
    # package.  They are quadratic in y after clearing x*y.
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
    expected_A = x * (r * rb - t * tb) * (
        -s * sb * x + 2 * s + 2 * sb * x**2 - 3 * x
    )
    zero(A - expected_A, "companion numerator factorization")
    if sp.degree(B, x) != 3:
        raise AssertionError(f"companion denominator has degree {sp.degree(B, x)}")
    print("PASS companion denominator is cubic")

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
    if fundamental.degree() != 6:
        raise AssertionError(
            f"fundamental polynomial has degree {fundamental.degree()}"
        )
    print("PASS fundamental polynomial is sextic")

    c = [fundamental.coeff_monomial(x**k) for k in range(7)]
    expected_c6 = -(
        r**2*tb - r*sb*t*tb + 3*r*sb + sb**2*t
    ) * (
        r*rb*sb*tb - r*tb**2 - rb*sb**2 - 3*sb*tb
    )
    zero(c[6] - expected_c6, "leading coefficient factorization")
    zero(c[0] - star(c[6]), "sextic endpoint involution")
    zero(c[2] - star(c[4]), "sextic inner-coefficient involution")
    zero(c[3] - star(c[3]), "sextic middle-coefficient involution")
    zero(c[5] + 2 * s * c[6], "sextic coefficient c5")
    zero(c[1] + 2 * sb * c[0], "sextic coefficient c1")
    zero(
        sb * c[3] + (s * sb + 1) * (c[4] - s**2 * c[6]),
        "sextic coefficient c3",
    )
    zero(
        sb * c[2] - s * (c[4] - s**2 * c[6]) - sb**3 * c[0],
        "sextic coefficient c2",
    )

    # A better product equation uses c3 and has no division by sb.  It is
    # equivalent to the original equation where sb is nonzero, but remains
    # regular at s=sb=0 on the Hadamard real form.
    lam = sp.Symbol("lam")
    regular_product = (1 + s*sb)*c[6]*lam**2 + c[3]*lam + (1 + s*sb)*c[0]
    original_product = (
        sb*c[6]*lam**2 - (c[4] - s**2*c[6])*lam + sb*c[0]
    )
    zero(
        sb*regular_product - (1 + s*sb)*original_product,
        "regularized product equation",
    )

    # Verify the universal factorization pattern independently.  The four
    # identities above identify u+v and u*v without adjoining quadratic
    # radicals to the coefficient field.
    u, v = sp.symbols("u v")
    q_u = x**3 - s * x**2 + u * sb * x - u
    q_v = x**3 - s * x**2 + v * sb * x - v
    product = sp.Poly(sp.expand(q_u * q_v), x)
    expected = [
        u * v,
        -2 * sb * u * v,
        s * (u + v) + sb**2 * u * v,
        -(s * sb + 1) * (u + v),
        s**2 + sb * (u + v),
        -2 * s,
        1,
    ]
    for k, coefficient in enumerate(expected):
        zero(
            product.coeff_monomial(x**k) - coefficient,
            f"universal cubic-product coefficient x^{k}",
        )

    # U=(c4-s^2*c6)/(sb*c6) and V=c0/c6.  Check the
    # self-inversive quadratic identity U=V*star(U) without division.
    numerator_u = c[4] - s**2 * c[6]
    zero(
        s * numerator_u - sb * (c[2] - sb**2 * c[0]),
        "product quadratic self-inversive relation",
    )

    print("ALL PRODUCT-CUBIC REDUCTION CHECKS PASSED")


if __name__ == "__main__":
    main()
