import Hadamard6.DependentAlgebra
import Mathlib.Tactic.FinCases

/-!
# Matrix-level assembly of the positive-`t` dependent branch
-/

namespace Hadamard6

noncomputable section

theorem normalized_fibre_gram_eq_dependentGram
    {G X : Mat3} {s t : ℝ} {z : ℂ}
    (hX : X ∈ normalizedRowGramFibre G)
    (hS : G 1 0 = (s : ℂ))
    (hT : G 2 0 = (t : ℂ))
    (hR : G 2 1 = (t : ℂ) * z) :
    G = dependentGram s t z := by
  have hherm : G.IsHermitian := by
    rw [← hX.2.2]
    exact Matrix.isHermitian_mul_conjTranspose_self X
  have hdiag (i : I3) : G i i = 3 := by
    rw [← hX.2.2]
    exact rowGram_diagonal_three hX.1 i
  ext i j
  fin_cases i <;> fin_cases j
  · simpa [dependentGram] using hdiag 0
  · have h := hherm.apply (0 : I3) (1 : I3)
    simpa [dependentGram, hS, Complex.star_def] using h.symm
  · have h := hherm.apply (0 : I3) (2 : I3)
    simpa [dependentGram, hT, Complex.star_def] using h.symm
  · simpa [dependentGram] using hS
  · simpa [dependentGram] using hdiag 1
  · have h := hherm.apply (1 : I3) (2 : I3)
    simpa [dependentGram, hR, star_mul, Complex.star_def, mul_comm] using h.symm
  · simpa [dependentGram] using hT
  · simpa [dependentGram] using hR
  · simpa [dependentGram] using hdiag 2

theorem dependent_positive_t_infinite_fibre_rowTau_negative
    {G : Mat3} {s t : ℝ} {z : ℂ}
    (hs0 : 0 ≤ s) (hs3 : s ≤ 3)
    (ht0 : 0 < t) (ht3 : t ≤ 3)
    (hz : Complex.normSq z = 1)
    (hS : G 1 0 = (s : ℂ))
    (hT : G 2 0 = (t : ℂ))
    (hR : G 2 1 = (t : ℂ) * z)
    (hδ : gramDelta (G 2 0) (G 2 1) = 0)
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedRowGramFibre G)
    (hdet₀ : X₀.det ≠ 0) :
    (rowTau X₀).re < 0 := by
  have hbetas := specializedBetas_zero_of_dependent_infinite_second_rows
    hS hδ hinf
  have hb₀ : specializedBeta0 s (t : ℂ) ((t : ℂ) * z) = 0 := by
    simpa [hT, hR] using hbetas.1
  have hb₃ : specializedBeta3 s (t : ℂ) ((t : ℂ) * z) = 0 := by
    simpa [hT, hR] using hbetas.2.2.2
  have htC : (t : ℂ) ≠ 0 := by exact_mod_cast ne_of_gt ht0
  have hz0 := ne_zero_of_normSq_eq_one hz
  have hPi : dependentPi s t z = 0 := by
    rw [dependent_beta0_formula hz] at hb₀
    field_simp [hz0] at hb₀
    have hb₀' : -(t : ℂ) * dependentPi s t z = 0 := by simpa using hb₀
    exact (mul_eq_zero.mp hb₀').resolve_left (neg_ne_zero.mpr htC)
  have hTheta : dependentTheta s t z = 0 := by
    rw [dependent_beta3_formula hz] at hb₃
    field_simp [hz0] at hb₃
    have hb₃' : (t : ℂ) * dependentTheta s t z = 0 := by simpa using hb₃
    exact (mul_eq_zero.mp hb₃').resolve_left htC
  have hgram := normalized_fibre_gram_eq_dependentGram hX₀ hS hT hR
  have hdetGram : 0 < (Matrix.det (dependentGram s t z)).re := by
    rw [← hgram, ← hX₀.2.2]
    exact rowGram_det_re_pos hdet₀
  have hneg := dependent_positive_t_tau_negative
    hs0 hs3 ht0 ht3 hz hPi hTheta hdetGram
  have htau : rowTau X₀ = gramTau (dependentGram s t z) := by
    rw [rowTau, hX₀.2.2, hgram]
    rfl
  rw [htau]
  exact hneg

end

end Hadamard6
