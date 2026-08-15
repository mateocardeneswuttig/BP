#!/usr/bin/env python3
"""Enforce the source and axiom boundary of the public Lean theorem."""

from __future__ import annotations

import argparse
from pathlib import Path
import re
import subprocess
import sys


ROOT = Path(__file__).resolve().parent
PUBLIC_ENDPOINTS = {
    "paper_failed_corner_search_forces_karlsson_or_tao",
    "paper_karlsson_has_finite_corner",
    "paper_tao_has_finite_corner",
    "paper_finite_corner_theorem",
    "paper_nonexceptional_completed_dilation_recovery",
    "paper_finite_corner_completeness",
    "paper_finite_corner_soundness",
    "paper_total_output_corollary",
    "paper_classification_corollary",
}
ALLOWED_AXIOMS = {"propext", "Classical.choice", "Quot.sound"}
FORBIDDEN = re.compile(
    r"\b(?:sorry|admit|axiom|constant|opaque|unsafe)\b|\bnative_decide\b"
)


def code_without_comments_or_strings(source: str) -> str:
    """Erase Lean comments and string contents while preserving newlines."""
    result: list[str] = []
    index = 0
    block_depth = 0
    in_string = False
    escaped = False
    while index < len(source):
        pair = source[index:index + 2]
        character = source[index]
        if block_depth:
            if pair == "/-":
                block_depth += 1
                result.extend("  ")
                index += 2
            elif pair == "-/":
                block_depth -= 1
                result.extend("  ")
                index += 2
            else:
                result.append("\n" if character == "\n" else " ")
                index += 1
            continue
        if in_string:
            result.append("\n" if character == "\n" else " ")
            if escaped:
                escaped = False
            elif character == "\\":
                escaped = True
            elif character == '"':
                in_string = False
            index += 1
            continue
        if pair == "/-":
            block_depth = 1
            result.extend("  ")
            index += 2
        elif pair == "--":
            newline = source.find("\n", index + 2)
            if newline == -1:
                result.extend(" " * (len(source) - index))
                break
            result.extend(" " * (newline - index))
            index = newline
        elif character == '"':
            in_string = True
            result.append(" ")
            index += 1
        else:
            result.append(character)
            index += 1
    return "".join(result)


def source_audit() -> None:
    failures: list[str] = []
    for path in sorted((ROOT / "Hadamard6").glob("*.lean")):
        code = code_without_comments_or_strings(path.read_text(encoding="utf-8"))
        for match in FORBIDDEN.finditer(code):
            line = code.count("\n", 0, match.start()) + 1
            failures.append(f"{path.relative_to(ROOT)}:{line}: {match.group(0)}")
    if failures:
        raise AssertionError(
            "forbidden unfinished or unchecked Lean source:\n"
            + "\n".join(failures)
        )
    print(
        "PASS Lean source contains no sorry, admit, project axiom/constant, "
        "opaque/unsafe declaration, or native_decide"
    )


def axiom_audit(lake: str) -> None:
    completed = subprocess.run(
        [lake, "env", "lean", "Hadamard6/PaperTheorem.lean"],
        cwd=ROOT,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    if completed.returncode:
        sys.stdout.write(completed.stdout)
        raise RuntimeError("Lean public theorem audit did not compile")

    report_pattern = re.compile(
        r"'([^']+)' depends on axioms:\s*\[([^\]]*)\]",
        re.MULTILINE,
    )
    reports = {}
    for theorem, body in report_pattern.findall(completed.stdout):
        short_name = theorem.rsplit(".", 1)[-1]
        reports[short_name] = {
            item.strip() for item in body.split(",") if item.strip()
        }

    missing = sorted(PUBLIC_ENDPOINTS - reports.keys())
    if missing:
        sys.stdout.write(completed.stdout)
        raise AssertionError("missing axiom reports for: " + ", ".join(missing))
    unexpected = {
        theorem: sorted(axioms - ALLOWED_AXIOMS)
        for theorem, axioms in reports.items()
        if theorem in PUBLIC_ENDPOINTS and axioms - ALLOWED_AXIOMS
    }
    if unexpected:
        raise AssertionError(f"unexpected public theorem axioms: {unexpected}")
    print(
        "PASS nine paper-facing axiom reports use only "
        "propext, Classical.choice, and Quot.sound"
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--lake", default="lake")
    args = parser.parse_args()
    source_audit()
    axiom_audit(args.lake)
    print("ALL PUBLIC LEAN SOURCE AND AXIOM CHECKS PASSED")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
