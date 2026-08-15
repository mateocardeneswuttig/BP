import Hadamard6.Basic

/-!
# Geometric predicates occurring in the published inputs
-/

namespace Hadamard6

def HasHadamardTwoByTwo (H : Mat6) : Prop :=
  ∃ (rows cols : I2 ↪ I6),
    IsHadamard2 (H.submatrix rows cols)

def IsDephased (H : Mat6) : Prop :=
  (∀ j, H (Sum.inl 0) j = 1) ∧
  (∀ i, H i (Sum.inl 0) = 1)

def IsCubicRoot (z : ℂ) : Prop := z ^ 3 = 1

def HasNoninitialCubicRootRowAndColumn (H : Mat6) : Prop :=
  IsDephased H ∧
  (∃ i, i ≠ Sum.inl 0 ∧ ∀ j, IsCubicRoot (H i j)) ∧
  (∃ j, j ≠ Sum.inl 0 ∧ ∀ i, IsCubicRoot (H i j))

end Hadamard6
