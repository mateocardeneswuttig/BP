#!/usr/bin/env python3
"""Deterministic runner for the manuscript's non-Lean certificates."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path
import subprocess
import sys
import time


ROOT = Path(__file__).resolve().parent

THEOREM_CERTIFICATES = (
    "generic_cover/product_cubic_reduction.py",
    "generic_cover/product_cubic_candidate_check.py",
    "generic_cover/product_discriminant_check.py",
    "generic_cover/horizontal_vertical_cover_check.py",
    "generic_cover/positivity_lemma_reduction.py",
    "generic_cover/exact_lower_block_specialization.py",
    "product_escape/product_regular_escape_reduction_check.py",
    "product_escape/bi_equimodular_core_check.py",
    "product_escape/global_escape_incidence_check.py",
    "product_escape/zero_invariant_endpoint_check.py",
    "product_escape/dependent_block_threshold_check.py",
    "product_escape/dependent_block_threshold_independent_check.py",
)

RAMIFICATION_CERTIFICATES = (
    "ramification/ramification_seed_certificate.py",
)

PRODUCT_EXCEPTIONAL_FAST_CERTIFICATES = (
    "product_exceptional/tao_product_exceptional_check.py",
    "product_exceptional/karlsson_product_regular_coverage/exact_product_exceptional_karlsson.py",
    "product_exceptional/karlsson_product_regular_coverage/sympy_verify_product_exceptional_karlsson.py",
)

PRODUCT_EXCEPTIONAL_FULL_CERTIFICATES = (
    "product_exceptional/karlsson_product_regular_coverage/karlsson_product_exceptional_theorem_check.py",
)


def verify_manifest() -> None:
    """Check that the audited certificate package is byte-for-byte intact."""
    manifest_path = ROOT / "SHA256SUMS"
    expected: dict[str, str] = {}
    for line in manifest_path.read_text(encoding="utf-8").splitlines():
        digest, relative_path = line.split("  ", 1)
        expected[relative_path] = digest

    actual_paths = {
        path.relative_to(ROOT).as_posix()
        for path in ROOT.rglob("*")
        if path.is_file()
        and path != manifest_path
        and "__pycache__" not in path.parts
    }
    if actual_paths != set(expected):
        missing = sorted(set(expected) - actual_paths)
        unlisted = sorted(actual_paths - set(expected))
        raise RuntimeError(
            f"certificate manifest mismatch; missing={missing}, unlisted={unlisted}"
        )

    for relative_path, digest in sorted(expected.items()):
        payload = (ROOT / relative_path).read_bytes()
        observed = hashlib.sha256(payload).hexdigest()
        if observed != digest:
            raise RuntimeError(
                f"SHA-256 mismatch for {relative_path}: {observed} != {digest}"
            )
    print(f"PASS SHA-256 manifest ({len(expected)} files)")


def run(relative_path: str) -> None:
    path = ROOT / relative_path
    started = time.monotonic()
    print(f"\n=== {relative_path} ===", flush=True)
    subprocess.run(
        [sys.executable, path.name],
        cwd=path.parent,
        check=True,
    )
    print(f"PASS {relative_path} ({time.monotonic() - started:.1f}s)")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--ramification",
        action="store_true",
        help="also run the illustrative exact/Arb ramification-seed audit",
    )
    parser.add_argument(
        "--full-product-exceptional",
        action="store_true",
        help="run the complete Karlsson singleton audit (requires msolve)",
    )
    args = parser.parse_args()

    verify_manifest()

    for certificate in THEOREM_CERTIFICATES:
        run(certificate)
    for certificate in PRODUCT_EXCEPTIONAL_FAST_CERTIFICATES:
        run(certificate)
    if args.full_product_exceptional:
        for certificate in PRODUCT_EXCEPTIONAL_FULL_CERTIFICATES:
            run(certificate)
    if args.ramification:
        for certificate in RAMIFICATION_CERTIFICATES:
            run(certificate)

    count = len(THEOREM_CERTIFICATES) + len(PRODUCT_EXCEPTIONAL_FAST_CERTIFICATES) + (
        len(PRODUCT_EXCEPTIONAL_FULL_CERTIFICATES)
        if args.full_product_exceptional else 0
    ) + (
        len(RAMIFICATION_CERTIFICATES) if args.ramification else 0
    )
    print(f"\nALL {count} REQUESTED CERTIFICATES PASSED")


if __name__ == "__main__":
    main()
