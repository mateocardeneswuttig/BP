import Hadamard6.QuotientAlgebra
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Real inequalities in the nonsingular quotient allocations
-/

namespace Hadamard6

def realKappa (s r : ℝ) : ℝ :=
  2 * s * r ^ 2 - (s ^ 2 + 3) * r + 2 * s

theorem kappa_ofReal (s r : ℝ) :
    kappa (s : ℂ) (r : ℂ) = (realKappa s r : ℂ) := by
  have hn : Complex.normSq (s : ℂ) = s ^ 2 := by
    simp [Complex.normSq_apply]
    ring
  rw [kappa, hn]
  norm_num [Complex.star_def, realKappa]

theorem realKappa_discriminant_identity (s : ℝ) :
    (s ^ 2 + 3) ^ 2 - 16 * s ^ 2 =
      (s ^ 2 - 1) * (s ^ 2 - 9) := by
  ring

theorem realKappa_at_zero (s : ℝ) : realKappa s 0 = 2 * s := by
  simp [realKappa]

theorem realKappa_at_s (s : ℝ) :
    realKappa s s = s * (s ^ 2 - 1) := by
  simp [realKappa]
  ring

theorem exists_positive_realKappa_root {s : ℝ}
    (hs0 : 0 < s) (hs1 : s < 1) :
    ∃ r, 0 < r ∧ r < s ∧ realKappa s r = 0 := by
  let f : ℝ → ℝ := fun r ↦ realKappa s r
  have hf0 : 0 < f 0 := by simp [f, realKappa]; linarith
  have hfs : f s < 0 := by
    rw [show f s = s * (s ^ 2 - 1) by simp [f, realKappa]; ring]
    have : s ^ 2 < 1 := by nlinarith
    exact mul_neg_of_pos_of_neg hs0 (sub_neg.mpr this)
  have hcont : Continuous f := by
    unfold f realKappa
    fun_prop
  have hzeroMem : (0 : ℝ) ∈ Set.Icc (f s) (f 0) := ⟨hfs.le, hf0.le⟩
  rcases (intermediate_value_Icc' hs0.le hcont.continuousOn hzeroMem) with
    ⟨r, hrange, hroot⟩
  have hr0 : 0 < r := by
    rcases hrange with ⟨hr0, hrs⟩
    refine lt_of_le_of_ne hr0 ?_
    intro hre
    subst r
    linarith
  have hrs : r < s := by
    rcases hrange with ⟨_, hrs⟩
    refine lt_of_le_of_ne hrs ?_
    intro hre
    subst r
    linarith
  exact ⟨r, hr0, hrs, hroot⟩

theorem realKappa_reciprocal {s r : ℝ} (hr : r ≠ 0)
    (hroot : realKappa s r = 0) : realKappa s r⁻¹ = 0 := by
  have hid : realKappa s r⁻¹ = (r⁻¹) ^ 2 * realKappa s r := by
    unfold realKappa
    field_simp [hr]
    all_goals ring
  rw [hid, hroot, mul_zero]

theorem realKappa_root_sum_reciprocal {s r : ℝ}
    (hs : s ≠ 0) (hr : r ≠ 0) (hroot : realKappa s r = 0) :
    r + r⁻¹ = (s ^ 2 + 3) / (2 * s) := by
  unfold realKappa at hroot
  field_simp [hs, hr]
  nlinarith

/-- A positive real root and its reciprocal give the explicit factorization
of the critical quadratic. -/
theorem kappa_factor_at_real_root {s r : ℝ}
    (hs : s ≠ 0) (hr : r ≠ 0) (hroot : realKappa s r = 0)
    (x : ℂ) :
    kappa (s : ℂ) x =
      (2 * (s : ℂ)) * (x - (r : ℂ)) * (x - (r⁻¹ : ℝ)) := by
  have hsum := realKappa_root_sum_reciprocal hs hr hroot
  have hcoefR : 2 * s * (r + r⁻¹) = s ^ 2 + 3 := by
    rw [hsum]
    field_simp [hs]
  have hprodR : r * r⁻¹ = 1 := by field_simp [hr]
  have hcoefC :
      (2 * (s : ℂ)) * ((r : ℂ) + (r⁻¹ : ℝ)) =
        (s : ℂ) ^ 2 + 3 := by exact_mod_cast hcoefR
  have hprodC : (r : ℂ) * (r⁻¹ : ℝ) = 1 := by exact_mod_cast hprodR
  have hstarS : star (s : ℂ) = (s : ℂ) := by
    simp [Complex.star_def]
  have hnormS : Complex.normSq (s : ℂ) = s ^ 2 := by
    simp only [Complex.normSq_apply, Complex.ofReal_re,
      Complex.ofReal_im]
    ring
  calc
    kappa (s : ℂ) x =
        2 * (s : ℂ) * x ^ 2 - ((s : ℂ) ^ 2 + 3) * x +
          2 * (s : ℂ) := by
            simp only [kappa, hstarS, hnormS]
            push_cast
            ring
    _ = (2 * (s : ℂ)) * (x - (r : ℂ)) *
          (x - (r⁻¹ : ℝ)) := by
            rw [← hcoefC]
            calc
              _ = (2 * (s : ℂ)) *
                  (x ^ 2 - ((r : ℂ) + (r⁻¹ : ℝ)) * x + 1) := by ring
              _ = (2 * (s : ℂ)) *
                  (x ^ 2 - ((r : ℂ) + (r⁻¹ : ℝ)) * x +
                    (r : ℂ) * (r⁻¹ : ℝ)) := by rw [hprodC]
              _ = _ := by ring

/-- For `0<s<1`, every positive root is either below `s` or above `1/s`.
This is the root-location statement actually needed for the sign argument. -/
theorem realKappa_root_outside {s r : ℝ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (hroot : realKappa s r = 0) :
    r < s ∨ 1 < s * r := by
  by_contra h
  push Not at h
  rcases h with ⟨hsr, hsr1⟩
  have hss : 0 < 1 - s ^ 2 := by nlinarith
  have hleft : 0 ≤ r - s := sub_nonneg.mpr hsr
  have hright : 0 ≤ 1 - s * r := sub_nonneg.mpr hsr1
  have hprod : 0 ≤ 2 * (r - s) * (1 - s * r) := by positivity
  have hstrict : 0 < (1 - s ^ 2) * r := mul_pos hss hr0
  have hid :
      (s ^ 2 + 3) * r - 2 * s * (r ^ 2 + 1) =
        2 * (r - s) * (1 - s * r) + (1 - s ^ 2) * r := by
    ring
  have hzero :
      (s ^ 2 + 3) * r - 2 * s * (r ^ 2 + 1) = 0 := by
    unfold realKappa at hroot
    nlinarith
  nlinarith

theorem realKappa_root_ne_reciprocal {s r : ℝ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (hroot : realKappa s r = 0) : r ≠ r⁻¹ := by
  intro heq
  have hr : r ≠ 0 := ne_of_gt hr0
  have hsq : r ^ 2 = 1 := by
    have hm := congrArg (fun x : ℝ ↦ r * x) heq
    field_simp [hr] at hm
    nlinarith
  have hrone : r = 1 := by nlinarith
  unfold realKappa at hroot
  rw [hrone] at hroot
  nlinarith [mul_pos hs0 (sub_pos.mpr hs1)]

theorem first_mobius_ratio_negative {s r : ℝ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (hroot : realKappa s r = 0) :
    s * (r - s) / (1 - s * r) < 0 := by
  rcases realKappa_root_outside hs0 hs1 hr0 hroot with hrs | hrs
  · apply div_neg_of_neg_of_pos
    · exact mul_neg_of_pos_of_neg hs0 (sub_neg.mpr hrs)
    · have : s * r < 1 := by nlinarith [mul_pos hs0 hr0]
      exact sub_pos.mpr this
  · apply div_neg_of_pos_of_neg
    · exact mul_pos hs0 (sub_pos.mpr (lt_trans hs1 (by
          nlinarith [mul_pos hs0 hr0])))
    · exact sub_neg.mpr hrs

theorem second_mobius_ratio_negative {s r : ℝ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (hroot : realKappa s r = 0) :
    s * (r⁻¹ - s) / (1 - s / r) < 0 := by
  rcases realKappa_root_outside hs0 hs1 hr0 hroot with hrs | hrs
  · apply div_neg_of_pos_of_neg
    · apply mul_pos hs0
      have : s * r < 1 := by nlinarith [mul_pos hs0 hr0]
      have hinv : s < 1 / r := (lt_div_iff₀ hr0).2 this
      exact sub_pos.mpr (by simpa [one_div] using hinv)
    · exact sub_neg.mpr ((one_lt_div hr0).2 hrs)
  · apply div_neg_of_neg_of_pos
    · apply mul_neg_of_pos_of_neg hs0
      have hinv : 1 / r < s := (div_lt_iff₀ hr0).2 (by nlinarith)
      exact sub_neg.mpr (by simpa [one_div] using hinv)
    · exact sub_pos.mpr ((div_lt_one hr0).2 (by
          have : 1 < r := by nlinarith [mul_pos hs0 hr0]
          exact lt_trans hs1 this))

end Hadamard6
