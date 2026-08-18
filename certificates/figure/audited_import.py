"""Pinned import of the audited product-quadratic coefficient builder.

The redesign deliberately does NOT re-derive the fundamental sextic.  It imports
`build_symbolic_functions` from the audited project source, records the source
path and a SHA-256 checksum, and exposes omega_n built from those coefficients.

The audited source is shipped with the certificate package, so the import is
relative to this file rather than tied to a contributor's workstation.
"""
from __future__ import annotations
import hashlib, sys
from pathlib import Path
import numpy as np

PINNED_PATH = (
    Path(__file__).resolve().parents[1]
    / "ramification"
    / "scan_lower_block_pairing.py"
)
# SHA-256 of the shipped source; the whole package is also covered by SHA256SUMS.
CHECKSUM = "479754895853fc1fd60b8edffbc8ad5b2a09dca1f45f8723d90732d5a365c270"


def source_checksum() -> str:
    return hashlib.sha256(PINNED_PATH.read_bytes()).hexdigest()


def load_coefficient_function():
    """Return the audited lambdified callable (s,sb,t,tb,r,rb) -> [c0,c4,c6,*A,*B]."""
    if not PINNED_PATH.exists():
        raise FileNotFoundError(f"audited source missing: {PINNED_PATH}")
    sys.path.insert(0, str(PINNED_PATH.parent))
    from scan_lower_block_pairing import build_symbolic_functions
    return build_symbolic_functions()


def trace_data(a, b, c, d):
    """Horizontal fixed-Gram trace data forced by the corner E(a,b,c,d)."""
    s = -(1 + a + b)
    t = -(1 + c + d)
    r = -(1 + c / a + d / b)
    return s, t, r


def product_quadratic(a, b, c, d, fn):
    """(U, V, c6, delta, s) of  lambda^2 - U lambda + V = 0  for the horizontal fiber.

    U = (c4 - s^2 c6)/(sb c6),  V = c0/c6   (audited c4-form; equivalent to the
    c3-form by the exact middle-coefficient identity, valid where sb != 0).
    """
    s, t, r = trace_data(a, b, c, d)
    sb, tb, rb = np.conj(s), np.conj(t), np.conj(r)
    vals = fn(s, sb, t, tb, r, rb)
    c0, c4, c6 = vals[0], vals[1], vals[2]
    with np.errstate(divide="ignore", invalid="ignore"):
        U = (c4 - s**2 * c6) / (sb * c6)
        V = c0 / c6
    delta = r * rb - t * tb
    return U, V, c6, delta, s


def omega_n(a, b, c, d, fn):
    """Normalized product discriminant  omega_n = |U|^2 - 4.

    REGULAR_SEED_SUFFICIENCY.md:  on the guarded product-regular domain the
    horizontal fiber is physical iff omega_n <= 0, with two distinct product
    sheets iff omega_n < 0, and |u_+ - u_-|^2 = -omega_n.
    """
    U, V, c6, delta, s = product_quadratic(a, b, c, d, fn)
    return np.abs(U) ** 2 - 4.0, U, V, c6, delta, s


if __name__ == "__main__":
    print("pinned source :", PINNED_PATH)
    print("sha256        :", source_checksum())
