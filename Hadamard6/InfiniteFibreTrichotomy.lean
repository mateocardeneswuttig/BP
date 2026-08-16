import Hadamard6.InfiniteFibreRegular
import Hadamard6.DependentBranch
import Hadamard6.DependentFourier
import Hadamard6.QuotientEndpoints

/-!
# Canonical infinite-fibre trichotomy

This file combines every range of the quotient calculation and the dependent
branch after the two noninitial row sums have been phased to nonnegative real
numbers.
-/

namespace Hadamard6

def HasOppositePairSecondRow (X : Mat3) : Prop :=
  (∃ z, Complex.normSq z = 1 ∧ rowTriple X 1 = (1, z, -z)) ∨
  (∃ z, Complex.normSq z = 1 ∧ rowTriple X 1 = (z, 1, -z)) ∨
  (∃ z, Complex.normSq z = 1 ∧ rowTriple X 1 = (z, -z, 1))

theorem canonical_infinite_fibre_trichotomy
    {G : Mat3} {s t : ℝ}
    (hs0 : 0 ≤ s) (hs3 : s ≤ 3)
    (ht0 : 0 ≤ t) (ht3 : t ≤ 3)
    (hS : G 1 0 = (s : ℂ))
    (hT : G 2 0 = (t : ℂ))
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedRowGramFibre G)
    (hdet₀ : X₀.det ≠ 0) :
    IsHadamard3 X₀ ∨ (rowTau X₀).re < 0 ∨
      HasOppositePairSecondRow X₀ := by
  by_cases hδ : gramDelta (G 2 0) (G 2 1) = 0
  · have hnormEq : Complex.normSq (G 2 1) = t ^ 2 := by
      have h := congrArg Complex.re hδ
      simp [gramDelta, hT, Complex.normSq_apply] at h
      rw [Complex.normSq_apply]
      nlinarith
    by_cases ht : t = 0
    · have hR : G 2 1 = 0 := by
        apply Complex.normSq_eq_zero.mp
        rw [hnormEq, ht]
        norm_num
      left
      exact dependent_zero_T_R_isHadamard3 hX₀ (by simp [hT, ht]) hR hdet₀
    · have htpos : 0 < t := lt_of_le_of_ne ht0 (Ne.symm ht)
      let z : ℂ := G 2 1 / (t : ℂ)
      have htC : (t : ℂ) ≠ 0 := by exact_mod_cast ne_of_gt htpos
      have hz : Complex.normSq z = 1 := by
        dsimp [z]
        rw [Complex.normSq_div, hnormEq]
        simp [Complex.normSq_apply]
        field_simp [ne_of_gt htpos]
      have hR : G 2 1 = (t : ℂ) * z := by
        dsimp [z]
        field_simp [htC]
      right; left
      exact dependent_positive_t_infinite_fibre_rowTau_negative
        hs0 hs3 htpos ht3 hz hS hT hR hδ hinf hX₀ hdet₀
  · by_cases hs : s = 0
    · have hnorm := clearedNormIdentity_of_infinite_second_rows hS hinf
      have hdata := normalized_fibre_fixed_data hX₀
      have hsum : fibreS (X₀ 1 0) (X₀ 1 1) (X₀ 1 2) = 0 := by
        simpa [hs] using hdata.1.trans hS
      have hrels := specialized_relations_all_coordinates
        (hX₀.1 1 0) (hX₀.1 1 1) (hX₀.1 1 2)
        (hX₀.1 2 0) (hX₀.1 2 1) (hX₀.1 2 2) hsum
      have hrel₁ := hrels (X₀ 1 0, X₀ 2 0) (by simp)
      have hrel₂ := hrels (X₀ 1 1, X₀ 2 1) (by simp)
      have hrel₃ := hrels (X₀ 1 2, X₀ 2 2) (by simp)
      have hnormalized := eq_normalizedRows_of_mem hX₀
      left
      rw [hnormalized]
      apply zero_endpoint_good_row_isHadamard3 hδ
        (by simpa [rowTriple, hS, hs] using rowTriple_mem_phaseTriplesAtSum hX₀ 1)
        (hX₀.1 2 0) (hX₀.1 2 1) (hX₀.1 2 2)
        (by simpa [← hnormalized] using hdet₀)
        (by simpa [hdata.2.1, hdata.2.2, hs] using hrel₁)
        (by simpa [hdata.2.1, hdata.2.2, hs] using hrel₂)
        (by simpa [hdata.2.1, hdata.2.2, hs] using hrel₃)
        (by simpa [hs] using hnorm)
    · have hspos : 0 < s := lt_of_le_of_ne hs0 (Ne.symm hs)
      by_cases hslt : s < 1
      · right; left
        exact regular_infinite_fibre_rowTau_negative
          hspos hslt hS hinf hX₀ hdet₀ hδ
      · have hsone : 1 ≤ s := le_of_not_gt hslt
        right; right
        exact (closed_endpoint_infinite_fibre_forces_opposite_pair
          hsone hs3 hS hinf hX₀ hdet₀ hδ).2

end Hadamard6
