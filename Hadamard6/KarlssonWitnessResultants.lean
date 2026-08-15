import Hadamard6.KarlssonResultantNonvanishing

/-! Generated exact identities for the four Karlsson witness quadratics. -/

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

theorem karlssonWitness4_resultant_identity
    (t : ℝ) (p : ℂ) (hpUnit : Complex.normSq p = 1) :
    p ^ 6 * quadraticResultant
      (karlssonWitness4A (t : ℂ) p) (karlssonWitness4B (t : ℂ) p) (karlssonWitness4C (t : ℂ) p)
      (star (karlssonWitness4C (t : ℂ) p))
      (star (karlssonWitness4B (t : ℂ) p))
      (star (karlssonWitness4A (t : ℂ) p)) =
        karlssonHorizontalUnitResultant t p := by
  have hp0 : p ≠ 0 := unitPhase_ne_zero hpUnit
  have hstar : star p = p⁻¹ := by
    apply mul_right_cancel₀ hp0
    rw [star_mul_self_of_normSq_one hpUnit, inv_mul_cancel₀ hp0]
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) = 3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  unfold quadraticResultant karlssonWitness4A karlssonWitness4B karlssonWitness4C
  unfold karlssonHorizontalUnitResultant karlssonMPlus karlssonSharedResidual
  unfold karlssonSharedResidualRow0 karlssonSharedResidualRow1 karlssonSharedResidualRow2 karlssonSharedResidualRow3 karlssonSharedResidualRow4 karlssonSharedResidualRow5 karlssonSharedResidualRow6 karlssonSharedResidualRow7 karlssonSharedResidualRow8 karlssonSharedResidualRow9 karlssonSharedResidualRow10 karlssonSharedResidualRow11 karlssonSharedResidualRow12 karlssonSharedResidualRow13 karlssonSharedResidualRow14 karlssonSharedResidualRow15 karlssonSharedResidualRow16
  simp [Complex.star_def, hstar]
  field_simp [hp0]
  ring_nf
  simp [Complex.I_pow_eq_pow_mod, Complex.I_sq, Complex.I_pow_three,
    Complex.I_pow_four, hsqrt, hsqrt3, hsqrt4]
  ring_nf
  norm_num [Complex.I_sq, Complex.I_pow_three, Complex.I_pow_four,
    hsqrt, hsqrt3, hsqrt4]
  ring

theorem karlssonWitness6_resultant_identity
    (t : ℝ) (p : ℂ) (hpUnit : Complex.normSq p = 1) :
    p ^ 6 * quadraticResultant
      (karlssonWitness6A (t : ℂ) p) (karlssonWitness6B (t : ℂ) p) (karlssonWitness6C (t : ℂ) p)
      (star (karlssonWitness6C (t : ℂ) p))
      (star (karlssonWitness6B (t : ℂ) p))
      (star (karlssonWitness6A (t : ℂ) p)) =
        karlssonHorizontalUnitResultant t p := by
  have hp0 : p ≠ 0 := unitPhase_ne_zero hpUnit
  have hstar : star p = p⁻¹ := by
    apply mul_right_cancel₀ hp0
    rw [star_mul_self_of_normSq_one hpUnit, inv_mul_cancel₀ hp0]
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) = 3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  unfold quadraticResultant karlssonWitness6A karlssonWitness6B karlssonWitness6C
  unfold karlssonHorizontalUnitResultant karlssonMPlus karlssonSharedResidual
  unfold karlssonSharedResidualRow0 karlssonSharedResidualRow1 karlssonSharedResidualRow2 karlssonSharedResidualRow3 karlssonSharedResidualRow4 karlssonSharedResidualRow5 karlssonSharedResidualRow6 karlssonSharedResidualRow7 karlssonSharedResidualRow8 karlssonSharedResidualRow9 karlssonSharedResidualRow10 karlssonSharedResidualRow11 karlssonSharedResidualRow12 karlssonSharedResidualRow13 karlssonSharedResidualRow14 karlssonSharedResidualRow15 karlssonSharedResidualRow16
  simp [Complex.star_def, hstar]
  field_simp [hp0]
  ring_nf
  simp [Complex.I_pow_eq_pow_mod, Complex.I_sq, Complex.I_pow_three,
    Complex.I_pow_four, hsqrt, hsqrt3, hsqrt4]
  ring_nf
  norm_num [Complex.I_sq, Complex.I_pow_three, Complex.I_pow_four,
    hsqrt, hsqrt3, hsqrt4]
  ring

theorem karlssonWitness8_resultant_identity
    (t : ℝ) (p : ℂ) (hpUnit : Complex.normSq p = 1) :
    p ^ 10 * quadraticResultant
      (karlssonWitness8A (t : ℂ) p) (karlssonWitness8B (t : ℂ) p) (karlssonWitness8C (t : ℂ) p)
      (star (karlssonWitness8C (t : ℂ) p))
      (star (karlssonWitness8B (t : ℂ) p))
      (star (karlssonWitness8A (t : ℂ) p)) =
        karlssonVerticalUnitResultant t p := by
  have hp0 : p ≠ 0 := unitPhase_ne_zero hpUnit
  have hstar : star p = p⁻¹ := by
    apply mul_right_cancel₀ hp0
    rw [star_mul_self_of_normSq_one hpUnit, inv_mul_cancel₀ hp0]
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) = 3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  unfold quadraticResultant karlssonWitness8A karlssonWitness8B karlssonWitness8C
  unfold karlssonVerticalUnitResultant karlssonMPlus karlssonSharedResidual
  unfold karlssonSharedResidualRow0 karlssonSharedResidualRow1 karlssonSharedResidualRow2 karlssonSharedResidualRow3 karlssonSharedResidualRow4 karlssonSharedResidualRow5 karlssonSharedResidualRow6 karlssonSharedResidualRow7 karlssonSharedResidualRow8 karlssonSharedResidualRow9 karlssonSharedResidualRow10 karlssonSharedResidualRow11 karlssonSharedResidualRow12 karlssonSharedResidualRow13 karlssonSharedResidualRow14 karlssonSharedResidualRow15 karlssonSharedResidualRow16
  simp [Complex.star_def, hstar]
  field_simp [hp0]
  ring_nf
  simp [Complex.I_pow_eq_pow_mod, Complex.I_sq, Complex.I_pow_three,
    Complex.I_pow_four, hsqrt, hsqrt3, hsqrt4]
  ring_nf
  norm_num [Complex.I_sq, Complex.I_pow_three, Complex.I_pow_four,
    hsqrt, hsqrt3, hsqrt4]
  ring

theorem karlssonWitness10_resultant_identity
    (t : ℝ) (p : ℂ) (hpUnit : Complex.normSq p = 1) :
    p ^ 10 * quadraticResultant
      (karlssonWitness10A (t : ℂ) p) (karlssonWitness10B (t : ℂ) p) (karlssonWitness10C (t : ℂ) p)
      (star (karlssonWitness10C (t : ℂ) p))
      (star (karlssonWitness10B (t : ℂ) p))
      (star (karlssonWitness10A (t : ℂ) p)) =
        karlssonVerticalUnitResultant t p := by
  have hp0 : p ≠ 0 := unitPhase_ne_zero hpUnit
  have hstar : star p = p⁻¹ := by
    apply mul_right_cancel₀ hp0
    rw [star_mul_self_of_normSq_one hpUnit, inv_mul_cancel₀ hp0]
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) = 3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 = (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  unfold quadraticResultant karlssonWitness10A karlssonWitness10B karlssonWitness10C
  unfold karlssonVerticalUnitResultant karlssonMPlus karlssonSharedResidual
  unfold karlssonSharedResidualRow0 karlssonSharedResidualRow1 karlssonSharedResidualRow2 karlssonSharedResidualRow3 karlssonSharedResidualRow4 karlssonSharedResidualRow5 karlssonSharedResidualRow6 karlssonSharedResidualRow7 karlssonSharedResidualRow8 karlssonSharedResidualRow9 karlssonSharedResidualRow10 karlssonSharedResidualRow11 karlssonSharedResidualRow12 karlssonSharedResidualRow13 karlssonSharedResidualRow14 karlssonSharedResidualRow15 karlssonSharedResidualRow16
  simp [Complex.star_def, hstar]
  field_simp [hp0]
  ring_nf
  simp [Complex.I_pow_eq_pow_mod, Complex.I_sq, Complex.I_pow_three,
    Complex.I_pow_four, hsqrt, hsqrt3, hsqrt4]
  ring_nf
  norm_num [Complex.I_sq, Complex.I_pow_three, Complex.I_pow_four,
    hsqrt, hsqrt3, hsqrt4]
  ring


theorem karlssonWitness4_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness4A (t : ℂ) p) (karlssonWitness4B (t : ℂ) p) (karlssonWitness4C (t : ℂ) p)
      (star (karlssonWitness4C (t : ℂ) p))
      (star (karlssonWitness4B (t : ℂ) p))
      (star (karlssonWitness4A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 6 * z) hzero
  rw [karlssonWitness4_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonHorizontalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness4_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness4A (t : ℂ) p * z ^ 2 +
        karlssonWitness4B (t : ℂ) p * z + karlssonWitness4C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness4_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)

theorem karlssonWitness6_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness6A (t : ℂ) p) (karlssonWitness6B (t : ℂ) p) (karlssonWitness6C (t : ℂ) p)
      (star (karlssonWitness6C (t : ℂ) p))
      (star (karlssonWitness6B (t : ℂ) p))
      (star (karlssonWitness6A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 6 * z) hzero
  rw [karlssonWitness6_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonHorizontalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness6_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness6A (t : ℂ) p * z ^ 2 +
        karlssonWitness6B (t : ℂ) p * z + karlssonWitness6C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness6_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)

theorem karlssonWitness8_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness8A (t : ℂ) p) (karlssonWitness8B (t : ℂ) p) (karlssonWitness8C (t : ℂ) p)
      (star (karlssonWitness8C (t : ℂ) p))
      (star (karlssonWitness8B (t : ℂ) p))
      (star (karlssonWitness8A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 10 * z) hzero
  rw [karlssonWitness8_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonVerticalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness8_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness8A (t : ℂ) p * z ^ 2 +
        karlssonWitness8B (t : ℂ) p * z + karlssonWitness8C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness8_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)

theorem karlssonWitness10_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness10A (t : ℂ) p) (karlssonWitness10B (t : ℂ) p) (karlssonWitness10C (t : ℂ) p)
      (star (karlssonWitness10C (t : ℂ) p))
      (star (karlssonWitness10B (t : ℂ) p))
      (star (karlssonWitness10A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 10 * z) hzero
  rw [karlssonWitness10_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonVerticalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness10_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness10A (t : ℂ) p * z ^ 2 +
        karlssonWitness10B (t : ℂ) p * z + karlssonWitness10C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness10_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)


#print axioms karlssonWitness4_has_no_unit_root
#print axioms karlssonWitness6_has_no_unit_root
#print axioms karlssonWitness8_has_no_unit_root
#print axioms karlssonWitness10_has_no_unit_root

end Hadamard6
