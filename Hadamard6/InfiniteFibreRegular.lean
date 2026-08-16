import Hadamard6.FibreNormIdentity
import Hadamard6.QuotientGoodRow
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Tactic.Linarith

/-!
# The regular infinite-fibre branch

For a normalized row-Gram fibre with real first off-diagonal entry
`0 < s < 1`, this file combines the global quotient identity with the
finite-exceptional-coordinate argument.  In the regular case `delta != 0`,
one can choose a row avoiding every positive real root of the critical
quadratic and hence force the cubic Gram invariant to have negative real
part.
-/

namespace Hadamard6

open Polynomial

noncomputable section

theorem regular_infinite_fibre_rowTau_negative
    {G : Mat3} {s : ℝ}
    (hs0 : 0 < s) (hs1 : s < 1)
    (hS : G 1 0 = (s : ℂ))
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedRowGramFibre G)
    (hdet₀ : X₀.det ≠ 0)
    (hδ : gramDelta (G 2 0) (G 2 1) ≠ 0) :
    (rowTau X₀).re < 0 := by
  let Z : Set ℂ :=
    {z | Complex.normSq z = 1 ∧ kappa (s : ℂ) z = 0}
  have hsne : (s : ℂ) ≠ 0 := by exact_mod_cast ne_of_gt hs0
  have hkpoly : kappaPoly (s : ℂ) ≠ 0 := by
    intro hp
    have he := congrArg (fun p : ℂ[X] ↦ p.eval 0) hp
    have htwo : (2 : ℂ) ≠ 0 := by norm_num
    apply hsne
    exact (mul_eq_zero.mp (by simpa [eval_kappaPoly, kappa] using he)).resolve_left htwo
  have hZfinite : Z.Finite := by
    apply (Polynomial.finite_setOfPred_isRoot hkpoly).subset
    intro z hz
    change (kappaPoly (s : ℂ)).eval z = 0
    simpa using hz.2
  let Rows := (fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G
  have hRows : Rows.Infinite := hinf
  have hvalid : Rows ⊆ phaseTriplesAtSum (s : ℂ) := by
    rintro t ⟨X, hX, rfl⟩
    simpa [hS] using rowTriple_mem_phaseTriplesAtSum hX 1
  have hgood : ∃ t ∈ Rows,
      t.1 ∉ Z ∧ t.2.1 ∉ Z ∧ t.2.2 ∉ Z := by
    by_contra hnone
    have hhit : ∀ t ∈ Rows,
        t.1 ∈ Z ∨ t.2.1 ∈ Z ∨ t.2.2 ∈ Z := by
      intro t ht
      by_cases h0 : t.1 ∈ Z
      · exact Or.inl h0
      by_cases h1 : t.2.1 ∈ Z
      · exact Or.inr (Or.inl h1)
      by_cases h2 : t.2.2 ∈ Z
      · exact Or.inr (Or.inr h2)
      · exact False.elim (hnone ⟨t, ht, h0, h1, h2⟩)
    have hsone := infinite_exceptional_rows_force_sum_one
      hs0.le hZfinite (fun z hz ↦ hz.1) hRows hvalid hhit
    linarith
  rcases hgood with ⟨t, ⟨X, hX, rfl⟩, hx₁Z, hx₂Z, hx₃Z⟩
  have hnorm := clearedNormIdentity_of_infinite_second_rows hS hinf
  have hdata := normalized_fibre_fixed_data hX
  have hsum : fibreS (X 1 0) (X 1 1) (X 1 2) = (s : ℂ) :=
    hdata.1.trans hS
  have hrels := specialized_relations_all_coordinates
    (hX.1 1 0) (hX.1 1 1) (hX.1 1 2)
    (hX.1 2 0) (hX.1 2 1) (hX.1 2 2) hsum
  have hrel₁ := hrels (X 1 0, X 2 0) (by simp)
  have hrel₂ := hrels (X 1 1, X 2 1) (by simp)
  have hrel₃ := hrels (X 1 2, X 2 2) (by simp)
  have hdetX : X.det ≠ 0 :=
    det_ne_zero_of_same_rowGram (hX₀.2.2.trans hX.2.2.symm) hdet₀
  have havoid : ∀ q : ℝ, 0 < q → realKappa s q = 0 →
      X 1 0 - (q : ℂ) ≠ 0 ∧
      X 1 1 - (q : ℂ) ≠ 0 ∧
      X 1 2 - (q : ℂ) ≠ 0 := by
    intro q hq0 hqroot
    have hbad (j : I3) (hjZ : X 1 j ∉ Z) : X 1 j - (q : ℂ) ≠ 0 := by
      intro heq
      apply hjZ
      refine ⟨hX.1 1 j, ?_⟩
      have hxq : X 1 j = (q : ℂ) := sub_eq_zero.mp heq
      rw [hxq, kappa_ofReal, hqroot]
      simp
    exact ⟨hbad 0 hx₁Z, hbad 1 hx₂Z, hbad 2 hx₃Z⟩
  have hnormalized := eq_normalizedRows_of_mem hX
  have hdetNormalized :
      Matrix.det (normalizedRows
        (X 1 0) (X 1 1) (X 1 2)
        (X 2 0) (X 2 1) (X 2 2)) ≠ 0 := by
    rw [← hnormalized]
    exact hdetX
  have hneg := quotient_good_row_negative hs0 hs1 hδ
    (by simpa [rowTriple, hS] using rowTriple_mem_phaseTriplesAtSum hX 1)
    (hX.1 2 0) (hX.1 2 1) (hX.1 2 2) hdetNormalized
    (by simpa [hdata.2.1, hdata.2.2] using hrel₁)
    (by simpa [hdata.2.1, hdata.2.2] using hrel₂)
    (by simpa [hdata.2.1, hdata.2.2] using hrel₃)
    hnorm havoid
  rw [← hnormalized] at hneg
  have hτ₀ : rowTau X₀ = gramTau G := by
    rw [rowTau, hX₀.2.2]
    rfl
  have hτX : rowTau X = gramTau G := by
    rw [rowTau, hX.2.2]
    rfl
  rw [hτ₀, ← hτX]
  exact hneg

end

end Hadamard6
