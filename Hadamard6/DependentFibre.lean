import Hadamard6.FibreNormIdentity
import Mathlib.Algebra.Polynomial.Roots

/-!
# The first step of the identically-dependent fibre branch

When `gramDelta = 0`, the `A` part of the eliminant vanishes identically.
If one coordinate of the varying row has infinite image, the unit entry in
the companion row can be cancelled without division by a polynomial.  Thus
the cubic `B` has infinitely many roots and is the zero polynomial.
-/

namespace Hadamard6

open Polynomial

noncomputable section

theorem cubic_eliminant_zero_of_infinite_fibre_coordinate
    {G : Mat3} {s : ℝ} (hS : G 1 0 = (s : ℂ))
    (hδ : gramDelta (G 2 0) (G 2 1) = 0) (j : I3)
    (hinf : ((fun X ↦ X 1 j) '' normalizedRowGramFibre G).Infinite) :
    cubicPoly
      (specializedBeta0 s (G 2 0) (G 2 1))
      (specializedBeta1 s (G 2 0) (G 2 1))
      (specializedBeta2 s (G 2 0) (G 2 1))
      (specializedBeta3 s (G 2 0) (G 2 1)) = 0 := by
  let P := cubicPoly
    (specializedBeta0 s (G 2 0) (G 2 1))
    (specializedBeta1 s (G 2 0) (G 2 1))
    (specializedBeta2 s (G 2 0) (G 2 1))
    (specializedBeta3 s (G 2 0) (G 2 1))
  apply Polynomial.eq_zero_of_infinite_isRoot P
  apply hinf.mono
  intro x hx
  rcases hx with ⟨X, hX, rfl⟩
  have hdata := normalized_fibre_fixed_data hX
  have hsum : fibreS (X 1 0) (X 1 1) (X 1 2) = (s : ℂ) :=
    hdata.1.trans hS
  have hrels := specialized_relations_all_coordinates
    (hX.1 1 0) (hX.1 1 1) (hX.1 1 2)
    (hX.1 2 0) (hX.1 2 1) (hX.1 2 2) hsum
  have hp : (X 1 j, X 2 j) ∈
      ({(X 1 0, X 2 0), (X 1 1, X 2 1), (X 1 2, X 2 2)} :
        Set (ℂ × ℂ)) := by
    fin_cases j <;> simp
  have hrel := hrels (X 1 j, X 2 j) hp
  rw [hdata.2.1, hdata.2.2, hδ] at hrel
  simp only [zero_mul, zero_add] at hrel
  have hy0 := ne_zero_of_normSq_eq_one (hX.1 2 j)
  have hB := (mul_eq_zero.mp hrel).resolve_right hy0
  change P.eval (X 1 j) = 0
  simpa [P] using hB

theorem cubic_eliminant_zero_of_infinite_second_rows
    {G : Mat3} {s : ℝ} (hS : G 1 0 = (s : ℂ))
    (hδ : gramDelta (G 2 0) (G 2 1) = 0)
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite) :
    cubicPoly
      (specializedBeta0 s (G 2 0) (G 2 1))
      (specializedBeta1 s (G 2 0) (G 2 1))
      (specializedBeta2 s (G 2 0) (G 2 1))
      (specializedBeta3 s (G 2 0) (G 2 1)) = 0 := by
  let Rows := (fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G
  rcases infinite_triples_coordinate_alternative (show Rows.Infinite from hinf) with
    h0 | h1 | h2
  · apply cubic_eliminant_zero_of_infinite_fibre_coordinate hS hδ 0
    have heq : Prod.fst '' Rows =
        (fun X ↦ X 1 0) '' normalizedRowGramFibre G := by
      ext z
      constructor
      · rintro ⟨t, ⟨X, hX, rfl⟩, rfl⟩
        exact ⟨X, hX, rfl⟩
      · rintro ⟨X, hX, rfl⟩
        exact ⟨rowTriple X 1, ⟨X, hX, rfl⟩, rfl⟩
    rwa [heq] at h0
  · apply cubic_eliminant_zero_of_infinite_fibre_coordinate hS hδ 1
    have heq : (fun t ↦ t.2.1) '' Rows =
        (fun X ↦ X 1 1) '' normalizedRowGramFibre G := by
      ext z
      constructor
      · rintro ⟨t, ⟨X, hX, rfl⟩, rfl⟩
        exact ⟨X, hX, rfl⟩
      · rintro ⟨X, hX, rfl⟩
        exact ⟨rowTriple X 1, ⟨X, hX, rfl⟩, rfl⟩
    rwa [heq] at h1
  · apply cubic_eliminant_zero_of_infinite_fibre_coordinate hS hδ 2
    have heq : (fun t ↦ t.2.2) '' Rows =
        (fun X ↦ X 1 2) '' normalizedRowGramFibre G := by
      ext z
      constructor
      · rintro ⟨t, ⟨X, hX, rfl⟩, rfl⟩
        exact ⟨X, hX, rfl⟩
      · rintro ⟨X, hX, rfl⟩
        exact ⟨rowTriple X 1, ⟨X, hX, rfl⟩, rfl⟩
    rwa [heq] at h2

theorem specializedBetas_zero_of_dependent_infinite_second_rows
    {G : Mat3} {s : ℝ} (hS : G 1 0 = (s : ℂ))
    (hδ : gramDelta (G 2 0) (G 2 1) = 0)
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite) :
    specializedBeta0 s (G 2 0) (G 2 1) = 0 ∧
    specializedBeta1 s (G 2 0) (G 2 1) = 0 ∧
    specializedBeta2 s (G 2 0) (G 2 1) = 0 ∧
    specializedBeta3 s (G 2 0) (G 2 1) = 0 := by
  exact (cubicPoly_eq_zero_iff _ _ _ _).mp
    (cubic_eliminant_zero_of_infinite_second_rows hS hδ hinf)

end

end Hadamard6
