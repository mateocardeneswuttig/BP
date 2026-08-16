import Hadamard6.FiniteDilation

/-!
# Concrete block predicates
-/

namespace Hadamard6

def AllFourBlocksHadamard (H : Mat6) : Prop :=
  IsHadamard3 (Matrix.toBlocks₁₁ H) ∧
  IsHadamard3 (Matrix.toBlocks₁₂ H) ∧
  IsHadamard3 (Matrix.toBlocks₂₁ H) ∧
  IsHadamard3 (Matrix.toBlocks₂₂ H)

/-- A normalized presentation of `H` with a finite-dilation corner and its
actual adjacent blocks.  The equality for `D` records the forced cross-block
orthogonality equation. -/
def HasFiniteCorner (H : Mat6) : Prop :=
  ∃ (p : CornerData) (B C D : Mat3),
    IsFiniteDilationCorner p.matrix ∧
    B ∈ invertibleHorizontalCandidates p.matrix ∧
    C ∈ invertibleVerticalCandidates p.matrix ∧
    EntrywiseUnit D ∧
    D = forcedD p.matrix B C ∧
    Equivalent H (Matrix.fromBlocks p.matrix B C D)

def HasRetainedOutputPresentation (H : Mat6) : Prop :=
  ∃ (p : CornerData) (B C : Mat3),
    Retained p.matrix B C ∧ Equivalent H (completion p.matrix B C)

theorem finiteCorner_hasRetainedOutput {H : Mat6}
    (h : HasFiniteCorner H) : HasRetainedOutputPresentation H := by
  rcases h with ⟨p, B, C, D, hfinite, hB, hC, hD, hforced, heq⟩
  refine ⟨p, B, C, ?_, ?_⟩
  · exact ⟨hfinite, hB, hC, hforced ▸ hD⟩
  · simpa [completion, hforced] using heq

/-- A finite-corner witness is already a retained output presentation, hence
membership in the intrinsic total finite-dilation class. -/
theorem finiteCorner_mem_finiteCornerAtlas {H : Mat6}
    (h : HasFiniteCorner H) : InFiniteCornerAtlas H := by
  rcases finiteCorner_hasRetainedOutput h with ⟨p, B, C, hret, heq⟩
  exact mem_finiteCornerAtlas_of_retained hret heq

/-- Every retained atlas presentation itself supplies a finite-corner
witness. This is the converse of `finiteCorner_mem_finiteCornerAtlas`; it records that
the atlas predicate has not hidden or weakened the finite-corner condition. -/
theorem inFiniteCornerAtlas_hasFiniteCorner {H : Mat6}
    (h : InFiniteCornerAtlas H) : HasFiniteCorner H := by
  rcases h with ⟨p, B, C, hret, heq⟩
  refine ⟨p, B, C, forcedD p.matrix B C, ?_⟩
  exact ⟨hret.1, hret.2.1, hret.2.2.1, hret.2.2.2,
    rfl, by simpa [completion] using heq⟩

/-- The total-output predicate and the geometric finite-corner witness are
logically equivalent.  Completeness must therefore prove `HasFiniteCorner`
for an arbitrary Hadamard matrix; it cannot follow merely by unfolding the
name of the atlas. -/
theorem inFiniteCornerAtlas_iff_hasFiniteCorner (H : Mat6) :
    InFiniteCornerAtlas H ↔ HasFiniteCorner H := by
  constructor
  · exact inFiniteCornerAtlas_hasFiniteCorner
  · exact finiteCorner_mem_finiteCornerAtlas

end Hadamard6
