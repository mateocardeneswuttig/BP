#!/usr/bin/env python3
"""Exact proof that every ordered Tao corner frame is product-exceptional.

Arithmetic is performed in Z[omega], omega^2 + omega + 1 = 0. The exhaustive
14,400-frame check tests the leading coefficients, delta factors, and actual
candidate-coordinate separation. Every frame fails at least one required
condition. This is an exact finite orbit calculation, not a floating-point
profile.
"""

from dataclasses import dataclass
from itertools import permutations


@dataclass(frozen=True)
class Eisenstein:
    """The exact element a + b*omega of Z[omega]."""

    a: int
    b: int = 0

    def __add__(self, other):
        other = lift(other)
        return Eisenstein(self.a + other.a, self.b + other.b)

    __radd__ = __add__

    def __neg__(self):
        return Eisenstein(-self.a, -self.b)

    def __sub__(self, other):
        return self + (-lift(other))

    def __rsub__(self, other):
        return lift(other) - self

    def __mul__(self, other):
        other = lift(other)
        # omega^2 = -1 - omega
        return Eisenstein(
            self.a * other.a - self.b * other.b,
            self.a * other.b + self.b * other.a - self.b * other.b,
        )

    __rmul__ = __mul__

    def conjugate(self):
        # conjugate(omega) = omega^2 = -1 - omega
        return Eisenstein(self.a - self.b, -self.b)

    def __pow__(self, exponent):
        if exponent < 0:
            return unit_power(self).unit_inverse() ** (-exponent)
        result = Eisenstein(1)
        base = self
        while exponent:
            if exponent & 1:
                result *= base
            base *= base
            exponent //= 2
        return result

    def unit_inverse(self):
        norm = self * self.conjugate()
        if norm != Eisenstein(1):
            raise ValueError(f"not an Eisenstein unit: {self}")
        return self.conjugate()


def lift(value):
    return value if isinstance(value, Eisenstein) else Eisenstein(value)


OMEGA = Eisenstein(0, 1)
POWERS = (Eisenstein(1), OMEGA, OMEGA * OMEGA)


def unit_power(value):
    if value not in POWERS:
        raise ValueError(value)
    return value


# Exponents of the standard dephased Tao representative.
TAO_EXPONENTS = (
    (0, 0, 0, 0, 0, 0),
    (0, 0, 1, 1, 2, 2),
    (0, 1, 0, 2, 2, 1),
    (0, 1, 2, 0, 1, 2),
    (0, 2, 2, 1, 0, 1),
    (0, 2, 1, 2, 1, 0),
)


def redephased_entry(row, column, pivot_row, pivot_column):
    exponent = (
        TAO_EXPONENTS[row][column]
        + TAO_EXPONENTS[pivot_row][pivot_column]
        - TAO_EXPONENTS[row][pivot_column]
        - TAO_EXPONENTS[pivot_row][column]
    ) % 3
    return POWERS[exponent]


def leading_coefficient(block):
    x = block[1]
    y = block[2]
    s = sum(x, Eisenstein(0))
    t = sum(y, Eisenstein(0))
    r = sum(
        (xj.conjugate() * yj for xj, yj in zip(x, y)),
        Eisenstein(0),
    )
    sb, tb, rb = s.conjugate(), t.conjugate(), r.conjugate()
    first = r**2 * tb - r * sb * t * tb + 3 * r * sb + sb**2 * t
    second = r * rb * sb * tb - r * tb**2 - rb * sb**2 - 3 * sb * tb
    return -(first * second)


def product_side_invariants(block):
    x = block[1]
    y = block[2]
    zero = Eisenstein(0)
    t = sum(y, zero)
    r = sum(
        (xj.conjugate() * yj for xj, yj in zip(x, y)),
        zero,
    )
    delta = r * r.conjugate() - t * t.conjugate()
    return (
        leading_coefficient(block) != zero,
        delta != zero,
        len(set(x)) == 3,
    )


def frame_blocks(rows, columns):
    remaining_rows = tuple(index for index in range(6) if index not in rows)
    remaining_columns = tuple(index for index in range(6) if index not in columns)
    row_order = rows + remaining_rows
    column_order = columns + remaining_columns
    pivot_row, pivot_column = rows[0], columns[0]
    chart = tuple(
        tuple(
            redephased_entry(row, column, pivot_row, pivot_column)
            for column in column_order
        )
        for row in row_order
    )
    horizontal = tuple(tuple(chart[i][j] for j in range(3, 6)) for i in range(3))
    vertical_transpose = tuple(
        tuple(chart[i][j] for i in range(3, 6)) for j in range(3)
    )
    return horizontal, vertical_transpose


def main():
    frames = tuple(permutations(range(6), 3))
    jointly_leading_nonzero = 0
    jointly_coefficient_regular = 0
    jointly_simple = 0
    for rows in frames:
        for columns in frames:
            horizontal, vertical = frame_blocks(rows, columns)
            h_c6, h_delta, h_simple = product_side_invariants(horizontal)
            v_c6, v_delta, v_simple = product_side_invariants(vertical)
            jointly_leading_nonzero += h_c6 and v_c6
            jointly_coefficient_regular += h_c6 and h_delta and v_c6 and v_delta
            jointly_simple += (
                h_c6 and h_delta and h_simple
                and v_c6 and v_delta and v_simple
            )

    assert len(frames) ** 2 == 14_400
    assert jointly_leading_nonzero == 12_960
    assert jointly_coefficient_regular == 5_760
    assert jointly_simple == 0
    print("PASS exact Z[omega] arithmetic for all 14,400 Tao frames")
    print("PASS 12,960 frames have both c6 factors nonzero")
    print("PASS 5,760 frames also have both delta factors nonzero")
    print("PASS every such frame has a repeated candidate coordinate")
    print("PASS Tao has no product-regular corner frame")
    print("ALL TAO PRODUCT-EXCEPTIONAL CHECKS PASSED")


if __name__ == "__main__":
    main()
