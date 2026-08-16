import Hadamard6.FactorAllocation
import Hadamard6.QuotientAllocation
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-!
# From allocated quadratic factors to the two Möbius companions
-/

namespace Hadamard6

noncomputable def allocationPhase (s : ℝ) (δ q₂ : ℂ) (r : ℝ) : ℂ :=
  -(2 * (s : ℂ) * δ) / (q₂ * (r : ℂ))

noncomputable def mixedPhase (s : ℝ) (δ q₂ : ℂ) : ℂ :=
  -(2 * (s : ℂ) * δ) / q₂

theorem xQ_mixed_relation_gives_constant
    {s r : ℝ} {δ q₂ x y : ℂ}
    (hs : s ≠ 0) (hr : r ≠ 0) (hroot : realKappa s r = 0)
    (hq₂ : q₂ ≠ 0) (hx0 : x ≠ 0)
    (hxr : x - (r : ℂ) ≠ 0)
    (hxri : x - ((r⁻¹ : ℝ) : ℂ) ≠ 0)
    (hrel :
      δ * x * kappa (s : ℂ) x +
        x * (q₂ * (x - (r : ℂ)) *
          (x - ((r⁻¹ : ℝ) : ℂ))) * y = 0) :
    y = mixedPhase s δ q₂ := by
  rw [kappa_factor_at_real_root hs hr hroot] at hrel
  have hcancel : x * (x - (r : ℂ)) *
      (x - ((r⁻¹ : ℝ) : ℂ)) ≠ 0 :=
    mul_ne_zero (mul_ne_zero hx0 hxr) hxri
  have hcore : 2 * (s : ℂ) * δ + q₂ * y = 0 := by
    apply mul_left_cancel₀ hcancel
    linear_combination hrel
  rw [mixedPhase]
  field_simp [hq₂]
  linear_combination hcore

theorem Q_mixed_relation_gives_proportional
    {s r : ℝ} {δ q₂ x y : ℂ}
    (hs : s ≠ 0) (hr : r ≠ 0) (hroot : realKappa s r = 0)
    (hq₂ : q₂ ≠ 0)
    (hxr : x - (r : ℂ) ≠ 0)
    (hxri : x - ((r⁻¹ : ℝ) : ℂ) ≠ 0)
    (hrel :
      δ * x * kappa (s : ℂ) x +
        (q₂ * (x - (r : ℂ)) *
          (x - ((r⁻¹ : ℝ) : ℂ))) * y = 0) :
    y = mixedPhase s δ q₂ * x := by
  rw [kappa_factor_at_real_root hs hr hroot] at hrel
  have hcancel : (x - (r : ℂ)) *
      (x - ((r⁻¹ : ℝ) : ℂ)) ≠ 0 := mul_ne_zero hxr hxri
  have hcore : 2 * (s : ℂ) * δ * x + q₂ * y = 0 := by
    apply mul_left_cancel₀ hcancel
    linear_combination hrel
  rw [mixedPhase]
  field_simp [hq₂]
  linear_combination hcore

theorem xQ_double_root_relation_gives_mobius
    {s r : ℝ} {δ q₂ x y : ℂ}
    (hs : s ≠ 0) (hr : r ≠ 0) (hroot : realKappa s r = 0)
    (hq₂ : q₂ ≠ 0) (hx0 : x ≠ 0) (hxr : x - (r : ℂ) ≠ 0)
    (hrel :
      δ * x * kappa (s : ℂ) x +
        x * (q₂ * (x - (r : ℂ)) ^ 2) * y = 0) :
    y = allocationPhase s δ q₂ r * mobius (r : ℂ) x := by
  rw [kappa_factor_at_real_root hs hr hroot] at hrel
  have hrC : (r : ℂ) ≠ 0 := by exact_mod_cast hr
  have hcancel : x * (x - (r : ℂ)) ≠ 0 := mul_ne_zero hx0 hxr
  have hcore :
      2 * (s : ℂ) * δ * (x - ((r⁻¹ : ℝ) : ℂ)) +
        q₂ * (x - (r : ℂ)) * y = 0 := by
    apply (mul_left_cancel₀ hcancel)
    calc
      x * (x - (r : ℂ)) *
          (2 * (s : ℂ) * δ * (x - ((r⁻¹ : ℝ) : ℂ)) +
            q₂ * (x - (r : ℂ)) * y) = 0 := by
              linear_combination hrel
      _ = x * (x - (r : ℂ)) * 0 := by simp
  have hprod : (r : ℂ) * ((r⁻¹ : ℝ) : ℂ) = 1 := by
    exact_mod_cast (mul_inv_cancel₀ hr)
  rw [allocationPhase, mobius]
  field_simp [hq₂, hrC, hxr]
  linear_combination (r : ℂ) * hcore + (2 * (s : ℂ) * δ) * hprod

theorem Q_double_root_relation_gives_x_mobius
    {s r : ℝ} {δ q₂ x y : ℂ}
    (hs : s ≠ 0) (hr : r ≠ 0) (hroot : realKappa s r = 0)
    (hq₂ : q₂ ≠ 0) (hxr : x - (r : ℂ) ≠ 0)
    (hrel :
      δ * x * kappa (s : ℂ) x +
        (q₂ * (x - (r : ℂ)) ^ 2) * y = 0) :
    y = allocationPhase s δ q₂ r * x * mobius (r : ℂ) x := by
  rw [kappa_factor_at_real_root hs hr hroot] at hrel
  have hrC : (r : ℂ) ≠ 0 := by exact_mod_cast hr
  have hcore :
      2 * (s : ℂ) * δ * x * (x - ((r⁻¹ : ℝ) : ℂ)) +
        q₂ * (x - (r : ℂ)) * y = 0 := by
    apply (mul_left_cancel₀ hxr)
    calc
      (x - (r : ℂ)) *
          (2 * (s : ℂ) * δ * x * (x - ((r⁻¹ : ℝ) : ℂ)) +
            q₂ * (x - (r : ℂ)) * y) = 0 := by
              linear_combination hrel
      _ = (x - (r : ℂ)) * 0 := by simp
  have hprod : (r : ℂ) * ((r⁻¹ : ℝ) : ℂ) = 1 := by
    exact_mod_cast (mul_inv_cancel₀ hr)
  rw [allocationPhase, mobius]
  field_simp [hq₂, hrC, hxr]
  linear_combination (r : ℂ) * hcore +
    (2 * x * (s : ℂ) * δ) * hprod

theorem allocationPhase_normSq_one_of_first
    {s r : ℝ} {δ q₂ x y : ℂ}
    (hy : Complex.normSq y = 1)
    (hx : Complex.normSq x = 1)
    (hxr : x - (r : ℂ) ≠ 0)
    (heq : y = allocationPhase s δ q₂ r * mobius (r : ℂ) x) :
    Complex.normSq (allocationPhase s δ q₂ r) = 1 := by
  have hm := normSq_mobius_of_real hx hxr
  rw [heq, Complex.normSq_mul, hm, mul_one] at hy
  exact hy

theorem allocationPhase_normSq_one_of_second
    {s r : ℝ} {δ q₂ x y : ℂ}
    (hy : Complex.normSq y = 1)
    (hx : Complex.normSq x = 1)
    (hxr : x - (r : ℂ) ≠ 0)
    (heq : y = allocationPhase s δ q₂ r * x * mobius (r : ℂ) x) :
    Complex.normSq (allocationPhase s δ q₂ r) = 1 := by
  have hm := normSq_mobius_of_real hx hxr
  rw [heq, Complex.normSq_mul, Complex.normSq_mul, hx, hm] at hy
  simpa using hy

theorem normalizedRows_constant_third_det_zero
    (x₁ x₂ x₃ ell : ℂ) :
    Matrix.det (normalizedRows x₁ x₂ x₃ ell ell ell) = 0 := by
  rw [Matrix.det_fin_three]
  simp [normalizedRows]
  ring

theorem normalizedRows_proportional_third_det_zero
    (x₁ x₂ x₃ ell : ℂ) :
    Matrix.det (normalizedRows x₁ x₂ x₃
      (ell * x₁) (ell * x₂) (ell * x₃)) = 0 := by
  rw [Matrix.det_fin_three]
  simp [normalizedRows]
  ring

end Hadamard6
