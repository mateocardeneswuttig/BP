import Hadamard6.Basic
import Mathlib.Tactic

/-!
# Elementary nonvanishing certificates on the Karlsson chart

This file formalizes the analytic part of the fixed mixed/mixed-corner
certificate.  Seven of its eleven witness factors reduce to three determinant
factors and two repeated squares.  Their nonvanishing uses only the canonical
Karlsson parameter domain; no resultant or numerical computation enters.
-/

namespace Hadamard6

/-- The closed canonical parameter domain for the regular Karlsson chart. -/
structure CanonicalKarlssonParameters where
  u : ℝ
  v : ℝ
  p : ℂ
  circle : u ^ 2 + v ^ 2 = 1
  v_nonneg : 0 ≤ v
  p_unit : Complex.normSq p = 1
  p_im_nonneg : 0 ≤ p.im

namespace CanonicalKarlssonParameters

variable (q : CanonicalKarlssonParameters)

private theorem sqrt_three_pos : 0 < Real.sqrt 3 := Real.sqrt_pos.2 (by norm_num)

private theorem sqrt_three_sq : (Real.sqrt 3) ^ 2 = 3 :=
  Real.sq_sqrt (by norm_num)

theorem v_le_one : q.v ≤ 1 := by
  have hv_sq : q.v ^ 2 ≤ 1 := by
    nlinarith [q.circle, sq_nonneg q.u]
  nlinarith [q.v_nonneg]

theorem p_im_le_one : q.p.im ≤ 1 := by
  have hpcoords : q.p.re ^ 2 + q.p.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using q.p_unit
  have him_sq : q.p.im ^ 2 ≤ 1 := by
    nlinarith [hpcoords, sq_nonneg q.p.re]
  nlinarith [q.p_im_nonneg]

theorem v_mul_p_im_le_one : q.v * q.p.im ≤ 1 := by
  have hv := q.v_le_one
  have him := q.p_im_le_one
  calc
    q.v * q.p.im ≤ 1 * q.p.im :=
      mul_le_mul_of_nonneg_right hv q.p_im_nonneg
    _ ≤ 1 * 1 := mul_le_mul_of_nonneg_left him (by norm_num)
    _ = 1 := by ring

theorem v_mul_p_im_lt_sqrt_three : q.v * q.p.im < Real.sqrt 3 := by
  have hsqrt_sq := sqrt_three_sq
  have hsqrt_pos := sqrt_three_pos
  have hsqrt_gt_one : 1 < Real.sqrt 3 := by nlinarith
  exact lt_of_le_of_lt q.v_mul_p_im_le_one hsqrt_gt_one

/-- First determinant factor of the fixed mixed/mixed corner. -/
theorem determinantFactor₁_ne_zero :
    (3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
      ((q.u : ℂ) + q.p * (q.v : ℂ)) ≠ 0 := by
  intro hzero
  have hre := congrArg Complex.re hzero
  norm_num [Complex.mul_re] at hre
  have hsqrt_pos := sqrt_three_pos
  have hlt := q.v_mul_p_im_lt_sqrt_three
  nlinarith [q.circle, sqrt_three_sq]

/-- Second determinant factor of the fixed mixed/mixed corner. -/
theorem determinantFactor₂_ne_zero :
    (3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
      (q.p * (q.v : ℂ) - (q.u : ℂ)) ≠ 0 := by
  intro hzero
  have hre := congrArg Complex.re hzero
  norm_num [Complex.mul_re] at hre
  have hsqrt_pos := sqrt_three_pos
  have hlt := q.v_mul_p_im_lt_sqrt_three
  nlinarith [q.circle, sqrt_three_sq]

/-- Third determinant factor of the fixed mixed/mixed corner. -/
theorem determinantFactor₃_ne_zero :
    q.p + Complex.I / (Real.sqrt 3 : ℂ) *
      (q.p * (q.u : ℂ) - (q.v : ℂ)) ≠ 0 := by
  intro hzero
  have hsqrt_ne : (Real.sqrt 3 : ℂ) ≠ 0 := by
    exact_mod_cast ne_of_gt sqrt_three_pos
  have hscaled :
      q.p * ((Real.sqrt 3 : ℂ) + Complex.I * (q.u : ℂ)) =
        Complex.I * (q.v : ℂ) := by
    field_simp [hsqrt_ne] at hzero
    linear_combination hzero
  have hnorm := congrArg Complex.normSq hscaled
  rw [Complex.normSq_mul, q.p_unit] at hnorm
  norm_num [Complex.normSq_apply, Complex.mul_re, Complex.mul_im] at hnorm
  nlinarith [q.circle, sqrt_three_sq]

/-- The first repeated-square base cannot vanish on the canonical domain. -/
theorem squareBase₁_ne_zero :
    q.p * (q.v : ℂ) - (q.u : ℂ) +
      Complex.I / (Real.sqrt 3 : ℂ) ≠ 0 := by
  intro hzero
  have hsqrt_pos := sqrt_three_pos
  have hsqrt_ne : Real.sqrt 3 ≠ 0 := ne_of_gt hsqrt_pos
  have hsqrt_ne_complex : (Real.sqrt 3 : ℂ) ≠ 0 := by exact_mod_cast hsqrt_ne
  have hnormalized :
      (Real.sqrt 3 : ℂ) *
          (q.p * (q.v : ℂ) - (q.u : ℂ)) + Complex.I = 0 := by
    calc
      (Real.sqrt 3 : ℂ) *
          (q.p * (q.v : ℂ) - (q.u : ℂ)) + Complex.I =
          (Real.sqrt 3 : ℂ) *
            (q.p * (q.v : ℂ) - (q.u : ℂ) +
              Complex.I / (Real.sqrt 3 : ℂ)) := by
                field_simp [hsqrt_ne_complex]
      _ = 0 := by rw [hzero, mul_zero]
  have him := congrArg Complex.im hnormalized
  norm_num [Complex.mul_im] at him
  nlinarith [mul_nonneg q.v_nonneg q.p_im_nonneg]

/-- The second repeated-square base cannot vanish on the canonical domain. -/
theorem squareBase₂_ne_zero :
    q.p * (q.u : ℂ) - (q.v : ℂ) +
      Complex.I * q.p / (Real.sqrt 3 : ℂ) ≠ 0 := by
  intro hzero
  have hpstar : star q.p * q.p = 1 :=
    star_mul_self_of_normSq_one q.p_unit
  have hstar :
      star q.p *
        (q.p * (q.u : ℂ) - (q.v : ℂ) +
          Complex.I * q.p / (Real.sqrt 3 : ℂ)) = 0 := by
    rw [hzero, mul_zero]
  have hnormalized :
      (q.u : ℂ) - (q.v : ℂ) * star q.p +
        Complex.I / (Real.sqrt 3 : ℂ) = 0 := by
    calc
      (q.u : ℂ) - (q.v : ℂ) * star q.p +
          Complex.I / (Real.sqrt 3 : ℂ) =
          (star q.p * q.p) * (q.u : ℂ) -
            (q.v : ℂ) * star q.p +
            Complex.I * (star q.p * q.p) / (Real.sqrt 3 : ℂ) := by
              rw [hpstar]
              ring
      _ = star q.p *
          (q.p * (q.u : ℂ) - (q.v : ℂ) +
            Complex.I * q.p / (Real.sqrt 3 : ℂ)) := by ring
      _ = 0 := hstar
  have hsqrt_pos := sqrt_three_pos
  have hsqrt_ne : Real.sqrt 3 ≠ 0 := ne_of_gt hsqrt_pos
  have hsqrt_ne_complex : (Real.sqrt 3 : ℂ) ≠ 0 := by exact_mod_cast hsqrt_ne
  have hscaled :
      (Real.sqrt 3 : ℂ) *
          ((q.u : ℂ) - (q.v : ℂ) * star q.p) + Complex.I = 0 := by
    calc
      (Real.sqrt 3 : ℂ) *
          ((q.u : ℂ) - (q.v : ℂ) * star q.p) + Complex.I =
          (Real.sqrt 3 : ℂ) *
            ((q.u : ℂ) - (q.v : ℂ) * star q.p +
              Complex.I / (Real.sqrt 3 : ℂ)) := by
                field_simp [hsqrt_ne_complex]
      _ = 0 := by rw [hnormalized, mul_zero]
  have him := congrArg Complex.im hscaled
  norm_num [Complex.mul_im, Complex.star_def] at him
  nlinarith [mul_nonneg q.v_nonneg q.p_im_nonneg]

/-- A unit complex phase is nonzero. -/
theorem phase_ne_zero {z : ℂ} (hz : Complex.normSq z = 1) : z ≠ 0 := by
  intro hzero
  rw [hzero] at hz
  norm_num at hz

/-- The first determinant pullback, including its unit monomial, is nonzero. -/
theorem determinantPullback₁_ne_zero {z₁ z₃ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1) (hz₃ : Complex.normSq z₃ = 1) :
    -z₁ * z₃ *
      ((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
        ((q.u : ℂ) + q.p * (q.v : ℂ))) ≠ 0 :=
  mul_ne_zero (mul_ne_zero (neg_ne_zero.mpr (phase_ne_zero hz₁))
    (phase_ne_zero hz₃)) q.determinantFactor₁_ne_zero

/-- The second determinant pullback, including its unit monomial, is nonzero. -/
theorem determinantPullback₂_ne_zero {z₂ z₃ : ℂ}
    (hz₂ : Complex.normSq z₂ = 1) (hz₃ : Complex.normSq z₃ = 1) :
    -z₂ * z₃ *
      ((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
        (q.p * (q.v : ℂ) - (q.u : ℂ))) ≠ 0 :=
  mul_ne_zero (mul_ne_zero (neg_ne_zero.mpr (phase_ne_zero hz₂))
    (phase_ne_zero hz₃)) q.determinantFactor₂_ne_zero

/-- The third determinant pullback, including its scalar and unit monomial,
is nonzero. -/
theorem determinantPullback₃_ne_zero {z₁ z₄ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1) (hz₄ : Complex.normSq z₄ = 1) :
    (-6 : ℂ) * z₁ * z₄ *
      (q.p + Complex.I / (Real.sqrt 3 : ℂ) *
        (q.p * (q.u : ℂ) - (q.v : ℂ))) ≠ 0 :=
  mul_ne_zero
    (mul_ne_zero (mul_ne_zero (by norm_num) (phase_ne_zero hz₁))
      (phase_ne_zero hz₄))
    q.determinantFactor₃_ne_zero

/-- Either occurrence of the first repeated square is nonzero. -/
theorem squareFactor₁_ne_zero :
    (-3 : ℂ) *
      (q.p * (q.v : ℂ) - (q.u : ℂ) +
        Complex.I / (Real.sqrt 3 : ℂ)) ^ 2 ≠ 0 :=
  mul_ne_zero (by norm_num) (pow_ne_zero 2 q.squareBase₁_ne_zero)

/-- Either occurrence of the second repeated square is nonzero. -/
theorem squareFactor₂_ne_zero :
    (-3 : ℂ) *
      (q.p * (q.u : ℂ) - (q.v : ℂ) +
        Complex.I * q.p / (Real.sqrt 3 : ℂ)) ^ 2 ≠ 0 :=
  mul_ne_zero (by norm_num) (pow_ne_zero 2 q.squareBase₂_ne_zero)

end CanonicalKarlssonParameters

end Hadamard6
