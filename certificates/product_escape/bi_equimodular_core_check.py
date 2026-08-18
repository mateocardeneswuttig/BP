#!/usr/bin/env python3
"""Exact normal forms for bi-equimodular 3 x 3 phase blocks."""

import sympy as sp


def main():
    a, b, c, d = sp.symbols("a b c d", nonzero=True)

    def torus_star(expr):
        return expr.subs(
            {a: 1 / a, b: 1 / b, c: 1 / c, d: 1 / d},
            simultaneous=True,
        )

    def norm_square(expr):
        return sp.expand(expr * torus_star(expr))

    row_correlations = (
        1 + a + b,
        1 + c + d,
        1 + c / a + d / b,
    )
    column_correlations = (
        1 + a + c,
        1 + b + d,
        1 + b / a + d / c,
    )
    row_norms = tuple(norm_square(value) for value in row_correlations)
    column_norms = tuple(norm_square(value) for value in column_correlations)

    # Equality of the common row and column magnitudes gives the first
    # three-way split.
    first_split = sp.factor(row_norms[0] - column_norms[0])
    expected_first_split = -(
        (a + 1) * (a - b * c) * (b - c) / (a * b * c)
    )
    assert sp.cancel(first_split - expected_first_split) == 0

    # The a=bc branch becomes b'=c' after swapping the first two columns and
    # re-dephasing.  The new inner coordinates are displayed explicitly.
    transformed_a = 1 / a
    transformed_b = b / a
    transformed_c = 1 / c
    transformed_d = d / c
    assert sp.cancel((transformed_b - transformed_c).subs(a, b * c)) == 0

    # On the symmetric branch c=b, the two remaining row equations factor
    # completely.  Factors b=-1 and a=-b are visible H2 edges.
    symmetric_first = sp.factor(
        (row_norms[0] - row_norms[1]).subs(c, b)
    )
    symmetric_second = sp.factor(
        (row_norms[0] - row_norms[2]).subs(c, b)
    )
    expected_symmetric_first = (
        (a - d) * (b + 1) * (a * d - b) / (a * b * d)
    )
    expected_symmetric_second = (
        (a + b) * (b**2 - d) * (a * d - b)
        / (a * b**2 * d)
    )
    assert sp.cancel(symmetric_first - expected_symmetric_first) == 0
    assert sp.cancel(symmetric_second - expected_symmetric_second) == 0

    # Reconstruct the universal fundamental polynomial in fixed-Gram
    # variables in order to certify the product-coordinate claims on the two
    # surviving branches.
    x, y, lam = sp.symbols("x y lam", nonzero=True)
    s, sb, t, tb, r, rb = sp.symbols("s sb t tb r rb", nonzero=True)
    h = (x - s) * (1 / y - tb) * (y / x - r)
    hb = (1 / x - sb) * (y - t) * (x / y - rb)
    sigma = (x - s) * (1 / x - sb)
    delta = (y - t) * (1 / y - tb)
    psi = (y / x - r) * (x / y - rb)
    first = sp.Poly(sp.cancel(x * y * (h - hb)), y)
    second = sp.Poly(
        sp.cancel(x * y * (h - 4 + sigma + delta + psi)), y
    )
    f = [first.coeff_monomial(y**degree) for degree in range(3)]
    g = [second.coeff_monomial(y**degree) for degree in range(3)]
    companion_a = sp.expand(f[2] * g[0] - f[0] * g[2])
    companion_b = sp.expand(f[2] * g[1] - f[1] * g[2])

    def fixed_star(expr):
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
        sp.expand(
            x**3
            * (companion_a * fixed_star(companion_a)
               - companion_b * fixed_star(companion_b))
        ),
        x,
    )
    coefficients = [
        fundamental.coeff_monomial(x**degree) for degree in range(7)
    ]

    def product_equation(substitution):
        specialized = [
            sp.factor(value.subs(substitution)) for value in coefficients
        ]
        specialized_s = substitution[s]
        specialized_sb = substitution[sb]
        return sp.factor(
            (1 + specialized_s * specialized_sb)
            * specialized[6] * lam**2
            + specialized[3] * lam
            + (1 + specialized_s * specialized_sb) * specialized[0]
        )

    # Main symmetric branch d=b/a (equivalently ad=b).
    main_s = -(1 + a + b)
    main_t = -(1 + b + b / a)
    main_r = -(1 + b / a + 1 / a)
    main_substitution = {
        s: main_s,
        sb: -(1 + 1 / a + 1 / b),
        t: main_t,
        tb: -(1 + 1 / b + a / b),
        r: main_r,
        rb: -(1 + a / b + a),
    }
    main_product = product_equation(main_substitution)
    main_first_coefficient_factor = (
        a**2 * b
        + a**2
        + a * b**2
        + 4 * a * b
        + a
        + b**2
        + b
    )
    main_infinite_fibre_factor = (
        a**4 * b**2
        + 3 * a**4 * b
        + a**4
        + 3 * a**3 * b**3
        + 11 * a**3 * b**2
        + 11 * a**3 * b
        + 3 * a**3
        + a**2 * b**4
        + 11 * a**2 * b**3
        + 18 * a**2 * b**2
        + 11 * a**2 * b
        + a**2
        + 3 * a * b**4
        + 11 * a * b**3
        + 11 * a * b**2
        + 3 * a * b
        + b**4
        + 3 * b**3
        + b**2
    )
    expected_main_product = (
        main_first_coefficient_factor
        * main_infinite_fibre_factor**2
        * (lam - a * b) ** 2
        / (a**6 * b**6)
    )
    assert sp.cancel(main_product - expected_main_product) == 0
    # On the torus the first factor is ab(1+|1+a+b|^2), hence never zero.
    main_trace = 1 + a + b
    main_trace_star = 1 + 1 / a + 1 / b
    assert sp.cancel(
        main_first_coefficient_factor
        - a * b * (1 + main_trace * main_trace_star)
    ) == 0
    boundary_t, boundary_z = sp.symbols("boundary_t boundary_z", real=True)
    boundary_p, boundary_q = sp.symbols("boundary_p boundary_q", real=True)
    boundary_cayley = {
        a: (1 + sp.I * boundary_t) / (1 - sp.I * boundary_t),
        b: (1 + sp.I * boundary_z) / (1 - sp.I * boundary_z),
    }
    boundary_polynomial = (
        boundary_t**4 * boundary_z**4
        - 2 * boundary_t**4 * boundary_z**2
        + boundary_t**4
        - 8 * boundary_t**3 * boundary_z
        - 2 * boundary_t**2 * boundary_z**4
        - 24 * boundary_t**2 * boundary_z**2
        - 6 * boundary_t**2
        - 8 * boundary_t * boundary_z**3
        - 48 * boundary_t * boundary_z
        + boundary_z**4
        - 6 * boundary_z**2
        - 27
    )
    transformed_boundary = sp.factor(
        sp.together(
            (main_infinite_fibre_factor / (a**2 * b**2)).subs(
                boundary_cayley
            )
        )
    )
    assert sp.cancel(
        transformed_boundary
        + 4
        * boundary_polynomial
        / ((1 + boundary_t**2) ** 2 * (1 + boundary_z**2) ** 2)
    ) == 0
    symmetric_boundary = (
        boundary_p**4
        - (2 * boundary_q**2 + 12 * boundary_q + 6)
        * boundary_p**2
        + boundary_q**4
        + 4 * boundary_q**3
        - 6 * boundary_q**2
        - 36 * boundary_q
        - 27
    )
    assert sp.expand(
        boundary_polynomial
        - symmetric_boundary.subs({
            boundary_p: boundary_t + boundary_z,
            boundary_q: boundary_t * boundary_z,
        })
    ) == 0
    main_companion_a = sp.factor(companion_a.subs(main_substitution))
    main_companion_b = sp.factor(companion_b.subs(main_substitution))
    assert main_companion_a == 0
    assert sp.cancel(
        main_companion_b
        + (
            x**3
            + (1 + a + b) * x**2
            - (a * b + a + b) * x
            - a * b
        )
        * main_infinite_fibre_factor
        / (a**2 * b**3)
    ) == 0

    # The large dependent-fibre factor has a much smaller intrinsic meaning.
    # If q is the common squared correlation modulus and theta is the real
    # cyclic Gram invariant, then Xi_M=0 is exactly
    # 2*theta=q(3-q).
    main_q = sp.factor(
        (1 + a + b) * (1 + 1 / a + 1 / b)
    )
    main_tau = (
        (1 + 1 / a + 1 / b)
        * (1 + a / b + a)
        * (1 + b + b / a)
    )
    main_theta = sp.factor(
        (main_tau + torus_star(main_tau)) / 2
    )
    assert sp.cancel(
        2 * main_theta
        - main_q * (3 - main_q)
        - main_infinite_fibre_factor / (a**2 * b**2)
    ) == 0
    assert sp.factor(sp.discriminant(main_product, lam)) == 0
    main_poly = sp.Poly(main_product, lam)
    main_root = sp.factor(
        -main_poly.coeff_monomial(lam)
        / (2 * main_poly.coeff_monomial(lam**2))
    )
    assert sp.cancel(main_root - a * b) == 0

    # Circulant branch a=d=b^2.
    circulant_s = -(1 + b + b**2)
    circulant_r = -(1 + b + 1 / b)
    circulant_substitution = {
        s: circulant_s,
        sb: -(1 + 1 / b + 1 / b**2),
        t: circulant_s,
        tb: -(1 + 1 / b + 1 / b**2),
        r: circulant_r,
        rb: circulant_r,
    }
    circulant_product = product_equation(circulant_substitution)
    expected_circulant_factor = (
        (b**2 + 1) ** 2
        * (b**2 + b + 1) ** 4
        * (b**2 + 4 * b + 1) ** 2
        * (b**4 + 2 * b**3 + 4 * b**2 + 2 * b + 1)
        / b**13
    )
    assert sp.cancel(
        circulant_product
        - expected_circulant_factor * (lam - b**3) ** 2
    ) == 0
    circulant_cubic = (
        x**3 - circulant_s * x**2
        + b**3 * circulant_substitution[sb] * x - b**3
    )
    assert sp.expand(
        circulant_cubic
        - (x - b) * (x**2 + (b + 1) ** 2 * x + b**2)
    ) == 0

    # Fourth-block closure on the main normal form.  If u,v,w are the roots
    # of its unique product cubic, the two finite pairings are the two cyclic
    # pairings of the reciprocal-scaled third row.
    u, v, w = sp.symbols("u v w", nonzero=True)
    main_e = sp.Matrix(
        [[1, 1, 1], [1, a, b], [1, b, b / a]]
    )
    main_b_plus = sp.Matrix(
        [[1, 1, 1], [u, v, w], [b / v, b / w, b / u]]
    )
    main_b_minus = sp.Matrix(
        [[1, 1, 1], [u, v, w], [b / w, b / u, b / v]]
    )
    main_relations = (
        u + v + w + 1 + a + b,
        u * v + u * w + v * w + a * b + a + b,
        u * v * w - a * b,
    )
    main_groebner = sp.groebner(
        main_relations,
        u,
        v,
        w,
        order="lex",
        domain=sp.QQ.frac_field(a, b),
    )
    main_torus = {
        a: 1 / a,
        b: 1 / b,
        u: 1 / u,
        v: 1 / v,
        w: 1 / w,
    }

    def main_adjoint(matrix):
        return matrix.xreplace(main_torus).T

    def main_zero(expr):
        numerator = sp.together(expr).as_numer_denom()[0]
        return sp.factor(main_groebner.reduce(numerator)[1]) == 0

    assert all(
        main_zero(
            (main_e * main_adjoint(main_e)
             + main_b_plus * main_adjoint(main_b_plus)
             - 6 * sp.eye(3))[i, j]
        )
        for i in range(3)
        for j in range(3)
    )
    main_c = main_b_minus.T
    main_d = sp.simplify(
        -main_c
        * main_adjoint(main_e)
        * main_adjoint(main_b_plus.inv())
    )
    expected_main_d = -sp.Matrix(
        [[u, b / w, 1], [1, v, b / u], [b / v, 1, w]]
    )
    assert all(
        main_zero(main_d[i, j] - expected_main_d[i, j])
        for i in range(3)
        for j in range(3)
    )

    # The same-sheet main completion is symmetric.  Its row norms are already
    # three, so entrywise flatness is equivalent to flatness of the three
    # diagonal entries: once |d_ii|=1, symmetry and the three row-norm
    # identities force every off-diagonal modulus to be one as well.
    main_same_d = sp.simplify(
        -main_b_plus.T
        * main_adjoint(main_e)
        * main_adjoint(main_b_plus.inv())
    )
    assert all(
        main_zero(main_same_d[i, j] - main_same_d[j, i])
        for i in range(3)
        for j in range(3)
    )
    assert all(
        main_zero(
            sum(
                main_same_d[i, j]
                * main_same_d[i, j].xreplace(main_torus)
                for j in range(3)
            )
            - 3
        )
        for i in range(3)
    )

    # Put w=ab/(uv).  Away from a repeated root, the three diagonal modulus
    # equations shed the same Vandermonde factor and reduce to q0=q1=q2=0.
    main_w_substitution = {w: a * b / (u * v)}
    q0 = (
        a**2 * b**2
        + a**2 * b * u
        - a**2 * b * v
        - a**2 * b
        - a * b**2 * u
        - a * b * u**2 * v
        + a * b * v
        + a * u * v**2
        + b * u**2 * v**2
        + b * u**2 * v
        - b * u * v**2
        - u**2 * v**2
    )
    q1 = (
        -a**2 * b * u
        + a**2 * b
        + a * b**2 * v
        - a * b**2
        + a * b * u**2 * v
        - a * b * u * v**2
        + a * b * u
        - a * b * v
        + a * u**2 * v**2
        - a * u**2 * v
        - b * u**2 * v**2
        + b * u * v**2
    )
    q2 = (
        a**2 * b**2
        - a**2 * b * v
        - a * b**2 * u
        + a * b**2 * v
        - a * b**2
        - a * b * u * v**2
        + a * b * u
        + a * u**2 * v**2
        - a * u**2 * v
        + a * u * v**2
        + b * u**2 * v
        - u**2 * v**2
    )
    vandermonde = (
        (u - v) * (-a * b + u * v**2) * (-a * b + u**2 * v)
    )
    expected_flat_numerators = (
        -vandermonde * q0,
        -vandermonde * q1,
        vandermonde * q2,
    )
    for diagonal, expected in enumerate(expected_flat_numerators):
        flat_error = (
            main_same_d[diagonal, diagonal]
            * main_same_d[diagonal, diagonal].xreplace(main_torus)
            - 1
        )
        numerator = sp.factor(
            sp.together(flat_error.subs(main_w_substitution))
            .as_numer_denom()[0]
        )
        _, primitive = sp.Poly(numerator, u, v, a, b).primitive()
        assert sp.factor(primitive.as_expr() - expected) == 0

    # Because u and v are distinct roots of the same cubic, their divided
    # difference vanishes.  Reduce q0,q1,q2 by that quadratic in v.  Each
    # remainder is linear in v; compatibility of any two linear equations,
    # reduced once more by the cubic for u, forces the same linear factor L.
    main_cubic_u = (
        u**3
        + (1 + a + b) * u**2
        - (a * b + a + b) * u
        - a * b
    )
    main_cubic_v = main_cubic_u.xreplace({u: v})
    divided_difference = sp.cancel(
        (main_cubic_u - main_cubic_v) / (u - v)
    )
    linear_remainders = [
        sp.Poly(sp.rem(q_value, divided_difference, v), v)
        for q_value in (q0, q1, q2)
    ]
    compatibility_determinants = []
    for left, right in ((0, 1), (1, 2), (2, 0)):
        left_poly = linear_remainders[left]
        right_poly = linear_remainders[right]
        compatibility_determinants.append(
            sp.expand(
                left_poly.coeff_monomial(v)
                * right_poly.coeff_monomial(1)
                - right_poly.coeff_monomial(v)
                * left_poly.coeff_monomial(1)
            )
        )
    compatibility_linear = (
        -a**3 * b
        + a**2 * b**2 * u
        + a**2 * b**2
        - a**2 * b * u
        + a**2 * b
        + a**2 * u
        - a * b**3
        - a * b**2 * u
        + a * b**2
        - a * b * u
        - a * b
        + b**2 * u
    )
    expected_compatibility_remainders = (
        -6 * a * b * u * compatibility_linear,
        6 * a * b * u * compatibility_linear,
        6 * a * b * u * compatibility_linear,
    )
    assert all(
        sp.factor(
            sp.rem(determinant, main_cubic_u, u) - expected
        )
        == 0
        for determinant, expected in zip(
            compatibility_determinants,
            expected_compatibility_remainders,
        )
    )

    residual_torus_factor = (
        a**4 * b**2
        + a**4
        - 4 * a**3 * b**2
        - 4 * a**3 * b
        + a**2 * b**4
        - 4 * a**2 * b**3
        + 18 * a**2 * b**2
        - 4 * a**2 * b
        + a**2
        - 4 * a * b**3
        - 4 * a * b**2
        + b**4
        + b**2
    )
    assert sp.factor(
        sp.resultant(main_cubic_u, compatibility_linear, u)
    ) == (
        -a
        * b
        * (a - b**2)
        * (a**2 - b)
        * (a * b - 1)
        * residual_torus_factor
    )

    # The two first factors are precisely the circulant normal form (directly
    # or after swapping its last two rows).  The reciprocal residual factor
    # has no nontrivial unit-torus zero.  A Cayley transform makes this an
    # elementary positivity statement for two real quadratics.
    cayley_t, cayley_z = sp.symbols("cayley_t cayley_z", real=True)
    cayley_substitution = {
        a: (1 + sp.I * cayley_t) / (1 - sp.I * cayley_t),
        b: (1 + sp.I * cayley_z) / (1 - sp.I * cayley_z),
    }
    positive_minus = (
        cayley_t**2 * cayley_z**2
        - cayley_t**2 * cayley_z
        + cayley_t**2
        + cayley_t * cayley_z**2
        - cayley_t * cayley_z
        + cayley_z**2
    )
    positive_plus = (
        cayley_t**2 * cayley_z**2
        + cayley_t**2 * cayley_z
        + cayley_t**2
        - cayley_t * cayley_z**2
        - cayley_t * cayley_z
        + cayley_z**2
    )
    transformed_residual = sp.factor(
        sp.together(
            (residual_torus_factor / (a**2 * b**2)).subs(
                cayley_substitution
            )
        )
    )
    expected_transformed_residual = sp.factor(
        32
        * positive_minus
        * positive_plus
        / (
            (1 + cayley_t**2) ** 2
            * (1 + cayley_z**2) ** 2
        )
    )
    assert sp.cancel(
        transformed_residual - expected_transformed_residual
    ) == 0
    assert sp.factor(
        sp.discriminant(positive_minus, cayley_t)
        + cayley_z**2 * (3 * cayley_z**2 - 2 * cayley_z + 3)
    ) == 0
    assert sp.factor(
        sp.discriminant(positive_plus, cayley_t)
        + cayley_z**2 * (3 * cayley_z**2 + 2 * cayley_z + 3)
    ) == 0

    # It remains to contract ab=1.  The cubic then has the root 1; after a
    # cyclic rotation write the other roots as r and r^{-1}.  A diagonal
    # flatness numerator forces a=1, r=-1, or ar=1.  The first is not a phase
    # complement, the second is H2, and the third is the Fourier-block point.
    reciprocal_a, reciprocal_r = sp.symbols(
        "reciprocal_a reciprocal_r", nonzero=True
    )
    reciprocal_b = 1 / reciprocal_a
    reciprocal_e = sp.Matrix(
        [
            [1, 1, 1],
            [1, reciprocal_a, reciprocal_b],
            [1, reciprocal_b, reciprocal_b / reciprocal_a],
        ]
    )
    reciprocal_b_plus = sp.Matrix(
        [
            [1, 1, 1],
            [1, reciprocal_r, 1 / reciprocal_r],
            [
                reciprocal_b / reciprocal_r,
                reciprocal_b * reciprocal_r,
                reciprocal_b,
            ],
        ]
    )
    reciprocal_torus = {
        reciprocal_a: 1 / reciprocal_a,
        reciprocal_r: 1 / reciprocal_r,
    }

    def reciprocal_adjoint(matrix):
        return matrix.xreplace(reciprocal_torus).T

    reciprocal_d = sp.simplify(
        -reciprocal_b_plus.T
        * reciprocal_adjoint(reciprocal_e)
        * reciprocal_adjoint(reciprocal_b_plus.inv())
    )
    reciprocal_quadratic = (
        reciprocal_a * reciprocal_r**2
        + (reciprocal_a + 1) ** 2 * reciprocal_r
        + reciprocal_a
    )
    for diagonal in range(3):
        reciprocal_error = (
            reciprocal_d[diagonal, diagonal]
            * reciprocal_d[diagonal, diagonal].xreplace(reciprocal_torus)
            - 1
        )
        reciprocal_numerator = sp.factor(
            sp.together(reciprocal_error).as_numer_denom()[0]
        )
        expected_numerator = (
            (reciprocal_a - 1)
            * (reciprocal_r + 1)
            * (reciprocal_a * reciprocal_r - 1)
        )
        assert sp.factor(
            reciprocal_numerator / expected_numerator
        ) in (1, -1, 2, -2)
    assert sp.factor(reciprocal_quadratic.subs(reciprocal_r, -1)) == (
        -(reciprocal_a**2 + 1)
    )
    assert sp.factor(
        reciprocal_a
        * reciprocal_quadratic.subs(
            reciprocal_r, 1 / reciprocal_a
        )
        - 2 * (reciprocal_a**2 + reciprocal_a + 1)
    ) == 0

    # Fourth-block closure on the circulant normal form.
    cu, cv = sp.symbols("cu cv", nonzero=True)
    circulant_e = sp.Matrix(
        [[1, 1, 1], [1, b**2, b], [1, b, b**2]]
    )
    circulant_b_plus = sp.Matrix(
        [[1, 1, 1], [b, cu, cv], [cu, b, cv]]
    )
    circulant_b_minus = sp.Matrix(
        [[1, 1, 1], [b, cu, cv], [cv, cu, b]]
    )
    circulant_relations = (
        cu + cv + (b + 1) ** 2,
        cu * cv - b**2,
    )
    circulant_groebner = sp.groebner(
        circulant_relations,
        cu,
        cv,
        order="lex",
        domain=sp.QQ.frac_field(b),
    )
    circulant_torus = {b: 1 / b, cu: 1 / cu, cv: 1 / cv}

    def circulant_adjoint(matrix):
        return matrix.xreplace(circulant_torus).T

    def circulant_remainder(expr):
        numerator = sp.together(expr).as_numer_denom()[0]
        return sp.factor(circulant_groebner.reduce(numerator)[1])

    assert all(
        circulant_remainder(
            (circulant_e * circulant_adjoint(circulant_e)
             + circulant_b_plus * circulant_adjoint(circulant_b_plus)
             - 6 * sp.eye(3))[i, j]
        ) == 0
        for i in range(3)
        for j in range(3)
    )
    circulant_c = circulant_b_minus.T
    circulant_d = sp.simplify(
        -circulant_c
        * circulant_adjoint(circulant_e)
        * circulant_adjoint(circulant_b_plus.inv())
    )
    expected_circulant_d = -sp.Matrix(
        [[1, b, cv], [cu, cu, 1], [b, 1, cv]]
    )
    assert all(
        circulant_remainder(
            circulant_d[i, j] - expected_circulant_d[i, j]
        ) == 0
        for i in range(3)
        for j in range(3)
    )

    # If the same circulant pairing is used on both sides, one modulus
    # equation already forces an H2 endpoint or the Fourier-block point.
    circulant_same_d = sp.simplify(
        -circulant_b_plus.T
        * circulant_adjoint(circulant_e)
        * circulant_adjoint(circulant_b_plus.inv())
    )
    same_norm_remainder = circulant_remainder(
        circulant_same_d[0, 0]
        * circulant_same_d[0, 0].xreplace(circulant_torus)
        - 1
    )
    same_linear_factor = 2 * b**2 + b * cv + b + cv + 1
    assert sp.cancel(
        same_norm_remainder
        / ((b - 1) * (b**2 + 4 * b + 1) * same_linear_factor)
        + 2 * b
    ) == 0
    circulant_quadratic = cv**2 + (b + 1) ** 2 * cv + b**2
    assert sp.factor(
        sp.resultant(circulant_quadratic, same_linear_factor, cv)
    ) == -2 * b * (b**2 + 1) * (b**2 + b + 1)

    print("PASS bi-equimodularity has the exact three-way first split")
    print("PASS the a=bc branch re-dephases to the symmetric branch")
    print("PASS the non-H2 symmetric locus has exactly two normal forms")
    print("PASS the ad=b normal form has double product coordinate ab")
    print("PASS Xi_M=0 is intrinsically 2*theta=q(3-q)")
    print("PASS the circulant normal form has double product coordinate b^3")
    print("PASS opposite pairing sheets force explicit H2 edges")
    print("PASS a flat same-sheet main completion is H2 or Fourier-block")
    print("PASS a flat same-sheet circulant completion is H2 or Fourier-block")
    print("ALL BI-EQUIMODULAR CORE CHECKS PASSED")


if __name__ == "__main__":
    main()
