import Hadamard6.QuotientMobius
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-!
# Symmetric identities for three phases
-/

namespace Hadamard6

theorem ne_zero_of_normSq_eq_one {x : ℂ}
    (hx : Complex.normSq x = 1) : x ≠ 0 := by
  intro h
  rw [h] at hx
  norm_num at hx

theorem one_div_eq_star_of_normSq_eq_one {x : ℂ}
    (hx : Complex.normSq x = 1) : 1 / x = star x := by
  have hxne := ne_zero_of_normSq_eq_one hx
  apply (div_eq_iff hxne).2
  have hunit : star x * x = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun q : ℝ ↦ (q : ℂ)) hx
  exact hunit.symm

theorem phaseTriple_inverse_sum
    {s x₁ x₂ x₃ : ℂ}
    (h₁ : Complex.normSq x₁ = 1)
    (h₂ : Complex.normSq x₂ = 1)
    (h₃ : Complex.normSq x₃ = 1)
    (hsum : x₁ + x₂ + x₃ = s)
    (hsreal : star s = s) :
    1 / x₁ + 1 / x₂ + 1 / x₃ = s := by
  rw [one_div_eq_star_of_normSq_eq_one h₁,
    one_div_eq_star_of_normSq_eq_one h₂,
    one_div_eq_star_of_normSq_eq_one h₃]
  have hs := congrArg star hsum
  simpa [star_add, hsreal] using hs

theorem phaseTriple_pair_sum
    {s x₁ x₂ x₃ : ℂ}
    (h₁ : Complex.normSq x₁ = 1)
    (h₂ : Complex.normSq x₂ = 1)
    (h₃ : Complex.normSq x₃ = 1)
    (hsum : x₁ + x₂ + x₃ = s)
    (hsreal : star s = s) :
    x₁ * x₂ + x₁ * x₃ + x₂ * x₃ =
      (x₁ * x₂ * x₃) * s := by
  have hu₁ : star x₁ * x₁ = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun q : ℝ ↦ (q : ℂ)) h₁
  have hu₂ : star x₂ * x₂ = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun q : ℝ ↦ (q : ℂ)) h₂
  have hu₃ : star x₃ * x₃ = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun q : ℝ ↦ (q : ℂ)) h₃
  have hs := congrArg star hsum
  simp only [star_add, hsreal] at hs
  calc
    x₁ * x₂ + x₁ * x₃ + x₂ * x₃ =
        (x₁ * x₂ * x₃) * (star x₁ + star x₂ + star x₃) := by
      linear_combination
        (-(x₂ * x₃)) * hu₁ +
        (-(x₁ * x₃)) * hu₂ +
        (-(x₁ * x₂)) * hu₃
    _ = (x₁ * x₂ * x₃) * s := by rw [hs]

theorem phaseTriple_symmetric_data
    {s x₁ x₂ x₃ : ℂ}
    (ht : (x₁, x₂, x₃) ∈ phaseTriplesAtSum s)
    (hsreal : star s = s) :
    let u := x₁ * x₂ * x₃
    x₁ + x₂ + x₃ = s ∧
    (1 / x₁ + 1 / x₂ + 1 / x₃ = s) ∧
    (x₁ * x₂ + x₁ * x₃ + x₂ * x₃ = u * s) ∧
    x₁ * x₂ * x₃ = u := by
  dsimp
  refine ⟨ht.2.2.2, ?_, ?_, rfl⟩
  · exact phaseTriple_inverse_sum ht.1 ht.2.1 ht.2.2.1 ht.2.2.2 hsreal
  · exact phaseTriple_pair_sum ht.1 ht.2.1 ht.2.2.1 ht.2.2.2 hsreal

end Hadamard6
