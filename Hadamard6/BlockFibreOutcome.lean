import Hadamard6.BlockOppositePair
import Hadamard6.BlockSwapCore

/-!
# Infinite block fibres produce the sign-core outcomes
-/

namespace Hadamard6

variable {IsTao IsKarlsson : Mat6 → Prop}

theorem topRight_infinite_fibre_outcome
    (pub : PublishedInputs IsTao IsKarlsson)
    {H : Mat6} (hH : IsHadamard H) (hdeph : IsDephased H)
    {G : Mat3}
    (hinf : (normalizedRowGramFibre G).Infinite)
    (hmem : Matrix.toBlocks₁₂ H ∈ normalizedRowGramFibre G)
    (hdet : (Matrix.toBlocks₁₂ H).det ≠ 0) :
    RowFibreOutcome IsKarlsson H (Matrix.toBlocks₁₂ H) := by
  rcases infinite_row_fibre_trichotomy hinf hmem hdet with
    hfour | hneg | hopp
  · exact Or.inl hfour
  · exact Or.inr (Or.inl hneg)
  · exact Or.inr (Or.inr (pub.twoByTwo_mem_karlsson H hH
      (topRight_oppositePair_hasHadamardTwoByTwo hH hdeph hopp)))

theorem topLeft_infinite_fibre_outcome
    (pub : PublishedInputs IsTao IsKarlsson)
    {H : Mat6} (hH : IsHadamard H) (hdeph : IsDephased H)
    {G : Mat3}
    (hinf : (normalizedRowGramFibre G).Infinite)
    (hmem : Matrix.toBlocks₁₁ H ∈ normalizedRowGramFibre G)
    (hdet : (Matrix.toBlocks₁₁ H).det ≠ 0) :
    RowFibreOutcome IsKarlsson H (Matrix.toBlocks₁₁ H) := by
  rcases infinite_row_fibre_trichotomy hinf hmem hdet with
    hfour | hneg | hopp
  · exact Or.inl hfour
  · exact Or.inr (Or.inl hneg)
  · exact Or.inr (Or.inr (pub.twoByTwo_mem_karlsson H hH
      (topLeft_oppositePair_hasHadamardTwoByTwo hH hdeph hopp)))

theorem bottomRight_infinite_column_fibre_outcome
    (pub : PublishedInputs IsTao IsKarlsson)
    {H : Mat6} (hH : IsHadamard H)
    (hfirst : ∀ i, Matrix.toBlocks₂₂ H i 0 = 1)
    {G : Mat3}
    (hinf : (normalizedColumnGramFibre G).Infinite)
    (hmem : Matrix.toBlocks₂₂ H ∈ normalizedColumnGramFibre G)
    (hdet : (Matrix.toBlocks₂₂ H).det ≠ 0) :
    ColumnFibreOutcome IsKarlsson H (Matrix.toBlocks₂₂ H) := by
  rcases infinite_column_fibre_trichotomy hinf hmem hdet with
    hfour | hneg | hopp
  · exact Or.inl hfour
  · exact Or.inr (Or.inl hneg)
  · exact Or.inr (Or.inr (pub.twoByTwo_mem_karlsson H hH
      (bottomRight_oppositeColumn_hasHadamardTwoByTwo hH hfirst hopp)))

end Hadamard6
