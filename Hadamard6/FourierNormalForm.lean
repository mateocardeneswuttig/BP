import Hadamard6.FourierCoordinateAllocation
import Hadamard6.NormalizedBlockOpposite
import Hadamard6.FibreGauge

/-!
# Explicit simultaneous Fourier chart
-/

namespace Hadamard6

def fourier3 (ω : ℂ) : Mat3 :=
  fun i j ↦ ω ^ (i.val * j.val)

def fourierParameters (p q : ℂ) : I3 → ℂ
  | 0 => 1
  | 1 => p
  | 2 => q

def fourierNormalForm (ω p q r s : ℂ) (D : Mat3) : Mat6 :=
  Matrix.fromBlocks (fourier3 ω)
    (rowGauge (fourierParameters p q) (fourier3 ω))
    (columnGauge (fourierParameters r s) (fourier3 ω)) D

theorem cubic_mul {x y : ℂ}
    (hx : IsCubicRoot x) (hy : IsCubicRoot y) :
    IsCubicRoot (x * y) := by
  rw [IsCubicRoot, mul_pow, hx, hy, one_mul]

theorem cubic_pow {x : ℂ} (hx : IsCubicRoot x) (n : ℕ) :
    IsCubicRoot (x ^ n) := by
  rw [IsCubicRoot, ← pow_mul, show n * 3 = 3 * n by omega,
    pow_mul, hx, one_pow]

theorem fourierNormalForm_isDephased
    {ω p q r s : ℂ} {D : Mat3} :
    IsDephased (fourierNormalForm ω p q r s D) := by
  constructor
  · intro j
    rcases j with j | j
    · simp [fourierNormalForm, fourier3]
    · simp [fourierNormalForm, rowGauge, fourierParameters, fourier3]
  · intro i
    rcases i with i | i
    · simp [fourierNormalForm, fourier3]
    · simp [fourierNormalForm, columnGauge, rowGauge,
        fourierParameters, fourier3]

theorem fourierParameters_cubic
    {x y : ℂ} (hx : IsCubicRoot x) (hy : IsCubicRoot y) :
    ∀ i, IsCubicRoot (fourierParameters x y i) := by
  intro i
  fin_cases i
  · norm_num [fourierParameters, IsCubicRoot]
  · exact hx
  · exact hy

theorem fourierNormalForm_hasCubicRowAndColumn
    {ω p q r s : ℂ} {D : Mat3}
    (hω : IsCubicRoot ω) (hp : IsCubicRoot p)
    (_hq : IsCubicRoot q) (hr : IsCubicRoot r)
    (_hs : IsCubicRoot s) :
    HasNoninitialCubicRootRowAndColumn
      (fourierNormalForm ω p q r s D) := by
  refine ⟨fourierNormalForm_isDephased,
    ⟨Sum.inl 1, by simp, ?_⟩,
    ⟨Sum.inl 1, by simp, ?_⟩⟩
  · intro j
    rcases j with j | j
    · change IsCubicRoot (ω ^ (1 * j.val))
      exact cubic_pow hω _
    · change IsCubicRoot
        (rowGauge (fourierParameters p q) (fourier3 ω) 1 j)
      change IsCubicRoot
        (fourierParameters p q 1 * ω ^ (1 * j.val))
      exact cubic_mul (by simpa [fourierParameters] using hp)
        (cubic_pow hω _)
  · intro i
    rcases i with i | i
    · change IsCubicRoot (ω ^ (i.val * 1))
      exact cubic_pow hω _
    · change IsCubicRoot
        (columnGauge (fourierParameters r s) (fourier3 ω) i 1)
      change IsCubicRoot
        (fourierParameters r s 1 * ω ^ (i.val * 1))
      exact cubic_mul (by simpa [fourierParameters] using hr)
        (cubic_pow hω _)

theorem normalForm_equal_right_blocks_hasTwoByTwo
    {ω : ℂ} {C : Mat3} (hC : EntrywiseUnit C) :
    HasHadamardTwoByTwo (Matrix.fromBlocks
      (fourier3 ω) (fourier3 ω) C (-C)) := by
  let rows : I2 ↪ I6 := pairEmbedding (Sum.inl 0) (Sum.inr 0) (by simp)
  let cols : I2 ↪ I6 := pairEmbedding (Sum.inl 0) (Sum.inr 0) (by simp)
  refine ⟨rows, cols, ?_⟩
  have heq : (Matrix.fromBlocks (fourier3 ω) (fourier3 ω) C (-C)).submatrix
      rows cols = rowHadamard2 (C 0 0) := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [rows, cols, rowHadamard2, fourier3]
  rw [heq]
  exact rowHadamard2_isHadamard2 (hC 0 0)

end Hadamard6
