import Hadamard6.GramInvariant
import Hadamard6.Blocks
import Mathlib.Tactic.FinCases

/-!
# Gram equations for the four literal `3 x 3` blocks
-/

namespace Hadamard6

/-- For a square Hadamard matrix, row orthogonality also gives column
orthogonality. -/
theorem hadamard_column_gram {H : Mat6} (hH : IsHadamard H) :
    Matrix.conjTranspose H * H = (6 : ℂ) • (1 : Mat6) := by
  have hright : H * ((6 : ℂ)⁻¹ • Matrix.conjTranspose H) = 1 := by
    calc
      H * ((6 : ℂ)⁻¹ • Matrix.conjTranspose H) =
          (6 : ℂ)⁻¹ • (H * Matrix.conjTranspose H) := by
            rw [Matrix.mul_smul]
      _ = (6 : ℂ)⁻¹ • ((6 : ℂ) • (1 : Mat6)) := by rw [hH.2]
      _ = 1 := by rw [smul_smul]; norm_num
  have hleft : ((6 : ℂ)⁻¹ • Matrix.conjTranspose H) * H = 1 :=
    mul_eq_one_comm.mp hright
  have hs := congrArg (fun M : Mat6 ↦ (6 : ℂ) • M) hleft
  simpa [Matrix.smul_mul] using hs

theorem hadamard3_column_gram {X : Mat3} (hX : IsHadamard3 X) :
    Matrix.conjTranspose X * X = (3 : ℂ) • (1 : Mat3) := by
  have hright : X * ((3 : ℂ)⁻¹ • Matrix.conjTranspose X) = 1 := by
    calc
      X * ((3 : ℂ)⁻¹ • Matrix.conjTranspose X) =
          (3 : ℂ)⁻¹ • (X * Matrix.conjTranspose X) := by
            rw [Matrix.mul_smul]
      _ = (3 : ℂ)⁻¹ • ((3 : ℂ) • (1 : Mat3)) := by rw [hX.2]
      _ = 1 := by rw [smul_smul]; norm_num
  have hleft := mul_eq_one_comm.mp hright
  have hs := congrArg (fun M : Mat3 ↦ (3 : ℂ) • M) hleft
  simpa [Matrix.smul_mul] using hs

theorem isHadamard3_of_column_gram {X : Mat3}
    (hunit : EntrywiseUnit X)
    (hcol : Matrix.conjTranspose X * X = (3 : ℂ) • (1 : Mat3)) :
    IsHadamard3 X := by
  have hright : Matrix.conjTranspose X * ((3 : ℂ)⁻¹ • X) = 1 := by
    calc
      Matrix.conjTranspose X * ((3 : ℂ)⁻¹ • X) =
          (3 : ℂ)⁻¹ • (Matrix.conjTranspose X * X) := by
            rw [Matrix.mul_smul]
      _ = (3 : ℂ)⁻¹ • ((3 : ℂ) • (1 : Mat3)) := by rw [hcol]
      _ = 1 := by rw [smul_smul]; norm_num
  have hleft := mul_eq_one_comm.mp hright
  have hs := congrArg (fun M : Mat3 ↦ (3 : ℂ) • M) hleft
  refine ⟨hunit, ?_⟩
  simpa [Matrix.smul_mul] using hs

theorem hadamard_blocks_entrywiseUnit {H : Mat6} (hH : IsHadamard H) :
    EntrywiseUnit (Matrix.toBlocks₁₁ H) ∧
    EntrywiseUnit (Matrix.toBlocks₁₂ H) ∧
    EntrywiseUnit (Matrix.toBlocks₂₁ H) ∧
    EntrywiseUnit (Matrix.toBlocks₂₂ H) := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> intro i j
  · exact hH.1 (Sum.inl i) (Sum.inl j)
  · exact hH.1 (Sum.inl i) (Sum.inr j)
  · exact hH.1 (Sum.inr i) (Sum.inl j)
  · exact hH.1 (Sum.inr i) (Sum.inr j)

theorem toBlocks₁₁_sixI :
    Matrix.toBlocks₁₁ ((6 : ℂ) • (1 : Mat6)) = sixI3 := by
  ext i j
  by_cases h : i = j <;> simp [Matrix.toBlocks₁₁, sixI3, h]

theorem toBlocks₂₂_sixI :
    Matrix.toBlocks₂₂ ((6 : ℂ) • (1 : Mat6)) = sixI3 := by
  ext i j
  by_cases h : i = j <;> simp [Matrix.toBlocks₂₂, sixI3, h]

theorem hadamard_row_block_grams {H : Mat6} (hH : IsHadamard H) :
    let E := Matrix.toBlocks₁₁ H
    let B := Matrix.toBlocks₁₂ H
    let C := Matrix.toBlocks₂₁ H
    let D := Matrix.toBlocks₂₂ H
    E * Matrix.conjTranspose E + B * Matrix.conjTranspose B = sixI3 ∧
    C * Matrix.conjTranspose C + D * Matrix.conjTranspose D = sixI3 := by
  let E := Matrix.toBlocks₁₁ H
  let B := Matrix.toBlocks₁₂ H
  let C := Matrix.toBlocks₂₁ H
  let D := Matrix.toBlocks₂₂ H
  have hg := hH.2
  rw [← Matrix.fromBlocks_toBlocks H, Matrix.fromBlocks_conjTranspose,
    Matrix.fromBlocks_multiply] at hg
  constructor
  · have h11 := congrArg Matrix.toBlocks₁₁ hg
    rw [toBlocks₁₁_sixI] at h11
    simpa [E, B, C, D] using h11
  · have h22 := congrArg Matrix.toBlocks₂₂ hg
    rw [toBlocks₂₂_sixI] at h22
    simpa [E, B, C, D] using h22

theorem hadamard_column_block_grams {H : Mat6} (hH : IsHadamard H) :
    let E := Matrix.toBlocks₁₁ H
    let B := Matrix.toBlocks₁₂ H
    let C := Matrix.toBlocks₂₁ H
    let D := Matrix.toBlocks₂₂ H
    Matrix.conjTranspose E * E + Matrix.conjTranspose C * C = sixI3 ∧
    Matrix.conjTranspose B * B + Matrix.conjTranspose D * D = sixI3 := by
  let E := Matrix.toBlocks₁₁ H
  let B := Matrix.toBlocks₁₂ H
  let C := Matrix.toBlocks₂₁ H
  let D := Matrix.toBlocks₂₂ H
  have hg := hadamard_column_gram hH
  rw [← Matrix.fromBlocks_toBlocks H, Matrix.fromBlocks_conjTranspose,
    Matrix.fromBlocks_multiply] at hg
  constructor
  · have h11 := congrArg Matrix.toBlocks₁₁ hg
    rw [toBlocks₁₁_sixI] at h11
    simpa [E, B, C, D] using h11
  · have h22 := congrArg Matrix.toBlocks₂₂ hg
    rw [toBlocks₂₂_sixI] at h22
    simpa [E, B, C, D] using h22

/-- If the upper-right block is `3 x 3` Hadamard, the four block Gram
equations force every block to be `3 x 3` Hadamard. -/
theorem allFourBlocksHadamard_of_topRight
    {H : Mat6} (hH : IsHadamard H)
    (hB : IsHadamard3 (Matrix.toBlocks₁₂ H)) :
    AllFourBlocksHadamard H := by
  let E := Matrix.toBlocks₁₁ H
  let B := Matrix.toBlocks₁₂ H
  let C := Matrix.toBlocks₂₁ H
  let D := Matrix.toBlocks₂₂ H
  rcases hadamard_blocks_entrywiseUnit hH with ⟨hEu, hBu, hCu, hDu⟩
  rcases hadamard_row_block_grams hH with ⟨hrowTop, hrowBottom⟩
  rcases hadamard_column_block_grams hH with ⟨hcolLeft, hcolRight⟩
  have hsubtract :
      sixI3 - (3 : ℂ) • (1 : Mat3) = (3 : ℂ) • (1 : Mat3) := by
    ext i j
    by_cases h : i = j <;> simp [sixI3, h]
    all_goals norm_num
  have hEgram : E * Matrix.conjTranspose E = (3 : ℂ) • (1 : Mat3) := by
    rw [hB.2] at hrowTop
    exact (eq_sub_of_add_eq hrowTop).trans hsubtract
  have hBcol := hadamard3_column_gram hB
  have hDcol : Matrix.conjTranspose D * D = (3 : ℂ) • (1 : Mat3) := by
    have hdsub : Matrix.conjTranspose D * D =
        sixI3 - Matrix.conjTranspose B * B := by
      rw [← hcolRight]
      abel
    rw [hBcol] at hdsub
    exact hdsub.trans hsubtract
  have hD : IsHadamard3 D := isHadamard3_of_column_gram hDu hDcol
  have hCgram : C * Matrix.conjTranspose C = (3 : ℂ) • (1 : Mat3) := by
    rw [hD.2] at hrowBottom
    exact (eq_sub_of_add_eq hrowBottom).trans hsubtract
  exact ⟨⟨hEu, hEgram⟩, hB, ⟨hCu, hCgram⟩, hD⟩

/-- The analogous propagation starting from the upper-left block. -/
theorem allFourBlocksHadamard_of_topLeft
    {H : Mat6} (hH : IsHadamard H)
    (hE : IsHadamard3 (Matrix.toBlocks₁₁ H)) :
    AllFourBlocksHadamard H := by
  let E := Matrix.toBlocks₁₁ H
  let B := Matrix.toBlocks₁₂ H
  let C := Matrix.toBlocks₂₁ H
  let D := Matrix.toBlocks₂₂ H
  rcases hadamard_blocks_entrywiseUnit hH with ⟨hEu, hBu, hCu, hDu⟩
  rcases hadamard_row_block_grams hH with ⟨hrowTop, hrowBottom⟩
  rcases hadamard_column_block_grams hH with ⟨hcolLeft, hcolRight⟩
  have hsubtract :
      sixI3 - (3 : ℂ) • (1 : Mat3) = (3 : ℂ) • (1 : Mat3) := by
    ext i j
    by_cases h : i = j <;> simp [sixI3, h]
    all_goals norm_num
  have hBgram : B * Matrix.conjTranspose B = (3 : ℂ) • (1 : Mat3) := by
    have hbsub : B * Matrix.conjTranspose B =
        sixI3 - E * Matrix.conjTranspose E := by
      rw [← hrowTop]
      abel
    rw [hE.2] at hbsub
    exact hbsub.trans hsubtract
  have hEcol := hadamard3_column_gram hE
  have hCcol : Matrix.conjTranspose C * C = (3 : ℂ) • (1 : Mat3) := by
    have hcsub : Matrix.conjTranspose C * C =
        sixI3 - Matrix.conjTranspose E * E := by
      rw [← hcolLeft]
      abel
    rw [hEcol] at hcsub
    exact hcsub.trans hsubtract
  have hC : IsHadamard3 C := isHadamard3_of_column_gram hCu hCcol
  have hDgram : D * Matrix.conjTranspose D = (3 : ℂ) • (1 : Mat3) := by
    have hdsub : D * Matrix.conjTranspose D =
        sixI3 - C * Matrix.conjTranspose C := by
      rw [← hrowBottom]
      abel
    rw [hC.2] at hdsub
    exact hdsub.trans hsubtract
  exact ⟨hE, ⟨hBu, hBgram⟩, hC, ⟨hDu, hDgram⟩⟩

theorem allFourBlocksHadamard_of_bottomRight
    {H : Mat6} (hH : IsHadamard H)
    (hD : IsHadamard3 (Matrix.toBlocks₂₂ H)) :
    AllFourBlocksHadamard H := by
  let B := Matrix.toBlocks₁₂ H
  let C := Matrix.toBlocks₂₁ H
  let D := Matrix.toBlocks₂₂ H
  rcases hadamard_blocks_entrywiseUnit hH with ⟨hEu, hBu, hCu, hDu⟩
  rcases hadamard_column_block_grams hH with ⟨hcolLeft, hcolRight⟩
  have hsubtract :
      sixI3 - (3 : ℂ) • (1 : Mat3) = (3 : ℂ) • (1 : Mat3) := by
    ext i j
    by_cases h : i = j <;> simp [sixI3, h]
    all_goals norm_num
  have hDcol := hadamard3_column_gram hD
  have hBcol : Matrix.conjTranspose B * B = (3 : ℂ) • (1 : Mat3) := by
    rw [hDcol] at hcolRight
    exact (eq_sub_of_add_eq hcolRight).trans hsubtract
  have hB : IsHadamard3 B := isHadamard3_of_column_gram hBu hBcol
  exact allFourBlocksHadamard_of_topRight hH hB

theorem allFourBlocksHadamard_of_bottomLeft
    {H : Mat6} (hH : IsHadamard H)
    (hC : IsHadamard3 (Matrix.toBlocks₂₁ H)) :
    AllFourBlocksHadamard H := by
  let E := Matrix.toBlocks₁₁ H
  let C := Matrix.toBlocks₂₁ H
  have hEu := (hadamard_blocks_entrywiseUnit hH).1
  have hcolLeft := (hadamard_column_block_grams hH).1
  have hCcol := hadamard3_column_gram hC
  have hsubtract :
      sixI3 - (3 : ℂ) • (1 : Mat3) = (3 : ℂ) • (1 : Mat3) := by
    ext i j
    by_cases h : i = j <;> simp [sixI3, h]
    all_goals norm_num
  have hEcol : Matrix.conjTranspose E * E =
      (3 : ℂ) • (1 : Mat3) := by
    rw [hCcol] at hcolLeft
    exact (eq_sub_of_add_eq hcolLeft).trans hsubtract
  exact allFourBlocksHadamard_of_topLeft hH
    (isHadamard3_of_column_gram hEu hEcol)

end Hadamard6
