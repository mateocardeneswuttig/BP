import Hadamard6.PhaseEquivalence

/-!
# Swapping the two block rows or block columns

This foundational file contains only the matrix permutations and their
Hadamard/equivalence properties.  It deliberately has no dependency on the
finite-corner classification or on any published input.
-/

namespace Hadamard6

def swapBlockSide : I6 ≃ I6 := Equiv.sumComm I3 I3

def swapBlockColumns (H : Mat6) : Mat6 :=
  fun i j ↦ H i (swapBlockSide j)

def swapBlockRows (H : Mat6) : Mat6 :=
  fun i j ↦ H (swapBlockSide i) j

theorem swapBlockColumns_isHadamard {H : Mat6} (hH : IsHadamard H) :
    IsHadamard (swapBlockColumns H) := by
  refine ⟨(fun i j ↦ hH.1 i (swapBlockSide j)), ?_⟩
  ext i j
  change (∑ k, H i (swapBlockSide k) * star (H j (swapBlockSide k))) = _
  calc
    (∑ k, H i (swapBlockSide k) * star (H j (swapBlockSide k))) =
        ∑ k, H i k * star (H j k) :=
      swapBlockSide.sum_comp (fun k ↦ H i k * star (H j k))
    _ = _ := congrArg (fun M : Mat6 ↦ M i j) hH.2

theorem swapBlockRows_isHadamard {H : Mat6} (hH : IsHadamard H) :
    IsHadamard (swapBlockRows H) := by
  refine ⟨(fun i j ↦ hH.1 (swapBlockSide i) j), ?_⟩
  ext i j
  change (H * Matrix.conjTranspose H) (swapBlockSide i)
      (swapBlockSide j) = ((6 : ℂ) • (1 : Mat6)) i j
  rw [hH.2]
  by_cases hij : i = j
  · subst j
    simp
  · have hswap : swapBlockSide i ≠ swapBlockSide j := by
      intro hs
      exact hij (swapBlockSide.injective hs)
    simp [hij, hswap]

theorem equivalent_swapBlockColumns (H : Mat6) :
    Equivalent H (swapBlockColumns H) := by
  refine ⟨Equiv.refl I6, swapBlockSide, (fun _ ↦ 1), (fun _ ↦ 1),
    (by intro i; norm_num), (by intro j; norm_num), ?_⟩
  intro i j
  simp [swapBlockColumns]

theorem equivalent_swapBlockRows (H : Mat6) :
    Equivalent H (swapBlockRows H) := by
  refine ⟨swapBlockSide, Equiv.refl I6, (fun _ ↦ 1), (fun _ ↦ 1),
    (by intro i; norm_num), (by intro j; norm_num), ?_⟩
  intro i j
  simp [swapBlockRows]

@[simp] theorem swapBlockColumns_toBlocks₁₁ (H : Mat6) :
    Matrix.toBlocks₁₁ (swapBlockColumns H) = Matrix.toBlocks₁₂ H := rfl

@[simp] theorem swapBlockColumns_toBlocks₁₂ (H : Mat6) :
    Matrix.toBlocks₁₂ (swapBlockColumns H) = Matrix.toBlocks₁₁ H := rfl

@[simp] theorem swapBlockColumns_toBlocks₂₁ (H : Mat6) :
    Matrix.toBlocks₂₁ (swapBlockColumns H) = Matrix.toBlocks₂₂ H := rfl

@[simp] theorem swapBlockColumns_toBlocks₂₂ (H : Mat6) :
    Matrix.toBlocks₂₂ (swapBlockColumns H) = Matrix.toBlocks₂₁ H := rfl

@[simp] theorem swapBlockRows_toBlocks₁₁ (H : Mat6) :
    Matrix.toBlocks₁₁ (swapBlockRows H) = Matrix.toBlocks₂₁ H := rfl

@[simp] theorem swapBlockRows_toBlocks₁₂ (H : Mat6) :
    Matrix.toBlocks₁₂ (swapBlockRows H) = Matrix.toBlocks₂₂ H := rfl

@[simp] theorem swapBlockRows_toBlocks₂₁ (H : Mat6) :
    Matrix.toBlocks₂₁ (swapBlockRows H) = Matrix.toBlocks₁₁ H := rfl

@[simp] theorem swapBlockRows_toBlocks₂₂ (H : Mat6) :
    Matrix.toBlocks₂₂ (swapBlockRows H) = Matrix.toBlocks₁₂ H := rfl

end Hadamard6
