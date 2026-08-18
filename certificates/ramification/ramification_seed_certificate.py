#!/usr/bin/env python3
"""Exact and Arb-certified checks for the algebraic ramification seed.

The exact layer works in Q(i)[xi]/(P).  It proves that the repeated product
coordinate is unit, that the candidate cubic lies in the fundamental norm
locus, and that the companion denominator is coprime to the cubic.  The Arb
layer rigorously encloses the selected real embedding, all three candidate
roots, the completed matrix, the 225 Karlsson equations, and a Tao-excluding
cross-ratio.

The proof that the lower block is exactly flat uses the generic minus-sheet
flatness identity from GENERIC_FLATNESS_BY_DOMINANCE.md, specialized at this
regular branch point.  Arb independently checks that every lower-block
modulus enclosure contains one.
"""

from __future__ import annotations

import itertools

import sympy as sp
from flint import acb, acb_mat, arb, arb_poly, ctx, fmpz_poly

from ramification_algebraic_seed import (
    primitive_integer_polynomial,
    residual_branch_polynomial,
)


ctx.prec = 256

I = sp.I
XI, Z, Y = sp.symbols("xi z y", real=True)
P = sp.Poly(
    16 * XI**7
    + 120 * XI**6
    + 428 * XI**5
    + 952 * XI**4
    + 1363 * XI**3
    + 1231 * XI**2
    + 664 * XI
    + 176,
    XI,
    domain=sp.QQ_I,
)


def cycle_lengths(permutation):
    """Return the nontrivial cycle lengths of a permutation."""
    seen = set()
    lengths = []
    for start in range(len(permutation)):
        if start in seen:
            continue
        current = start
        length = 0
        while current not in seen:
            seen.add(current)
            current = permutation[current]
            length += 1
        if length > 1:
            lengths.append(length)
    return tuple(sorted(lengths))


def exclude_three_cycle_block_automorphisms(H):
    """Exclude every monomial automorphism of row/column type (3,3).

    A matrix built from four 3-by-3 circulant blocks is fixed by simultaneous
    cyclic shifts inside the two row blocks and the two column blocks.  After
    arbitrary Hadamard equivalence, the underlying row and column
    permutations still both have cycle type (3,3).  Conversely, a candidate
    pair of permutations lifts to a monomial automorphism exactly when the
    two dephased matrices agree.  The cross-ratio formula below performs that
    comparison without solving for the diagonal phases.
    """
    permutations_33 = [
        permutation
        for permutation in itertools.permutations(range(6))
        if cycle_lengths(permutation) == (3, 3)
    ]
    if len(permutations_33) != 40:
        raise AssertionError("unexpected number of cycle-type (3,3) permutations")

    candidate_witness_lowers = []
    for row_permutation in permutations_33:
        for column_permutation in permutations_33:
            pivot = H[row_permutation[0], column_permutation[0]]
            witness_lower = arb(0)
            for i in range(1, 6):
                row_pivot = H[row_permutation[i], column_permutation[0]]
                for j in range(1, 6):
                    column_pivot = H[row_permutation[0], column_permutation[j]]
                    redephased = (
                        H[row_permutation[i], column_permutation[j]] * pivot
                        / (row_pivot * column_pivot)
                    )
                    witness_lower = max(
                        witness_lower,
                        (redephased - H[i, j]).abs_lower(),
                    )
            candidate_witness_lowers.append(witness_lower)

    minimum_witness_lower = min(candidate_witness_lowers)
    if minimum_witness_lower <= arb(0):
        raise AssertionError(
            "a cycle-type (3,3) block automorphism was not excluded"
        )
    return minimum_witness_lower


def canonical(expr):
    """Canonical representative in Q(i)[xi]/(P)."""
    numerator, denominator = sp.cancel(expr).as_numer_denom()
    numerator_poly = sp.Poly(numerator, XI, domain=sp.QQ_I).rem(P)
    denominator_poly = sp.Poly(denominator, XI, domain=sp.QQ_I).rem(P)
    inverse = sp.invert(denominator_poly, P)
    return (numerator_poly * inverse).rem(P).as_expr()


def candidate_symbolics():
    s, sb, t, tb, r, rb = sp.symbols("s sb t tb r rb", nonzero=True)
    h = (Z - s) * (1 / Y - tb) * (Y / Z - r)
    hb = (1 / Z - sb) * (Y - t) * (Z / Y - rb)
    sigma2 = (Z - s) * (1 / Z - sb)
    delta2 = (Y - t) * (1 / Y - tb)
    psi2 = (Y / Z - r) * (Z / Y - rb)
    first = sp.Poly(sp.cancel(Z * Y * (h - hb)), Y)
    second = sp.Poly(
        sp.cancel(Z * Y * (h - 4 + sigma2 + delta2 + psi2)), Y
    )
    f0, f1, f2 = (first.coeff_monomial(Y**k) for k in range(3))
    g0, g1, g2 = (second.coeff_monomial(Y**k) for k in range(3))
    A = sp.expand(f2 * g0 - f0 * g2)
    B = sp.expand(f2 * g1 - f1 * g2)

    def star(expr):
        return expr.subs(
            {Z: 1 / Z, s: sb, sb: s, t: tb, tb: t, r: rb, rb: r},
            simultaneous=True,
        )

    fundamental = sp.Poly(
        sp.expand(Z**3 * (A * star(A) - B * star(B))), Z
    )
    coefficients = [fundamental.coeff_monomial(Z**k) for k in range(7)]
    d = (1 + I * XI) / (1 - I * XI)
    substitution = {
        s: -(1 + 2 * I),
        sb: -(1 - 2 * I),
        t: -(1 + I + d),
        tb: -(1 - I + 1 / d),
        r: -2 + I * d,
        rb: -2 - I / d,
    }
    U = sp.cancel(
        ((coefficients[4] - s**2 * coefficients[6]) / (sb * coefficients[6])).subs(
            substitution
        )
    )
    u = canonical(U / 2)
    q = sp.Poly(Z**3 - substitution[s] * Z**2 + u * substitution[sb] * Z - u, Z)
    regular_factors = {
        "c6": sp.cancel(coefficients[6].subs(substitution)),
        "delta": sp.cancel((r * rb - t * tb).subs(substitution)),
    }
    return substitution, A, B, fundamental, u, q, regular_factors


def exact_checks():
    factorization = sp.factor_list(P)
    if len(factorization[1]) != 1 or factorization[1][0][0].degree() != 7:
        raise AssertionError("seed polynomial is reducible over Q(i)")

    substitution, A, B, fundamental, u, q, regular_factors = candidate_symbolics()
    if canonical(u * sp.conjugate(u) - 1) != 0:
        raise AssertionError("repeated product coordinate is not unit")

    B_seed = sp.Poly(sp.cancel(B.subs(substitution)), Z)
    resultant = canonical(sp.resultant(q.as_expr(), B_seed.as_expr(), Z))
    if resultant == 0:
        raise AssertionError("companion denominator meets the candidate cubic")

    fundamental_seed = sp.Poly(sp.cancel(fundamental.as_expr().subs(substitution)), Z)
    remainder = sp.rem(fundamental_seed, q, Z)
    if any(canonical(remainder.coeff_monomial(Z**k)) != 0 for k in range(3)):
        raise AssertionError("candidate cubic does not divide the norm polynomial")

    q_discriminant = canonical(sp.discriminant(q.as_expr(), Z))
    if q_discriminant == 0:
        raise AssertionError("candidate cubic has a repeated coordinate")
    if canonical(q.as_expr().subs(Z, -1)) == 0:
        raise AssertionError("Cayley coordinate misses a root at -1")

    # The Cayley transform of q is a real cubic over Q(xi).  The clean
    # coefficient formula is useful both for exact inspection and Arb roots.
    seed_trace = (
        992 * XI**6
        + 6592 * XI**5
        + 21088 * XI**4
        + 41052 * XI**3
        + 49318 * XI**2
        + 32455 * XI
    )
    expected_coefficients = [
        1,
        (seed_trace + 12348) / 600,
        (seed_trace + 12048) / 300,
        (seed_trace + 11148) / 600,
    ]
    W = sp.symbols("w", real=True)
    cayley_numerator = sp.Poly(
        sp.together(q.as_expr().subs(Z, (1 + I * W) / (1 - I * W))).as_numer_denom()[0],
        W,
    )
    leading = cayley_numerator.all_coeffs()[0]
    actual_coefficients = [canonical(value / leading) for value in cayley_numerator.all_coeffs()]
    if any(
        canonical(actual - expected) != 0
        for actual, expected in zip(actual_coefficients, expected_coefficients)
    ):
        raise AssertionError("real Cayley cubic formula changed")
    if any(canonical((value - sp.conjugate(value)) / (2 * I)) != 0 for value in actual_coefficients):
        raise AssertionError("Cayley cubic is not real at the selected embedding")

    # Recompute the residual branch equation independently of the product
    # cubic above and verify its exact one-parameter specialization.
    (s, sb, t, tb, r, rb), omega = residual_branch_polynomial()
    d_symbol = sp.symbols("d", real=True)
    branch_substitution = {
        s: -(1 + 2 * I),
        sb: -(1 - 2 * I),
        t: -(1 + I + d_symbol),
        tb: -(1 - I + 1 / d_symbol),
        r: -2 + I * d_symbol,
        rb: -2 - I / d_symbol,
    }
    specialized = sp.cancel(omega.subs(branch_substitution))
    numerator = sp.together(specialized).as_numer_denom()[0]
    cayley = sp.cancel(numerator.subs(d_symbol, (1 + I * XI) / (1 - I * XI)))
    branch_numerator = sp.expand(sp.together(cayley).as_numer_denom()[0])
    real_part = sp.Poly(sp.re(sp.expand_complex(branch_numerator)), XI, domain=sp.QQ)
    imaginary_part = sp.Poly(sp.im(sp.expand_complex(branch_numerator)), XI, domain=sp.QQ)
    branch_polynomial = primitive_integer_polynomial(sp.gcd(real_part, imaginary_part))
    expected_branch = sp.Poly((XI + 1) * P.as_expr(), XI).set_domain(sp.ZZ)
    if branch_polynomial != expected_branch:
        raise AssertionError("residual branch specialization is not (xi+1)P(xi)")

    # Exact transverse branch: P is square-free and does not meet xi+1.
    if sp.gcd(P, sp.diff(P.as_expr(), XI)) != 1:
        raise AssertionError("seed polynomial is not square-free")
    if sp.gcd(P, sp.Poly(XI + 1, XI, domain=sp.QQ_I)) != 1:
        raise AssertionError("regular seed collided with the xi=-1 branch")

    return substitution, A, B, expected_coefficients, resultant, regular_factors


def rational_ball(value):
    value = sp.Rational(value)
    return arb(int(value.p)) / int(value.q)


def gaussian_ball(value):
    value = sp.expand(value)
    return acb(rational_ball(sp.re(value)), rational_ball(sp.im(value)))


def downward_decimal(value, places=6):
    """Format a rigorous lower endpoint by truncating toward minus infinity."""
    scale = 10**places
    integer = (value.lower() * scale).floor().unique_fmpz()
    if integer is None:
        raise AssertionError("lower endpoint did not determine a decimal truncation")
    integer = str(integer)
    negative = integer.startswith("-")
    digits = integer[1:] if negative else integer
    digits = digits.zfill(places + 1)
    text = f"{digits[:-places]}.{digits[-places:]}"
    return f"-{text}" if negative else text


def evaluate_at_xi(expr, xi_ball):
    numerator, denominator = sp.cancel(expr).as_numer_denom()

    def evaluate_polynomial(poly_expr):
        value = acb(0)
        coefficients = sp.Poly(poly_expr, XI, domain=sp.QQ_I).all_coeffs()
        for coefficient in coefficients:
            value = value * xi_ball + gaussian_ball(coefficient)
        return value

    return evaluate_polynomial(numerator) / evaluate_polynomial(denominator)


def polynomial_value(coefficients, value):
    result = acb(0)
    for coefficient in coefficients:
        result = result * value + coefficient
    return result


def certified_real_embedding():
    integer_polynomial = fmpz_poly([176, 664, 1231, 1363, 952, 428, 120, 16])
    roots = integer_polynomial.complex_roots()
    real_roots = [root.real for root, multiplicity in roots if root.imag.contains(0)]
    if len(real_roots) != 1:
        raise AssertionError("Arb did not isolate the unique real seed root")
    return real_roots[0]


def interval_checks(
    substitution, A, B, cayley_coefficients, resultant, regular_factors
):
    xi_ball = certified_real_embedding()
    if evaluate_at_xi(resultant, xi_ball).abs_lower() <= arb(30):
        raise AssertionError("companion resultant lacks a robust lower bound")

    real_coefficients = [evaluate_at_xi(value, xi_ball).real for value in cayley_coefficients]
    real_cubic = arb_poly(list(reversed(real_coefficients)))
    # The default isolating boxes are sufficient for the original scalar
    # checks but much too wide for downstream all-frame evaluation, where
    # cancellation in the companion polynomials amplifies their radii.
    roots = real_cubic.complex_roots(tol=2**-180, maxprec=512)
    if len(roots) != 3 or any(not root.imag.contains(0) for root in roots):
        raise AssertionError("Arb did not isolate three real Cayley roots")
    cayley_roots = [root.real for root in roots]
    root_separation_lower_ball = min(
        abs(cayley_roots[i] - cayley_roots[j]).lower()
        for i in range(3)
        for j in range(i + 1, 3)
    )
    if root_separation_lower_ball <= rational_ball(sp.Rational(1, 10)):
        raise AssertionError("Cayley roots are not safely separated")

    regular_factor_lower_ball = min(
        evaluate_at_xi(value, xi_ball).abs_lower()
        for value in regular_factors.values()
    )
    if regular_factor_lower_ball <= rational_ball(sp.Rational(1, 10)):
        raise AssertionError("a product-cover regularity factor approaches zero")

    one = acb(1)
    imaginary_unit = acb(0, 1)
    x_roots = [
        (one + imaginary_unit * root) / (one - imaginary_unit * root)
        for root in cayley_roots
    ]

    A_seed = sp.Poly(sp.cancel(A.subs(substitution)), Z)
    B_seed = sp.Poly(sp.cancel(B.subs(substitution)), Z)
    A_coefficients = [evaluate_at_xi(value, xi_ball) for value in A_seed.all_coeffs()]
    B_coefficients = [evaluate_at_xi(value, xi_ball) for value in B_seed.all_coeffs()]
    B_values = [polynomial_value(B_coefficients, root) for root in x_roots]
    denominator_lower_ball = min(value.abs_lower() for value in B_values)
    if denominator_lower_ball <= rational_ball(sp.Rational(1, 10)):
        raise AssertionError("companion denominator is not safely separated from zero")
    y_roots = [
        -polynomial_value(A_coefficients, root) / denominator
        for root, denominator in zip(x_roots, B_values)
    ]

    d = evaluate_at_xi((1 + I * XI) / (1 - I * XI), xi_ball)
    E = acb_mat([[one, one, one], [one, imaginary_unit, imaginary_unit], [one, imaginary_unit, d]])
    B_matrix = acb_mat([[one, one, one], x_roots, y_roots])
    C = B_matrix.transpose()
    D = -(C * E.conjugate().transpose() * B_matrix.inv().conjugate().transpose())
    H = acb_mat(6, 6)
    for i in range(3):
        for j in range(3):
            H[i, j] = E[i, j]
            H[i, j + 3] = B_matrix[i, j]
            H[i + 3, j] = C[i, j]
            H[i + 3, j + 3] = D[i, j]

    determinant_lower_ball = min(
        matrix.det().abs_lower() for matrix in (E, B_matrix, C)
    )
    if determinant_lower_ball <= arb(1):
        raise AssertionError("one of E, B, C is not certified invertible")

    karlsson_lower_bounds = []
    tao_lower_bounds = []
    for i in range(6):
        for k in range(i + 1, 6):
            for j in range(6):
                for ell in range(j + 1, 6):
                    karlsson = H[i, j] * H[k, ell] + H[i, ell] * H[k, j]
                    karlsson_lower_bounds.append(karlsson.abs_lower())
                    cross_ratio = H[i, j] * H[k, ell] / (H[i, ell] * H[k, j])
                    tao_lower_bounds.append((cross_ratio**3 - 1).abs_lower())

    minimum_karlsson = min(karlsson_lower_bounds)
    maximum_tao_witness = max(tao_lower_bounds)
    if minimum_karlsson <= rational_ball(sp.Rational(1, 10)):
        raise AssertionError("Karlsson equations are not all certified nonzero")
    if maximum_tao_witness <= rational_ball(sp.Rational(19, 10)):
        raise AssertionError("no robust Tao-excluding cross-ratio was found")

    # Exact flatness follows from the atlas identity.  These enclosures are
    # an independent numerical audit that the correct branch/order was used.
    if any(not (abs(D[i, j]) - 1).contains(0) for i in range(3) for j in range(3)):
        raise AssertionError("a lower-block modulus enclosure misses one")

    block_automorphism_witness_lower = (
        exclude_three_cycle_block_automorphisms(H)
    )

    return {
        # Retained for downstream finite-frame certificates.  This is the
        # rigorously enclosed completed seed, not a floating-point matrix.
        "matrix": H,
        "xi": xi_ball,
        # These strings are downward-truncated rigorous lower endpoints, not
        # nearest-rounded binary floats.
        "companion_denominator_lower": downward_decimal(denominator_lower_ball),
        "regular_factor_lower": downward_decimal(regular_factor_lower_ball),
        "root_separation_lower": downward_decimal(root_separation_lower_ball),
        "determinant_lower": downward_decimal(determinant_lower_ball),
        "minimum_karlsson": downward_decimal(minimum_karlsson),
        "maximum_tao_witness": downward_decimal(maximum_tao_witness),
        "block_automorphism_witness_lower": (
            downward_decimal(block_automorphism_witness_lower)
        ),
        "cayley_roots": cayley_roots,
    }


def main():
    substitution, A, B, cayley_coefficients, resultant, regular_factors = exact_checks()
    bounds = interval_checks(
        substitution, A, B, cayley_coefficients, resultant, regular_factors
    )
    print("PASS repeated product coordinate is exactly unit")
    print("PASS seed polynomial is irreducible over Q(i)")
    print("PASS residual branch specialization is exactly (xi+1)P(xi)")
    print("PASS candidate cubic exactly divides the fundamental norm polynomial")
    print("PASS companion denominator is exactly coprime to the candidate cubic")
    print("PASS Cayley cubic is real with three rigorously enclosed real roots")
    print("PASS product-sheet branch is transverse in the fourth Cayley coordinate")
    print(f"xi enclosure {bounds['xi']}")
    print(f"companion denominator lower bound {bounds['companion_denominator_lower']}")
    print(f"minimum product-cover regularity-factor lower bound {bounds['regular_factor_lower']}")
    print(f"minimum Cayley-root separation lower bound {bounds['root_separation_lower']}")
    print(f"minimum block determinant lower bound {bounds['determinant_lower']}")
    print(f"minimum of 225 Karlsson lower bounds {bounds['minimum_karlsson']}")
    print(f"Tao cross-ratio exclusion lower bound {bounds['maximum_tao_witness']}")
    print(
        "minimum cycle-type (3,3) automorphism witness lower bound "
        f"{bounds['block_automorphism_witness_lower']}"
    )
    print("PASS every four-circulant-block Diţă automorphism is excluded")
    print("ALL RAMIFICATION-SEED CERTIFICATE CHECKS PASSED")


if __name__ == "__main__":
    main()
