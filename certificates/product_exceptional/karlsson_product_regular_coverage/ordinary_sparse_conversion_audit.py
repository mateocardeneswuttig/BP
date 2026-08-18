#!/usr/bin/env python3
"""Independent exact audit of the sparse Cayley conversion.

Every rescue-frame expression used in the mixed-branch certificates is
converted twice:

1. by direct SymPy substitution, complex expansion and denominator removal;
2. by the custom sparse quotient-aware converter used for the large jobs.

After primitive monic normalization, the real and imaginary polynomials
must agree term for term.  This checks the algebraic front end independently
of msolve and covers both rescue frames, both directions and every guard
type used in the proof.
"""

from __future__ import annotations

import ordinary_real_elimination as R
import ordinary_rescue_elimination as E


FRAMES = (
    ((0, 2, 1), (0, 4, 1)),
    ((0, 2, 1), (0, 5, 1)),
)
DETERMINANTS = ("detE", "detB", "detC")
DIRECTIONAL = (
    "lead1", "lead2", "delta",
    "equal0", "equal1", "equal2",
    "opposite0", "opposite1", "opposite2",
)


def canonical(polynomials):
    return tuple(
        sorted(
            (tuple(sorted(polynomial.monic().rep.to_dict().items()))
             for polynomial in polynomials),
            key=str,
        )
    )


def check(rows, columns, side, guard):
    expression = E.rescue_expression(rows, columns, side, guard)
    direct = canonical(R.real_polynomials(expression))
    sparse = canonical(R.real_polynomials_sparse(expression))
    if direct != sparse:
        raise AssertionError(
            f"Cayley converters disagree for {rows}/{columns} {side}:{guard}"
        )
    print(f"PASS {rows}/{columns} {side}:{guard}", flush=True)


def main():
    count = 0
    for rows, columns in FRAMES:
        for guard in DETERMINANTS:
            check(rows, columns, "horizontal", guard)
            count += 1
        for side in ("horizontal", "vertical"):
            for guard in DIRECTIONAL:
                check(rows, columns, side, guard)
                count += 1
    print(f"PASS sparse/direct Cayley equality for all {count} rescue expressions")


if __name__ == "__main__":
    main()
