#!/usr/bin/env python3
"""Exact product-regularity classification inside Dita's one-parameter family.

The fixed ordered frame rows=(0,1,2), columns=(0,4,2) is product regular
precisely when c^4 != 1.  At the four excluded parameters the matrices are
all equivalent to the exact product-exceptional matrix H_times.
"""

from __future__ import annotations

from pathlib import Path
import sys

import sympy as sp


ATLAS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ATLAS))

import exact_lower_block_specialization as EL  # noqa: E402


C = sp.symbols("c", nonzero=True)
I = sp.I


def dita(c=C):
    return sp.Matrix([
        [1, 1, 1, 1, 1, 1],
        [1, -1, I, -I, -I*c, I*c],
        [1, I, -1, I, -I, -I],
        [1, -I, I, -1, I*c, -I*c],
        [1, -I/c, -I, I/c, -1, I],
        [1, I/c, -I, -I/c, I, -1],
    ])


def star(value):
    return sp.cancel(sp.conjugate(value).subs(sp.conjugate(C), 1/C))


def redephase(matrix, rows=(0, 1, 2), columns=(0, 4, 2)):
    row_order = rows+tuple(i for i in range(6) if i not in rows)
    column_order = columns+tuple(j for j in range(6) if j not in columns)
    source = matrix.extract(row_order, column_order)
    pivot = source[0, 0]
    return sp.Matrix(6, 6, lambda i, j:
        sp.cancel(source[i, j]*pivot/(source[i, 0]*source[0, j])))


def side_guards(block):
    xs = tuple(block[1, j] for j in range(3))
    ys = tuple(block[2, j] for j in range(3))
    s, t = sum(xs), sum(ys)
    r = sum(star(xs[j])*ys[j] for j in range(3))
    substitution = {
        EL.s: s, EL.sb: star(s), EL.t: t, EL.tb: star(t),
        EL.r: r, EL.rb: star(r),
    }
    c6 = EL.FUNDAMENTAL_COEFFICIENTS[6].subs(substitution)
    delta = r*star(r)-t*star(t)
    discriminant = sp.prod(
        xs[i]-xs[j] for i in range(3) for j in range(i+1, 3)
    )
    denominator = EL.B_GENERIC.subs(substitution)
    companion = sp.prod(denominator.subs(EL.x, root) for root in xs)
    return tuple(sp.factor(sp.cancel(value)) for value in (
        c6, delta, discriminant, companion
    ))


def verify_guard_factorization():
    chart = redephase(dita())
    determinants = tuple(sp.factor(sp.cancel(value)) for value in (
        chart[:3, :3].det(), chart[:3, 3:].det(), chart[3:, :3].det()
    ))
    assert determinants == (2*I*C, -2-2*I, -2+2*I)

    horizontal = side_guards(chart[:3, 3:])
    vertical = side_guards(chart[3:, :3].T)
    expected_horizontal = (
        (16+16*I)*(C-1)*(C+I)/C**2,
        (1+I)*(C+1)*(C-I)/C,
        (1-I)*(C+1)*(C-I),
        -8*(C-1)*(C+1)**5*(C-I)**5*(C+I)/C**4,
    )
    expected_vertical = (
        (16-16*I)*(C+1)*(C+I)/C**2,
        (-1+I)*(C-1)*(C-I)/C,
        (1+I)*(C-1)*(C-I),
        -8*(C-1)**5*(C+1)*(C-I)**5*(C+I)/C**4,
    )
    for actual, expected in zip(horizontal+vertical, expected_horizontal+expected_vertical):
        assert sp.cancel(actual-expected) == 0
    return determinants, horizontal, vertical


H_TIMES = (
    (0, 0, 0, 0, 0, 0),
    (0, 2, 0, 1, 2, 3),
    (0, 2, 2, 3, 1, 0),
    (0, 1, 3, 2, 3, 1),
    (0, 0, 1, 3, 2, 2),
    (0, 3, 2, 1, 0, 2),
)


def dita_exponents(k):
    return (
        (0, 0, 0, 0, 0, 0),
        (0, 2, 1, 3, (k+3) % 4, (k+1) % 4),
        (0, 1, 2, 1, 3, 3),
        (0, 3, 1, 2, (k+1) % 4, (k+3) % 4),
        (0, (3-k) % 4, 3, (1-k) % 4, 2, 1),
        (0, (1-k) % 4, 3, (3-k) % 4, 1, 2),
    )


EQUIVALENCES = {
    0: (0, 1, (0, 4, 5, 1, 2, 3), (1, 3, 2, 0, 5, 4)),
    1: (0, 0, (0, 1, 4, 2, 5, 3), (0, 1, 4, 2, 5, 3)),
    2: (0, 1, (0, 5, 4, 1, 2, 3), (1, 3, 2, 0, 4, 5)),
    3: (0, 0, (0, 1, 5, 2, 4, 3), (0, 1, 5, 2, 4, 3)),
}


def verify_exceptional_equivalences():
    for k, (pivot_row, pivot_column, rows, columns) in EQUIVALENCES.items():
        source = dita_exponents(k)
        normalized = tuple(tuple(
            (source[i][j]-source[i][pivot_column]-source[pivot_row][j]
             + source[pivot_row][pivot_column]) % 4
            for j in range(6)
        ) for i in range(6))
        result = tuple(tuple(normalized[i][j] for j in columns) for i in rows)
        assert result == H_TIMES


def main():
    verify_guard_factorization()
    verify_exceptional_equivalences()
    print("PASS Dita fixed-frame guard factorization")
    print("PASS fixed frame is product regular iff c^4 != 1")
    print("PASS Dita(1), Dita(i), Dita(-1), Dita(-i) are equivalent to H_times")
    print("CERTIFIED: [Dita(c)] is in P_6 iff c^4 != 1")


if __name__ == "__main__":
    main()
