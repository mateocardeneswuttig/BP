#!/usr/bin/env python3
"""Symbolic pullback of the fixed MM-corner witnesses to Karlsson variables."""

import os
import random
import json

import sympy as sp


U, V = sp.symbols("u v", real=True)
T = sp.symbols("t", real=True)
R = sp.symbols("rho", real=True)
P, Z1, Z2, Z3, Z4 = sp.symbols("p z1 z2 z3 z4", nonzero=True)
ROOT3 = sp.sqrt(3)
FIELD_GENERATOR = sp.I*ROOT3


def linear_generator_pair(value, generator):
    """Serialize an exact element of Q(generator) as its two rational parts."""
    expanded = sp.expand(value)
    b = sp.simplify(expanded.coeff(generator))
    a = sp.simplify(expanded - b*generator)
    if not (a.is_Rational and b.is_Rational):
        raise AssertionError(f"coefficient is not linear in {generator}: {value}")
    return [str(a), str(b)]


def polynomial_terms_in_generator(expression, variables, generator):
    """Serialize a polynomial over Q(generator), including its monomials."""
    polynomial = sp.Poly(expression, *variables, extension=generator)
    rows = []
    for monomial, coefficient in polynomial.terms():
        try:
            value = polynomial.domain.to_sympy(coefficient)
        except (AttributeError, TypeError):
            value = sp.sympify(coefficient)
        rows.append([*monomial, *linear_generator_pair(value, generator)])
    return rows


def star(expression):
    return sp.conjugate(expression).xreplace(
        {
            sp.conjugate(P): 1/P,
            sp.conjugate(Z1): 1/Z1,
            sp.conjugate(Z2): 1/Z2,
            sp.conjugate(Z3): 1/Z3,
            sp.conjugate(Z4): 1/Z4,
        }
    )


def leading_factors(block):
    xs = tuple(block[1, j] for j in range(3))
    ys = tuple(block[2, j] for j in range(3))
    s = sum(xs)
    sb = star(s)
    t = sum(ys)
    tb = star(t)
    r = sum(star(xs[j])*ys[j] for j in range(3))
    rb = star(r)
    return (
        sp.cancel(r**2*tb-r*sb*t*tb+3*r*sb+sb**2*t),
        sp.cancel(r*rb*sb*tb-r*tb**2-rb*sb**2-3*sb*tb),
    )


def redephase(matrix, row_front, column_front):
    rows = row_front + tuple(i for i in range(6) if i not in row_front)
    columns = column_front + tuple(j for j in range(6) if j not in column_front)
    permuted = matrix.extract(rows, columns)
    pivot = permuted[0, 0]
    return sp.Matrix(6, 6, lambda i, j: sp.cancel(
        permuted[i, j]*pivot/(permuted[i, 0]*permuted[0, j])
    ))


def karlsson_matrix():
    f2 = sp.Matrix([[1, 1], [1, -1]])
    lam = sp.Matrix([[U, P*V], [V/P, -U]])
    a = f2*(-sp.eye(2)/2 + sp.I*ROOT3*lam/2)
    b = -f2-a

    def z_right(z):
        return sp.Matrix([[1, 1], [z, -z]])

    def z_left(z):
        return sp.Matrix([[1, z], [1, -z]])

    z1m, z2m = z_right(Z1), z_right(Z2)
    z3m, z4m = z_left(Z3), z_left(Z4)
    return sp.Matrix.vstack(
        sp.Matrix.hstack(f2, z1m, z2m),
        sp.Matrix.hstack(z3m, z3m*a*z1m/2, z3m*b*z2m/2),
        sp.Matrix.hstack(z4m, z4m*b*z1m/2, z4m*a*z2m/2),
    )


def main():
    chart = redephase(karlsson_matrix(), (0, 2, 3), (0, 2, 3))
    e, b, c = chart[:3, :3], chart[:3, 3:], chart[3:, :3]
    expressions = [e.det(), b.det(), c.det()]
    expressions.extend(leading_factors(b))
    expressions.extend(leading_factors(b[[0, 2, 1], :]))
    expressions.extend(leading_factors(c.T))
    expressions.extend(leading_factors(c.T[[0, 2, 1], :]))
    assert len(expressions) == 11
    numerators = [sp.fraction(sp.cancel(expression))[0] for expression in expressions]
    requested = {
        int(value)
        for value in os.environ.get("KARLSSON_PULLBACK_FACTORS", "").split(",")
        if value
    }
    raw_requested = {
        int(value)
        for value in os.environ.get("KARLSSON_PULLBACK_RAW", "").split(",")
        if value
    }
    circle_requested = {
        int(value)
        for value in os.environ.get("KARLSSON_PULLBACK_CIRCLE", "").split(",")
        if value
    }
    unit_resultant_requested = {
        int(value)
        for value in os.environ.get("KARLSSON_PULLBACK_UNIT_RESULTANT", "").split(",")
        if value
    }
    circle_basis = sp.groebner(
        [U**2+V**2-1], U, V, P, Z1, Z2, Z3, Z4,
        order="lex", extension=FIELD_GENERATOR,
    )

    determinant_targets = (
        -Z1*Z3*(3+sp.I*ROOT3*(U+P*V)),
        -Z2*Z3*(3+sp.I*ROOT3*(P*V-U)),
        -6*Z1*Z4*(P+sp.I*(P*U-V)/ROOT3),
    )
    for numerator, target in zip(numerators[:3], determinant_targets):
        assert circle_basis.reduce(sp.expand(numerator-target))[1] == 0
    square_targets = {
        4: -3*(P*V-U+sp.I/ROOT3)**2,
        6: -3*(P*V-U+sp.I/ROOT3)**2,
        8: -3*(P*U-V+sp.I*P/ROOT3)**2,
        10: -3*(P*U-V+sp.I*P/ROOT3)**2,
    }
    for zero_based_index, target in square_targets.items():
        assert sp.simplify(numerators[zero_based_index]-target) == 0
    print("PASS three determinant pullbacks reduce to the simple bounded forms")
    print("PASS four leading factors reduce to two repeated squares")
    unit_residuals = {}
    seam_multiplicities_by_index = {}
    unit_resultant_summaries = {}
    bernstein_certified = False

    variables = (U, V, P, Z1, Z2, Z3, Z4)
    for index, (expression, numerator) in enumerate(zip(expressions, numerators), start=1):
        polynomial = sp.Poly(numerator, *variables, extension=FIELD_GENERATOR)
        print(
            f"W{index}: degree={polynomial.total_degree()}, "
            f"terms={len(polynomial.terms())}",
            flush=True,
        )
        if index in requested:
            print(sp.factor(numerator, extension=FIELD_GENERATOR), flush=True)
        if index in raw_requested:
            print(sp.expand(numerator), flush=True)
        if index in circle_requested:
            reduced = circle_basis.reduce(numerator)[1]
            print(
                "CIRCLE REDUCTION:",
                sp.factor(reduced, extension=FIELD_GENERATOR),
                flush=True,
            )
        if index in unit_resultant_requested:
            variable = Z3 if index in (4, 6) else Z1
            degree = sp.degree(numerator, variable)
            if degree != 2:
                raise AssertionError(f"expected a quadratic in {variable}")
            reciprocal = sp.cancel(variable**degree*star(numerator))
            reciprocal_numerator = sp.fraction(reciprocal)[0]
            first = sp.Poly(numerator, variable)
            second = sp.Poly(reciprocal_numerator, variable)
            a, b, c = first.all_coeffs()
            aa, bb, cc = second.all_coeffs()
            resultant = (
                aa**2*c**2-aa*bb*b*c-2*aa*cc*a*c+aa*cc*b**2
                +bb**2*a*c-bb*cc*a*b+cc**2*a**2
            )
            parametrized = sp.cancel(resultant.subs({
                U: (1-T**2)/(1+T**2),
                V: 2*T/(1+T**2),
            }))
            reduced = sp.fraction(parametrized)[0]
            polynomial_resultant = sp.Poly(
                reduced, T, P, Z1, Z2, Z3, Z4,
                extension=FIELD_GENERATOR,
            )
            print(
                f"UNIT RESULTANT: degree={polynomial_resultant.total_degree()}, "
                f"terms={len(polynomial_resultant.terms())}",
                flush=True,
            )
            direct_summary = None
            if (
                os.environ.get("KARLSSON_PULLBACK_DIRECT_RESULTANT") == "1"
                or os.environ.get("KARLSSON_PULLBACK_EXPORT_RESULTANTS_JSON")
            ):
                parametrized_witness = sp.cancel(numerator.subs({
                    U: (1-T**2)/(1+T**2),
                    V: 2*T/(1+T**2),
                }))
                witness_numerator, witness_denominator = sp.fraction(
                    parametrized_witness
                )
                wa, wb, wc = sp.Poly(
                    witness_numerator, variable,
                ).all_coeffs()
                saa, sbb, scc = star(wc), star(wb), star(wa)
                direct_resultant = sp.cancel(
                    saa**2*wc**2-saa*sbb*wb*wc-2*saa*scc*wa*wc
                    +saa*scc*wb**2+sbb**2*wa*wc-sbb*scc*wa*wb
                    +scc**2*wa**2
                )
                ratio = sp.factor(
                    sp.cancel(direct_resultant/reduced),
                    extension=FIELD_GENERATOR,
                )
                ratio_power = 6 if index in (4, 6) else 10
                assert sp.cancel(ratio - P**(-ratio_power)) == 0
                direct_summary = {
                    "denominator": polynomial_terms_in_generator(
                        witness_denominator, (T,), FIELD_GENERATOR
                    ),
                    "coefficients": [
                        polynomial_terms_in_generator(
                            coefficient, (T, P), FIELD_GENERATOR
                        )
                        for coefficient in (wa, wb, wc)
                    ],
                    "direct_resultant_ratio_power": ratio_power,
                }
                print(
                    f"DIRECT WITNESS: denominator={sp.factor(witness_denominator)}, "
                    f"coefficient terms={[len(sp.Poly(x, T, P, extension=FIELD_GENERATOR).terms()) for x in (wa, wb, wc)]}",
                    flush=True,
                )
                print(f"DIRECT/EXPORTED RESULTANT RATIO: {ratio}", flush=True)
            seam_factors = (
                T,
                P,
                1+T**2,
                (1+T**2)*(P**2-1)-sp.I*ROOT3*(1-T**2)*(P**2+1),
                (1+T**2)*(P**2-1)+sp.I*ROOT3*(1-T**2)*(P**2+1),
            )
            residual = sp.Poly(reduced, T, P, extension=FIELD_GENERATOR)
            multiplicities = []
            for seam in seam_factors:
                divisor = sp.Poly(seam, T, P, extension=FIELD_GENERATOR)
                multiplicity = 0
                while True:
                    quotient, remainder = sp.div(residual, divisor)
                    if not remainder.is_zero:
                        break
                    residual = quotient
                    multiplicity += 1
                multiplicities.append(multiplicity)
            print(f"SEAM MULTIPLICITIES: {multiplicities}", flush=True)
            seam_multiplicities_by_index[index] = multiplicities
            print(
                f"SEAM RESIDUAL: degree={residual.total_degree()}, "
                f"terms={len(residual.terms())}",
                flush=True,
            )
            monic_residual = residual.monic()
            unit_residuals[index] = monic_residual
            unit_resultant_summaries[index] = {
                "seam_multiplicities": multiplicities,
                "residual_leading_coefficient": linear_generator_pair(
                    sp.sympify(residual.LC()),
                    FIELD_GENERATOR,
                ),
                "resultant_terms": len(polynomial_resultant.terms()),
                "resultant_total_degree": polynomial_resultant.total_degree(),
                "direct_witness": direct_summary,
            }
            if os.environ.get("KARLSSON_PULLBACK_FACTOR_RESULTANT") == "1":
                print(sp.factor(residual.as_expr(), extension=FIELD_GENERATOR), flush=True)
            if (
                os.environ.get("KARLSSON_PULLBACK_REAL_RESULTANT") == "1"
                and index == min(unit_resultant_requested)
            ):
                real_form = sp.cancel(residual.as_expr().subs(
                    P, (1+sp.I*R)/(1-sp.I*R)
                ))
                real_numerator = sp.expand(sp.fraction(real_form)[0])
                real_part = sp.Poly(
                    sp.expand(sp.re(real_numerator)), T, R, extension=ROOT3
                )
                imag_part = sp.Poly(
                    sp.expand(sp.im(real_numerator)), T, R, extension=ROOT3
                )
                print(
                    f"REAL FORM: real degree={real_part.total_degree()}, "
                    f"terms={len(real_part.terms())}; "
                    f"imag degree={imag_part.total_degree()}, "
                    f"terms={len(imag_part.terms())}",
                    flush=True,
                )
                common = sp.polys.polytools.gcd(real_part, imag_part)
                print(
                    f"REAL/IMAG GCD: degree={common.total_degree()}, "
                    f"terms={len(common.terms())}",
                    flush=True,
                )
                signs = {"positive": 0, "negative": 0, "unknown": 0}
                for coefficient in real_part.coeffs():
                    try:
                        expression = real_part.domain.to_sympy(coefficient)
                    except (AttributeError, TypeError):
                        expression = sp.sympify(coefficient)
                    if expression.is_positive:
                        signs["positive"] += 1
                    elif expression.is_negative:
                        signs["negative"] += 1
                    else:
                        signs["unknown"] += 1
                print(f"REAL COEFFICIENT SIGNS: {signs}", flush=True)
                parity = {
                    (t_degree % 2, r_degree % 2)
                    for (t_degree, r_degree), _coefficient in real_part.terms()
                }
                print(f"REAL EXPONENT PARITIES: {sorted(parity)}", flush=True)
                if os.environ.get("KARLSSON_PULLBACK_SAMPLE_REAL") == "1":
                    evaluator = sp.lambdify((T, R), real_part.as_expr(), "math")
                    rng = random.Random(19381)
                    values = []
                    grid = [0, 1e-6, 1e-3, 0.01, 0.1, 0.5, 1, 2, 10, 1e3, 1e6]
                    for t_value in grid:
                        for r_value in grid:
                            values.append(float(evaluator(t_value, r_value)))
                    for _ in range(10000):
                        t_value = 10**rng.uniform(-6, 6)
                        r_value = 10**rng.uniform(-6, 6)
                        values.append(float(evaluator(t_value, r_value)))
                    print(
                        f"REAL SAMPLE SIGNS: min={min(values):.6e}, "
                        f"max={max(values):.6e}, "
                        f"positive={sum(value>0 for value in values)}, "
                        f"negative={sum(value<0 for value in values)}",
                        flush=True,
                    )
                if os.environ.get("KARLSSON_PULLBACK_BERNSTEIN") == "1":
                    X, Y = sp.symbols("x y", real=True)
                    positive_polynomial = -real_part
                    degree_t = positive_polynomial.degree(T)
                    degree_r = positive_polynomial.degree(R)
                    if (degree_t, degree_r) != (16, 8):
                        raise AssertionError(
                            "Karlsson Bernstein bidegree sentinel changed: "
                            f"{(degree_t, degree_r)}"
                        )
                    compact_expression = 0
                    for (t_degree, r_degree), coefficient in positive_polynomial.terms():
                        compact_expression += (
                            coefficient
                            * X**t_degree*(1-X)**(degree_t-t_degree)
                            * Y**r_degree*(1-Y)**(degree_r-r_degree)
                        )
                    compact = sp.Poly(
                        sp.expand(compact_expression), X, Y, extension=ROOT3
                    )
                    power_coefficients = {
                        monomial: coefficient
                        for monomial, coefficient in compact.terms()
                    }
                    bernstein = []
                    for i in range(degree_t+1):
                        for j in range(degree_r+1):
                            value = 0
                            for k in range(i+1):
                                for ell in range(j+1):
                                    coefficient = power_coefficients.get((k, ell), 0)
                                    value += (
                                        coefficient
                                        * sp.binomial(i, k)/sp.binomial(degree_t, k)
                                        * sp.binomial(j, ell)/sp.binomial(degree_r, ell)
                                    )
                            bernstein.append(sp.simplify(value))
                    bernstein_signs = {"positive": 0, "zero": 0, "negative": 0, "unknown": 0}
                    for value in bernstein:
                        if value == 0:
                            bernstein_signs["zero"] += 1
                        elif value.is_positive:
                            bernstein_signs["positive"] += 1
                        elif value.is_negative:
                            bernstein_signs["negative"] += 1
                        else:
                            bernstein_signs["unknown"] += 1
                    print(
                        f"BERNSTEIN ({degree_t},{degree_r}) SIGNS: "
                        f"{bernstein_signs}",
                        flush=True,
                    )
                    if os.environ.get("KARLSSON_PULLBACK_BERNSTEIN_SUBDIVIDE") == "1":
                        controls = [
                            bernstein[i*(degree_r+1):(i+1)*(degree_r+1)]
                            for i in range(degree_t+1)
                        ]

                        def split_curve(values):
                            current = list(values)
                            left = [current[0]]
                            right = [current[-1]]
                            while len(current) > 1:
                                current = [
                                    sp.expand((current[index]+current[index+1])/2)
                                    for index in range(len(current)-1)
                                ]
                                left.append(current[0])
                                right.append(current[-1])
                            return left, list(reversed(right))

                        def split_x(table):
                            left = [[0]*(degree_r+1) for _ in range(degree_t+1)]
                            right = [[0]*(degree_r+1) for _ in range(degree_t+1)]
                            for j in range(degree_r+1):
                                first, second = split_curve(
                                    [table[i][j] for i in range(degree_t+1)]
                                )
                                for i in range(degree_t+1):
                                    left[i][j], right[i][j] = first[i], second[i]
                            return left, right

                        def split_y(table):
                            left = [[0]*(degree_r+1) for _ in range(degree_t+1)]
                            right = [[0]*(degree_r+1) for _ in range(degree_t+1)]
                            for i in range(degree_t+1):
                                first, second = split_curve(table[i])
                                left[i], right[i] = first, second
                            return left, right

                        boxes = [(controls, 0, "")]
                        certified = 0
                        certified_boxes = []
                        unresolved_boxes = []
                        maximum_depth = 12
                        while boxes:
                            table, depth, path = boxes.pop()
                            values = [value for row in table for value in row]
                            if all(value.is_positive for value in values):
                                certified += 1
                                certified_boxes.append((path, table))
                                continue
                            if depth == maximum_depth:
                                unresolved_boxes.append((path, table))
                                continue
                            first_x, second_x = split_x(table)
                            for x_digit, x_table in enumerate((first_x, second_x)):
                                first_y, second_y = split_y(x_table)
                                boxes.append((first_y, depth+1, path + f"{x_digit}0"))
                                boxes.append((second_y, depth+1, path + f"{x_digit}1"))
                        print(
                            f"BERNSTEIN SUBDIVISION: certified={certified}, "
                            f"unresolved={len(unresolved_boxes)}, "
                            f"depth={maximum_depth}",
                            flush=True,
                        )
                        assert not unresolved_boxes
                        if certified != 10:
                            raise AssertionError(
                                "Karlsson Bernstein box-count sentinel changed: "
                                f"{certified}"
                            )
                        bernstein_certified = True
                        export_path = os.environ.get("KARLSSON_PULLBACK_EXPORT_JSON")
                        if export_path:
                            def rational_pair(value):
                                expanded = sp.expand(value)
                                b = sp.simplify(expanded.coeff(ROOT3))
                                a = sp.simplify(expanded - b*ROOT3)
                                if not (a.is_Rational and b.is_Rational):
                                    raise AssertionError(
                                        f"coefficient is not in Q(sqrt(3)): {value}"
                                    )
                                return [str(a), str(b)]

                            def generator_pair(value, generator):
                                expanded = sp.expand(value)
                                b = sp.simplify(expanded.coeff(generator))
                                a = sp.simplify(expanded - b*generator)
                                if not (a.is_Rational and b.is_Rational):
                                    raise AssertionError(
                                        f"coefficient is not linear in {generator}: {value}"
                                    )
                                return [str(a), str(b)]

                            def coefficient_expression(polynomial, coefficient):
                                try:
                                    return polynomial.domain.to_sympy(coefficient)
                                except (AttributeError, TypeError):
                                    return sp.sympify(coefficient)

                            certificate = {
                                "degree_x": degree_t,
                                "degree_y": degree_r,
                                "positive_real_power": [
                                    [monomial[0], monomial[1], *rational_pair(
                                        coefficient_expression(
                                            positive_polynomial, coefficient
                                        )
                                    )]
                                    for monomial, coefficient in positive_polynomial.terms()
                                ],
                                "unit_residual": [
                                    [monomial[0], monomial[1], *generator_pair(
                                        coefficient_expression(residual, coefficient),
                                        FIELD_GENERATOR,
                                    )]
                                    for monomial, coefficient in residual.terms()
                                ],
                                "real_substitution_denominator": [
                                    [monomial[0], *generator_pair(
                                        coefficient_expression(sp.Poly(
                                            sp.fraction(real_form)[1], R,
                                            extension=sp.I,
                                        ), coefficient),
                                        sp.I,
                                    )]
                                    for monomial, coefficient in sp.Poly(
                                        sp.fraction(real_form)[1], R,
                                        extension=sp.I,
                                    ).terms()
                                ],
                                "compact_power": [
                                    [monomial[0], monomial[1], *rational_pair(
                                        coefficient_expression(compact, coefficient)
                                    )]
                                    for monomial, coefficient in compact.terms()
                                ],
                                "initial_bernstein": [
                                    rational_pair(value) for value in bernstein
                                ],
                                "certified_boxes": [
                                    {
                                        "path": path,
                                        "controls": [
                                            rational_pair(value)
                                            for row in table for value in row
                                        ],
                                    }
                                    for path, table in sorted(certified_boxes)
                                ],
                            }
                            with open(export_path, "w", encoding="utf-8") as stream:
                                json.dump(certificate, stream, separators=(",", ":"))
                            print(
                                f"PASS exported exact Bernstein certificate to {export_path}",
                                flush=True,
                            )
                if os.environ.get("KARLSSON_PULLBACK_FACTOR_REAL") == "1":
                    print(sp.factor(common.as_expr(), extension=ROOT3), flush=True)

    if len(unit_residuals) > 1:
        representative = next(iter(unit_residuals.values()))
        equal_indices = [
            index for index, residual in unit_residuals.items()
            if residual == representative
        ]
        print(
            f"UNIT-RESULTANT RESIDUALS IDENTICAL FOR: {equal_indices}",
            flush=True,
        )
        if set(unit_residuals) == {4, 6, 8, 10}:
            assert set(equal_indices) == {4, 6, 8, 10}
            assert seam_multiplicities_by_index[4] == [2, 0, 0, 0, 2]
            assert seam_multiplicities_by_index[6] == [2, 0, 0, 0, 2]
            assert seam_multiplicities_by_index[8] == [2, 4, 0, 0, 2]
            assert seam_multiplicities_by_index[10] == [2, 4, 0, 0, 2]
            if os.environ.get("KARLSSON_PULLBACK_BERNSTEIN_SUBDIVIDE") == "1":
                assert bernstein_certified
                print("PASS the shared residual is strictly nonzero on the canonical quadrant")
                print("PASS the fixed MM corner is finite on the nondegenerate Karlsson chart")
            summary_path = os.environ.get("KARLSSON_PULLBACK_EXPORT_RESULTANTS_JSON")
            if summary_path:
                with open(summary_path, "w", encoding="utf-8") as stream:
                    json.dump(
                        {
                            "seams": ["t", "p", "1+t^2", "Mminus", "Mplus"],
                            "resultants": unit_resultant_summaries,
                        },
                        stream,
                        separators=(",", ":"),
                    )
                print(f"PASS exported unit-resultant summary to {summary_path}")

    print("PASS eleven fixed-MM-corner witness factors pulled back exactly")
    proof_mode_complete = (
        unit_resultant_requested == {4, 6, 8, 10}
        and os.environ.get("KARLSSON_PULLBACK_REAL_RESULTANT") == "1"
        and os.environ.get("KARLSSON_PULLBACK_BERNSTEIN") == "1"
        and os.environ.get("KARLSSON_PULLBACK_BERNSTEIN_SUBDIVIDE") == "1"
        and bernstein_certified
    )
    if proof_mode_complete:
        print("ALL KARLSSON FIXED-CORNER PULLBACK CHECKS PASSED")
    else:
        print(
            "DIAGNOSTIC KARLSSON PULLBACK RUN COMPLETE; "
            "use karlsson_interior_containment_check.py for the proof target"
        )


if __name__ == "__main__":
    main()
