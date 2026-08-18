#!/usr/bin/env python3
"""Certify a two-frame cover of the ordinary mixed branch ``(1,7)``.

On this base branch frame A

    rows=(0,2,1), columns=(0,4,1)

is first certified to have all sufficient product-regularity guards nonzero
apart from its horizontal ``lead1`` and ``delta`` guards.  The runner then
asks msolve, in characteristic zero, whether any of the 21 sufficient guards
of frame C

    rows=(0,2,1), columns=(0,5,1)

can vanish on either residual stratum.  A unit ideal in every job proves
that C is product regular wherever A is not.

The underlying equations and exact Cayley saturation are assembled by
``ordinary_rescue_elimination.py``.  The runner is intentionally sequential
so that no two Groebner-basis computations compete for memory.
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


def rescue_jobs():
    for residual in ("lead1", "delta"):
        for guard in DETERMINANTS:
            yield residual, "horizontal", guard
        for side in ("horizontal", "vertical"):
            for guard in DIRECTIONAL:
                yield residual, side, guard


def run(environment, label):
    result = subprocess.run(
        [sys.executable, str(ENGINE)],
        cwd=HERE,
        env=environment,
        text=True,
        capture_output=True,
        check=False,
    )
    if result.returncode:
        print(f"FAIL {label}")
        print(result.stdout[-4000:])
        print(result.stderr[-4000:])
        raise SystemExit(result.returncode)
    if "unit ideal" not in result.stdout:
        raise AssertionError(f"missing unit-ideal marker for {label}")
    print(f"PASS {label}", flush=True)


def common_environment():
    environment = os.environ.copy()
    environment.update({
        "KARLSSON_BASE_PAIR": "1,7",
        "KARLSSON_RESCUE_ROWS": "0,2,1",
        "KARLSSON_RESCUE_COLUMNS": "0,4,1",
        "MSOLVE_QUIET": "1",
        "MSOLVE_THREADS": os.environ.get("MSOLVE_THREADS", "4"),
        "MSOLVE_REVERSE_ORDER": "1",
        "MSOLVE_REQUIRE_UNIT": "1",
    })
    return environment


def main():
    primary_count = 0
    for guard in DETERMINANTS:
        environment = common_environment()
        environment.update({
            "KARLSSON_RESCUE_SIDE": "horizontal",
            "KARLSSON_RESCUE_GUARD": guard,
        })
        run(environment, f"A:horizontal:{guard}=0")
        primary_count += 1
    for side in ("horizontal", "vertical"):
        for guard in DIRECTIONAL:
            if side == "horizontal" and guard in ("lead1", "delta"):
                continue
            environment = common_environment()
            environment.update({
                "KARLSSON_RESCUE_SIDE": side,
                "KARLSSON_RESCUE_GUARD": guard,
            })
            run(environment, f"A:{side}:{guard}=0")
            primary_count += 1

    rescue_count = 0
    for residual, side, guard in rescue_jobs():
        environment = common_environment()
        environment.update({
            "KARLSSON_RESCUE_SIDE": "horizontal",
            "KARLSSON_RESCUE_GUARD": residual,
            "KARLSSON_EXTRA_ROWS": "0,2,1",
            "KARLSSON_EXTRA_COLUMNS": "0,5,1",
            "KARLSSON_EXTRA_SIDE": side,
            "KARLSSON_EXTRA_GUARD": guard,
        })
        label = f"A:{residual}=0 / C:{side}:{guard}=0"
        run(environment, label)
        rescue_count += 1

    print(
        f"PASS branch (1,7): {primary_count} primary and {rescue_count} "
        "rescue unit-ideal jobs prove the two-frame A/C cover"
    )


if __name__ == "__main__":
    main()
