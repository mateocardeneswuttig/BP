import Hadamard6.CandidateFibre

/-!
# The exceptional infinite-fibre branch

This is the matrix-level form of the saturation repair.  If every row in an
infinite normalized fibre meets a finite exceptional set of unit roots of
the critical quadratic, then the fixed row sum is one.  Every exceptional
root is then `1`, so any specified row in the fibre contains an opposite
pair and exhibits the local `2 x 2` Hadamard pattern.
-/

namespace Hadamard6

theorem infinite_exceptional_fibre_forces_opposite_pair
    {G : Mat3} {s : ℝ} {Z : Set ℂ}
    (hs : 0 ≤ s) (hS : G 1 0 = (s : ℂ))
    (hZfinite : Z.Finite)
    (hZunit : ∀ z ∈ Z, Complex.normSq z = 1)
    (hZroot : ∀ z ∈ Z, kappa (s : ℂ) z = 0)
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite)
    (hhit : ∀ t ∈ ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G),
      t.1 ∈ Z ∨ t.2.1 ∈ Z ∨ t.2.2 ∈ Z)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedRowGramFibre G) :
    s = 1 ∧
      ((∃ z, Complex.normSq z = 1 ∧ rowTriple X₀ 1 = (1, z, -z)) ∨
       (∃ z, Complex.normSq z = 1 ∧ rowTriple X₀ 1 = (z, 1, -z)) ∨
       (∃ z, Complex.normSq z = 1 ∧ rowTriple X₀ 1 = (z, -z, 1))) := by
  let Rows := (fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G
  have hvalid : Rows ⊆ phaseTriplesAtSum (s : ℂ) := by
    rintro t ⟨X, hX, rfl⟩
    simpa [hS] using rowTriple_mem_phaseTriplesAtSum hX 1
  have hsone : s = 1 := infinite_exceptional_rows_force_sum_one
    hs hZfinite hZunit hinf hvalid hhit
  have hroot_one {z : ℂ} (hz : z ∈ Z) : z = 1 := by
    have hk := hZroot z hz
    rw [hsone] at hk
    have hk' : kappa 1 z = 0 := by simpa using hk
    rw [kappa_one] at hk'
    have hsquare : (z - 1) ^ 2 = 0 :=
      (mul_eq_zero.mp hk').resolve_left (by norm_num)
    exact sub_eq_zero.mp (eq_zero_of_pow_eq_zero hsquare)
  have hone :
      (rowTriple X₀ 1).1 = 1 ∨
      (rowTriple X₀ 1).2.1 = 1 ∨
      (rowTriple X₀ 1).2.2 = 1 := by
    rcases hhit (rowTriple X₀ 1) ⟨X₀, hX₀, rfl⟩ with h0 | h1 | h2
    · exact Or.inl (hroot_one h0)
    · exact Or.inr (Or.inl (hroot_one h1))
    · exact Or.inr (Or.inr (hroot_one h2))
  refine ⟨hsone, ?_⟩
  apply phaseTriple_sum_one_containing_one
  · simpa [hS, hsone] using rowTriple_mem_phaseTriplesAtSum hX₀ 1
  · exact hone

end Hadamard6
