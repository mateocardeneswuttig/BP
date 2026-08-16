import Hadamard6.BlockSwapMatrices
import Hadamard6.DephasedFiniteCorner

/-!
# Swapping the two block rows or block columns
-/

namespace Hadamard6

theorem finite_topRight_intrinsic_fibres_give_finiteCorner
    {H : Mat6} (hH : IsHadamard H)
    (hdetE : (Matrix.toBlocks₁₁ H).det ≠ 0)
    (hdetB : (Matrix.toBlocks₁₂ H).det ≠ 0)
    (hdetD : (Matrix.toBlocks₂₂ H).det ≠ 0)
    (hfinE : (normalizedRowGramFibre
      (Matrix.toBlocks₁₁ H *
        Matrix.conjTranspose (Matrix.toBlocks₁₁ H))).Finite)
    (hfinD : (normalizedColumnGramFibre
      (Matrix.conjTranspose (Matrix.toBlocks₂₂ H) *
        Matrix.toBlocks₂₂ H)).Finite) :
    HasFiniteCorner H := by
  let K := swapBlockColumns H
  have hK : IsHadamard K := swapBlockColumns_isHadamard hH
  have hfiniteK : HasFiniteCorner K := by
    apply finite_topLeft_intrinsic_fibres_give_finiteCorner hK
    all_goals simpa [K]
  exact finiteCorner_of_equivalent (equivalent_swapBlockColumns H) hfiniteK

theorem finite_bottomLeft_intrinsic_fibres_give_finiteCorner
    {H : Mat6} (hH : IsHadamard H)
    (hdetE : (Matrix.toBlocks₁₁ H).det ≠ 0)
    (hdetC : (Matrix.toBlocks₂₁ H).det ≠ 0)
    (hdetD : (Matrix.toBlocks₂₂ H).det ≠ 0)
    (hfinE : (normalizedColumnGramFibre
      (Matrix.conjTranspose (Matrix.toBlocks₁₁ H) *
        Matrix.toBlocks₁₁ H)).Finite)
    (hfinD : (normalizedRowGramFibre
      (Matrix.toBlocks₂₂ H *
        Matrix.conjTranspose (Matrix.toBlocks₂₂ H))).Finite) :
    HasFiniteCorner H := by
  let K := swapBlockRows H
  have hK : IsHadamard K := swapBlockRows_isHadamard hH
  have hfiniteK : HasFiniteCorner K := by
    apply finite_topLeft_intrinsic_fibres_give_finiteCorner hK
    all_goals simpa [K]
  exact finiteCorner_of_equivalent (equivalent_swapBlockRows H) hfiniteK

end Hadamard6
