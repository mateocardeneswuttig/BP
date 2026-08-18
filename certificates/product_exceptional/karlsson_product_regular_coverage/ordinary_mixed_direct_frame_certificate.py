#!/usr/bin/env python3
"""Certify direct rescue frames on selected ordinary mixed branches.

Each configured branch is intersected in turn with the vanishing set of all
21 sufficient product-regularity guards of the stated frame.  Characteristic
zero unit ideals for every intersection prove that the frame is uniformly
product regular on the entire physical branch (away from the separately
covered Cayley endpoints).

The jobs run sequentially to keep the memory footprint bounded.
"""

from __future__ import annotations

import os
from pathlib import Path
import subprocess
import sys


HERE = Path(__file__).resolve().parent
ENGINE = HERE / "ordinary_rescue_elimination.py"
DETERMINANTS = ("detE", "detB", "detC")
DIRECTIONAL = (
    "lead1", "lead2", "delta",
    "equal0", "equal1", "equal2",
    "opposite0", "opposite1", "opposite2",
)

# Numerical discovery selected the same MM frame A for these three branches.
CASES = (
    ((1, 5), (0, 2, 1), (0, 4, 1)),
    ((1, 6), (0, 2, 1), (0, 5, 1)),
    ((5, 1), (0, 2, 1), (0, 5, 1)),
    ((6, 1), (0, 2, 1), (0, 4, 1)),
    ((7, 1), (0, 2, 1), (0, 4, 1)),
)


def guards():
    for guard in DETERMINANTS:
        yield "horizontal", guard
    for side in ("horizontal", "vertical"):
        for guard in DIRECTIONAL:
            yield side, guard


def main():
    count = 0
    selected = os.environ.get("KARLSSON_CASE_FILTER")
    for branch, rows, columns in CASES:
        if selected and ",".join(map(str, branch)) not in selected.split(";"):
            continue
        for side, guard in guards():
            environment = os.environ.copy()
            environment.update({
                "KARLSSON_BASE_PAIR": ",".join(map(str, branch)),
                "KARLSSON_RESCUE_ROWS": ",".join(map(str, rows)),
                "KARLSSON_RESCUE_COLUMNS": ",".join(map(str, columns)),
                "KARLSSON_RESCUE_SIDE": side,
                "KARLSSON_RESCUE_GUARD": guard,
                "MSOLVE_QUIET": "1",
                "MSOLVE_THREADS": os.environ.get("MSOLVE_THREADS", "4"),
                "MSOLVE_REVERSE_ORDER": "1",
                "MSOLVE_REQUIRE_UNIT": "1",
            })
            # This leading factor is independent of z4.  Dropping z4 and
            # its two defining relations enlarges the projected solution
            # set, so a unit ideal in this relaxed system is still a valid
            # no-solution certificate and is substantially cheaper.
            if guard == "lead2":
                environment["KARLSSON_OMIT_PHASE"] = (
                    "z4" if side == "horizontal" else "z1"
                )
            result = subprocess.run(
                [sys.executable, str(ENGINE)],
                cwd=HERE,
                env=environment,
                text=True,
                capture_output=True,
                check=False,
            )
            label = f"branch={branch} frame={rows}/{columns} {side}:{guard}"
            if result.returncode:
                print(f"FAIL {label}")
                print(result.stdout[-4000:])
                print(result.stderr[-4000:])
                raise SystemExit(result.returncode)
            if "unit ideal" not in result.stdout:
                raise AssertionError(f"missing unit-ideal marker for {label}")
            count += 1
            print(f"PASS {label}", flush=True)
        print(f"PASS branch {branch}: all 21 frame guards", flush=True)

    print(f"PASS direct mixed-branch cover: {count} exact unit-ideal jobs")


if __name__ == "__main__":
    main()
