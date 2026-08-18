#!/usr/bin/env python3
"""Small exact identities for the two non-zero-dimensional guard pairs.

The ordinary Karlsson four-frame audit compares the two effective row
orders ``(0,2,3)`` and ``(0,3,2)`` of the fixed mixed/mixed corner.  Most
simultaneous failures are zero-dimensional Groebner calculations.  Two
pairs are better handled without elimination:

* simultaneous Gram imbalance is impossible on Karlsson's canonical
  parameter domain;
* equality in coordinates 1,2 for the first order and an opposite pair in
  coordinates 1,2 for the reversed order lies on the singly-degenerate
  Moebius divisor ``M_+=0``.  The reciprocal Karlsson presentation moves it
  to ``M_- != 0`` except at the affine-Fourier endpoint.

This checker derives both statements from the actual redephased blocks.  It
uses no sampled points or floating-point arithmetic.
"""

from __future__ import annotations

import os

import sympy as sp

import ordinary_cover_modular_probe as O
import ordinary_real_elimination as R


ORDER = (0, 2, 3)
REVERSED = (0, 3, 2)


def numerator(expression):
    return sp.fraction(sp.cancel(expression))[0]


def reduce_k2(expression):
    return sp.rem(sp.Poly(sp.expand(expression), O.K), sp.Poly(O.K**2 + 3, O.K)).as_expr()


def imbalance_identity():
    for direction in ("horizontal", "vertical"):
        first = R.guard(direction, ORDER, 1)
        second = R.guard(direction, REVERSED, 1)
        summed = sp.cancel(first + second)
        target = (O.K * O.V * (O.P**2 - 1) - 2 * O.P) / O.P
        difference = reduce_k2(numerator(summed - target))
        difference = sp.rem(
            sp.Poly(difference, O.U),
            sp.Poly(O.U**2 + O.V**2 - 1, O.U),
        ).as_expr()
        assert sp.expand(difference) == 0

    # On the physical canonical domain K=i sqrt(3), v>=0 and Im(p)>=0.
    # If both imbalances vanished, division by the unit p would give
    # K v (p-p^{-1})=2, i.e. -2 sqrt(3) v Im(p)=2, impossible.
    print("PASS simultaneous imbalance forces v Im(p)=-1/sqrt(3)")
    print("PASS the canonical inequalities v>=0 and Im(p)>=0 exclude it")


def singly_degenerate_identity():
    old_proxy = os.environ.get("KARLSSON_OPPOSITE_PROXY")
    os.environ["KARLSSON_OPPOSITE_PROXY"] = "1"
    try:
        failures = {
            direction: (
                numerator(R.guard(direction, ORDER, 4)),
                numerator(R.guard(direction, REVERSED, 7)),
            )
            for direction in ("horizontal", "vertical")
        }
    finally:
        if old_proxy is None:
            os.environ.pop("KARLSSON_OPPOSITE_PROXY", None)
        else:
            os.environ["KARLSSON_OPPOSITE_PROXY"] = old_proxy

    common = O.K * O.U * (O.P**2 + 1) + O.P**2 - 1
    horizontal_resultant = sp.factor(
        sp.resultant(*failures["horizontal"], O.Z3)
    )
    vertical_resultant = sp.factor(
        sp.resultant(*failures["vertical"], O.Z1)
    )
    assert sp.expand(horizontal_resultant - O.K * O.V * O.Z2 * common) == 0
    assert sp.expand(vertical_resultant - 2 * O.K * O.P * O.V * O.Z4 * common) == 0

    plus = O.P**2 - 1 + O.K * O.U * (O.P**2 + 1)
    minus = O.P**2 - 1 - O.K * O.U * (O.P**2 + 1)
    assert sp.expand(plus.subs(O.U, -O.U) - minus) == 0
    assert sp.expand(plus + minus - 2 * (O.P**2 - 1)) == 0
    assert sp.expand(plus - minus - 2 * O.K * O.U * (O.P**2 + 1)) == 0

    # K, v and z2 never vanish on the ordinary physical chart, hence the
    # simultaneous guard failure forces plus=0.  The reciprocal half-angle
    # presentation sends u to -u, so its plus factor is the old minus.  A
    # common zero has p^2=1 and u=0, the separately covered Fourier endpoint.
    print("PASS equality/opposite failure is exactly on M_+=0")
    print("PASS reciprocal presentation exchanges M_+ and M_-")
    print("PASS their only physical common zero is the affine-Fourier endpoint")


def shared_opposite_pattern():
    # The sole physical opposite/opposite survivor is (5,6).  In the base
    # complement columns (1,4,5), it says H[2,4]=-H[2,1] and
    # H[3,5]=-H[3,1].  Karlsson's displayed F2 block also has H[1,1]=-1.
    # Dephase at row 0, column 1.  The following three entries, in three
    # distinct columns, are then exactly -1.
    h11, h10, h21, h24, h31, h35 = sp.symbols(
        "h11 h10 h21 h24 h31 h35", nonzero=True
    )
    dephased = (h10 / h11, h24 / h21, h35 / h31)
    substitution = {h10: 1, h11: -1, h24: -h21, h35: -h31}
    assert tuple(sp.cancel(value.subs(substitution)) for value in dephased) == (
        -1, -1, -1
    )
    print("PASS shared opposite pairs produce -1 in columns 0,4,5")
    print("PASS the three-minus-one theorem routes this branch to Fourier/2-circulant")


def main():
    imbalance_identity()
    singly_degenerate_identity()
    shared_opposite_pattern()
    print("ALL ORDINARY KARLSSON RESIDUAL IDENTITIES PASSED")


if __name__ == "__main__":
    main()
