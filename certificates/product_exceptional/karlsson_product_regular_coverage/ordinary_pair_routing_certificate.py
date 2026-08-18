#!/usr/bin/env python3
"""Exact exhaustion certificate for the ordinary base-frame case split.

For the two effective orientations of Karlsson's mixed/mixed corner, a
direction can fail product regularity only through one of seven guards:
imbalance (1), three coordinate equalities (2--4), or three opposite-pair
proxies for a failed actual companion denominator (5--7).

There are 49 simultaneous failure pairs.  Forty have empty physical
intersection, certified here by characteristic-zero real Cayley elimination.
The remaining nine are exactly

* simultaneous imbalance ``(1,1)``;
* the six mixed imbalance/opposite branches;
* the reciprocal-chart branch ``(4,7)``; and
* the shared-opposite branch ``(5,6)``.

The first, eighth and ninth are handled by
``ordinary_residual_identities.py``.  The six mixed branches are handled by
the two frame-cover certificate runners in this directory.
"""

from __future__ import annotations

import os
from pathlib import Path
import subprocess
import sys


HERE = Path(__file__).resolve().parent
ELIMINATION = HERE / "ordinary_real_elimination.py"
IDENTITIES = HERE / "ordinary_residual_identities.py"
MIXED = (
    (1, 5), (1, 6), (1, 7),
    (5, 1), (6, 1), (7, 1),
)
ROUTED = {(1, 1), (4, 7), (5, 6), *MIXED}
EMPTY = tuple(
    (left, right)
    for left in range(1, 8)
    for right in range(1, 8)
    if (left, right) not in ROUTED
)


def main():
    assert len(EMPTY) == 40
    for left, right in EMPTY:
        environment = os.environ.copy()
        environment.update({
            "KARLSSON_DIRECTION": "horizontal",
            "KARLSSON_GUARD_PAIR": f"{left},{right}",
            "KARLSSON_OPPOSITE_PROXY": "1",
            "MSOLVE_QUIET": "1",
            "MSOLVE_THREADS": os.environ.get("MSOLVE_THREADS", "4"),
            "MSOLVE_REVERSE_ORDER": "1",
            "MSOLVE_REQUIRE_UNIT": "1",
        })
        result = subprocess.run(
            [sys.executable, str(ELIMINATION)], cwd=HERE, env=environment,
            text=True, capture_output=True, check=False,
        )
        label = f"pair=({left},{right})"
        if result.returncode or "unit ideal" not in result.stdout:
            print(f"FAIL {label}")
            print(result.stdout[-4000:])
            print(result.stderr[-4000:])
            raise SystemExit(result.returncode or 3)
        print(f"PASS empty {label}", flush=True)

    identities = subprocess.run(
        [sys.executable, str(IDENTITIES)], cwd=HERE,
        text=True, capture_output=True, check=False,
    )
    if identities.returncode:
        print(identities.stdout)
        print(identities.stderr)
        raise SystemExit(identities.returncode)
    expected = "ALL ORDINARY KARLSSON RESIDUAL IDENTITIES PASSED"
    if expected not in identities.stdout:
        raise AssertionError("residual identity certificate did not finish")
    print(identities.stdout, end="")
    print("PASS exhaustive 49-pair ordinary routing table")


if __name__ == "__main__":
    main()
