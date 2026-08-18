#!/usr/bin/env python3
"""Exact nonsquare certificate for the generic product discriminant."""

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
    regular_discriminant = sp.expand(
        coefficients[3]**2
        - 4*(1+s*sb)**2*coefficients[6]*coefficients[0]
    )
    if sp.factor(
        sb**2*regular_discriminant - (1+s*sb)**2*discriminant
    ) != 0:
        raise AssertionError("regularized discriminant changed the cover")
    print("PASS regularized discriminant extends across sb=0")
    obvious_square = sb**2 * (r * rb - t * tb) ** 2
    omega_fraction = sp.cancel(discriminant / obvious_square)
    omega, omega_denominator = omega_fraction.as_numer_denom()
    if omega_denominator != 1:
        raise AssertionError("obvious square does not divide the discriminant")
    _, omega_factors = sp.factor_list(omega)
    if len(omega_factors) != 1 or omega_factors[0][1] != 1:
        raise AssertionError("residual branch polynomial is not irreducible")
    print("PASS residual branch polynomial is irreducible over Q")
    print("PASS discriminant square-factor extraction")

    omega_sharp = omega.xreplace({s: sb, sb: s, t: tb, tb: t, r: rb, rb: r})
    if sp.expand(omega_sharp - omega) != 0:
        raise AssertionError("residual branch polynomial is not sharp-real")
    print("PASS residual branch polynomial satisfies Omega^sharp = Omega")

    seed_substitution = {
        s: -(1 + a + b),
        sb: -(1 + 1 / a + 1 / b),
        t: -(1 + c + d),
        tb: -(1 + 1 / c + 1 / d),
        r: -(1 + c / a + d / b),
        rb: -(1 + a / c + b / d),
    }
    seed_omega = sp.cancel(omega.subs(seed_substitution))
    seed_numerator, seed_denominator = sp.together(
        seed_omega
    ).as_numer_denom()
    seed_polynomial = sp.Poly(seed_numerator, a, b, c, d)
    if [seed_polynomial.degree(v) for v in (a, b, c, d)] != [8]*4:
        raise AssertionError("unexpected branch multidegree")
    if seed_denominator != a**4*b**4*c**4*d**4:
        raise AssertionError("unexpected Laurent branch denominator")
    print("PASS seed branch has Laurent width 8 in all four variables")
    specialized = sp.factor(
        sp.together(
            omega.subs(seed_substitution).subs({b: 2, c: 3, d: 5})
        )
    )
    numerator, denominator = specialized.as_numer_denom()
    numerator_poly = sp.Poly(numerator, a)
    square_free_constant, square_free_factors = sp.sqf_list(numerator_poly)

    if denominator != 50625 * a**4:
        raise AssertionError(f"unexpected denominator: {denominator}")
    if square_free_constant != 4:
        raise AssertionError(
            f"unexpected square-free constant: {square_free_constant}"
        )
    if len(square_free_factors) != 1 or square_free_factors[0][1] != 1:
        raise AssertionError(
            f"unexpected square-free decomposition: {square_free_factors}"
        )

    expected = sp.Poly(
        39438400 * a**8
        + 817556640 * a**7
        + 6990420276 * a**6
        + 30537666468 * a**5
        + 70114019337 * a**4
        + 81963192384 * a**3
        + 50372453664 * a**2
        + 15833180160 * a
        + 2057529600,
        a,
    )
    if square_free_factors[0][0] != expected:
        raise AssertionError("specialized square-free polynomial changed")

    print("PASS exact four-seed Laurent specialization")
    print("PASS residual discriminant has an odd square-free factor")
    print("PASS product double cover is nontrivial over the seed function field")
    print("ALL PRODUCT-DISCRIMINANT CHECKS PASSED")


if __name__ == "__main__":
    main()
