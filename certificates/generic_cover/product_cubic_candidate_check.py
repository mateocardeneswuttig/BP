#!/usr/bin/env python3
"""Exact trace proof for the product-cubic candidate sheets.

This extends product_cubic_reduction.py.  For a root u of the quadratic
product equation it proves, without extracting any roots of the cubic, that
the companion values y=-A(x)/B(x) have the prescribed sum and cross trace.
The calculation is fraction-free until the final saturation by det(M_B).
"""

import sympy as sp


def coefficient_vector(poly, x):
    value = sp.Poly(poly, x)
    return sp.Matrix([value.coeff_monomial(x**k) for k in range(3)])


def main():
    x, y, u = sp.symbols("x y u", nonzero=True)
    s, sb, t, tb, r, rb = sp.symbols(
        "s sb t tb r rb", nonzero=True
    )

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
    c = [fundamental.coeff_monomial(x**k) for k in range(7)]
    product_quadratic = sp.Poly(
        sp.expand(
            sb * c[6] * u**2
            - (c[4] - s**2 * c[6]) * u
            + sb * c[0]
        ),
        u,
    )

    cubic = x**3 - s * x**2 + u * sb * x - u
    A_reduced = sp.rem(A, cubic, x)
    B_reduced = sp.rem(B, cubic, x)

    # M_B represents multiplication by B in the basis (1,x,x^2).
    multiplication_B = sp.Matrix.hstack(
        *(
            coefficient_vector(sp.rem(B_reduced * x**j, cubic, x), x)
            for j in range(3)
        )
    )
    denominator = sp.expand(multiplication_B.det(method="domain-ge"))
    numerator_vector = [
        sp.expand(value)
        for value in (
            -multiplication_B.adjugate() * coefficient_vector(A_reduced, x)
        )
    ]

    # Newton traces for q=x^3-s*x^2+u*sb*x-u.
    trace_x = s
    trace_x2 = s**2 - 2 * u * sb
    trace_y_error = sp.expand(
        3 * numerator_vector[0]
        + trace_x * numerator_vector[1]
        + trace_x2 * numerator_vector[2]
        - t * denominator
    )

    # From q(x)=0, u/x=x^2-s*x+u*sb.  Multiplying by u avoids
    # introducing a denominator in the cross trace.
    numerator_y = sum(numerator_vector[k] * x**k for k in range(3))
    cross_numerator = sp.rem(
        (x**2 - s * x + u * sb) * numerator_y, cubic, x
    )
    cross_vector = coefficient_vector(cross_numerator, x)
    trace_cross_error = sp.expand(
        3 * cross_vector[0]
        + trace_x * cross_vector[1]
        + trace_x2 * cross_vector[2]
        - r * u * denominator
    )

    trace_quotient, trace_remainder = sp.div(
        sp.Poly(trace_y_error, u), product_quadratic
    )
    if not trace_remainder.is_zero:
        raise AssertionError(
            "sum(y_j)-t is not divisible by the product quadratic:\n"
            f"{sp.factor(trace_remainder.as_expr())}"
        )
    print(
        "PASS sum(y_j)=t modulo the product quadratic "
        f"(quotient degree {trace_quotient.degree()})"
    )

    cross_quotient, cross_remainder = sp.div(
        sp.Poly(trace_cross_error, u), product_quadratic
    )
    if not cross_remainder.is_zero:
        raise AssertionError(
            "sum(y_j/x_j)-r is not divisible by the product quadratic:\n"
            f"{sp.factor(cross_remainder.as_expr())}"
        )
    print(
        "PASS sum(y_j/x_j)=r modulo the product quadratic "
        f"(quotient degree {cross_quotient.degree()})"
    )

    print("PASS regular denominator recorded as det(M_B)")
    print("ALL PRODUCT-CUBIC CANDIDATE CHECKS PASSED")


if __name__ == "__main__":
    main()
