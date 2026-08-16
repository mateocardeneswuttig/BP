import Hadamard6.KarlssonWitnessPolynomials

/-! Generated exact resultant identity for the Karlsson witness quadratic 6.

Isolated in its own module: this single `ring` identity peaks near 5 GiB of
elaboration memory. -/

namespace Hadamard6

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

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
  simp [hstar]
  field_simp [hp0]
  ring_nf
  simp [Complex.I_pow_eq_pow_mod, hsqrt, hsqrt3, hsqrt4]
  ring_nf
  norm_num [Complex.I_sq, Complex.I_pow_three, Complex.I_pow_four,
    hsqrt, hsqrt3, hsqrt4]
  ring


end Hadamard6
