import Hadamard6.FibreSymmetry
import Hadamard6.BlockGram

/-!
# Column-Gram fibres

Transpose converts a normalized column-Gram fibre into a normalized row-Gram
fibre.  This file transports the fully general row-fibre trichotomy across
that symmetry.
-/

namespace Hadamard6

def transposeGram (G : Mat3) : Mat3 := fun i j ↦ G j i

theorem transpose_rowGram (X : Mat3) :
    X.transpose * Matrix.conjTranspose X.transpose =
      transposeGram (Matrix.conjTranspose X * X) := by
  ext i j
  simp [transposeGram, Matrix.mul_apply, Matrix.conjTranspose_apply]
  apply Finset.sum_congr rfl
  intro k hk
  ring

theorem transpose_mem_normalizedRowGramFibre {G X : Mat3}
    (hX : X ∈ normalizedColumnGramFibre G) :
    X.transpose ∈ normalizedRowGramFibre (transposeGram G) := by
  refine ⟨?_, ?_, ?_⟩
  · intro i j
    exact hX.1 j i
  · intro j
    exact hX.2.1 j
  · rw [transpose_rowGram, hX.2.2]

theorem transpose_injective : Function.Injective (Matrix.transpose : Mat3 → Mat3) := by
  intro X Y h
  simpa using congrArg Matrix.transpose h

theorem infinite_column_fibre_transpose {G : Mat3}
    (hinf : (normalizedColumnGramFibre G).Infinite) :
    (normalizedRowGramFibre (transposeGram G)).Infinite := by
  have himage := hinf.image
    (fun _ _ _ _ h ↦ transpose_injective h)
  apply himage.mono
  rintro Y ⟨X, hX, rfl⟩
  exact transpose_mem_normalizedRowGramFibre hX

theorem transpose_det_ne_zero {X : Mat3} (hdet : X.det ≠ 0) :
    X.transpose.det ≠ 0 := by
  simpa using hdet

theorem transpose_isHadamard3_iff {X : Mat3} :
    IsHadamard3 X.transpose ↔ IsHadamard3 X := by
  constructor
  · intro h
    have hcol := hadamard3_column_gram h
    have ht := congrArg Matrix.transpose hcol
    have hc : (Matrix.conjTranspose X.transpose).transpose =
        Matrix.conjTranspose X := by
      ext i j
      simp [Matrix.conjTranspose_apply]
    rw [Matrix.transpose_mul, hc] at ht
    refine ⟨?_, ?_⟩
    · intro i j
      exact h.1 j i
    · simpa using ht
  · intro h
    have hcol := hadamard3_column_gram h
    refine ⟨?_, ?_⟩
    · intro i j
      exact h.1 j i
    · rw [transpose_rowGram, hcol]
      ext i j
      simp [transposeGram, Matrix.one_apply, eq_comm]

theorem rowTau_transpose_re (X : Mat3) :
    (rowTau X.transpose).re = (columnTau X).re := by
  have hherm := Matrix.isHermitian_conjTranspose_mul_self X
  have h02 := hherm.apply (0 : I3) (2 : I3)
  have h21 := hherm.apply (2 : I3) (1 : I3)
  have h10 := hherm.apply (1 : I3) (0 : I3)
  rw [rowTau, transpose_rowGram]
  simp only [transposeGram]
  rw [← h02, ← h21, ← h10]
  simp only [← star_mul]
  simp [columnTau]
  ring

def HasOppositePairInNoninitialColumn (X : Mat3) : Prop :=
  ∃ j : I3, j ≠ 0 ∧ ∃ i k : I3, i ≠ k ∧ X k j = -X i j

theorem oppositePair_transpose_iff {X : Mat3} :
    HasOppositePairInNoninitialRow X.transpose ↔
      HasOppositePairInNoninitialColumn X := by
  rfl

/-- The completely general column-fibre trichotomy. -/
theorem infinite_column_fibre_trichotomy
    {G : Mat3} (hinf : (normalizedColumnGramFibre G).Infinite)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedColumnGramFibre G)
    (hdet₀ : X₀.det ≠ 0) :
    IsHadamard3 X₀ ∨ (columnTau X₀).re < 0 ∨
      HasOppositePairInNoninitialColumn X₀ := by
  have hinf' := infinite_column_fibre_transpose hinf
  have hX₀' := transpose_mem_normalizedRowGramFibre hX₀
  have hdet₀' := transpose_det_ne_zero hdet₀
  rcases infinite_row_fibre_trichotomy hinf' hX₀' hdet₀' with
    hH | hneg | hopp
  · left
    exact transpose_isHadamard3_iff.mp hH
  · right; left
    rw [rowTau_transpose_re] at hneg
    exact hneg
  · right; right
    exact oppositePair_transpose_iff.mp hopp

end Hadamard6
