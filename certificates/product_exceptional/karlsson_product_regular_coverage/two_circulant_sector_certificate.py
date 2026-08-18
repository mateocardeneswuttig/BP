#!/usr/bin/env python3
"""Master certificate for the complete two-circulant sector theorem.

The seven component certificates partition all 21 primary guard divisors.
Together they prove that every physical divisor point either has an exact
product-regular rescue frame or represents the single class ``[H_x]``.
"""

from __future__ import annotations

from pathlib import Path
import subprocess
import sys


HERE = Path(__file__).resolve().parent
COMPONENTS = (
    ("two_circulant_determinant_factor_certificate.py",
     "CERTIFIED: determinant factors 1--3 have no physical zeros"),
    ("two_circulant_factor4_rescue_certificate.py",
     "CERTIFIED: factor 4 is product regular away from [H_x]"),
    ("two_circulant_hx_factor_certificate.py",
     "TWO-CIRCULANT H_X FACTOR CERTIFICATE PASSED"),
    ("two_circulant_factors6_15_certificate.py",
     "CERTIFIED: factors 6 and 15 are product regular away from [H_x]"),
    ("two_circulant_factor7_dita_certificate.py",
     "CERTIFIED: all nine divisors are product regular away from [H_x]"),
    ("two_circulant_factor10_rescue_certificate.py",
     "CERTIFIED: factor 10 is product regular away from [H_x]"),
    ("two_circulant_companion_divisor_symmetry.py",
     "CERTIFIED: factor-10 coverage transports to all four divisors"),
)


def main():
    for filename, marker in COMPONENTS:
        result = subprocess.run(
            [sys.executable, str(HERE / filename)], cwd=HERE,
            text=True, capture_output=True, check=False,
        )
        if result.returncode or marker not in result.stdout:
            print(f"FAIL {filename}")
            print(result.stdout[-6000:])
            print(result.stderr[-6000:])
            raise SystemExit(result.returncode or 3)
        print(f"PASS {filename}", flush=True)
    print("CERTIFIED: X_6^(2) minus P_6 is exactly {[H_x]}")


if __name__ == "__main__":
    main()
