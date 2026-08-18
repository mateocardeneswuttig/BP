#!/usr/bin/env python3
"""Locate the exact msolve executable used by the elimination certificates."""

from __future__ import annotations

import os
from pathlib import Path
import shutil


def msolve_executable() -> str:
    """Return a configured msolve executable, with a portable PATH fallback."""
    configured = os.environ.get("MSOLVE_BIN")
    if configured:
        candidate = Path(configured).expanduser()
        if candidate.is_file():
            return str(candidate)
        raise FileNotFoundError(f"MSOLVE_BIN does not name a file: {candidate}")

    discovered = shutil.which("msolve")
    if discovered:
        return discovered

    homebrew = Path("/opt/homebrew/bin/msolve")
    if homebrew.is_file():
        return str(homebrew)

    raise FileNotFoundError(
        "msolve was not found; install it or set MSOLVE_BIN to its executable"
    )
