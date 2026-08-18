"""Fixed constants defining the plotted slice and the certified ramification seed."""
import numpy as np

# Degree-7 defining polynomial of xi_0 (exact ramification certificate,
# manuscript Prop. "Three-parameter ramification patch").
RAMIFICATION_POLY = [16, 120, 428, 952, 1363, 1231, 664, 176]

def xi0():
    """Unique real root of RAMIFICATION_POLY."""
    real = [r.real for r in np.roots(RAMIFICATION_POLY) if abs(r.imag) < 1e-9]
    if len(real) != 1:
        raise RuntimeError(f"expected a unique real root, got {real}")
    return real[0]

def cayley(xi):
    """Cayley transform R -> T."""
    return (1 + 1j * xi) / (1 - 1j * xi)

XI0 = xi0()
D0  = cayley(XI0)                 # d at the certified ramification seed
C_FIXED = 1j                      # c = i
D_FIXED = D0                      # slice chosen so the certified seed lies in it
# the certified seed is (a,b,c,d) = (i, i, i, d0), i.e. (alpha,beta) = (pi/2, pi/2)
SEED_ALPHA = np.pi / 2
SEED_BETA  = np.pi / 2
