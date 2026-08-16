import Hadamard6.Blocks
import Hadamard6.CubicRoots
import Hadamard6.PublishedInputs

/-!
# Interface for the all-Fourier-block calculation

The remaining block calculation has one precise output: either it exposes a
Hadamard `2 x 2` submatrix, or it exposes a noninitial cubic-root row and
column.  The published classification inputs then finish this branch.
-/

namespace Hadamard6

variable (IsTao IsKarlsson : Mat6 → Prop)

/-- Exact formal boundary of the elementary Fourier-coordinate calculation.
It contains no classification conclusion. -/
structure FourierBlockAlgebra where
  reduce :
    ∀ H, IsHadamard H → AllFourBlocksHadamard H →
      HasHadamardTwoByTwo H ∨
        ∃ K, IsHadamard K ∧ Equivalent H K ∧
          HasNoninitialCubicRootRowAndColumn K

theorem fourierBlocks_classified
    (pub : PublishedInputs IsTao IsKarlsson)
    (fourier : FourierBlockAlgebra) :
    ∀ H, IsHadamard H → AllFourBlocksHadamard H →
      InKnownExceptionalSector IsTao IsKarlsson H := by
  intro H hH hfour
  rcases fourier.reduce H hH hfour with htwo |
      ⟨K, hK, heq, hcubic⟩
  · exact Or.inl (pub.twoByTwo_mem_karlsson H hH htwo)
  · exact PublishedInputs.cubicRoot_mem_knownExceptionalSector
      pub H K hH hK heq hcubic

end Hadamard6
