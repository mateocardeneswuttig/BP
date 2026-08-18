#!/usr/bin/env python3
"""Single-column plate stack for Section IV.

Five (arg a, arg b) slices of the product-sheet separation sqrt(-omega_n) at
five fixed (c,d), drawn as opaque plates held apart by a uniform vertical step.
A torus at the top left shows the topmost slice uncut -- each plate is the seed
2-torus cut open along arg a = arg b = -pi.

Bottom to top:  (i, d_0), (omega, 1), (i, 1), (-1, -1), (omega, -1).
The ramification seed sits at (pi/2, pi/2) on plate 0 and Tao's S_6^(0) at
(0, 2pi/3) on plate 1; the torus depicts plate 4.

Deliberately unlabelled.  No (c,d) text, no axis labels, no seed markers -- all
annotation is added downstream.  Only the colour bar is kept, since it is the
sole carrier of the scale.  The vertical offset is a stacking index, not a phase
coordinate.  Angles use [-pi,pi).

Usage:  python plot_figure_composite.py [--N 720] [--out output/figure_stack.pdf]
"""
from __future__ import annotations
import argparse
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import audited_import as ai
import seed_constants as sc
import plot_style as ps

ap = argparse.ArgumentParser()
ap.add_argument("--N", type=int, default=420)
ap.add_argument("--elev", type=float, default=31.0)
ap.add_argument("--azim", type=float, default=-60.0)
ap.add_argument("--lo", type=float, default=-1.0,
                help="left end of the angle window in units of pi.  Default -1 "
                     "gives [-pi,pi); 0 gives [0,2pi).  Default is NOT 0 on "
                     "purpose: Tao has a = 1, so under [0,2pi) it lands exactly "
                     "on the arg a = 0 seam, which severs the figure-of-eight on "
                     "plate 1 into two half-lobes at opposite edges and makes the "
                     "point itself appear twice.  Under [-pi,pi) it is interior.")
ap.add_argument("--out", default="output/figure_stack.pdf")
a = ap.parse_args()
ps.apply()

WOM = np.exp(2j*np.pi/3)
MINLEN = 0.60                     # drop boundary fragments shorter than this (rad).
                                  # Counts are stable over 0.6-1.5 on every plate, so
                                  # this sits in a genuine scale gap, not on a cliff.
SEPMAX = 2.0                      # exact: omega_n >= -4
RAM, TAO = "#1d4f7a", "#14402f"
L = np.pi
LO = a.lo*np.pi
HI = LO + 2*L
NB = 20
LEV = np.concatenate([[-1.0], np.linspace(0.0, SEPMAX, NB + 1)])
COLS = [ps.NEUT] + [ps.SEQ(i/(NB - 1)) for i in range(NB)]

# bottom -> top.  No labels or markers are drawn: (c,d), the in-plane angles,
# the ramification-seed ring at (pi/2, pi/2) on plate 0 and the Tao cross at
# (0, 2pi/3) on plate 1 are all added downstream.
PLATES = [
    dict(c=1j,  d=sc.D0, lab="(i, d0)"),
    dict(c=WOM, d=1,     lab="(omega, 1)"),
    dict(c=1j,  d=1,     lab="(i, 1)"),
    dict(c=-1,  d=-1,    lab="(-1, -1)"),
    dict(c=WOM, d=-1,    lab="(omega, -1)"),
]

fn = ai.load_coefficient_function()
g = np.linspace(LO, HI, a.N, endpoint=False)
A, B = np.meshgrid(np.exp(1j*g), np.exp(1j*g), indexing="ij")
fields = [np.real(ai.omega_n(A, B, p["c"], p["d"], fn)[0]) for p in PLATES]
_scratch = plt.figure().add_subplot(111)   # off-screen: contour extraction only

# torus geometry, sitting over the top plate
ZSTRETCH = 4.05              # raised: plates no longer overlap              # box_aspect z of the stack axes

fig = plt.figure(figsize=(3.4, 7.80))
axS = fig.add_axes([-0.045, 0.005, 1.09, 0.990], projection="3d")

dz = 2*L/len(PLATES)
zt_plate = (len(PLATES) - 1)*dz

_outlines = []
for m, sl in enumerate(fields):
    zp = m*dz
    fld = np.where(sl < 0.0, np.sqrt(np.maximum(0.0, -sl)), -0.5)
    _cf = axS.contourf(g, g, fld.T, levels=LEV, colors=COLS, zdir="z", offset=zp)
    _cf.set_rasterized(True)   # fills -> raster; outlines stay vector
    for xx, yy in (([LO, HI], [LO, LO]), ([LO, HI], [HI, HI]),
                   ([LO, LO], [LO, HI]), ([HI, HI], [LO, HI])):
        axS.plot(xx, yy, [zp, zp], color="#8d8880", lw=0.4, zorder=6)
    # omega_n = 0 boundary, as the 0.5-level of the physical indicator.
    # The grid is wrapped periodically first (arg a, arg b live on a torus), so
    # boundary curves crossing the -pi seam close instead of being severed into
    # open arcs.  Extracted off-screen and stashed, then drawn after every fill
    # is down: a zdir contour loses the depth sort against its own plate's fill.
    # Fragments shorter than MINLEN of arc are dropped -- on the (-1,-1) and
    # (omega,-1) plates the boundary is 76-81% sub-grid speckle, which would
    # read as noise.  So what is drawn is the part of the locus the sampling
    # resolves, not the whole of it.
    ind = (sl.T < 0.0).astype(float)
    ind = np.vstack([ind, ind[0:1]]); ind = np.hstack([ind, ind[:, 0:1]])
    gx = np.append(g, HI)
    for _seg in _scratch.contour(gx, gx, ind, levels=[0.5]).allsegs[0]:
        if np.hypot(*np.diff(_seg, axis=0).T).sum() >= MINLEN:
            _outlines.append((_seg, zp))

for _seg, zp in _outlines:
    axS.plot(_seg[:, 0], _seg[:, 1], np.full(len(_seg), zp + 0.015),
             color=ps.LINE, lw=0.55, solid_capstyle="round", zorder=30)

# ---- angle ticks, top plate only ----------------------------------------
# Drawn by hand rather than via the 3-D axis decorations, which cannot be
# restricted to a single z-slice.  Front edges at y = LO (arg a) and x = LO
# (arg b) for elev/azim as set below.
_zt = (len(PLATES) - 1)*dz
_TL = 0.34                                    # tick length, data units
def _pilab(v):
    k = v/np.pi
    if abs(k) < 1e-9:            return "$0$"
    if abs(k - 1) < 1e-9:        return r"$\pi$"
    if abs(k + 1) < 1e-9:        return r"$-\pi$"
    return rf"${k:.0f}\pi$"
for _tv in (LO, LO + L, HI):
    _tlab = _pilab(_tv)
    axS.plot([_tv, _tv], [LO, LO - _TL], [_zt, _zt],
             color=ps.LINE, lw=0.5, zorder=31)
    axS.text(_tv, LO - 2.7*_TL, _zt, _tlab, fontsize=5.4, ha="center",
             va="center", color="#2b2b2b", zorder=32)
    axS.plot([LO, LO - _TL], [_tv, _tv], [_zt, _zt],
             color=ps.LINE, lw=0.5, zorder=31)
    axS.text(LO - 2.7*_TL, _tv, _zt, _tlab, fontsize=5.4, ha="center",
             va="center", color="#2b2b2b", zorder=32)
for _xx, _yy in (([LO, HI], [LO, LO]), ([LO, LO], [LO, HI])):
    axS.plot(_xx, _yy, [_zt, _zt], color=ps.LINE, lw=0.5, zorder=31)

# ---- torus to the side: the top plate, uncut -----------------------------
axT = fig.add_axes([-0.040, 0.830, 0.395, 0.160], projection="3d")
RT, RR_ = 3.3, 1.02

def torus3d(al, be):
    return ((RT + RR_*np.cos(be))*np.cos(al),
            (RT + RR_*np.cos(be))*np.sin(al),
            RR_*np.sin(be))

st = 2
gt = np.append(g[::st], HI)   # close the torus at the window's own top end
Wt = fields[-1][::st, ::st]
Wt = np.vstack([Wt, Wt[0:1, :]]); Wt = np.hstack([Wt, Wt[:, 0:1]])
AA, BB = np.meshgrid(gt, gt, indexing="ij")
XT, YT, ZT = torus3d(AA, BB)
sepT = np.sqrt(np.maximum(0.0, -Wt))
fcT = ps.SEQ(matplotlib.colors.Normalize(0, SEPMAX)(sepT))
fcT[Wt > 0] = matplotlib.colors.to_rgba(ps.NEUT)
_ts = axT.plot_surface(XT, YT, ZT, facecolors=fcT, rstride=1, cstride=1,
                       linewidth=0, antialiased=False, shade=False)
_ts.set_rasterized(True)
# ---- circulation arrows: which angle runs which way round the torus ------
# torus3d(al, be) is called with al from axis 0 of the field and be from axis 1,
# and A, B = meshgrid(..., indexing="ij") puts arg a on axis 0.  So arg a is the
# TOROIDAL angle (the big loop around the hole) and arg b is the POLOIDAL one
# (around the tube).  Unlabelled, per the rest of the figure.
AR = dict(color=ps.LINE, lw=0.75, zorder=40, solid_capstyle="round")
PAD = 0.62
OUT = RT + RR_ + PAD


def _chev(tip, tang, perp, size=0.62, half=0.42):
    """Arrowhead as two explicit line segments.

    quiver() heads get dropped by the 3-D depth sort here; plain Line3D does not.
    """
    tang = tang/np.linalg.norm(tang); perp = perp/np.linalg.norm(perp)
    for sg in (+1, -1):
        q = tip + size*(-tang*np.cos(half) + sg*perp*np.sin(half))
        axT.plot([tip[0], q[0]], [tip[1], q[1]], [tip[2], q[2]], **AR)


# arg a: toroidal, a loop just outside the torus in the z = 0 plane
_r = OUT - 0.16
_al = np.radians(np.linspace(170, 450, 240))
axT.plot(_r*np.cos(_al), _r*np.sin(_al), np.zeros_like(_al), **AR)
_a2 = _al[-1]
_chev(np.array([_r*np.cos(_a2), _r*np.sin(_a2), 0.0]),
      np.array([-np.sin(_a2), np.cos(_a2), 0.0]),
      np.array([np.cos(_a2), np.sin(_a2), 0.0]))

# arg b: poloidal, a loop encircling the tube at a fixed arg a
_u = np.array([np.cos(np.radians(300.0)), np.sin(np.radians(300.0)), 0.0])
_zh = np.array([0.0, 0.0, 1.0])
_rr = RR_ + 0.42
_be = np.radians(np.linspace(-60, 250, 240))
_pts = (RT*_u[None, :]
        + _rr*(np.cos(_be)[:, None]*_u[None, :] + np.sin(_be)[:, None]*_zh[None, :]))
axT.plot(_pts[:, 0], _pts[:, 1], _pts[:, 2], **AR)
_chev(_pts[-1],
      -np.sin(_be[-1])*_u + np.cos(_be[-1])*_zh,
      np.cos(_be[-1])*_u + np.sin(_be[-1])*_zh)

axT.set_xlim(-OUT, OUT); axT.set_ylim(-OUT, OUT)
axT.set_zlim(-1.5*RR_, 1.5*RR_)
axT.set_box_aspect((1, 1, 2*RR_/(RT+RR_)), zoom=1.34)
axT.set_axis_off(); axT.view_init(elev=40, azim=84)

axS.set_xlim(LO, HI); axS.set_ylim(LO, HI)
axS.set_zlim(-0.40, zt_plate + 0.40)
axS.set_box_aspect((1, 1, ZSTRETCH), zoom=1.09)   # fits all 5 plates in the bbox
axS.set_axis_off()
axS.set_proj_type("ortho")   # exploded stack: no per-plate foreshortening
axS.view_init(elev=a.elev, azim=a.azim)

cax = fig.add_axes([0.880, 0.330, 0.021, 0.180])
cb = fig.colorbar(matplotlib.cm.ScalarMappable(
        norm=matplotlib.colors.Normalize(0, SEPMAX), cmap=ps.SEQ), cax=cax)
cb.set_label(r"$\sqrt{-\omega_{\mathrm{n}}}$", labelpad=2, fontsize=6.4)
cb.outline.set_linewidth(0.4); cb.ax.tick_params(width=0.4, labelsize=5.6)
cb.set_ticks([0, 1, 2])

fig.savefig(a.out, dpi=600)
print("wrote", a.out)
for m, p in enumerate(PLATES):
    print(f"  plate {m} (bottom=0): {p['lab']:26s} phys frac {np.mean(fields[m] < 0):.3f}")
