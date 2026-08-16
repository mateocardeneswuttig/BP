import Hadamard6.KarlssonResultantNonvanishing

/-! Generated exact coefficients for the four Karlsson witness quadratics.

This module holds only the witness polynomials.  Each resultant identity
lives in its own module because a single identity peaks near 5 GiB of
elaboration memory; keeping all four together exceeded the memory of a
standard CI runner. -/

namespace Hadamard6

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

noncomputable def karlssonWitness4A (t p : ℂ) : ℂ :=
  ((8 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 1 +
    ((-24 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 2 +
    ((12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 0 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 3 +
    ((-36 : ℂ) + (-36 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 1 +
    ((0 : ℂ) + (56 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 2 +
    ((0 : ℂ) + (-16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 0 +
    ((12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 3 +
    ((-36 : ℂ) + (36 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 1 +
    ((24 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 2 +
    ((-12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 0 +
    ((8 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 1
noncomputable def karlssonWitness4B (t p : ℂ) : ℂ :=
  ((4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 1 +
    ((12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 2 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 0 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 3 +
    ((12 : ℂ) + (-20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 1 +
    ((0 : ℂ) + (-40 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 2 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 0 +
    ((0 : ℂ) + (24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 3 +
    ((12 : ℂ) + (20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 1 +
    ((-12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 2 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 0 +
    ((4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 1
noncomputable def karlssonWitness4C (t p : ℂ) : ℂ :=
  ((-4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 1 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 2 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 0 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 3 +
    ((0 : ℂ) + (16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 1 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 0 +
    ((-12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 3 +
    ((0 : ℂ) + (-16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 1 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 2 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 0 +
    ((-4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 1
noncomputable def karlssonWitness6A (t p : ℂ) : ℂ :=
  ((-8 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 1 +
    ((24 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 2 +
    ((-12 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 0 +
    ((-12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 3 +
    ((36 : ℂ) + (36 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 1 +
    ((0 : ℂ) + (-56 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 2 +
    ((0 : ℂ) + (16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 0 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 3 +
    ((36 : ℂ) + (-36 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 1 +
    ((-24 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 2 +
    ((12 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 0 +
    ((-8 : ℂ) + (0 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 1
noncomputable def karlssonWitness6B (t p : ℂ) : ℂ :=
  ((4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 1 +
    ((12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 2 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 0 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 3 +
    ((12 : ℂ) + (-20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 1 +
    ((0 : ℂ) + (-40 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 2 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 0 +
    ((0 : ℂ) + (24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 3 +
    ((12 : ℂ) + (20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 1 +
    ((-12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 2 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 0 +
    ((4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 1
noncomputable def karlssonWitness6C (t p : ℂ) : ℂ :=
  ((4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 1 +
    ((12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 2 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 0 +
    ((12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 3 +
    ((0 : ℂ) + (-16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 1 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 0 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 3 +
    ((0 : ℂ) + (16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 1 +
    ((-12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 2 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 0 +
    ((4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 1
noncomputable def karlssonWitness8A (t p : ℂ) : ℂ :=
  ((-4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 2 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 3 +
    ((36 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 4 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 2 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 5 +
    ((36 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 4 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 2 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 3 +
    ((-4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 2
noncomputable def karlssonWitness8B (t p : ℂ) : ℂ :=
  ((4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 2 +
    ((12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 3 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 1 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 4 +
    ((12 : ℂ) + (-20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 2 +
    ((0 : ℂ) + (-40 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 3 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 1 +
    ((0 : ℂ) + (24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 4 +
    ((12 : ℂ) + (20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 2 +
    ((-12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 3 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 1 +
    ((4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 2
noncomputable def karlssonWitness8C (t p : ℂ) : ℂ :=
  ((-4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 2 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 3 +
    ((-12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 1 +
    ((0 : ℂ) + (-16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 2 +
    ((-12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 0 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 3 +
    ((0 : ℂ) + (16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 2 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 0 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 3 +
    ((12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 1 +
    ((-4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 2
noncomputable def karlssonWitness10A (t p : ℂ) : ℂ :=
  ((4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 2 +
    ((12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 3 +
    ((-36 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 4 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 2 +
    ((0 : ℂ) + (24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 5 +
    ((-36 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 4 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 2 +
    ((-12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 3 +
    ((4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 2
noncomputable def karlssonWitness10B (t p : ℂ) : ℂ :=
  ((4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 2 +
    ((12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 3 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 1 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 4 +
    ((12 : ℂ) + (-20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 2 +
    ((0 : ℂ) + (-40 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 3 +
    ((0 : ℂ) + (-24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 1 +
    ((0 : ℂ) + (24 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 4 +
    ((12 : ℂ) + (20 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 2 +
    ((-12 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 3 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 1 +
    ((4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 2
noncomputable def karlssonWitness10C (t p : ℂ) : ℂ :=
  ((4 : ℂ) + (4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 6 * p ^ 2 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 3 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 5 * p ^ 1 +
    ((0 : ℂ) + (16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 2 +
    ((12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 4 * p ^ 0 +
    ((0 : ℂ) + (-8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 3 * p ^ 3 +
    ((0 : ℂ) + (-16 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 2 +
    ((12 : ℂ) + (-12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 2 * p ^ 0 +
    ((0 : ℂ) + (8 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 3 +
    ((-12 : ℂ) + (12 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 1 * p ^ 1 +
    ((4 : ℂ) + (-4 : ℂ) * Complex.I * (Real.sqrt 3 : ℂ)) * t ^ 0 * p ^ 2


end Hadamard6
