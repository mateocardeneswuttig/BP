#!/usr/bin/env python3
"""Standalone square figure: the branch collision at omega_n = 0.

Along a transverse path through the exact ramification seed, the two product
phases arg u_pm coalesce where omega_n = 0 and no physical sheet exists beyond.
Square aspect, no panel letter or annotation text -- intended to be placed as an
annotation beside the plate stack.

Usage:  python plot_branch_collision.py [--size 2.4] [--out FILE]
"""
from __future__ import annotations
import argparse
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import plot_style as ps

ap = argparse.ArgumentParser()
ap.add_argument("--data", default="data/transect.npz")
ap.add_argument("--size", type=float, default=1.85, help="side length in inches")
ap.add_argument("--out", default="output/branch_collision.pdf")
a = ap.parse_args()
ps.apply()

tr = np.load(a.data)
t, w = tr["t"], tr["omega_n"]
ph = w < 0

fig = plt.figure(figsize=(a.size, a.size))
ax = fig.add_axes([0.215, 0.155, 0.755, 0.815])

ax.axvspan(-0.026, 0.0, color="#f0eeea", lw=0, zorder=0)
ax.plot(t[ph], tr["arg_plus"][ph],  "-", lw=1.2, color="#a83236", label=r"$\arg u_+$")
ax.plot(t[ph], tr["arg_minus"][ph], "-", lw=1.2, color="#39618f", label=r"$\arg u_-$")
ax.axvline(0.0, ls=(0, (3.5, 2.5)), lw=0.65, color=ps.LINE)

ax.set_xlim(-0.026, 0.062)
ax.set_ylim(-0.006, 0.218)
ax.set_xticks([0.0, 0.05]); ax.set_xticklabels([r"$0$", r"$0.05$"])
ax.set_yticks([0.0, 0.1, 0.2]); ax.set_yticklabels([r"$0.0$", r"$0.1$", r"$0.2$"])
ax.set_xlabel(r"$t=\xi-\xi_0$", labelpad=1.5)
ax.set_ylabel(r"$\arg u_\pm$", labelpad=2.0)
ax.legend(loc="center right", fontsize=6.8, handlelength=1.0,
          labelspacing=0.22, borderaxespad=0.4)

fig.savefig(a.out)
print("wrote", a.out, f"({a.size}x{a.size} in)")
