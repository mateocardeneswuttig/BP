import Hadamard6.Basic
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Tactic.LinearCombination

/-!
# The elementary two-circle lemma
-/

namespace Hadamard6

def phasePairs (c : ℂ) : Set (ℂ × ℂ) :=
  {p | Complex.normSq p.1 = 1 ∧
       Complex.normSq p.2 = 1 ∧ p.1 + p.2 = c}

noncomputable def phasePairPolynomial (c : ℂ) : Polynomial ℂ :=
  Polynomial.C (star c) * Polynomial.X ^ 2 -
    Polynomial.C (Complex.normSq c : ℂ) * Polynomial.X +
    Polynomial.C c

theorem phasePairPolynomial_ne_zero {c : ℂ} (hc : c ≠ 0) :
    phasePairPolynomial c ≠ 0 := by
  intro hp
  have hcoeff := congrArg (fun p : Polynomial ℂ ↦ p.coeff 2) hp
  have hstar : star c = 0 := by
    simpa [phasePairPolynomial] using hcoeff
  have : c = 0 := by
    simpa using congrArg star hstar
  exact hc this

theorem phasePair_first_isRoot {c u v : ℂ}
    (hu : Complex.normSq u = 1)
    (hv : Complex.normSq v = 1)
    (hsum : u + v = c) :
    (phasePairPolynomial c).IsRoot u := by
  have hu' : star u * u = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun r : ℝ ↦ (r : ℂ)) hu
  have hv' : star v * v = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun r : ℝ ↦ (r : ℂ)) hv
  rw [Polynomial.IsRoot, phasePairPolynomial]
  simp only [Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_mul,
    Polynomial.eval_C, Polynomial.eval_X, Polynomial.eval_pow]
  rw [← hsum]
  have hnorm : (Complex.normSq (u + v) : ℂ) =
      star (u + v) * (u + v) := by
    simpa [Complex.star_def] using
      (Complex.normSq_eq_conj_mul_self (z := u + v))
  rw [hnorm, star_add]
  linear_combination (-v) * hu' + (-u) * hv'

theorem phasePairs_finite {c : ℂ} (hc : c ≠ 0) :
    (phasePairs c).Finite := by
  let p := phasePairPolynomial c
  have hp : p ≠ 0 := phasePairPolynomial_ne_zero hc
  have hrootFinite : Set.Finite {u : ℂ | p.IsRoot u} :=
    Polynomial.finite_setOfPred_isRoot hp
  apply Set.Finite.of_finite_image
  · apply hrootFinite.subset
    rintro u ⟨⟨u', v⟩, huv, rfl⟩
    exact phasePair_first_isRoot huv.1 huv.2.1 huv.2.2
  · rintro ⟨u, v⟩ huv ⟨u', v'⟩ huv' hfirst
    cases hfirst
    have hsecond : v = v' :=
      add_left_cancel (huv.2.2.trans huv'.2.2.symm)
    cases hsecond
    rfl

theorem phasePairs_zero {u v : ℂ} (h : (u, v) ∈ phasePairs 0) :
    v = -u := by
  exact eq_neg_of_add_eq_zero_right h.2.2

end Hadamard6
