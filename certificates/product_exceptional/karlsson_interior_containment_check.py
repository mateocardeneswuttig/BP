#!/usr/bin/env python3
"""Exact fixed-corner certificate for the nondegenerate Karlsson chart."""

import os


os.environ["KARLSSON_PULLBACK_UNIT_RESULTANT"] = "4,6,8,10"
os.environ["KARLSSON_PULLBACK_REAL_RESULTANT"] = "1"
os.environ["KARLSSON_PULLBACK_BERNSTEIN"] = "1"
os.environ["KARLSSON_PULLBACK_BERNSTEIN_SUBDIVIDE"] = "1"

from karlsson_fixed_corner_pullback import main


if __name__ == "__main__":
    main()
    print("ALL KARLSSON INTERIOR CONTAINMENT CHECKS PASSED")
