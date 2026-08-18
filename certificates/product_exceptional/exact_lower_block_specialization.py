#!/usr/bin/env python3
"""Exact cubic-norm flatness check at one generic rational seed."""

import sympy as sp


x, y = sp.symbols("x y", nonzero=True)
s, sb, t, tb, r, rb = sp.symbols("s sb t tb r rb", nonzero=True)


def universal_eliminants():
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
    return A, B, coefficients


A_GENERIC, B_GENERIC, FUNDAMENTAL_COEFFICIENTS = universal_eliminants()


def fixed_data(seed, product, variable):
    a, b, c, d = (
        value if isinstance(value, sp.Basic) else sp.Rational(value)
        for value in seed
    )
    sum_x = -(1 + a + b)
    sum_x_bar = -(1 + 1 / a + 1 / b)
    sum_y = -(1 + c + d)
    sum_y_bar = -(1 + 1 / c + 1 / d)
    cross = -(1 + c / a + d / b)
    cross_bar = -(1 + a / c + b / d)
    substitution = {
        s: sum_x,
        sb: sum_x_bar,
        t: sum_y,
        tb: sum_y_bar,
        r: cross,
        rb: cross_bar,
    }
    A = sp.Poly(A_GENERIC.subs(substitution).subs(x, variable), variable)
    B = sp.Poly(B_GENERIC.subs(substitution).subs(x, variable), variable)
    coefficients = [
        value.subs(substitution) for value in FUNDAMENTAL_COEFFICIENTS
    ]
    U = sp.cancel(
        (coefficients[4] - sum_x**2 * coefficients[6])
        / (sum_x_bar * coefficients[6])
    )
    V = sp.cancel(coefficients[0] / coefficients[6])
    product_quadratic = sp.Poly(product**2 - U * product + V, product)
    cubic = sp.Poly(
        variable**3
        - sum_x * variable**2
        + product * sum_x_bar * variable
        - product,
        variable,
    )
    delta = cross * cross_bar - sum_y * sum_y_bar
    return {
        "seed": (a, b, c, d),
        "sum_x": sum_x,
        "sum_x_bar": sum_x_bar,
        "A": A,
        "B": B,
        "c6": coefficients[6],
        "U": U,
        "V": V,
        "product_quadratic": product_quadratic,
        "cubic": cubic,
        "delta": delta,
    }


def build_row_norm(
    seed,
    product,
    vertical_root,
    sign,
    vertical_product_override=None,
    fraction_free=False,
    return_entry=False,
):
    horizontal = fixed_data(seed, product, x)
    transposed_seed = (seed[0], seed[2], seed[1], seed[3])
    temporary_vertical_product = sp.Dummy("vertical_product")
    vertical_base = fixed_data(
        transposed_seed, temporary_vertical_product, vertical_root
    )
    kappa = sp.cancel(
        vertical_base["delta"] * horizontal["c6"]
        / (horizontal["delta"] * vertical_base["c6"])
    )
    if vertical_product_override is None:
        vertical_product = sp.cancel(
            (
                vertical_base["U"]
                + sign * kappa * (2 * product - horizontal["U"])
            )
            / 2
        )
    else:
        vertical_product = vertical_product_override
    vertical = fixed_data(
        transposed_seed, vertical_product, vertical_root
    )

    field_generators = [product]
    if vertical_product_override is not None:
        field_generators.append(vertical_product_override)
    for value in seed:
        if isinstance(value, sp.Basic):
            field_generators.extend(sorted(value.free_symbols, key=str))
    field_generators = list(dict.fromkeys(field_generators))
    coefficient_field = sp.QQ.frac_field(*field_generators)
    q_horizontal = sp.Poly(
        horizontal["cubic"].as_expr(), x, domain=coefficient_field
    )
    q_vertical = sp.Poly(
        vertical["cubic"].as_expr(),
        vertical_root,
        domain=coefficient_field,
    )

    inverse_vertical_B = sp.invert(
        sp.Poly(
            vertical["B"].as_expr(),
            vertical_root,
            domain=coefficient_field,
        ),
        q_vertical,
    )
    vertical_companion = sp.rem(
        sp.Poly(
            -vertical["A"].as_expr() * inverse_vertical_B,
            vertical_root,
            domain=coefficient_field,
        ),
        q_vertical,
    ).as_expr()

    # In the horizontal cubic algebra, 1/y=-B_h/A_h.
    inverse_horizontal_A = sp.invert(
        sp.Poly(horizontal["A"].as_expr(), x, domain=coefficient_field),
        q_horizontal,
    )
    inverse_y = sp.rem(
        sp.Poly(
            -horizontal["B"].as_expr() * inverse_horizontal_A,
            x,
            domain=coefficient_field,
        ),
        q_horizontal,
    ).as_expr()

    def coefficient_vector(expr):
        remainder = sp.rem(
            sp.Poly(expr, x, domain=coefficient_field), q_horizontal
        )
        return sp.Matrix(
            [remainder.coeff_monomial(x**k) for k in range(3)]
        )

    def field_trace(expr):
        coefficients = coefficient_vector(expr)
        trace_x = horizontal["sum_x"]
        trace_x2 = trace_x**2 - 2 * product * horizontal["sum_x_bar"]
        return sp.cancel(
            3 * coefficients[0]
            + trace_x * coefficients[1]
            + trace_x2 * coefficients[2]
        )

    inverse_x = (
        x**2
        - horizontal["sum_x"] * x
        + product * horizontal["sum_x_bar"]
    ) / product
    trace_pairing = sp.Matrix(
        [
            [field_trace(x**k) for k in range(3)],
            [field_trace(inverse_x * x**k) for k in range(3)],
            [field_trace(inverse_y * x**k) for k in range(3)],
        ]
    )

    a, b, c, d = horizontal["seed"]
    target = sp.Matrix(
        [
            -(1 + vertical_root + vertical_companion),
            -(1 + vertical_root / a + vertical_companion / b),
            -(1 + vertical_root / c + vertical_companion / d),
        ]
    )
    entry_coefficients = trace_pairing.inv() * target
    entry_expression = (
        entry_coefficients[0]
        + entry_coefficients[1] * x
        + entry_coefficients[2] * x**2
    )
    entry = sp.together(entry_expression) if fraction_free else sp.cancel(entry_expression)
    entry_numerator, entry_denominator = sp.together(entry).as_numer_denom()
    if return_entry:
        return (
            horizontal["product_quadratic"].as_expr(),
            vertical["cubic"].as_expr(),
            horizontal["cubic"].as_expr(),
            entry_numerator,
            entry_denominator,
        )
    if fraction_free:
        entry_poly = sp.Poly(entry_numerator, x)
        d0, d1, d2 = (
            entry_poly.coeff_monomial(x**k) for k in range(3)
        )
        cubic_poly = sp.Poly(horizontal["cubic"].as_expr(), x)
        q0, q1, q2 = (
            cubic_poly.coeff_monomial(x**k) for k in range(3)
        )
        vertical_modulus = sp.Poly(
            vertical["cubic"].as_expr(),
            vertical_root,
            domain=coefficient_field,
        )

        def vertical_poly(value):
            return sp.Poly(value, vertical_root, domain=coefficient_field)

        def vmul(left, right):
            return sp.rem(left * right, vertical_modulus)

        def vpow(value, exponent):
            result = vertical_poly(1)
            for _ in range(exponent):
                result = vmul(result, value)
            return result

        def vterm(coefficient, *factors):
            result = vertical_poly(coefficient)
            for factor in factors:
                result = vmul(result, factor)
            return result

        d0, d1, d2 = map(vertical_poly, (d0, d1, d2))
        q0, q1, q2 = map(vertical_poly, (q0, q1, q2))
        d0_2, d1_2, d2_2 = vpow(d0, 2), vpow(d1, 2), vpow(d2, 2)
        d0_3, d1_3, d2_3 = vmul(d0_2, d0), vmul(d1_2, d1), vmul(d2_2, d2)
        q0_2, q1_2, q2_2 = vpow(q0, 2), vpow(q1, 2), vpow(q2, 2)
        terms = [
            vterm(1, d0_3), vterm(-1, d0_2, d1, q2),
            vterm(-2, d0_2, d2, q1), vterm(1, d0_2, d2, q2_2),
            vterm(1, d0, d1_2, q1), vterm(3, d0, d1, d2, q0),
            vterm(-1, d0, d1, d2, q1, q2),
            vterm(-2, d0, d2_2, q0, q2),
            vterm(1, d0, d2_2, q1_2), vterm(-1, d1_3, q0),
            vterm(1, d1_2, d2, q0, q2),
            vterm(-1, d1, d2_2, q0, q1), vterm(1, d2_3, q0_2),
        ]
        norm_poly = vertical_poly(0)
        for term_value in terms:
            norm_poly = sp.rem(norm_poly + term_value, vertical_modulus)
        norm_numerator = norm_poly
    else:
        norm_numerator = sp.resultant(
            horizontal["cubic"].as_expr(), entry_numerator, x
        )
    norm_denominator = entry_denominator**3
    if not fraction_free:
        norm = sp.cancel(norm_numerator / norm_denominator)
        norm_numerator, norm_denominator = sp.together(norm).as_numer_denom()
    return (
        horizontal["product_quadratic"].as_expr(),
        vertical["cubic"].as_expr(),
        norm_numerator,
        norm_denominator,
    )


def reduced_norm_error(seed, sign):
    product, vertical_root = sp.symbols("product vertical_root", nonzero=True)
    barred_product, barred_vertical_root = sp.symbols(
        "barred_product barred_vertical_root", nonzero=True
    )
    q_product, q_vertical, numerator, denominator = build_row_norm(
        seed, product, vertical_root, sign
    )
    reciprocal_seed = tuple(sp.Rational(1, value) for value in seed)
    _, _, barred_numerator, barred_denominator = build_row_norm(
        reciprocal_seed, barred_product, barred_vertical_root, sign
    )
    starred_numerator = barred_numerator.subs(
        {barred_product: 1 / product, barred_vertical_root: 1 / vertical_root}
    )
    starred_denominator = barred_denominator.subs(
        {barred_product: 1 / product, barred_vertical_root: 1 / vertical_root}
    )
    error_numerator = sp.together(
        numerator * starred_numerator
        - denominator * starred_denominator
    ).as_numer_denom()[0]

    coefficient_field = sp.QQ.frac_field(product)
    remainder_vertical = sp.rem(
        sp.Poly(error_numerator, vertical_root, domain=coefficient_field),
        sp.Poly(q_vertical, vertical_root, domain=coefficient_field),
    ).as_expr()
    remainder_numerator = sp.together(remainder_vertical).as_numer_denom()[0]
    remainder_poly = sp.Poly(remainder_numerator, vertical_root)
    reduced_coefficients = []
    for degree in range(3):
        coefficient = remainder_poly.coeff_monomial(vertical_root**degree)
        reduced = sp.rem(
            sp.Poly(coefficient, product), sp.Poly(q_product, product)
        )
        reduced_coefficients.append(reduced.as_expr())
    return reduced_coefficients


def main():
    seed = (2, 3, 5, 7)
    minus_coefficients = reduced_norm_error(seed, sign=-1)
    if any(value != 0 for value in minus_coefficients):
        raise AssertionError(
            f"minus norm identity failed: {minus_coefficients}"
        )
    print("PASS exact minus-matching cubic-norm identity at (2,3,5,7)")

    plus_coefficients = reduced_norm_error(seed, sign=1)
    if all(value == 0 for value in plus_coefficients):
        raise AssertionError("plus matching unexpectedly satisfies flatness")
    nonzero_count = sum(value != 0 for value in plus_coefficients)
    print(
        "PASS plus matching leaves "
        f"{nonzero_count} nonzero quotient coefficient(s)"
    )
    print("PASS plus matching is not a generic algebraic flatness law")
    print("ALL EXACT LOWER-BLOCK SPECIALIZATION CHECKS PASSED")


if __name__ == "__main__":
    main()
