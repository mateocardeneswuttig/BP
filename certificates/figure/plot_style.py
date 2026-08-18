"""Shared figure style for the Section IV seed-space figures.

Typography is matched to the manuscript (STIX / LaTeX-like serif + math) so the
panels sit naturally in a REVTeX document.  Colour maps come from seaborn's
perceptually-uniform families; seaborn's *default theme* is deliberately NOT
applied, since its grey-grid aesthetic is wrong for PRX.
"""
import matplotlib as mpl
import seaborn as sns

# --- palette ---------------------------------------------------------------
PHYS = "#39618f"        # physical region, omega_n < 0
NEUT = "#f3f2ef"        # pale neutral, omega_n > 0
LINE = "#14181d"
ACC_R = "#a83236"       # u_+
ACC_B = "#39618f"       # u_-
import matplotlib.pyplot as _plt
# YlGnBu: light (near-neutral) at 0 so ramification walls read pale, good
# mid-range separation, tops out at navy rather than black, colourblind-safe.
SEQ = sns.color_palette("flare", as_cmap=True)

PI_TICKS = ([0, 3.141592653589793, 6.283185307179586], ["$0$", r"$\pi$", r"$2\pi$"])


def apply():
    mpl.rcParams.update({
        # typography: LaTeX-like serif, matching the manuscript
        "font.family": "STIXGeneral",
        "mathtext.fontset": "stix",
        "font.size": 8.0,
        "axes.labelsize": 8.0, "axes.titlesize": 8.0,
        "xtick.labelsize": 7.0, "ytick.labelsize": 7.0, "legend.fontsize": 7.0,
        # restrained frame
        "axes.linewidth": 0.55, "axes.edgecolor": "#3a3a3a",
        "xtick.major.width": 0.55, "ytick.major.width": 0.55,
        "xtick.major.size": 2.6, "ytick.major.size": 2.6,
        "xtick.minor.width": 0.4, "ytick.minor.width": 0.4,
        "xtick.direction": "out", "ytick.direction": "out",
        "xtick.color": "#3a3a3a", "ytick.color": "#3a3a3a",
        "axes.labelcolor": "#14181d", "text.color": "#14181d",
        "legend.frameon": False, "legend.handlelength": 1.25,
        "legend.labelspacing": 0.30, "legend.borderaxespad": 0.35,
        # output
        "figure.dpi": 150, "savefig.dpi": 400, "savefig.bbox": "tight",
        "savefig.pad_inches": 0.012,
        "pdf.fonttype": 42, "ps.fonttype": 42,
    })


def panel_label(ax, text, dx=0.035, dy=0.965, dark=False):
    """Bold panel letter inside the axes with a halo, consistent across panels."""
    import matplotlib.patheffects as _pe
    ax.text(dx, dy, text, transform=ax.transAxes, fontsize=8.6,
            fontweight="bold", va="top", ha="left", zorder=10,
            color="white" if dark else "#14181d",
            path_effects=[_pe.withStroke(linewidth=2.0,
                          foreground="#14181d" if dark else "white")])
