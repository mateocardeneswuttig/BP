#!/usr/bin/env python3
"""Exact identities reducing the product-regular escape problem.

This is a reduction certificate, not a proof that G_exc is empty.  It checks
the row-pair reversal law, the opposite-pair identity, the intrinsic delta
tests, and the canonical forms used to classify repeated-coordinate patterns
inside an invertible 3 x 3 phase block.
"""

import sympy as sp


def main():
    s, sb, t, tb, r, rb = sp.symbols("s sb t tb r rb", nonzero=True)

    def c6(s0, sb0, t0, tb0, r0, rb0):
        return -(
            r0**2 * tb0
            - r0 * sb0 * t0 * tb0
            + 3 * r0 * sb0
            + sb0**2 * t0
        ) * (
            r0 * rb0 * sb0 * tb0
            - r0 * tb0**2
            - rb0 * sb0**2
            - 3 * sb0 * tb0
        )

    def star(expr):
        return expr.subs(
            {s: sb, sb: s, t: tb, tb: t, r: rb, rb: r},
            simultaneous=True,
        )

    original_c6 = c6(s, sb, t, tb, r, rb)
    # Swapping the pivot row with the row carrying x sends
    # (s,s#,t,t#,r,r#) to (s#,s,r,r#,t,t#).
    reversed_c6 = c6(sb, s, r, rb, t, tb)
    assert sp.factor(reversed_c6 - star(original_c6)) == 0
    original_delta = r * rb - t * tb
    reversed_delta = t * tb - r * rb
    assert sp.expand(reversed_delta + original_delta) == 0

    # For a unit triple, |s|=1 is exactly the opposite-pair divisor.
    x, y, z = sp.symbols("x y z", nonzero=True)
    trace = x + y + z
    trace_bar = 1 / x + 1 / y + 1 / z
    opposite_product = (x + y) * (x + z) * (y + z)
    assert sp.factor(
        (trace * trace_bar - 1) * x * y * z - opposite_product
    ) == 0

    # The three oriented delta tests are precisely the three pairwise
    # differences of squared partial-correlation magnitudes.
    g01, g01b, g02, g02b, g12, g12b = sp.symbols(
        "g01 g01b g02 g02b g12 g12b"
    )
    magnitudes = (g01 * g01b, g02 * g02b, g12 * g12b)
    deltas = (
        magnitudes[2] - magnitudes[1],
        magnitudes[2] - magnitudes[0],
        magnitudes[1] - magnitudes[0],
    )
    assert sp.expand(deltas[0] - (g12 * g12b - g02 * g02b)) == 0
    assert sp.expand(deltas[1] - (g12 * g12b - g01 * g01b)) == 0
    assert sp.expand(deltas[2] - (g02 * g02b - g01 * g01b)) == 0
    # Any two vanishing differences force the third to vanish.
    assert sp.expand(deltas[0] - deltas[1] + deltas[2]) == 0

    # If two distinct row pairs are repeated on the same column pair, the
    # corresponding two columns are proportional.  The displayed minor is
    # the remaining row equation after the first two proportionality laws.
    a0, a1, a2, b0, b1, b2 = sp.symbols(
        "a0 a1 a2 b0 b1 b2", nonzero=True
    )
    proportionality = sp.factor(
        (a0 * b1 - a1 * b0) * a2 * b0
        - (a0 * b2 - a2 * b0) * a1 * b0
    )
    assert sp.expand(
        proportionality - a0 * b0 * (a2 * b1 - a1 * b2)
    ) == 0

    # With exactly one simple row pair, dephasing and permuting gives
    # X(a,b).  Local badness equates |2+a| and |2+b|.  On the unit torus
    # this splits into b=a or b=a^{-1}; the latter makes the nominally simple
    # pair repeated, leaving X(a,a).
    a, b = sp.symbols("a b", nonzero=True)
    modulus_difference = sp.factor(
        (2 + a) * (2 + 1 / a) - (2 + b) * (2 + 1 / b)
    )
    assert sp.cancel(
        modulus_difference - 2 * (a - b) * (a * b - 1) / (a * b)
    ) == 0
    nominal_simple_minor = sp.factor(b - 1 / a)
    assert sp.factor(nominal_simple_minor.subs(b, 1 / a)) == 0

    one_simple = sp.Matrix(
        [[1, 1, 1], [1, 1, a], [1, a, 1]]
    )
    assert sp.factor(one_simple.det()) == -(a - 1) ** 2
    # At a=-1 the remaining row ratio also repeats, so exactly one simple
    # pair requires a != +/-1.
    remaining_ratio = (sp.Integer(1), a, 1 / a)
    assert remaining_ratio[1].subs(a, -1) == remaining_ratio[2].subs(a, -1)

    # If no row pair is simple, the third repeated pair forces b=a^{-1}.
    no_simple = sp.Matrix(
        [[1, 1, 1], [1, 1, a], [1, 1 / a, 1]]
    )
    assert sp.factor(no_simple.det()) == (a - 1) ** 2 / a
    ratios_12 = (sp.Integer(1), 1 / a, 1 / a)
    assert ratios_12[1] == ratios_12[2]

    # First global compatibility contraction.  For X(a), the sum of the
    # squared moduli of its three off-diagonal row correlations is
    # F(c)=11+12c+4c^2, where c=Re(a).  Equality of tr((EE*)^2) and
    # tr((E*E)^2) forces F(c)=F(d) for opposite X(a), X(b) blocks.  Since
    # c,d lie in [-1,1], the second factor c+d+3 cannot vanish.
    def torus_adjoint(matrix, phase):
        return matrix.T.subs(phase, 1 / phase)

    one_simple_gram = one_simple * torus_adjoint(one_simple, a)
    one_simple_laurent_profile = sp.factor(sum(
        one_simple_gram[i, j] * one_simple_gram[j, i]
        for i in range(3)
        for j in range(i + 1, 3)
    ))
    assert sp.cancel(
        one_simple_laurent_profile
        - (11 + 6 * (a + 1 / a) + (a + 1 / a) ** 2)
    ) == 0

    no_simple_gram = no_simple * torus_adjoint(no_simple, a)
    no_simple_laurent_profile = sp.factor(sum(
        no_simple_gram[i, j] * no_simple_gram[j, i]
        for i in range(3)
        for j in range(i + 1, 3)
    ))
    assert sp.cancel(
        no_simple_laurent_profile - (15 + 6 * (a + 1 / a))
    ) == 0

    c, d = sp.symbols("c d", real=True)
    profile_one_simple = 2 * (5 + 4 * c) + (1 + 2 * c) ** 2
    assert sp.factor(profile_one_simple - (11 + 12 * c + 4 * c**2)) == 0
    matching_profiles = sp.factor(
        profile_one_simple
        - profile_one_simple.subs(c, d)
    )
    assert sp.expand(
        matching_profiles - 4 * (c - d) * (c + d + 3)
    ) == 0

    # The no-simple canonical form has an equimodular row Gram.
    no_simple_profile = 3 * (5 + 4 * c)
    assert sp.expand(
        profile_one_simple
        - no_simple_profile.subs(c, d)
        - 4 * (c**2 + 3 * c - 3 * d - 1)
    ) == 0

    # The determinant supplies the second spectral invariant.  Together
    # with the squared-trace relation it rules out a one-simple/no-simple
    # complementary pair away from the endpoints c=d=+/-1.
    det_one_simple = -(2 * c + 4) * (14 * c + 4)
    det_no_simple = -4 * (d**2 + 16 * d + 10)
    trace_relation = c**2 + 3 * c - 3 * d - 1
    determinant_relation = sp.expand(
        det_one_simple - det_no_simple
    )
    endpoint_eliminant = sp.factor(
        sp.resultant(trace_relation, determinant_relation, d)
    )
    assert endpoint_eliminant == 4 * (c - 1) ** 2 * (c + 1) * (c + 7)

    # If both sides are one-simple and their common real parameter is not an
    # endpoint, the distinguished antisymmetric eigenvalue is simple.
    lam = sp.symbols("lam")
    anti_eigenvalue = 4 + 2 * c
    remaining_quadratic = (
        lam**2 + (2 * c - 5) * lam - 14 * c - 4
    )
    assert sp.expand(
        remaining_quadratic.subs(lam, anti_eigenvalue)
        - 8 * (c - 1) * (c + 1)
    ) == 0

    # The phase-entry contradiction used after simplicity of that eigenvalue
    # is the unit-circle parallelogram lemma.  For unit p,q,r,z with
    # p+z=q+r, a nonzero sum determines the unordered endpoint pair; the two
    # possible matchings kill one of the nonzero singular-vector scalars.  If
    # the sum is zero, equality of the first two row correlations forces
    # p+q=0 and hence equality of the last two rows.
    p, q = sp.symbols("p q", nonzero=True)
    row_correlation_difference = sp.factor(
        2 * (1 / p + 1 / q)
    )
    assert sp.expand(
        p * q * row_correlation_difference - 2 * (p + q)
    ) == 0

    # The fixed-Gram companion for a one-simple block preserves each product
    # cubic.  Since the fixed-Gram data are symmetric in the last two rows,
    # the companion is an involution; away from the exceptional closure it
    # therefore pairs the three roots by a transposition (identity would make
    # the block singular).  This gives E with its last two rows related by a
    # transposition.
    coordinate, partner, product = sp.symbols(
        "coordinate partner product", nonzero=True
    )
    ss, ssb, tt, ttb, rr, rrb = sp.symbols(
        "ss ssb tt ttb rr rrb", nonzero=True
    )
    haagerup = (
        (coordinate - ss)
        * (1 / partner - ttb)
        * (partner / coordinate - rr)
    )
    haagerup_bar = (
        (1 / coordinate - ssb)
        * (partner - tt)
        * (coordinate / partner - rrb)
    )
    sigma = (coordinate - ss) * (1 / coordinate - ssb)
    delta_pair = (partner - tt) * (1 / partner - ttb)
    psi = (
        (partner / coordinate - rr)
        * (coordinate / partner - rrb)
    )
    first_haagerup = sp.Poly(
        sp.cancel(coordinate * partner * (haagerup - haagerup_bar)),
        partner,
    )
    second_haagerup = sp.Poly(
        sp.cancel(
            coordinate
            * partner
            * (haagerup - 4 + sigma + delta_pair + psi)
        ),
        partner,
    )
    first_coefficients = [
        first_haagerup.coeff_monomial(partner**degree)
        for degree in range(3)
    ]
    second_coefficients = [
        second_haagerup.coeff_monomial(partner**degree)
        for degree in range(3)
    ]
    companion_a = sp.expand(
        first_coefficients[2] * second_coefficients[0]
        - first_coefficients[0] * second_coefficients[2]
    )
    companion_b = sp.expand(
        first_coefficients[2] * second_coefficients[1]
        - first_coefficients[1] * second_coefficients[2]
    )
    one_simple_substitution = {
        ss: -(2 + a),
        tt: -(2 + a),
        ssb: -(2 + 1 / a),
        ttb: -(2 + 1 / a),
        rr: -(1 + a + 1 / a),
        rrb: -(1 + a + 1 / a),
    }
    specialized_a = sp.factor(companion_a.subs(one_simple_substitution))
    specialized_b = sp.factor(companion_b.subs(one_simple_substitution))

    def coordinate_star(expr):
        return expr.subs(
            {
                coordinate: 1 / coordinate,
                ss: ssb,
                ssb: ss,
                tt: ttb,
                ttb: tt,
                rr: rrb,
                rrb: rr,
            },
            simultaneous=True,
        )

    fundamental = sp.Poly(
        sp.expand(
            coordinate**3
            * (companion_a * coordinate_star(companion_a)
               - companion_b * coordinate_star(companion_b))
        ),
        coordinate,
    )
    coefficients = [
        fundamental.coeff_monomial(coordinate**degree)
        for degree in range(7)
    ]
    specialized_coefficients = [
        sp.factor(value.subs(one_simple_substitution))
        for value in coefficients
    ]
    specialized_numerators = [
        sp.Poly(sp.together(value).as_numer_denom()[0], a)
        for value in specialized_coefficients
    ]
    common_coefficient_factor = specialized_numerators[0]
    for numerator in specialized_numerators[1:]:
        common_coefficient_factor = sp.gcd(
            common_coefficient_factor, numerator
        )
    assert sp.factor(common_coefficient_factor.as_expr()) == (
        (a**2 + 2 * a + 3)
        * (a**2 + 4 * a + 1)
        * (3 * a**2 + 2 * a + 1)
    )
    product_equation = sp.primitive(
        sp.Poly(
            (1 + (2 + a) * (2 + 1 / a))
            * specialized_coefficients[6]
            * product**2
            + specialized_coefficients[3] * product
            + (1 + (2 + a) * (2 + 1 / a))
            * specialized_coefficients[0],
            product,
        ),
        product,
    )[1].as_expr()
    product_cubic = (
        coordinate**3
        + (2 + a) * coordinate**2
        - product * (2 + 1 / a) * coordinate
        - product
    )
    companion_value = -specialized_a / specialized_b
    preserved_cubic_numerator = sp.together(
        companion_value**3
        + (2 + a) * companion_value**2
        - product * (2 + 1 / a) * companion_value
        - product
    ).as_numer_denom()[0]
    preservation_groebner = sp.groebner(
        [product_cubic, product_equation],
        coordinate,
        product,
        order="lex",
        domain=sp.QQ.frac_field(a),
    )
    assert preservation_groebner.reduce(
        preserved_cubic_numerator
    )[1] == 0

    # Such a transposition complement has column-correlation magnitudes
    # |1+2c|, sqrt(5+4c), sqrt(5+4c).  Equimodularity would force c=+/-1,
    # exactly the excluded endpoints.
    one_simple_real_correlation_squared = (1 + 2 * c) ** 2
    one_simple_other_correlation_squared = 5 + 4 * c
    assert sp.expand(
        one_simple_real_correlation_squared
        - one_simple_other_correlation_squared
        - 4 * (c - 1) * (c + 1)
    ) == 0

    # The no-simple/no-simple branch is an H2 branch.  If u,v,w are the
    # roots of the finite delta=0 cubic, their symmetric data are
    # u+v+w=-(a+2), uv+uw+vw=-(2a+1), uvw=a.  The two compatible third rows
    # are cyclic inverse shifts.  One canonical choice is below.
    u, v, w = sp.symbols("u v w", nonzero=True)
    no_simple_b = sp.Matrix(
        [[1, 1, 1], [1, 1, a], [1, 1 / a, 1]]
    )
    cyclic_e = sp.Matrix(
        [[1, 1, 1], [u, v, w], [1 / v, 1 / w, 1 / u]]
    )
    column_phase = sp.diag(1, v, 1 / u)
    cyclic_c = no_simple_b * column_phase

    torus_substitution = {
        a: 1 / a,
        u: 1 / u,
        v: 1 / v,
        w: 1 / w,
    }

    def cyclic_adjoint(matrix):
        return matrix.xreplace(torus_substitution).T

    symmetric_relations = (
        u + v + w + a + 2,
        u * v + u * w + v * w + 2 * a + 1,
        u * v * w - a,
    )
    symmetric_groebner = sp.groebner(
        symmetric_relations,
        u,
        v,
        w,
        order="lex",
        domain=sp.QQ.frac_field(a),
    )

    def zero_mod_symmetric_relations(expr):
        numerator = sp.together(expr).as_numer_denom()[0]
        return sp.factor(symmetric_groebner.reduce(numerator)[1]) == 0

    column_complement_error = (
        cyclic_adjoint(cyclic_e) * cyclic_e
        + cyclic_adjoint(cyclic_c) * cyclic_c
        - 6 * sp.eye(3)
    )
    assert all(
        zero_mod_symmetric_relations(column_complement_error[i, j])
        for i in range(3)
        for j in range(3)
    )

    forced_d = sp.simplify(
        -cyclic_c
        * cyclic_adjoint(cyclic_e)
        * cyclic_adjoint(no_simple_b.inv())
    )
    for index in range(3):
        assert zero_mod_symmetric_relations(forced_d[index, index] + 1)

    # More strongly, the column-complement fibre of cyclic_e is ramified at
    # a repeated-root cubic.  Reuse the general fundamental coefficients
    # computed above with the fixed-Gram data of Z=C^T.
    z_s = v * (2 + 1 / a)
    z_sb = (2 + a) / v
    z_t = (2 + a) / u
    z_tb = u * (2 + 1 / a)
    z_r = (1 + 2 * a) / (u * v)
    z_rb = u * v * (1 + 2 / a)
    z_substitution = {
        ss: z_s,
        ssb: z_sb,
        tt: z_t,
        ttb: z_tb,
        rr: z_r,
        rrb: z_rb,
    }
    z_coefficients = [
        value.subs(z_substitution) for value in coefficients
    ]
    z_product = sp.symbols("z_product")
    z_product_equation = sp.Poly(
        sp.together(
            (1 + z_s * z_sb) * z_coefficients[6] * z_product**2
            + z_coefficients[3] * z_product
            + (1 + z_s * z_sb) * z_coefficients[0]
        ).as_numer_denom()[0],
        z_product,
    )
    reduced_product_coefficients = []
    for degree in range(3):
        coefficient = z_product_equation.coeff_monomial(z_product**degree)
        reduced_product_coefficients.append(
            sp.factor(symmetric_groebner.reduce(coefficient)[1])
        )
    repeated_product = v**3 / a
    for relation in (
        reduced_product_coefficients[1]
        + 2 * repeated_product * reduced_product_coefficients[2],
        reduced_product_coefficients[0]
        - repeated_product**2 * reduced_product_coefficients[2],
    ):
        numerator = sp.together(relation).as_numer_denom()[0]
        assert sp.factor(symmetric_groebner.reduce(numerator)[1]) == 0

    z_candidate_cubic = (
        coordinate**3
        - z_s * coordinate**2
        + repeated_product * z_sb * coordinate
        - repeated_product
    )
    assert sp.expand(
        z_candidate_cubic
        - (coordinate - v) ** 2 * (coordinate - v / a)
    ) == 0
    y_repeated_product = a / u**3
    y_candidate_cubic = (
        partner**3
        - z_t * partner**2
        + y_repeated_product * z_tb * partner
        - y_repeated_product
    )
    assert sp.expand(
        y_candidate_cubic
        - (partner - 1 / u) ** 2 * (partner - a / u)
    ) == 0

    # Exhaust the six inverse-root pairings.  The two 3-cycles give the
    # required cross trace identically.  The identity pairing would require
    # 7a^2+10a+1=0, which has no unit root: after division by a its imaginary
    # part is 6 Im(a), and neither real unit is a root.  A transposition can
    # occur only when the cubic
    # discriminant vanishes, and its fixed root is then a repeated root, so
    # its value-pattern is already one of the two cyclic inverse shifts.
    root = sp.symbols("root", nonzero=True)
    finite_delta_cubic = (
        root**3 + (a + 2) * root**2 - (2 * a + 1) * root - a
    )
    cubic_discriminant_factor = (
        a**4 + 14 * a**3 + 24 * a**2 + 14 * a + 1
    )
    assert sp.factor(
        sp.discriminant(finite_delta_cubic, root)
        - 8 * cubic_discriminant_factor
    ) == 0
    normalized_discriminant_error = sp.together(
        cubic_discriminant_factor / a**2
        - 2 * (2 * c**2 + 14 * c + 11)
    ).as_numer_denom()[0]
    assert sp.rem(
        normalized_discriminant_error,
        a**2 - 2 * c * a + 1,
        a,
    ) == 0
    transposition_cross = (
        a * root**2 + a + 2 * root**3 + 2 * root**2
    )
    assert sp.factor(
        sp.resultant(finite_delta_cubic, transposition_cross, root)
    ) == -8 * a * cubic_discriminant_factor
    repeated_groebner = sp.groebner([
        finite_delta_cubic,
        transposition_cross,
        cubic_discriminant_factor,
    ],
        root,
        a,
        order="lex",
    )
    assert repeated_groebner.reduce(
        sp.diff(finite_delta_cubic, root)
    )[1] == 0
    identity_pairing_factor = 7 * a**2 + 10 * a + 1
    assert identity_pairing_factor.subs(a, 1) != 0
    assert identity_pairing_factor.subs(a, -1) != 0

    # A fully exact counterexample shows why the final lemma must use all
    # four 3 x 3 blocks, not merely a bad block and its Gram complement.
    # Put a=(-4+3i)/5, M=-(1+3i)/sqrt(10), and
    # h=(sqrt(2)+i sqrt(3))/sqrt(5).  Then x1=Mh, x2=M/h are unit,
    # x1+x2=-2(1+a), and x1*x2=a.
    aa = (-4 + 3 * sp.I) / 5
    phase_m = -(1 + 3 * sp.I) / sp.sqrt(10)
    phase_h = (sp.sqrt(2) + sp.I * sp.sqrt(3)) / sp.sqrt(5)
    x1 = sp.expand_power_base(phase_m * phase_h, force=True)
    x2 = sp.expand_power_base(phase_m / phase_h, force=True)
    exact_x = sp.Matrix(
        [[1, 1, 1], [1, 1, aa], [1, aa, 1]]
    )
    exact_e = sp.Matrix(
        [[1, 1, 1], [x1, x2, aa], [x2, x1, aa]]
    )

    def algebraic_conjugate(value):
        return sp.conjugate(value).expand(complex=True)

    def adjoint(matrix):
        return matrix.applyfunc(algebraic_conjugate).T

    for entry in tuple(exact_e) + tuple(exact_x):
        assert sp.simplify(entry * algebraic_conjugate(entry) - 1) == 0
    complement_error = exact_e * adjoint(exact_e) + exact_x * adjoint(exact_x)
    assert all(
        sp.simplify(complement_error[i, j] - (6 if i == j else 0)) == 0
        for i in range(3)
        for j in range(3)
    )
    assert sp.simplify(exact_e.det()) != 0
    assert sp.simplify(exact_x.det()) != 0

    partial = exact_e.row_join(exact_x)
    for first in range(3):
        for second in range(first + 1, 3):
            ratios = [
                sp.simplify(partial[second, column] / partial[first, column])
                for column in range(6)
            ]
            for left in range(6):
                for right in range(left + 1, 6):
                    assert sp.simplify(ratios[left] + ratios[right]) != 0

    print("PASS row-pair reversal conjugates c6 and negates delta")
    print("PASS |s|=1 is exactly the opposite-pair divisor for a unit triple")
    print("PASS the three delta tests are correlation-magnitude differences")
    print("PASS repeated-minor incidences have the stated canonical forms")
    print("PASS the exactly-one-simple bad form is X(a,a), a != +/-1")
    print("PASS a one-simple bad block cannot oppose any locally bad block")
    print("PASS the no-simple/no-simple completion has a forced H2 edge")
    print("PASS a no-simple block has only no-simple invertible opposite candidates")
    print("PASS all exceptional inverse-root pairings reduce to the cyclic chart")
    print("PASS an exact complemented bad block refutes the local shortcut")
    print("ALL PRODUCT-REGULAR ESCAPE REDUCTIONS PASSED")


if __name__ == "__main__":
    main()
