#!/usr/bin/env python3
"""Dependency-free exact counterexample to universal Karlsson product coverage.

Let zeta=exp(pi*i/6), so Phi_12(zeta)=zeta^4-zeta^2+1=0.  The matrix below
is the 2-circulant matrix X_6(beta,gamma,epsilon,phi) at

    (beta,gamma,epsilon,phi)=(zeta^-4,zeta^-2,zeta^-4,zeta^-5).

All arithmetic is performed in Z[zeta] using the basis 1,zeta,zeta^2,zeta^3.
The script verifies the Hadamard equations and then checks every one of the
120^2 ordered 3-by-3 frames.  At every frame, the actual horizontal lift
meets the companion-denominator divisor: at least one of the three values
B(x_j) is exactly zero.  Therefore no ordered frame is product-regular.

This finite audit uses only Python's standard library.  It is deliberately
independent of SymPy, NumPy, msolve, and floating-point tolerances.
"""

from __future__ import annotations

from itertools import combinations, permutations


ZERO = (0, 0, 0, 0)
ONE = (1, 0, 0, 0)


def add(a, b):
    return tuple(a[i]+b[i] for i in range(4))


def neg(a):
    return tuple(-x for x in a)


def sub(a, b):
    return add(a, neg(b))


def scale(n, a):
    return tuple(n*x for x in a)


def mul(a, b):
    raw = [0]*7
    for i, ai in enumerate(a):
        for j, bj in enumerate(b):
            raw[i+j] += ai*bj
    # zeta^4=zeta^2-1.  Reduce from the highest degree down.
    for degree in range(6, 3, -1):
        coefficient = raw[degree]
        raw[degree] = 0
        raw[degree-2] += coefficient
        raw[degree-4] -= coefficient
    return tuple(raw[:4])


def power(a, exponent):
    if exponent < 0:
        # Only powers of zeta use negative exponents in this certificate.
        return power(ZETA, exponent % 12)
    answer, base = ONE, a
    while exponent:
        if exponent & 1:
            answer = mul(answer, base)
        base = mul(base, base)
        exponent //= 2
    return answer


ZETA = (0, 1, 0, 0)
ROOTS = tuple(power(ZETA, k) for k in range(12))


def conj(a):
    # Complex conjugation sends zeta to zeta^-1.
    answer = ZERO
    for degree, coefficient in enumerate(a):
        answer = add(answer, scale(coefficient, ROOTS[(-degree) % 12]))
    return answer


def total(items):
    answer = ZERO
    for item in items:
        answer = add(answer, item)
    return answer


# Exponents modulo 12 of the exact normalized matrix.
EXPONENTS = (
    (0, 0, 0, 0, 0, 0),
    (0, 6, 0, 3, 6, 9),
    (0, 6, 6, 9, 3, 0),
    (0, 3, 9, 6, 9, 3),
    (0, 0, 3, 9, 6, 6),
    (0, 9, 6, 3, 0, 6),
)
H = tuple(tuple(ROOTS[k] for k in row) for row in EXPONENTS)


def verify_cyclotomic_model():
    assert sub(power(ZETA, 4), sub(power(ZETA, 2), ONE)) == ZERO
    assert power(ZETA, 12) == ONE
    for k in range(12):
        assert mul(ROOTS[k], conj(ROOTS[k])) == ONE


def verify_hadamard():
    gram = []
    for i in range(6):
        row = []
        for j in range(6):
            value = total(mul(H[i][k], conj(H[j][k])) for k in range(6))
            expected = scale(6, ONE) if i == j else ZERO
            assert value == expected
            row.append(value)
        gram.append(tuple(row))
    return tuple(gram)


def verify_two_circulant_parameters():
    b, g, e, p = (ROOTS[-4 % 12], ROOTS[-2 % 12], ROOTS[-4 % 12], ROOTS[-5 % 12])
    relation = total((
        mul(mul(b, g), mul(e, e)),
        mul(mul(b, g), p),
        mul(mul(mul(b, b), e), p),
        mul(mul(g, e), p),
        mul(mul(mul(mul(b, g), g), e), p),
        mul(mul(mul(b, g), e), mul(p, p)),
    ))
    assert relation == ZERO
    inverse = conj
    quotient = lambda left, right: mul(left, inverse(right))
    X = (
        (ONE, ONE, ONE, ONE, ONE, ONE),
        (ONE, neg(ONE), neg(inverse(mul(g, e))), neg(inverse(mul(b, p))),
         inverse(mul(g, e)), inverse(mul(b, p))),
        (ONE, neg(quotient(e, b)), neg(ONE), neg(quotient(e, mul(g, p))),
         quotient(e, mul(g, p)), quotient(e, b)),
        (ONE, neg(quotient(p, g)), neg(quotient(p, mul(b, e))), neg(ONE),
         quotient(p, g), quotient(p, mul(b, e))),
        (ONE, quotient(e, b), quotient(p, mul(b, e)), inverse(mul(b, p)),
         inverse(mul(b, g)), quotient(g, mul(b, b))),
        (ONE, quotient(p, g), inverse(mul(g, e)), quotient(e, mul(g, p)),
         quotient(b, mul(g, g)), inverse(mul(b, g))),
    )
    assert X == H
    # The leading 2-by-2 block is [[1,1],[1,-1]], so the matrix is
    # H2-reducible (and hence lies in Karlsson's classified sector).
    assert H[0][0] == H[0][1] == H[1][0] == ONE
    assert H[1][1] == neg(ONE)


def companion_B(x, s, sb, t, tb, r, rb):
    """Evaluate the cubic companion denominator B(x) exactly.

    These are the four coefficients of the uncancelled companion polynomial
    obtained from the two parent quadratics in the fixed-Gram construction.
    """
    c3 = add(
        add(neg(mul(mul(mul(r, rb), sb), tb)), mul(r, mul(tb, tb))),
        add(mul(rb, mul(sb, sb)), scale(3, mul(sb, tb))),
    )
    c2 = total((
        neg(mul(mul(mul(r, mul(rb, rb)), sb), ONE)),
        mul(mul(mul(mul(r, rb), s), sb), tb),
        mul(mul(r, rb), tb),
        neg(mul(mul(r, s), mul(tb, tb))),
        neg(mul(mul(rb, s), mul(sb, sb))),
        mul(mul(mul(rb, sb), t), tb),
        scale(-3, mul(mul(s, sb), tb)),
        neg(mul(t, mul(tb, tb))),
    ))
    c1 = total((
        mul(r, mul(rb, rb)),
        neg(mul(mul(mul(r, rb), s), tb)),
        mul(mul(mul(rb, rb), sb), t),
        neg(mul(mul(mul(mul(rb, s), sb), t), tb)),
        scale(3, mul(mul(rb, s), sb)),
        neg(mul(mul(rb, t), tb)),
        mul(mul(mul(s, s), sb), tb),
        mul(mul(s, t), mul(tb, tb)),
    ))
    c0 = total((
        neg(mul(mul(rb, rb), t)),
        mul(mul(mul(rb, s), t), tb),
        scale(-3, mul(rb, s)),
        neg(mul(mul(s, s), tb)),
    ))
    return add(add(mul(c3, power(x, 3)), mul(c2, power(x, 2))), add(mul(c1, x), c0))


def redephased_exponent(row_order, column_order, i, j):
    return (
        EXPONENTS[row_order[i]][column_order[j]]
        + EXPONENTS[row_order[0]][column_order[0]]
        - EXPONENTS[row_order[i]][column_order[0]]
        - EXPONENTS[row_order[0]][column_order[j]]
    ) % 12


def verify_transpose_equivalence():
    """Check an explicit monomial equivalence H_x^T ~ H_x."""
    order = (0, 1, 4, 3, 2, 5)
    source = tuple(zip(*EXPONENTS))
    redephased = tuple(tuple(
        (source[order[i]][order[j]]
         + source[order[0]][order[0]]
         - source[order[i]][order[0]]
         - source[order[0]][order[j]]) % 12
        for j in range(6)
    ) for i in range(6))
    assert redephased == EXPONENTS


def determinant3(block):
    positive = total((
        mul(block[0][0], mul(block[1][1], block[2][2])),
        mul(block[0][1], mul(block[1][2], block[2][0])),
        mul(block[0][2], mul(block[1][0], block[2][1])),
    ))
    negative = total((
        mul(block[0][2], mul(block[1][1], block[2][0])),
        mul(block[0][1], mul(block[1][0], block[2][2])),
        mul(block[0][0], mul(block[1][2], block[2][1])),
    ))
    return sub(positive, negative)


def verify_all_unframed_corners():
    squared_moduli = []
    checked = 0
    for rows in combinations(range(6), 3):
        row_order = rows + tuple(i for i in range(6) if i not in rows)
        for columns in combinations(range(6), 3):
            column_order = columns + tuple(j for j in range(6) if j not in columns)
            chart = tuple(tuple(
                ROOTS[redephased_exponent(row_order, column_order, i, j)]
                for j in range(6)
            ) for i in range(6))
            for row_start, column_start in ((0, 0), (0, 3), (3, 0)):
                block = tuple(tuple(
                    chart[row_start+i][column_start+j] for j in range(3)
                ) for i in range(3))
                determinant = determinant3(block)
                assert determinant != ZERO
                modulus_squared = mul(determinant, conj(determinant))
                assert modulus_squared[1:] == (0, 0, 0)
                squared_moduli.append(modulus_squared[0])
            checked += 1
    assert checked == 400
    assert min(squared_moduli) == 4
    return checked, tuple(sorted(set(squared_moduli)))


def ordered_frame_certificate(rows, columns):
    row_order = rows + tuple(i for i in range(6) if i not in rows)
    column_order = columns + tuple(j for j in range(6) if j not in columns)
    xs = tuple(ROOTS[redephased_exponent(row_order, column_order, 1, j)] for j in range(3, 6))
    ys = tuple(ROOTS[redephased_exponent(row_order, column_order, 2, j)] for j in range(3, 6))
    s, t = total(xs), total(ys)
    sb, tb = conj(s), conj(t)
    r = total(mul(conj(xs[j]), ys[j]) for j in range(3))
    rb = conj(r)
    values = tuple(companion_B(x, s, sb, t, tb, r, rb) for x in xs)
    assert ZERO in values
    return tuple(index for index, value in enumerate(values) if value == ZERO)


def verify_all_ordered_frames():
    frames = tuple(permutations(range(6), 3))
    zero_position_counts = {(0,): 0, (1,): 0, (2,): 0}
    multiplicity_counts = {1: 0, 2: 0, 3: 0}
    checked = 0
    for rows in frames:
        for columns in frames:
            positions = ordered_frame_certificate(rows, columns)
            multiplicity_counts[len(positions)] += 1
            if len(positions) == 1:
                zero_position_counts[positions] += 1
            checked += 1
    assert checked == 14400
    assert sum(multiplicity_counts.values()) == checked
    return checked, zero_position_counts, multiplicity_counts


def main():
    verify_cyclotomic_model()
    verify_hadamard()
    verify_two_circulant_parameters()
    verify_transpose_equivalence()
    corners, determinant_moduli = verify_all_unframed_corners()
    checked, position_counts, multiplicity_counts = verify_all_ordered_frames()
    print("PASS exact Phi_12 arithmetic")
    print("PASS exact H H^*=6 I")
    print("PASS exact 2-circulant constraint and H2 witness")
    print("PASS explicit equivalence H_x^T ~ H_x")
    print(f"PASS all unframed corners block-invertible: {corners}/{corners}")
    print(f"squared determinant moduli={determinant_moduli}")
    print(f"PASS companion denominator vanishes on every ordered frame: {checked}/{checked}")
    print(f"zero-position counts={position_counts}")
    print(f"zero-multiplicity counts={multiplicity_counts}")
    print("DISPROVED universal Karlsson product-regular-frame containment")


if __name__ == "__main__":
    main()
