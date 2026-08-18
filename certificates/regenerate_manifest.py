#!/usr/bin/env python3
"""Regenerate the deterministic SHA-256 manifest for certificate sources."""

from __future__ import annotations

import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parent
MANIFEST = ROOT / "SHA256SUMS"


def main() -> None:
    paths = sorted(
        path
        for path in ROOT.rglob("*")
        if path.is_file()
        and path != MANIFEST
        and "__pycache__" not in path.parts
    )
    lines = []
    for path in paths:
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        relative = path.relative_to(ROOT).as_posix()
        lines.append(f"{digest}  {relative}\n")
    MANIFEST.write_text("".join(lines), encoding="utf-8")
    print(f"WROTE {MANIFEST} ({len(paths)} files)")


if __name__ == "__main__":
    main()
