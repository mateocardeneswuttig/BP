import Hadamard6.BlockCompletion
import Hadamard6.PublishedInputs
import Hadamard6.VanishingMinorReduction

/-!
# Immediate consequences of the published inputs
-/

namespace Hadamard6

variable {IsTao IsKarlsson : Mat6 → Prop}

/-- Every retained completion is Hadamard; both entrywise unimodularity and
the full Gram identity are now checked locally. -/
theorem retained_completion_isHadamard
    {p : CornerData} {B C : Mat3}
    (h : Retained p.matrix B C) :
    IsHadamard (completion p.matrix B C) := by
  exact ⟨retained_completion_entrywiseUnit h,
    retained_completion_rowGram h⟩

/-- Soundness of the intrinsic atlas definition: every retained output, and
therefore every equivalent representative of it, is Hadamard. -/
theorem inFiniteCornerAtlas_isHadamard {H : Mat6}
    (hH : InFiniteCornerAtlas H) :
    IsHadamard H := by
  rcases hH with ⟨p, B, C, hret, heq⟩
  exact (equivalent_isHadamard_iff heq).2
    (retained_completion_isHadamard hret)

/-- In particular, all four blocks of the fixed `3+3` decomposition are
invertible outside Karlsson.  This now follows locally from the corner
singularity reduction and the sole Karlsson completeness input. -/
theorem all_four_blocks_det_ne_zero
    (pub : PublishedInputs IsTao IsKarlsson)
    {H : Mat6} (hH : IsHadamard H) (hK : ¬ IsKarlsson H) :
    Matrix.det (Matrix.toBlocks₁₁ H) ≠ 0 ∧
    Matrix.det (Matrix.toBlocks₁₂ H) ≠ 0 ∧
    Matrix.det (Matrix.toBlocks₂₁ H) ≠ 0 ∧
    Matrix.det (Matrix.toBlocks₂₂ H) ≠ 0 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro hzero
    exact hK (pub.twoByTwo_mem_karlsson H hH
      (singular_topLeft_hasHadamardTwoByTwo hH hzero))
  · intro hzero
    exact hK (pub.twoByTwo_mem_karlsson H hH
      (singular_topRight_hasHadamardTwoByTwo hH hzero))
  · intro hzero
    exact hK (pub.twoByTwo_mem_karlsson H hH
      (singular_bottomLeft_hasHadamardTwoByTwo hH hzero))
  · intro hzero
    exact hK (pub.twoByTwo_mem_karlsson H hH
      (singular_bottomRight_hasHadamardTwoByTwo hH hzero))

end Hadamard6
