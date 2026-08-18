#!/usr/bin/env python3
"""Independent SymPy verification of the product-exceptional Karlsson point.

Unlike ``exact_product_exceptional_karlsson.py``, this checker does not use
the handwritten companion coefficients.  It imports the universal parent
quadratics, lets SymPy derive B_GENERIC, and reduces the resulting values
modulo Phi_12.  Symmetry leaves only 648 ordered side-block states.
"""

from __future__ import annotations

from itertools import permutations
from pathlib import Path
import sys

import sympy as sp


ATLAS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ATLAS))

import exact_lower_block_specialization as EL  # noqa: E402


EXPONENTS = (
    (0, 0, 0, 0, 0, 0),
    (0, 6, 0, 3, 6, 9),
    (0, 6, 6, 9, 3, 0),
    (0, 3, 9, 6, 9, 3),
    (0, 0, 3, 9, 6, 6),
    (0, 9, 6, 3, 0, 6),
)

z = sp.symbols("z")
cyclotomic = sp.Poly(z**4-z**2+1, z, domain=sp.QQ)


def reduce12(expression):
    numerator, denominator = sp.cancel(expression).as_numer_denom()
    n = sp.rem(sp.Poly(numerator, z, domain=sp.QQ), cyclotomic)
    d = sp.rem(sp.Poly(denominator, z, domain=sp.QQ), cyclotomic)
    if d.as_expr() != 1:
        inverse = sp.invert(d, cyclotomic)
        n = sp.rem(n*inverse, cyclotomic)
    return n


ROOTS = tuple(reduce12(z**k).as_expr() for k in range(12))


def exponent(row_order, column_order, i, j):
    return (
        EXPONENTS[row_order[i]][column_order[j]]
        + EXPONENTS[row_order[0]][column_order[0]]
        - EXPONENTS[row_order[i]][column_order[0]]
        - EXPONENTS[row_order[0]][column_order[j]]
    ) % 12


def states_and_frames():
    frames = tuple(permutations(range(6), 3))
    states = {}
    for rows in frames:
        row_order = rows + tuple(i for i in range(6) if i not in rows)
        for columns in frames:
            column_order = columns + tuple(j for j in range(6) if j not in columns)
            state = (
                tuple(exponent(row_order, column_order, 1, j) for j in range(3, 6)),
                tuple(exponent(row_order, column_order, 2, j) for j in range(3, 6)),
            )
            states.setdefault(state, 0)
            states[state] += 1
    return states


def verify_state(state):
    xs = tuple(ROOTS[k] for k in state[0])
    ys = tuple(ROOTS[k] for k in state[1])
    s, t = sum(xs), sum(ys)
    sb, tb = sum(ROOTS[-k % 12] for k in state[0]), sum(ROOTS[-k % 12] for k in state[1])
    r = sum(ROOTS[(state[1][j]-state[0][j]) % 12] for j in range(3))
    rb = sum(ROOTS[(state[0][j]-state[1][j]) % 12] for j in range(3))
    substitution = {EL.s: s, EL.sb: sb, EL.t: t, EL.tb: tb, EL.r: r, EL.rb: rb}
    denominator = EL.B_GENERIC.subs(substitution)
    values = tuple(reduce12(denominator.subs(EL.x, root)) for root in xs)
    assert any(value.is_zero for value in values)
    return sum(value.is_zero for value in values)


def verify_hadamard():
    H = sp.Matrix([[ROOTS[k] for k in row] for row in EXPONENTS])
    gram = H*H.conjugate().T
    # Replace conjugates using z-bar=z^-1, then reduce in Q[z]/Phi_12.
    for i in range(6):
        for j in range(6):
            expression = gram[i, j].xreplace({sp.conjugate(z): z**11})
            expected = 6 if i == j else 0
            assert reduce12(expression-expected).is_zero


def main():
    verify_hadamard()
    states = states_and_frames()
    assert len(states) == 648
    multiplicities = {1: 0, 2: 0, 3: 0}
    frame_total = 0
    for state, frequency in states.items():
        multiplicities[verify_state(state)] += frequency
        frame_total += frequency
    assert frame_total == 14400
    assert multiplicities == {1: 4320, 2: 1440, 3: 8640}
    print("PASS SymPy-derived B_GENERIC modulo Phi_12")
    print("PASS 648 states representing all 14,400 ordered frames")
    print(f"PASS zero-multiplicity counts={multiplicities}")
    print("INDEPENDENT EXACT COUNTEREXAMPLE VERIFICATION COMPLETE")


if __name__ == "__main__":
    main()
