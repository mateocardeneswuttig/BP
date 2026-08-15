import Hadamard6.AllocationToMobius
import Hadamard6.ModulusIdentity

/-!
# The nonsingular quotient conclusion for one good normalized row
-/

namespace Hadamard6

open Polynomial

theorem quotient_good_row_negative
    {s : ℝ} {δ b₀ b₁ b₂ b₃ x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hs0 : 0 < s) (hs1 : s < 1) (hδ : δ ≠ 0)
    (ht : (x₁, x₂, x₃) ∈ phaseTriplesAtSum (s : ℂ))
    (hy₁ : Complex.normSq y₁ = 1)
    (_hy₂ : Complex.normSq y₂ = 1)
    (_hy₃ : Complex.normSq y₃ = 1)
    (hdet : Matrix.det (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) ≠ 0)
    (hrel₁ : δ * x₁ * kappa (s : ℂ) x₁ +
      cubicEval b₀ b₁ b₂ b₃ x₁ * y₁ = 0)
    (hrel₂ : δ * x₂ * kappa (s : ℂ) x₂ +
      cubicEval b₀ b₁ b₂ b₃ x₂ * y₂ = 0)
    (hrel₃ : δ * x₃ * kappa (s : ℂ) x₃ +
      cubicEval b₀ b₁ b₂ b₃ x₃ * y₃ = 0)
    (hnorm : ClearedNormIdentity (s : ℂ) δ b₀ b₁ b₂ b₃)
    (havoid : ∀ q : ℝ, 0 < q → realKappa s q = 0 →
      x₁ - (q : ℂ) ≠ 0 ∧ x₂ - (q : ℂ) ≠ 0 ∧ x₃ - (q : ℂ) ≠ 0) :
    (rowTau (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃)).re < 0 := by
  obtain ⟨r, hr0, hrs, hroot⟩ := exists_positive_realKappa_root hs0 hs1
  have hs : s ≠ 0 := ne_of_gt hs0
  have hr : r ≠ 0 := ne_of_gt hr0
  have hrinv0 : 0 < r⁻¹ := inv_pos.mpr hr0
  have hrootinv := realKappa_reciprocal hr hroot
  rcases havoid r hr0 hroot with ⟨hxr₁, hxr₂, hxr₃⟩
  rcases havoid r⁻¹ hrinv0 hrootinv with ⟨hxri₁, hxri₂, hxri₃⟩
  have hx₁0 := ne_zero_of_normSq_eq_one ht.1
  have hx₂0 := ne_zero_of_normSq_eq_one ht.2.1
  have hx₃0 := ne_zero_of_normSq_eq_one ht.2.2.1
  rcases quotient_factor_allocation hs0 hs1 hr0 hroot hnorm with
    ⟨hb₀, halloc⟩ | ⟨hb₃, halloc⟩
  · have hpoly := quadratic_polynomial_identity_of_constant_zero hnorm hb₀
    have hq₂ : b₃ ≠ 0 := quadratic_leading_ne_zero_of_identity hs hδ hpoly
    rcases halloc with hdouble | hmixed | hdoubleInv
    · have hQ (x : ℂ) : quadraticEval b₁ b₂ b₃ x =
          b₃ * (x - (r : ℂ)) ^ 2 := by
        have he := congrArg (fun P : ℂ[X] ↦ P.eval x) hdouble
        simpa using he
      have hB (x : ℂ) : cubicEval b₀ b₁ b₂ b₃ x =
          x * (b₃ * (x - (r : ℂ)) ^ 2) := by
        rw [hb₀]
        simp only [cubicEval, quadraticEval] at hQ ⊢
        rw [← hQ]
        ring
      rw [hB x₁] at hrel₁
      rw [hB x₂] at hrel₂
      rw [hB x₃] at hrel₃
      have he₁ := xQ_double_root_relation_gives_mobius hs hr hroot hq₂
        hx₁0 hxr₁ hrel₁
      have he₂ := xQ_double_root_relation_gives_mobius hs hr hroot hq₂
        hx₂0 hxr₂ hrel₂
      have he₃ := xQ_double_root_relation_gives_mobius hs hr hroot hq₂
        hx₃0 hxr₃ hrel₃
      have hell := allocationPhase_normSq_one_of_first hy₁ ht.1 hxr₁ he₁
      apply nonsingular_critical_allocation_rowTau_negative hs0 hs1 hr0 ht
        hroot hxr₁ hxr₂ hxr₃
      exact ⟨allocationPhase s δ b₃ r, hell,
        Or.inl ⟨he₁, he₂, he₃⟩⟩
    · have hQ (x : ℂ) : quadraticEval b₁ b₂ b₃ x =
          b₃ * (x - (r : ℂ)) * (x - ((r⁻¹ : ℝ) : ℂ)) := by
        have he := congrArg (fun P : ℂ[X] ↦ P.eval x) hmixed
        simpa using he
      have hB (x : ℂ) : cubicEval b₀ b₁ b₂ b₃ x =
          x * (b₃ * (x - (r : ℂ)) * (x - ((r⁻¹ : ℝ) : ℂ))) := by
        rw [hb₀]
        simp only [cubicEval, quadraticEval] at hQ ⊢
        rw [← hQ]
        ring
      rw [hB x₁] at hrel₁
      rw [hB x₂] at hrel₂
      rw [hB x₃] at hrel₃
      have he₁ := xQ_mixed_relation_gives_constant hs hr hroot hq₂ hx₁0
        hxr₁ hxri₁ hrel₁
      have he₂ := xQ_mixed_relation_gives_constant hs hr hroot hq₂ hx₂0
        hxr₂ hxri₂ hrel₂
      have he₃ := xQ_mixed_relation_gives_constant hs hr hroot hq₂ hx₃0
        hxr₃ hxri₃ hrel₃
      exfalso
      apply hdet
      rw [he₁, he₂, he₃]
      exact normalizedRows_constant_third_det_zero x₁ x₂ x₃
        (mixedPhase s δ b₃)
    · have hQ (x : ℂ) : quadraticEval b₁ b₂ b₃ x =
          b₃ * (x - ((r⁻¹ : ℝ) : ℂ)) ^ 2 := by
        have he := congrArg (fun P : ℂ[X] ↦ P.eval x) hdoubleInv
        simpa using he
      have hB (x : ℂ) : cubicEval b₀ b₁ b₂ b₃ x =
          x * (b₃ * (x - ((r⁻¹ : ℝ) : ℂ)) ^ 2) := by
        rw [hb₀]
        simp only [cubicEval, quadraticEval] at hQ ⊢
        rw [← hQ]
        ring
      rw [hB x₁] at hrel₁
      rw [hB x₂] at hrel₂
      rw [hB x₃] at hrel₃
      have he₁ := xQ_double_root_relation_gives_mobius hs (inv_ne_zero hr)
        hrootinv hq₂ hx₁0 hxri₁ hrel₁
      have he₂ := xQ_double_root_relation_gives_mobius hs (inv_ne_zero hr)
        hrootinv hq₂ hx₂0 hxri₂ hrel₂
      have he₃ := xQ_double_root_relation_gives_mobius hs (inv_ne_zero hr)
        hrootinv hq₂ hx₃0 hxri₃ hrel₃
      have hell := allocationPhase_normSq_one_of_first hy₁ ht.1 hxri₁ he₁
      apply nonsingular_critical_allocation_rowTau_negative hs0 hs1 hrinv0 ht
        hrootinv hxri₁ hxri₂ hxri₃
      exact ⟨allocationPhase s δ b₃ r⁻¹, hell,
        Or.inl ⟨he₁, he₂, he₃⟩⟩
  · have hpoly := quadratic_polynomial_identity_of_cubic_zero hnorm hb₃
    have hq₂ : b₂ ≠ 0 := quadratic_leading_ne_zero_of_identity hs hδ hpoly
    rcases halloc with hdouble | hmixed | hdoubleInv
    · have hB (x : ℂ) : cubicEval b₀ b₁ b₂ b₃ x =
          b₂ * (x - (r : ℂ)) ^ 2 := by
        have he := congrArg (fun P : ℂ[X] ↦ P.eval x) hdouble
        rw [hb₃]
        simpa [cubicEval, quadraticEval] using he
      rw [hB x₁] at hrel₁
      rw [hB x₂] at hrel₂
      rw [hB x₃] at hrel₃
      have he₁ := Q_double_root_relation_gives_x_mobius hs hr hroot hq₂
        hxr₁ hrel₁
      have he₂ := Q_double_root_relation_gives_x_mobius hs hr hroot hq₂
        hxr₂ hrel₂
      have he₃ := Q_double_root_relation_gives_x_mobius hs hr hroot hq₂
        hxr₃ hrel₃
      have hell := allocationPhase_normSq_one_of_second hy₁ ht.1 hxr₁ he₁
      apply nonsingular_critical_allocation_rowTau_negative hs0 hs1 hr0 ht
        hroot hxr₁ hxr₂ hxr₃
      exact ⟨allocationPhase s δ b₂ r, hell,
        Or.inr ⟨he₁, he₂, he₃⟩⟩
    · have hB (x : ℂ) : cubicEval b₀ b₁ b₂ b₃ x =
          b₂ * (x - (r : ℂ)) * (x - ((r⁻¹ : ℝ) : ℂ)) := by
        have he := congrArg (fun P : ℂ[X] ↦ P.eval x) hmixed
        rw [hb₃]
        simpa [cubicEval, quadraticEval] using he
      rw [hB x₁] at hrel₁
      rw [hB x₂] at hrel₂
      rw [hB x₃] at hrel₃
      have he₁ := Q_mixed_relation_gives_proportional hs hr hroot hq₂
        hxr₁ hxri₁ hrel₁
      have he₂ := Q_mixed_relation_gives_proportional hs hr hroot hq₂
        hxr₂ hxri₂ hrel₂
      have he₃ := Q_mixed_relation_gives_proportional hs hr hroot hq₂
        hxr₃ hxri₃ hrel₃
      exfalso
      apply hdet
      rw [he₁, he₂, he₃]
      exact normalizedRows_proportional_third_det_zero x₁ x₂ x₃
        (mixedPhase s δ b₂)
    · have hB (x : ℂ) : cubicEval b₀ b₁ b₂ b₃ x =
          b₂ * (x - ((r⁻¹ : ℝ) : ℂ)) ^ 2 := by
        have he := congrArg (fun P : ℂ[X] ↦ P.eval x) hdoubleInv
        rw [hb₃]
        simpa [cubicEval, quadraticEval] using he
      rw [hB x₁] at hrel₁
      rw [hB x₂] at hrel₂
      rw [hB x₃] at hrel₃
      have he₁ := Q_double_root_relation_gives_x_mobius hs (inv_ne_zero hr)
        hrootinv hq₂ hxri₁ hrel₁
      have he₂ := Q_double_root_relation_gives_x_mobius hs (inv_ne_zero hr)
        hrootinv hq₂ hxri₂ hrel₂
      have he₃ := Q_double_root_relation_gives_x_mobius hs (inv_ne_zero hr)
        hrootinv hq₂ hxri₃ hrel₃
      have hell := allocationPhase_normSq_one_of_second hy₁ ht.1 hxri₁ he₁
      apply nonsingular_critical_allocation_rowTau_negative hs0 hs1 hrinv0 ht
        hrootinv hxri₁ hxri₂ hxri₃
      exact ⟨allocationPhase s δ b₂ r⁻¹, hell,
        Or.inr ⟨he₁, he₂, he₃⟩⟩

end Hadamard6
