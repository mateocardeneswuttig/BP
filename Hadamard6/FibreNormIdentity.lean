import Hadamard6.CandidateFibre
import Hadamard6.HaagerupFromFibre
import Hadamard6.ModulusIdentity
import Mathlib.Tactic.FinCases

/-!
# The global norm identity from an infinite normalized matrix fibre
-/

namespace Hadamard6

theorem normalized_fibre_fixed_data
    {G X : Mat3} (hX : X ∈ normalizedRowGramFibre G) :
    fibreS (X 1 0) (X 1 1) (X 1 2) = G 1 0 ∧
    fibreT (X 2 0) (X 2 1) (X 2 2) = G 2 0 ∧
    fibreR (X 1 0) (X 1 1) (X 1 2)
      (X 2 0) (X 2 1) (X 2 2) = G 2 1 := by
  have h10 := congrArg (fun M : Mat3 ↦ M 1 0) hX.2.2
  have h20 := congrArg (fun M : Mat3 ↦ M 2 0) hX.2.2
  have h21 := congrArg (fun M : Mat3 ↦ M 2 1) hX.2.2
  refine ⟨?_, ?_, ?_⟩
  · simpa [fibreS, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, hX.2.1] using h10
  · simpa [fibreT, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, hX.2.1] using h20
  · simpa [fibreR, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, mul_comm] using h21

theorem clearedNormIdentity_of_infinite_fibre_coordinate
    {G : Mat3} {s : ℝ} (hS : G 1 0 = (s : ℂ)) (j : I3)
    (hinf : ((fun X ↦ X 1 j) '' normalizedRowGramFibre G).Infinite) :
    ClearedNormIdentity (s : ℂ) (gramDelta (G 2 0) (G 2 1))
      (specializedBeta0 s (G 2 0) (G 2 1))
      (specializedBeta1 s (G 2 0) (G 2 1))
      (specializedBeta2 s (G 2 0) (G 2 1))
      (specializedBeta3 s (G 2 0) (G 2 1)) := by
  apply clearedNormIdentity_of_infinite_unit_relations hinf
  intro x hx
  rcases hx with ⟨X, hX, rfl⟩
  have hdata := normalized_fibre_fixed_data hX
  have hsx : fibreS (X 1 0) (X 1 1) (X 1 2) = (s : ℂ) :=
    hdata.1.trans hS
  have hrels := specialized_relations_all_coordinates
    (hX.1 1 0) (hX.1 1 1) (hX.1 1 2)
    (hX.1 2 0) (hX.1 2 1) (hX.1 2 2) hsx
  have hp : (X 1 j, X 2 j) ∈
      ({(X 1 0, X 2 0), (X 1 1, X 2 1), (X 1 2, X 2 2)} :
        Set (ℂ × ℂ)) := by
    fin_cases j <;> simp
  have hrel := hrels (X 1 j, X 2 j) hp
  refine ⟨hX.1 1 j, X 2 j, hX.1 2 j, ?_⟩
  simpa [hdata.2.1, hdata.2.2] using hrel

theorem clearedNormIdentity_of_infinite_second_rows
    {G : Mat3} {s : ℝ} (hS : G 1 0 = (s : ℂ))
    (hinf : ((fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G).Infinite) :
    ClearedNormIdentity (s : ℂ) (gramDelta (G 2 0) (G 2 1))
      (specializedBeta0 s (G 2 0) (G 2 1))
      (specializedBeta1 s (G 2 0) (G 2 1))
      (specializedBeta2 s (G 2 0) (G 2 1))
      (specializedBeta3 s (G 2 0) (G 2 1)) := by
  let Rows := (fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G
  have hRows : Rows.Infinite := hinf
  rcases infinite_triples_coordinate_alternative hRows with h0 | h1 | h2
  · apply clearedNormIdentity_of_infinite_fibre_coordinate hS 0
    have heq : Prod.fst '' Rows =
        (fun X ↦ X 1 0) '' normalizedRowGramFibre G := by
      ext z
      constructor
      · rintro ⟨t, ⟨X, hX, rfl⟩, rfl⟩
        exact ⟨X, hX, rfl⟩
      · rintro ⟨X, hX, rfl⟩
        exact ⟨rowTriple X 1, ⟨X, hX, rfl⟩, rfl⟩
    rwa [heq] at h0
  · apply clearedNormIdentity_of_infinite_fibre_coordinate hS 1
    have heq : (fun t ↦ t.2.1) '' Rows =
        (fun X ↦ X 1 1) '' normalizedRowGramFibre G := by
      ext z
      constructor
      · rintro ⟨t, ⟨X, hX, rfl⟩, rfl⟩
        exact ⟨X, hX, rfl⟩
      · rintro ⟨X, hX, rfl⟩
        exact ⟨rowTriple X 1, ⟨X, hX, rfl⟩, rfl⟩
    rwa [heq] at h1
  · apply clearedNormIdentity_of_infinite_fibre_coordinate hS 2
    have heq : (fun t ↦ t.2.2) '' Rows =
        (fun X ↦ X 1 2) '' normalizedRowGramFibre G := by
      ext z
      constructor
      · rintro ⟨t, ⟨X, hX, rfl⟩, rfl⟩
        exact ⟨X, hX, rfl⟩
      · rintro ⟨X, hX, rfl⟩
        exact ⟨rowTriple X 1, ⟨X, hX, rfl⟩, rfl⟩
    rwa [heq] at h2

end Hadamard6
