import Hadamard6.FibreGauge
import Hadamard6.FiniteCornerFromBlocks

/-!
# From finite intrinsic block fibres to a retained finite corner
-/

namespace Hadamard6

theorem dephase_topLeft (H : Mat6) :
    Matrix.toBlocks₁₁ (dephase H) =
      biGauge (fun i ↦ dephaseRowFactor H (Sum.inl i))
        (fun j ↦ dephaseColumnFactor H (Sum.inl j))
        (Matrix.toBlocks₁₁ H) := by
  ext i j
  rfl

theorem dephase_topRight (H : Mat6) :
    Matrix.toBlocks₁₂ (dephase H) =
      biGauge (fun i ↦ dephaseRowFactor H (Sum.inl i))
        (fun j ↦ dephaseColumnFactor H (Sum.inr j))
        (Matrix.toBlocks₁₂ H) := by
  ext i j
  rfl

theorem dephase_bottomLeft (H : Mat6) :
    Matrix.toBlocks₂₁ (dephase H) =
      biGauge (fun i ↦ dephaseRowFactor H (Sum.inr i))
        (fun j ↦ dephaseColumnFactor H (Sum.inl j))
        (Matrix.toBlocks₂₁ H) := by
  ext i j
  rfl

theorem finite_horizontalCandidates_of_block_fibre
    {H : Mat6} (hH : IsHadamard H)
    (hfin : (normalizedRowGramFibre
      (Matrix.toBlocks₁₂ H *
        Matrix.conjTranspose (Matrix.toBlocks₁₂ H))).Finite) :
    (horizontalCandidates (Matrix.toBlocks₁₁ H)).Finite := by
  rw [horizontalCandidates_eq_fibre]
  have hgram := (hadamard_row_block_grams hH).1
  have heq : sixI3 - Matrix.toBlocks₁₁ H *
      Matrix.conjTranspose (Matrix.toBlocks₁₁ H) =
      Matrix.toBlocks₁₂ H * Matrix.conjTranspose (Matrix.toBlocks₁₂ H) := by
    symm
    apply eq_sub_of_add_eq
    simpa [add_comm] using hgram
  rw [heq]
  exact hfin

theorem finite_verticalCandidates_of_block_fibre
    {H : Mat6} (hH : IsHadamard H)
    (hfin : (normalizedColumnGramFibre
      (Matrix.conjTranspose (Matrix.toBlocks₂₁ H) *
        Matrix.toBlocks₂₁ H)).Finite) :
    (verticalCandidates (Matrix.toBlocks₁₁ H)).Finite := by
  rw [verticalCandidates_eq_fibre]
  have hgram := (hadamard_column_block_grams hH).1
  have heq : sixI3 - Matrix.conjTranspose (Matrix.toBlocks₁₁ H) *
      Matrix.toBlocks₁₁ H =
      Matrix.conjTranspose (Matrix.toBlocks₂₁ H) *
        Matrix.toBlocks₂₁ H := by
    symm
    apply eq_sub_of_add_eq
    simpa [add_comm] using hgram
  rw [heq]
  exact hfin

theorem finite_topLeft_intrinsic_fibres_give_finiteCorner
    {H : Mat6} (hH : IsHadamard H)
    (hdetE : (Matrix.toBlocks₁₁ H).det ≠ 0)
    (hdetB : (Matrix.toBlocks₁₂ H).det ≠ 0)
    (hdetC : (Matrix.toBlocks₂₁ H).det ≠ 0)
    (hfinB : (normalizedRowGramFibre
      (Matrix.toBlocks₁₂ H *
        Matrix.conjTranspose (Matrix.toBlocks₁₂ H))).Finite)
    (hfinC : (normalizedColumnGramFibre
      (Matrix.conjTranspose (Matrix.toBlocks₂₁ H) *
        Matrix.toBlocks₂₁ H)).Finite) :
    HasFiniteCorner H := by
  let K := dephase H
  have hK : IsHadamard K := dephase_isHadamard hH
  have hKdeph : IsDephased K := dephase_isDephased hH.1
  have hr : ∀ i, Complex.normSq (dephaseRowFactor H i) = 1 :=
    fun i ↦ dephaseRowFactor_unit hH.1 i
  have hc : ∀ j, Complex.normSq (dephaseColumnFactor H j) = 1 :=
    fun j ↦ dephaseColumnFactor_unit hH.1 j
  have hfinBK : (normalizedRowGramFibre
      (Matrix.toBlocks₁₂ K *
        Matrix.conjTranspose (Matrix.toBlocks₁₂ K))).Finite := by
    rw [dephase_topRight]
    exact finite_biGauge_rowGram_fibre
      (fun i ↦ hr (Sum.inl i)) (fun j ↦ hc (Sum.inr j)) hfinB
  have hfinCK : (normalizedColumnGramFibre
      (Matrix.conjTranspose (Matrix.toBlocks₂₁ K) *
        Matrix.toBlocks₂₁ K)).Finite := by
    rw [dephase_bottomLeft]
    exact finite_biGauge_columnGram_fibre
      (fun i ↦ hr (Sum.inr i)) (fun j ↦ hc (Sum.inl j)) hfinC
  have hdetEK : (Matrix.toBlocks₁₁ K).det ≠ 0 := by
    rw [dephase_topLeft]
    exact biGauge_det_ne_zero (fun i ↦ hr (Sum.inl i))
      (fun j ↦ hc (Sum.inl j)) hdetE
  have hdetBK : (Matrix.toBlocks₁₂ K).det ≠ 0 := by
    rw [dephase_topRight]
    exact biGauge_det_ne_zero (fun i ↦ hr (Sum.inl i))
      (fun j ↦ hc (Sum.inr j)) hdetB
  have hdetCK : (Matrix.toBlocks₂₁ K).det ≠ 0 := by
    rw [dephase_bottomLeft]
    exact biGauge_det_ne_zero (fun i ↦ hr (Sum.inr i))
      (fun j ↦ hc (Sum.inl j)) hdetC
  have hfiniteK := finite_topLeft_fibres_give_finiteCorner
    hK hKdeph hdetEK hdetBK hdetCK
    (finite_horizontalCandidates_of_block_fibre hK hfinBK)
    (finite_verticalCandidates_of_block_fibre hK hfinCK)
  exact finiteCorner_of_equivalent (equivalent_dephase hH.1) hfiniteK

end Hadamard6
