import Hadamard6.BlockGram
import Mathlib.Tactic.Linarith

/-!
# Kernel-checked sign core of the block-swap argument
-/

namespace Hadamard6

variable (IsKarlsson : Mat6 → Prop)

def RowFibreOutcome (H : Mat6) (X : Mat3) : Prop :=
  IsHadamard3 X ∨ (rowTau X).re < 0 ∨ IsKarlsson H

def ColumnFibreOutcome (H : Mat6) (X : Mat3) : Prop :=
  IsHadamard3 X ∨ (columnTau X).re < 0 ∨ IsKarlsson H

/-- If both the original and swapped horizontal fibres have the
infinite-fibre outcome, the sign flip forces the all-Fourier-block case. -/
theorem two_horizontal_outcomes_force_allFour
    {H : Mat6} (hH : IsHadamard H) (hK : ¬ IsKarlsson H)
    (hB : RowFibreOutcome IsKarlsson H (Matrix.toBlocks₁₂ H))
    (hE : RowFibreOutcome IsKarlsson H (Matrix.toBlocks₁₁ H)) :
    AllFourBlocksHadamard H := by
  rcases hB with hBfourier | hBneg | hBK
  · exact allFourBlocksHadamard_of_topRight hH hBfourier
  · rcases hE with hEfourier | hEneg | hEK
    · exact allFourBlocksHadamard_of_topLeft hH hEfourier
    · have hcomp := (hadamard_row_block_grams hH).1
      have hflip := rowTau_re_complement hcomp
      linarith
    · exact False.elim (hK hEK)
  · exact False.elim (hK hBK)

/-- The vertical half of the same switch: row/column invariant equality for
the old corner and the column sign flip to the diagonally opposite block
exclude simultaneous infinite-fibre outcomes. -/
theorem horizontal_and_opposite_vertical_outcomes_force_allFour
    {H : Mat6} (hH : IsHadamard H) (hK : ¬ IsKarlsson H)
    (hB : RowFibreOutcome IsKarlsson H (Matrix.toBlocks₁₂ H))
    (hD : ColumnFibreOutcome IsKarlsson H (Matrix.toBlocks₂₂ H)) :
    AllFourBlocksHadamard H := by
  rcases hB with hBfourier | hBneg | hBK
  · exact allFourBlocksHadamard_of_topRight hH hBfourier
  · rcases hD with hDfourier | hDneg | hDK
    · exact allFourBlocksHadamard_of_bottomRight hH hDfourier
    · have hunitB := (hadamard_blocks_entrywiseUnit hH).2.1
      have hinvariant := rowTau_re_eq_columnTau_re hunitB
      have hcomp := (hadamard_column_block_grams hH).2
      have hflip := columnTau_re_complement hcomp
      linarith
    · exact False.elim (hK hDK)
  · exact False.elim (hK hBK)

/-- The column-column version on the left block column. -/
theorem two_vertical_outcomes_force_allFour
    {H : Mat6} (hH : IsHadamard H) (hK : ¬ IsKarlsson H)
    (hC : ColumnFibreOutcome IsKarlsson H (Matrix.toBlocks₂₁ H))
    (hE : ColumnFibreOutcome IsKarlsson H (Matrix.toBlocks₁₁ H)) :
    AllFourBlocksHadamard H := by
  rcases hC with hCfourier | hCneg | hCK
  · exact allFourBlocksHadamard_of_bottomLeft hH hCfourier
  · rcases hE with hEfourier | hEneg | hEK
    · exact allFourBlocksHadamard_of_topLeft hH hEfourier
    · have hcomp := (hadamard_column_block_grams hH).1
      have hflip := columnTau_re_complement hcomp
      linarith
    · exact False.elim (hK hEK)
  · exact False.elim (hK hCK)

/-- The lower-row mixed version: the row/column invariant equality for `C`
and the row-complement sign flip from `C` to `D`. -/
theorem vertical_and_opposite_horizontal_outcomes_force_allFour
    {H : Mat6} (hH : IsHadamard H) (hK : ¬ IsKarlsson H)
    (hC : ColumnFibreOutcome IsKarlsson H (Matrix.toBlocks₂₁ H))
    (hD : RowFibreOutcome IsKarlsson H (Matrix.toBlocks₂₂ H)) :
    AllFourBlocksHadamard H := by
  rcases hC with hCfourier | hCneg | hCK
  · exact allFourBlocksHadamard_of_bottomLeft hH hCfourier
  · rcases hD with hDfourier | hDneg | hDK
    · exact allFourBlocksHadamard_of_bottomRight hH hDfourier
    · have hunitC := (hadamard_blocks_entrywiseUnit hH).2.2.1
      have hinvariant := rowTau_re_eq_columnTau_re hunitC
      have hcomp := (hadamard_row_block_grams hH).2
      have hflip := rowTau_re_complement hcomp
      linarith
    · exact False.elim (hK hDK)
  · exact False.elim (hK hCK)

end Hadamard6
