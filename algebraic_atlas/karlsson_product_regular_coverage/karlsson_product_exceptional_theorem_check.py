#!/usr/bin/env python3
"""Compatibility entry point for the path printed in the submitted paper."""

from pathlib import Path
import runpy


TARGET = (
    Path(__file__).resolve().parents[2]
    / "certificates"
    / "product_exceptional"
    / "karlsson_product_regular_coverage"
    / "karlsson_product_exceptional_theorem_check.py"
)

runpy.run_path(str(TARGET), run_name="__main__")
