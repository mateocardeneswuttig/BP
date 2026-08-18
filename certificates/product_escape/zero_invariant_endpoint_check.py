#!/usr/bin/env python3
"""Exact Q(zeta_6) closure of the zero-invariant X(omega) endpoint."""

from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations, product


@dataclass(frozen=True)
class Z6:
    """Element a+b*zeta in Q(zeta), zeta^2-zeta+1=0."""

    a: Fraction
    b: Fraction = Fraction(0)

    def __add__(self, other):
        other = coerce(other)
        return Z6(self.a + other.a, self.b + other.b)

    __radd__ = __add__

    def __neg__(self):
        return Z6(-self.a, -self.b)

    def __sub__(self, other):
        return self + (-coerce(other))

    def __rsub__(self, other):
        return coerce(other) - self

    def __mul__(self, other):
        other = coerce(other)
        # zeta^2=zeta-1
        return Z6(
            self.a * other.a - self.b * other.b,
            self.a * other.b + self.b * other.a + self.b * other.b,
        )

    __rmul__ = __mul__

    def conjugate(self):
        # conjugate(zeta)=1-zeta
        return Z6(self.a + self.b, -self.b)

    def norm(self):
        value = self * self.conjugate()
        assert value.b == 0
        return value.a

    def inverse(self):
        return Z6(
            self.conjugate().a / self.norm(),
            self.conjugate().b / self.norm(),
        )

    def __truediv__(self, other):
        return self * coerce(other).inverse()

    def __pow__(self, exponent):
        if exponent < 0:
            return (self.inverse()) ** (-exponent)
        result = ONE
        base = self
        while exponent:
            if exponent & 1:
                result *= base
            base *= base
            exponent //= 2
        return result


def coerce(value):
    if isinstance(value, Z6):
        return value
    return Z6(Fraction(value))


ZERO = Z6(Fraction(0))
ONE = Z6(Fraction(1))
ZETA = Z6(Fraction(0), Fraction(1))
ROOTS = tuple(ZETA**index for index in range(6))
OMEGA = ZETA**2
CUBIC_ROOTS = (ONE, OMEGA, OMEGA**2)


def matrix_adjoint(matrix):
    return [
        [matrix[row][column].conjugate() for row in range(len(matrix))]
        for column in range(len(matrix[0]))
    ]


def matrix_multiply(left, right):
    return [
        [
            sum(
                (left[row][index] * right[index][column]
                 for index in range(len(right))),
                ZERO,
            )
            for column in range(len(right[0]))
        ]
        for row in range(len(left))
    ]


def matrix_inverse(matrix):
    size = len(matrix)
    augmented = [
        list(matrix[row])
        + [ONE if row == column else ZERO for column in range(size)]
        for row in range(size)
    ]
    for pivot_column in range(size):
        pivot_row = next(
            row
            for row in range(pivot_column, size)
            if augmented[row][pivot_column] != ZERO
        )
        augmented[pivot_column], augmented[pivot_row] = (
            augmented[pivot_row],
            augmented[pivot_column],
        )
        pivot_inverse = augmented[pivot_column][pivot_column].inverse()
        augmented[pivot_column] = [
            value * pivot_inverse for value in augmented[pivot_column]
        ]
        for row in range(size):
            if row == pivot_column:
                continue
            multiplier = augmented[row][pivot_column]
            augmented[row] = [
                value - multiplier * pivot_value
                for value, pivot_value in zip(
                    augmented[row], augmented[pivot_column]
                )
            ]
    return [row[size:] for row in augmented]


def block_matrix(e, b, c, d):
    return [
        e[row] + b[row] for row in range(3)
    ] + [
        c[row] + d[row] for row in range(3)
    ]


def main():
    target_sum = -(2 * ONE + OMEGA)

    # The printed biunimodular argument proves that each noninitial row is a
    # common phase times cubic roots.  Its sum has Eisenstein norm three.
    # Enumerate that finite remainder and verify that the common phase is
    # always a sixth root; this gives exactly the same rows as direct
    # sixth-root enumeration with the prescribed sum.
    rows_from_biunimodular_reduction = set()
    for pattern in product(CUBIC_ROOTS, repeat=3):
        pattern_sum = sum(pattern, ZERO)
        if pattern_sum.norm() != 3:
            continue
        common_phase = target_sum / pattern_sum
        assert common_phase in ROOTS
        rows_from_biunimodular_reduction.add(tuple(
            common_phase * value for value in pattern
        ))
    sixth_root_rows = {
        row for row in product(ROOTS, repeat=3)
        if sum(row, ZERO) == target_sum
    }
    assert len(rows_from_biunimodular_reduction) == 6
    assert rows_from_biunimodular_reduction == sixth_root_rows

    # Enumerate the resulting candidate blocks exactly.
    candidates = []
    for x in sixth_root_rows:
        for y in sixth_root_rows:
            if sum((y[index] / x[index] for index in range(3)), ZERO) != ZERO:
                continue
            candidates.append([
                [ONE, ONE, ONE],
                list(x),
                list(y),
            ])
    assert len(candidates) == 12

    e = [
        [ONE, ONE, ONE],
        [ONE, ONE, OMEGA],
        [ONE, OMEGA, ONE],
    ]
    e_adjoint = matrix_adjoint(e)
    flat_completions = 0
    h2_completions = 0
    cubic_completions = 0

    for b in candidates:
        b_inverse_adjoint = matrix_adjoint(matrix_inverse(b))
        for c_transpose in candidates:
            c = [list(row) for row in zip(*c_transpose)]
            d = matrix_multiply(
                matrix_multiply(c, e_adjoint), b_inverse_adjoint
            )
            d = [[-value for value in row] for row in d]
            if not all(value.norm() == 1 for row in d for value in row):
                continue
            flat_completions += 1
            h = block_matrix(e, b, c, d)
            has_h2 = any(
                h[first_row][first_column] * h[second_row][second_column]
                + h[first_row][second_column] * h[second_row][first_column]
                == ZERO
                for first_row, second_row in combinations(range(6), 2)
                for first_column, second_column in combinations(range(6), 2)
            )
            all_cubic = all(
                value**3 == ONE for row in h for value in row
            )
            assert has_h2 or all_cubic
            h2_completions += int(has_h2)
            cubic_completions += int(all_cubic)

    assert flat_completions == 108
    assert h2_completions > 0
    assert cubic_completions > 0

    print("PASS the printed biunimodular reduction leaves six possible rows")
    print("PASS X(omega) has exactly 12 normalized phase candidates")
    print(f"PASS exactly {flat_completions} candidate pairings have a flat fourth block")
    print("PASS every flat pairing is H2-reducible or all-cubic-root")
    print("ALL ZERO-INVARIANT ENDPOINT CHECKS PASSED")


if __name__ == "__main__":
    main()
