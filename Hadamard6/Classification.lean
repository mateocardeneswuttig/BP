import Hadamard6.PublishedInputs
import Hadamard6.Blocks
import Hadamard6.FourierBlocks
import Hadamard6.BlockSwapTheorem
import Hadamard6.FourierCoordinateAllocation
import Hadamard6.FourierChartAssembly
import Hadamard6.FourierCoreFromNormalization
import Hadamard6.SimultaneousFourierNormalization

/-!
# Failed-search routing core

This internal layer has exactly two alternatives:

* the matrix belongs to the previously classified exceptional sector
  (`IsKarlsson ∨ IsTao`); or
* it belongs to the independently defined finite-corner atlas.

The paper-facing witness theorem is in `PaperTheorem.lean`; this file only
supplies its routing reduction.  The predicates naming the Karlsson sector
and Tao orbit remain parameters here so the published criterion is visible.
-/

namespace Hadamard6

variable (IsTao IsKarlsson : Mat6 → Prop)

/-- The two internal routing obligations, separated rather than bundled into
the final classification statement. -/
structure NewProofInputs where
  blockSwap :
    ∀ H, IsHadamard H → ¬ IsKarlsson H →
      HasFiniteCorner H ∨ AllFourBlocksHadamard H
  fourierBlocks :
    ∀ H, IsHadamard H → AllFourBlocksHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H

/-- The precise remaining proof obligation after importing the published
Tao/Karlsson results and the finite-corner exhaustiveness theorem.  This is the
statement supplied by the exceptional-locus and block-swap argument. -/
def RetainedOutputReduction : Prop :=
  ∀ H : Mat6, IsHadamard H →
    InKnownExceptionalSector IsTao IsKarlsson H ∨
      ∃ (p : CornerData) (B C : Mat3),
        Retained p.matrix B C ∧ Equivalent H (completion p.matrix B C)

theorem retained_output_reduction_of_named_lemmas
    (hnew : NewProofInputs IsTao IsKarlsson) :
    RetainedOutputReduction IsTao IsKarlsson := by
  intro H hH
  by_cases hK : IsKarlsson H
  · exact Or.inl (Or.inl hK)
  rcases hnew.blockSwap H hH hK with hfinite | hfourier
  · rcases finiteCorner_hasRetainedOutput hfinite with
      ⟨p, B, C, hret, heq⟩
    exact Or.inr ⟨p, B, C, hret, heq⟩
  · exact Or.inl (hnew.fourierBlocks H hH hfourier)

/-- The routing conclusion uses the exact retained-output predicate. -/
theorem classification_of_retained_output_reduction
    (hreduction : RetainedOutputReduction IsTao IsKarlsson) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H := by
  intro H hH
  rcases hreduction H hH with hexceptional | ⟨p, B, C, hret, heq⟩
  · exact Or.inl hexceptional
  · exact Or.inr (mem_finiteCornerAtlas_of_retained hret heq)

theorem conditional_classification_of_named_lemmas
    (hnew : NewProofInputs IsTao IsKarlsson) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H :=
  classification_of_retained_output_reduction IsTao IsKarlsson
    (retained_output_reduction_of_named_lemmas
      IsTao IsKarlsson hnew)

/-- A more granular assembly theorem: the all-Fourier branch is obtained
from its coordinate-algebra output plus the two relevant published results.
Only the block-swap statement remains as a direct geometric input here. -/
theorem conditional_classification_of_blockSwap_and_fourier_algebra
    (pub : PublishedInputs IsTao IsKarlsson)
    (hblockSwap :
      ∀ H, IsHadamard H → ¬ IsKarlsson H →
        HasFiniteCorner H ∨ AllFourBlocksHadamard H)
    (hfourier : FourierBlockAlgebra) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H := by
  apply conditional_classification_of_named_lemmas IsTao IsKarlsson
  exact
    { blockSwap := hblockSwap
      fourierBlocks := fourierBlocks_classified IsTao IsKarlsson pub hfourier }

/-- The strongest current assembly theorem.  The entire exceptional-fibre,
dephasing, finite-corner, block-permutation, and block-swap argument is now
internal.  The only non-published remaining input is construction of the
simultaneous Fourier chart and its cyclic-convolution identities. -/
theorem conditional_classification_of_published_and_fourier_chart
    (pub : PublishedInputs IsTao IsKarlsson)
    (hchart : FourierChartReduction) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H := by
  exact conditional_classification_of_blockSwap_and_fourier_algebra
    IsTao IsKarlsson pub (blockSwap_from_published_inputs pub)
      (fourierBlockAlgebra_of_chart hchart)

/-- Concrete-chart variant of the final assembly theorem. -/
theorem conditional_classification_of_published_and_fourier_core
    (pub : PublishedInputs IsTao IsKarlsson)
    (hcore : FourierChartCoreReduction) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H :=
  conditional_classification_of_published_and_fourier_chart
    IsTao IsKarlsson pub (fourierChartReduction_of_core hcore)

/-- Final theorem at the intended published-proof boundary.  The only
additional input beyond `PublishedInputs` is the standard simultaneous
normalization of four Hadamard `3 x 3` blocks.  All Fourier coefficient,
autocorrelation, factor-allocation, and exceptional unmixed cases are proved
internally from that normal form. -/
theorem conditional_classification_of_published_and_normalization
    (pub : PublishedInputs IsTao IsKarlsson)
    (hnorm : FourierNormalizationReduction) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H :=
  conditional_classification_of_published_and_fourier_core
    IsTao IsKarlsson pub
      (fourierChartCoreReduction_of_normalization hnorm)

theorem conditional_classification_of_published_and_threeBlockNormalization
    (pub : PublishedInputs IsTao IsKarlsson)
    (hthree : FourierThreeBlockNormalizationReduction) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H :=
  conditional_classification_of_published_and_normalization
    IsTao IsKarlsson pub
      (fourierNormalizationReduction_of_threeBlocks hthree)

/-- **Principal classification theorem.**  Simultaneous Fourier normalization
is proved internally, so the single `PublishedInputs` value is the complete
external mathematical boundary. -/
theorem conditional_classification_of_published_inputs
    (pub : PublishedInputs IsTao IsKarlsson) :
    ∀ H : Mat6, IsHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H ∨
        InFiniteCornerAtlas H :=
  conditional_classification_of_published_and_threeBlockNormalization
    IsTao IsKarlsson pub simultaneous_threeBlockFourierNormalization

end Hadamard6
