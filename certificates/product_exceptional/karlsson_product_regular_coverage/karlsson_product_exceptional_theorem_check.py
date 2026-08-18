#!/usr/bin/env python3
"""Sequential master audit for the Karlsson singleton theorem.

This runner checks every new exact component of

    K_6^(3) \ P_6 = {[H_x]}.

The published Matszangosz--Szollosi three-minus-one theorem is a stated
mathematical input, not re-proved here.  The ordinary Karlsson base-corner
certificate is also invoked from the parent atlas directory.
"""

from __future__ import annotations

from pathlib import Path
import subprocess
import sys


HERE = Path(__file__).resolve().parent
ATLAS = HERE.parent
COMPONENTS = (
    (ATLAS / "karlsson_interior_containment_check.py",
     "ALL KARLSSON INTERIOR CONTAINMENT CHECKS PASSED"),
    (HERE / "ordinary_sparse_conversion_audit.py",
     "PASS sparse/direct Cayley equality for all 42 rescue expressions"),
    (HERE / "ordinary_pair_routing_certificate.py",
     "PASS exhaustive 49-pair ordinary routing table"),
    (HERE / "ordinary_mixed_direct_frame_certificate.py",
     "PASS direct mixed-branch cover: 105 exact unit-ideal jobs"),
    (HERE / "ordinary_mixed_branch17_rescue_certificate.py",
     "PASS branch (1,7): 19 primary and 42 rescue unit-ideal jobs"),
    (HERE / "fourier_product_cover_check.py",
     "FOURIER PRODUCT-COVER RESULTANT REDUCTION COMPLETE"),
    (HERE / "two_circulant_sector_certificate.py",
     "CERTIFIED: X_6^(2) minus P_6 is exactly {[H_x]}"),
    (HERE / "exact_product_exceptional_karlsson.py",
     "PASS companion denominator vanishes on every ordered frame: 14400/14400"),
    (HERE / "sympy_verify_product_exceptional_karlsson.py",
     "INDEPENDENT EXACT COUNTEREXAMPLE VERIFICATION COMPLETE"),
)


def main():
    for script, marker in COMPONENTS:
        result = subprocess.run(
            [sys.executable, str(script)], cwd=script.parent,
            text=True, capture_output=True, check=False,
        )
        if result.returncode or marker not in result.stdout:
            print(f"FAIL {script.name}")
            print(result.stdout[-8000:])
            print(result.stderr[-8000:])
            raise SystemExit(result.returncode or 3)
        print(f"PASS {script.name}", flush=True)
    print("CERTIFIED: K_6^(3) minus P_6 is exactly {[H_x]}")


if __name__ == "__main__":
    main()
