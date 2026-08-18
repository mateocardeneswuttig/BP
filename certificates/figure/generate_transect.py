"""Transverse path through the certified algebraic ramification seed.

Path:   a = b = c = i,  d = Cayley(xi0 + t).
The signed transverse coordinate t vanishes exactly at the certified seed
(a,b,c,d) = (i,i,i,(1+i xi0)/(1-i xi0)), where omega_n = 0.

Usage:  python generate_transect.py [M] [half_width]
Writes data/transect.npz
"""
from __future__ import annotations
import sys
import numpy as np
import audited_import as ai
import seed_constants as sc

def run(M=1201, half=0.06, fn=None):
    fn = fn or ai.load_coefficient_function()
    t = np.linspace(-half, half, M)
    d = sc.cayley(sc.XI0 + t)
    a = np.full(M, 1j); b = np.full(M, 1j); c = np.full(M, 1j)
    w, U, V, c6, delta, s = ai.omega_n(a, b, c, d, fn)
    # roots of lambda^2 - U lambda + V, ordered by argument for a stable labelling
    disc = np.sqrt((U**2 - 4 * V).astype(complex))
    up, um = (U + disc) / 2, (U - disc) / 2
    swap = np.angle(up) < np.angle(um)
    up2 = np.where(swap, um, up); um2 = np.where(swap, up, um)
    return dict(t=t, omega_n=w, U=U, V=V, c6=c6, delta=delta,
                u_plus=up2, u_minus=um2,
                arg_plus=np.angle(up2), arg_minus=np.angle(um2),
                sep=np.abs(up2 - um2), xi0=sc.XI0, half=half, M=M)

if __name__ == "__main__":
    M = int(sys.argv[1]) if len(sys.argv) > 1 else 1201
    half = float(sys.argv[2]) if len(sys.argv) > 2 else 0.06
    out = run(M, half)
    np.savez_compressed("data/transect.npz", **out)
    t, w = out["t"], out["omega_n"]
    phys = w < 0
    print(f"M={M} half={half}")
    print(f"  omega_n at t=0        : {w[np.argmin(np.abs(t))]:.3e}")
    print(f"  physical side (w<0)   : t in [{t[phys].min():+.4f},{t[phys].max():+.4f}]")
    print(f"  |u+-u-| at |t| minimal: {out['sep'][np.argmin(np.abs(t))]:.3e}")
    # square-root fold diagnostic on the physical side
    tp = t[phys]; sep2 = out["sep"][phys] ** 2
    side = tp[np.abs(tp) > 1e-4]
    A = np.polyfit(side, sep2[np.abs(tp) > 1e-4], 1)
    ss = 1 - np.sum((sep2[np.abs(tp)>1e-4] - np.polyval(A, side))**2) / \
             np.sum((sep2[np.abs(tp)>1e-4] - sep2[np.abs(tp)>1e-4].mean())**2)
    print(f"  linear fit  sep^2 = {A[0]:+.5f} t {A[1]:+.3e}   R^2 = {ss:.6f}")
    print(f"  identity max|sep^2 + omega_n| on physical side: "
          f"{np.max(np.abs(out['sep'][phys]**2 + w[phys])):.2e}")
