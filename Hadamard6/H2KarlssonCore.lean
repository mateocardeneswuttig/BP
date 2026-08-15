import Hadamard6.H2BlockNormalization
import Hadamard6.H2CoreCaseAnalysis
import Hadamard6.KarlssonMixedBlocks
import Mathlib.Tactic

/-!
# Karlsson core coordinates extracted from a canonical `H₂` presentation

This file introduces no coverage hypothesis.  It applies the inverse
order-two Fourier transforms to the four central blocks of an arbitrary
canonical `H₂` presentation and checks the corresponding reconstruction
identities entry by entry.  These are the intrinsic coordinates used in
Karlsson's finite core case analysis.
-/

namespace Hadamard6

noncomputable section

def h2Z₁ (K : Mat6) : ℂ := K (Sum.inl 1) h2Tail₀
def h2Z₂ (K : Mat6) : ℂ := K (Sum.inl 1) h2Tail₂
def h2Z₃ (K : Mat6) : ℂ := K h2Tail₀ (Sum.inl 1)
def h2Z₄ (K : Mat6) : ℂ := K h2Tail₂ (Sum.inl 1)

/-- Inverse block Fourier transform.  If `X = (1/2) Z_L M Z_R`, this
expression recovers `M`. -/
def h2InverseBlockTransform (zLeft zRight : ℂ) (X : Mat2) : Mat2 :=
  (1 / 2 : ℂ) •
    (Matrix.conjTranspose (karlssonZLeft zLeft) * X *
      Matrix.conjTranspose (karlssonZRight zRight))

def h2ParameterA (K : Mat6) : Mat2 :=
  h2InverseBlockTransform (h2Z₃ K) (h2Z₁ K) (h2CoreA K)

def h2ParameterB (K : Mat6) : Mat2 :=
  h2InverseBlockTransform (h2Z₃ K) (h2Z₂ K) (h2CoreB K)

def h2ParameterC (K : Mat6) : Mat2 :=
  h2InverseBlockTransform (h2Z₄ K) (h2Z₁ K) (h2CoreC K)

def h2ParameterD (K : Mat6) : Mat2 :=
  h2InverseBlockTransform (h2Z₄ K) (h2Z₂ K) (h2CoreD K)

/-- The canonical `H₂` skeleton is symmetric under transposition; the row
and column phase pairs simply exchange roles. -/
theorem h2CanonicalPresentation_transpose
    {K : Mat6} (h : H2CanonicalPresentation K) :
    H2CanonicalPresentation K.transpose where
  hadamard := by
    refine ⟨(fun i j ↦ h.hadamard.1 j i), ?_⟩
    have hcol := hadamard_column_gram h.hadamard
    ext i j
    have hij := congrArg (fun M : Mat6 ↦ M j i) hcol
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.transpose_apply, Matrix.smul_apply, Matrix.one_apply] at hij ⊢
    simpa [mul_comm, eq_comm] using hij
  dephased := ⟨h.dephased.2, h.dephased.1⟩
  leading_neg_one := h.leading_neg_one
  z₁_unit := h.z₃_unit
  z₂_unit := h.z₄_unit
  z₃_unit := h.z₁_unit
  z₄_unit := h.z₂_unit
  row_pair₁ := h.column_pair₁
  row_pair₂ := h.column_pair₂
  column_pair₁ := h.row_pair₁
  column_pair₂ := h.row_pair₂

theorem h2InverseBlockTransform_transpose
    (zLeft zRight : ℂ) (X : Mat2) :
    h2InverseBlockTransform zRight zLeft X.transpose =
      (h2InverseBlockTransform zLeft zRight X).transpose := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [h2InverseBlockTransform, karlssonZLeft, karlssonZRight,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two] <;>
    ring

private theorem h2CoreA_of_transpose (K : Mat6) :
    h2CoreA K.transpose = (h2CoreA K).transpose := by
  ext i j
  rfl

private theorem h2CoreB_of_transpose (K : Mat6) :
    h2CoreB K.transpose = (h2CoreC K).transpose := by
  ext i j
  rfl

private theorem h2CoreC_of_transpose (K : Mat6) :
    h2CoreC K.transpose = (h2CoreB K).transpose := by
  ext i j
  rfl

private theorem h2CoreD_of_transpose (K : Mat6) :
    h2CoreD K.transpose = (h2CoreD K).transpose := by
  ext i j
  rfl

theorem h2ParameterA_transpose (K : Mat6) :
    h2ParameterA K.transpose = (h2ParameterA K).transpose := by
  unfold h2ParameterA
  rw [h2CoreA_of_transpose]
  exact h2InverseBlockTransform_transpose (h2Z₃ K) (h2Z₁ K) (h2CoreA K)

theorem h2ParameterB_transpose (K : Mat6) :
    h2ParameterB K.transpose = (h2ParameterC K).transpose := by
  unfold h2ParameterB h2ParameterC
  rw [h2CoreB_of_transpose]
  exact h2InverseBlockTransform_transpose (h2Z₄ K) (h2Z₁ K) (h2CoreC K)

theorem h2ParameterC_transpose (K : Mat6) :
    h2ParameterC K.transpose = (h2ParameterB K).transpose := by
  unfold h2ParameterB h2ParameterC
  rw [h2CoreC_of_transpose]
  exact h2InverseBlockTransform_transpose (h2Z₃ K) (h2Z₂ K) (h2CoreB K)

theorem h2ParameterD_transpose (K : Mat6) :
    h2ParameterD K.transpose = (h2ParameterD K).transpose := by
  unfold h2ParameterD
  rw [h2CoreD_of_transpose]
  exact h2InverseBlockTransform_transpose (h2Z₄ K) (h2Z₂ K) (h2CoreD K)

theorem karlssonF2_transpose : karlssonF2.transpose = karlssonF2 := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

private theorem unit_mul_star_eq_one' {z : ℂ}
    (hz : Complex.normSq z = 1) : z * star z = 1 := by
  simpa [mul_comm] using star_mul_self_of_normSq_one hz

theorem karlssonZLeft_mul_conjTranspose
    {z : ℂ} (hz : Complex.normSq z = 1) :
    karlssonZLeft z * Matrix.conjTranspose (karlssonZLeft z) =
      (2 : ℂ) • (1 : Mat2) := by
  have hunit : z * (starRingEnd ℂ) z = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hz
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonZLeft, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two]
  all_goals rw [hunit]; norm_num

theorem karlssonZRight_conjTranspose_mul
    {z : ℂ} (hz : Complex.normSq z = 1) :
    Matrix.conjTranspose (karlssonZRight z) * karlssonZRight z =
      (2 : ℂ) • (1 : Mat2) := by
  have hunit : (starRingEnd ℂ) z * z = 1 :=
    star_mul_self_of_normSq_one hz
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonZRight, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two, hunit] <;>
    norm_num

theorem karlssonZRight_mul_conjTranspose
    {z : ℂ} (hz : Complex.normSq z = 1) :
    karlssonZRight z * Matrix.conjTranspose (karlssonZRight z) =
      (2 : ℂ) • (1 : Mat2) := by
  have hunit : z * (starRingEnd ℂ) z = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hz
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonZRight, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two, hunit] <;>
    norm_num

/-- Exact inverse-transform identity for a general order-two block. -/
theorem karlssonBlockProduct_inverseBlockTransform
    {zLeft zRight : ℂ} (X : Mat2)
    (hzLeft : Complex.normSq zLeft = 1)
    (hzRight : Complex.normSq zRight = 1) :
    karlssonBlockProduct zLeft
      (h2InverseBlockTransform zLeft zRight X) zRight = X := by
  have hLeft := karlssonZLeft_mul_conjTranspose hzLeft
  have hRight := karlssonZRight_conjTranspose_mul hzRight
  unfold karlssonBlockProduct h2InverseBlockTransform
  calc
    (1 / 2 : ℂ) •
        (karlssonZLeft zLeft *
          ((1 / 2 : ℂ) •
            (Matrix.conjTranspose (karlssonZLeft zLeft) * X *
              Matrix.conjTranspose (karlssonZRight zRight))) *
          karlssonZRight zRight) =
        (1 / 4 : ℂ) •
          ((karlssonZLeft zLeft *
              Matrix.conjTranspose (karlssonZLeft zLeft)) * X *
            (Matrix.conjTranspose (karlssonZRight zRight) *
              karlssonZRight zRight)) := by
          simp only [Matrix.mul_smul, Matrix.smul_mul, smul_smul]
          congr 1
          · norm_num
          · noncomm_ring
    _ = X := by
      rw [hLeft, hRight]
      ext i j
      fin_cases i <;> fin_cases j <;> norm_num <;> ring

theorem h2CoreA_reconstruct
    {K : Mat6} (h : H2CanonicalPresentation K) :
    karlssonBlockProduct (h2Z₃ K) (h2ParameterA K) (h2Z₁ K) =
      h2CoreA K := by
  exact karlssonBlockProduct_inverseBlockTransform _ h.z₃_unit h.z₁_unit

theorem h2CoreB_reconstruct
    {K : Mat6} (h : H2CanonicalPresentation K) :
    karlssonBlockProduct (h2Z₃ K) (h2ParameterB K) (h2Z₂ K) =
      h2CoreB K := by
  exact karlssonBlockProduct_inverseBlockTransform _ h.z₃_unit h.z₂_unit

theorem h2CoreC_reconstruct
    {K : Mat6} (h : H2CanonicalPresentation K) :
    karlssonBlockProduct (h2Z₄ K) (h2ParameterC K) (h2Z₁ K) =
      h2CoreC K := by
  exact karlssonBlockProduct_inverseBlockTransform _ h.z₄_unit h.z₁_unit

theorem h2CoreD_reconstruct
    {K : Mat6} (h : H2CanonicalPresentation K) :
    karlssonBlockProduct (h2Z₄ K) (h2ParameterD K) (h2Z₂ K) =
      h2CoreD K := by
  exact karlssonBlockProduct_inverseBlockTransform _ h.z₄_unit h.z₂_unit

/-- Entrywise unitarity of a Fourier-transformed block forces the row
orthogonality expression of its core to be real-orthogonal to the left
phase.  This is Karlsson's equation (3.13), isolated from coordinates. -/
theorem karlssonBlockProduct_row_real_constraint
    {zLeft zRight : ℂ} {M : Mat2}
    (hzRight : Complex.normSq zRight = 1)
    (hunit : EntrywiseUnit (karlssonBlockProduct zLeft M zRight)) :
    (zLeft * (M 1 0 * star (M 0 0) +
      M 1 1 * star (M 0 1))).re = 0 := by
  have h00 := unit_mul_star_eq_one' (hunit 0 0)
  have h01 := unit_mul_star_eq_one' (hunit 0 1)
  have h10 := unit_mul_star_eq_one' (hunit 1 0)
  have h11 := unit_mul_star_eq_one' (hunit 1 1)
  have hz : zRight * star zRight = 1 :=
    unit_mul_star_eq_one' hzRight
  have hsum :
      karlssonBlockProduct zLeft M zRight 0 0 *
          star (karlssonBlockProduct zLeft M zRight 0 0) +
        karlssonBlockProduct zLeft M zRight 0 1 *
          star (karlssonBlockProduct zLeft M zRight 0 1) -
        karlssonBlockProduct zLeft M zRight 1 0 *
          star (karlssonBlockProduct zLeft M zRight 1 0) -
        karlssonBlockProduct zLeft M zRight 1 1 *
          star (karlssonBlockProduct zLeft M zRight 1 1) = 0 := by
    linear_combination h00 + h01 - h10 - h11
  simp [karlssonBlockProduct, karlssonZLeft, karlssonZRight,
    Matrix.mul_apply, Matrix.vecMul, dotProduct,
    Fin.sum_univ_two] at hsum
  simp only [starRingEnd_apply] at hsum
  have hc : zLeft * (M 1 0 * star (M 0 0) +
      M 1 1 * star (M 0 1)) +
      star (zLeft * (M 1 0 * star (M 0 0) +
        M 1 1 * star (M 0 1))) = 0 := by
    simp only [star_add, star_mul, star_star]
    linear_combination hsum -
      (zLeft * M 1 1 * star (M 0 1) +
        M 0 1 * star (M 1 1) * star zLeft) * hz
  have hre := congrArg Complex.re hc
  simp only [Complex.add_re, Complex.zero_re] at hre
  have hstarre :
      (star (zLeft * (M 1 0 * star (M 0 0) +
        M 1 1 * star (M 0 1)))).re =
      (zLeft * (M 1 0 * star (M 0 0) +
        M 1 1 * star (M 0 1))).re := by
    simpa only [starRingEnd_apply] using
      Complex.conj_re (zLeft * (M 1 0 * star (M 0 0) +
        M 1 1 * star (M 0 1)))
  rw [hstarre] at hre
  linarith

theorem karlssonBlockProduct_transpose
    (zLeft zRight : ℂ) (M : Mat2) :
    (karlssonBlockProduct zLeft M zRight).transpose =
      karlssonBlockProduct zRight M.transpose zLeft := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonBlockProduct, karlssonZLeft, karlssonZRight,
      Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two] <;>
    ring

/-- Column version of the preceding constraint, i.e. Karlsson's equation
(3.14). -/
theorem karlssonBlockProduct_column_real_constraint
    {zLeft zRight : ℂ} {M : Mat2}
    (hzLeft : Complex.normSq zLeft = 1)
    (hunit : EntrywiseUnit (karlssonBlockProduct zLeft M zRight)) :
    (zRight * (M 0 1 * star (M 0 0) +
      M 1 1 * star (M 1 0))).re = 0 := by
  have hunitT : EntrywiseUnit
      (karlssonBlockProduct zRight M.transpose zLeft) := by
    rw [← karlssonBlockProduct_transpose]
    intro i j
    exact hunit j i
  simpa using
    (karlssonBlockProduct_row_real_constraint hzLeft hunitT)

/-- Checkerboard combination of the four unit-modulus equations, i.e.
Karlsson's equation (3.15). -/
theorem karlssonBlockProduct_diagonal_real_constraint
    {zLeft zRight : ℂ} {M : Mat2}
    (hunit : EntrywiseUnit (karlssonBlockProduct zLeft M zRight)) :
    (zLeft * zRight * M 1 1 * star (M 0 0) +
      zRight * star zLeft * M 0 1 * star (M 1 0)).re = 0 := by
  have h00 := unit_mul_star_eq_one' (hunit 0 0)
  have h01 := unit_mul_star_eq_one' (hunit 0 1)
  have h10 := unit_mul_star_eq_one' (hunit 1 0)
  have h11 := unit_mul_star_eq_one' (hunit 1 1)
  have hsum :
      karlssonBlockProduct zLeft M zRight 0 0 *
          star (karlssonBlockProduct zLeft M zRight 0 0) -
        karlssonBlockProduct zLeft M zRight 0 1 *
          star (karlssonBlockProduct zLeft M zRight 0 1) -
        karlssonBlockProduct zLeft M zRight 1 0 *
          star (karlssonBlockProduct zLeft M zRight 1 0) +
        karlssonBlockProduct zLeft M zRight 1 1 *
          star (karlssonBlockProduct zLeft M zRight 1 1) = 0 := by
    linear_combination h00 - h01 - h10 + h11
  simp [karlssonBlockProduct, karlssonZLeft, karlssonZRight,
    Matrix.mul_apply, Matrix.vecMul, dotProduct,
    Fin.sum_univ_two] at hsum
  simp only [starRingEnd_apply] at hsum
  have hw :
      (zLeft * zRight * M 1 1 * star (M 0 0) +
        zRight * star zLeft * M 0 1 * star (M 1 0)) +
      star (zLeft * zRight * M 1 1 * star (M 0 0) +
        zRight * star zLeft * M 0 1 * star (M 1 0)) = 0 := by
    simp only [star_add, star_mul, star_star]
    linear_combination hsum
  have hre := congrArg Complex.re hw
  simp only [Complex.add_re, Complex.zero_re] at hre
  have hstarre :
      (star (zLeft * zRight * M 1 1 * star (M 0 0) +
        zRight * star zLeft * M 0 1 * star (M 1 0))).re =
      (zLeft * zRight * M 1 1 * star (M 0 0) +
        zRight * star zLeft * M 0 1 * star (M 1 0)).re := by
    simpa only [starRingEnd_apply] using Complex.conj_re
      (zLeft * zRight * M 1 1 * star (M 0 0) +
        zRight * star zLeft * M 0 1 * star (M 1 0))
  rw [hstarre] at hre
  change
    (zLeft * zRight * M 1 1 * star (M 0 0) +
      zRight * star zLeft * M 0 1 * star (M 1 0)).re +
    (zLeft * zRight * M 1 1 * star (M 0 0) +
      zRight * star zLeft * M 0 1 * star (M 1 0)).re = 0 at hre
  linarith

theorem add_star_eq_zero_of_re_eq_zero {w : ℂ} (h : w.re = 0) :
    w + star w = 0 := by
  apply Complex.ext
  · simpa [Complex.star_def, h]
  · simp [Complex.star_def]

/-- The two order-two Fourier factors preserve the Frobenius norm on unit
phases.  Thus four unit entries in a transformed block give Karlsson's
equation (3.12) for its core. -/
theorem karlssonBlockProduct_core_norm_sum
    {zLeft zRight : ℂ} {M : Mat2}
    (hzLeft : Complex.normSq zLeft = 1)
    (hzRight : Complex.normSq zRight = 1)
    (hunit : EntrywiseUnit (karlssonBlockProduct zLeft M zRight)) :
    M 0 0 * star (M 0 0) + M 0 1 * star (M 0 1) +
      M 1 0 * star (M 1 0) + M 1 1 * star (M 1 1) = 4 := by
  have h00 := unit_mul_star_eq_one' (hunit 0 0)
  have h01 := unit_mul_star_eq_one' (hunit 0 1)
  have h10 := unit_mul_star_eq_one' (hunit 1 0)
  have h11 := unit_mul_star_eq_one' (hunit 1 1)
  have hzL : zLeft * star zLeft = 1 :=
    unit_mul_star_eq_one' hzLeft
  have hzR : zRight * star zRight = 1 :=
    unit_mul_star_eq_one' hzRight
  have hsum :
      karlssonBlockProduct zLeft M zRight 0 0 *
          star (karlssonBlockProduct zLeft M zRight 0 0) +
        karlssonBlockProduct zLeft M zRight 0 1 *
          star (karlssonBlockProduct zLeft M zRight 0 1) +
        karlssonBlockProduct zLeft M zRight 1 0 *
          star (karlssonBlockProduct zLeft M zRight 1 0) +
        karlssonBlockProduct zLeft M zRight 1 1 *
          star (karlssonBlockProduct zLeft M zRight 1 1) = 4 := by
    linear_combination h00 + h01 + h10 + h11
  simp [karlssonBlockProduct, karlssonZLeft, karlssonZRight,
    Matrix.mul_apply, Matrix.vecMul, dotProduct,
    Fin.sum_univ_two] at hsum
  simp only [starRingEnd_apply] at hsum
  linear_combination hsum -
    (M 0 1 * star (M 0 1) +
      M 1 1 * star (M 1 1) * (zLeft * star zLeft)) * hzR -
    (M 1 0 * star (M 1 0) + M 1 1 * star (M 1 1)) * hzL

/-- A scaled-unitary Karlsson core remains scaled unitary after the two
order-two phase Fourier factors. -/
theorem karlssonBlockProduct_rowGram
    {zLeft zRight : ℂ} {M : Mat2}
    (hzLeft : Complex.normSq zLeft = 1)
    (hzRight : Complex.normSq zRight = 1)
    (hM : M * Matrix.conjTranspose M = (2 : ℂ) • (1 : Mat2)) :
    karlssonBlockProduct zLeft M zRight *
        Matrix.conjTranspose (karlssonBlockProduct zLeft M zRight) =
      (2 : ℂ) • (1 : Mat2) := by
  have hL := karlssonZLeft_mul_conjTranspose hzLeft
  have hR := karlssonZRight_mul_conjTranspose hzRight
  unfold karlssonBlockProduct
  simp only [Matrix.conjTranspose_smul, Matrix.conjTranspose_mul,
    Matrix.mul_smul, Matrix.smul_mul, smul_smul]
  norm_num
  calc
    (1 / 4 : ℂ) •
        (karlssonZLeft zLeft * M * karlssonZRight zRight *
          (Matrix.conjTranspose (karlssonZRight zRight) *
            (Matrix.conjTranspose M *
              Matrix.conjTranspose (karlssonZLeft zLeft)))) =
      (1 / 4 : ℂ) •
        (karlssonZLeft zLeft * M *
          (karlssonZRight zRight *
            Matrix.conjTranspose (karlssonZRight zRight)) *
          Matrix.conjTranspose M *
          Matrix.conjTranspose (karlssonZLeft zLeft)) := by
            congr 1
            noncomm_ring
    _ = (1 / 2 : ℂ) •
        (karlssonZLeft zLeft *
          (M * Matrix.conjTranspose M) *
          Matrix.conjTranspose (karlssonZLeft zLeft)) := by
      rw [hR]
      simp only [Matrix.mul_smul, Matrix.smul_mul, smul_smul]
      congr 1
      · norm_num
      · noncomm_ring
    _ = karlssonZLeft zLeft *
        Matrix.conjTranspose (karlssonZLeft zLeft) := by
      rw [hM]
      simp only [Matrix.mul_smul, Matrix.smul_mul,
        Matrix.mul_one, smul_smul]
      norm_num
    _ = (2 : ℂ) • (1 : Mat2) := hL

/-- The first Karlsson linear relation, derived directly from the four row
orthogonality equations against the leading `F₂` rows. -/
theorem h2ParameterA_add_h2ParameterB
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2ParameterA K + h2ParameterB K = -karlssonF2 := by
  have h₂₀ := congrArg (fun M : Mat6 ↦ M h2Tail₀ (Sum.inl 0)) h.hadamard.2
  have h₃₀ := congrArg (fun M : Mat6 ↦ M h2Tail₁ (Sum.inl 0)) h.hadamard.2
  have h₂₁ := congrArg (fun M : Mat6 ↦ M h2Tail₀ (Sum.inl 1)) h.hadamard.2
  have h₃₁ := congrArg (fun M : Mat6 ↦ M h2Tail₁ (Sum.inl 1)) h.hadamard.2
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
    Fin.sum_univ_three] at h₂₀ h₃₀ h₂₁ h₃₁
  simp only [h2Tail₀, h2Tail₁] at h₂₀ h₃₀ h₂₁ h₃₁
  have hz₃ : (starRingEnd ℂ) (K (Sum.inl 2) (Sum.inl 1)) *
      K (Sum.inl 2) (Sum.inl 1) = 1 := by
    simpa [h2Tail₀] using star_mul_self_of_normSq_one h.z₃_unit
  have hc₁ : K (Sum.inr 0) (Sum.inl 1) =
      -K (Sum.inl 2) (Sum.inl 1) := by
    simpa [h2Tail₀, h2Tail₁] using h.column_pair₁
  have hr₁ : K (Sum.inl 1) (Sum.inr 0) =
      -K (Sum.inl 1) (Sum.inl 2) := by
    simpa [h2Tail₀, h2Tail₁] using h.row_pair₁
  have hr₂ : K (Sum.inl 1) (Sum.inr 2) =
      -K (Sum.inl 1) (Sum.inr 1) := by
    simpa [h2Tail₂, h2Tail₃] using h.row_pair₂
  rw [hc₁] at h₃₀ h₃₁
  rw [hr₁, hr₂] at h₂₁ h₃₁
  simp [h.dephased.1, h.dephased.2, h.leading_neg_one] at h₂₀ h₃₀ h₂₁ h₃₁
  ext i j
  fin_cases i <;> fin_cases j
  · simp [h2ParameterA, h2ParameterB, h2InverseBlockTransform,
      h2CoreA, h2CoreB, h2Z₁, h2Z₂, h2Z₃,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination (1 / 2 : ℂ) * h₂₀ + (1 / 2 : ℂ) * h₃₀
  · simp [h2ParameterA, h2ParameterB, h2InverseBlockTransform,
      h2CoreA, h2CoreB, h2Z₁, h2Z₂, h2Z₃,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination (1 / 2 : ℂ) * h₂₁ + (1 / 2 : ℂ) * h₃₁
  · simp [h2ParameterA, h2ParameterB, h2InverseBlockTransform,
      h2CoreA, h2CoreB, h2Z₁, h2Z₂, h2Z₃,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination
      ((starRingEnd ℂ) (K (Sum.inl 2) (Sum.inl 1)) / 2) * h₂₀ -
      ((starRingEnd ℂ) (K (Sum.inl 2) (Sum.inl 1)) / 2) * h₃₀ - hz₃
  · simp [h2ParameterA, h2ParameterB, h2InverseBlockTransform,
      h2CoreA, h2CoreB, h2Z₁, h2Z₂, h2Z₃,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination
      ((starRingEnd ℂ) (K (Sum.inl 2) (Sum.inl 1)) / 2) * h₂₁ -
      ((starRingEnd ℂ) (K (Sum.inl 2) (Sum.inl 1)) / 2) * h₃₁ + hz₃

/-- The same row-orthogonality calculation on the second paired tail gives
the second horizontal Karlsson relation. -/
theorem h2ParameterC_add_h2ParameterD
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2ParameterC K + h2ParameterD K = -karlssonF2 := by
  have h₄₀ := congrArg (fun M : Mat6 ↦ M h2Tail₂ (Sum.inl 0)) h.hadamard.2
  have h₅₀ := congrArg (fun M : Mat6 ↦ M h2Tail₃ (Sum.inl 0)) h.hadamard.2
  have h₄₁ := congrArg (fun M : Mat6 ↦ M h2Tail₂ (Sum.inl 1)) h.hadamard.2
  have h₅₁ := congrArg (fun M : Mat6 ↦ M h2Tail₃ (Sum.inl 1)) h.hadamard.2
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
    Fin.sum_univ_three] at h₄₀ h₅₀ h₄₁ h₅₁
  simp only [h2Tail₂, h2Tail₃] at h₄₀ h₅₀ h₄₁ h₅₁
  have hz₄ : (starRingEnd ℂ) (K (Sum.inr 1) (Sum.inl 1)) *
      K (Sum.inr 1) (Sum.inl 1) = 1 := by
    simpa [h2Tail₂] using star_mul_self_of_normSq_one h.z₄_unit
  have hc₂ : K (Sum.inr 2) (Sum.inl 1) =
      -K (Sum.inr 1) (Sum.inl 1) := by
    simpa [h2Tail₂, h2Tail₃] using h.column_pair₂
  have hr₁ : K (Sum.inl 1) (Sum.inr 0) =
      -K (Sum.inl 1) (Sum.inl 2) := by
    simpa [h2Tail₀, h2Tail₁] using h.row_pair₁
  have hr₂ : K (Sum.inl 1) (Sum.inr 2) =
      -K (Sum.inl 1) (Sum.inr 1) := by
    simpa [h2Tail₂, h2Tail₃] using h.row_pair₂
  rw [hc₂] at h₅₀ h₅₁
  rw [hr₁, hr₂] at h₄₁ h₅₁
  simp [h.dephased.1, h.dephased.2, h.leading_neg_one] at h₄₀ h₅₀ h₄₁ h₅₁
  ext i j
  fin_cases i <;> fin_cases j
  · simp [h2ParameterC, h2ParameterD, h2InverseBlockTransform,
      h2CoreC, h2CoreD, h2Z₁, h2Z₂, h2Z₄,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination (1 / 2 : ℂ) * h₄₀ + (1 / 2 : ℂ) * h₅₀
  · simp [h2ParameterC, h2ParameterD, h2InverseBlockTransform,
      h2CoreC, h2CoreD, h2Z₁, h2Z₂, h2Z₄,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination (1 / 2 : ℂ) * h₄₁ + (1 / 2 : ℂ) * h₅₁
  · simp [h2ParameterC, h2ParameterD, h2InverseBlockTransform,
      h2CoreC, h2CoreD, h2Z₁, h2Z₂, h2Z₄,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination
      ((starRingEnd ℂ) (K (Sum.inr 1) (Sum.inl 1)) / 2) * h₄₀ -
      ((starRingEnd ℂ) (K (Sum.inr 1) (Sum.inl 1)) / 2) * h₅₀ - hz₄
  · simp [h2ParameterC, h2ParameterD, h2InverseBlockTransform,
      h2CoreC, h2CoreD, h2Z₁, h2Z₂, h2Z₄,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      karlssonZLeft, karlssonZRight, karlssonF2,
      Matrix.mul_apply, Matrix.conjTranspose_apply, Fin.sum_univ_two]
    linear_combination
      ((starRingEnd ℂ) (K (Sum.inr 1) (Sum.inl 1)) / 2) * h₄₁ -
      ((starRingEnd ℂ) (K (Sum.inr 1) (Sum.inl 1)) / 2) * h₅₁ + hz₄

/-- Transposing the first horizontal relation gives the first vertical
Karlsson relation. -/
theorem h2ParameterA_add_h2ParameterC
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2ParameterA K + h2ParameterC K = -karlssonF2 := by
  have ht := h2ParameterA_add_h2ParameterB
    (h2CanonicalPresentation_transpose h)
  rw [h2ParameterA_transpose, h2ParameterB_transpose] at ht
  have htt := congrArg Matrix.transpose ht
  simpa [karlssonF2_transpose] using htt

/-- Transposing the second horizontal relation gives the second vertical
Karlsson relation. -/
theorem h2ParameterB_add_h2ParameterD
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2ParameterB K + h2ParameterD K = -karlssonF2 := by
  have ht := h2ParameterC_add_h2ParameterD
    (h2CanonicalPresentation_transpose h)
  rw [h2ParameterC_transpose, h2ParameterD_transpose] at ht
  have htt := congrArg Matrix.transpose ht
  simpa [karlssonF2_transpose] using htt

/-- The four extracted core matrices therefore collapse to Karlsson's two
cores: opposite diagonal blocks agree. -/
theorem h2ParameterD_eq_h2ParameterA
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2ParameterD K = h2ParameterA K := by
  have hAB := h2ParameterA_add_h2ParameterB h
  have hBD := h2ParameterB_add_h2ParameterD h
  ext i j
  have hABij := congrArg (fun M : Mat2 ↦ M i j) hAB
  have hBDij := congrArg (fun M : Mat2 ↦ M i j) hBD
  simp only [Matrix.add_apply, Matrix.neg_apply] at hABij hBDij
  linear_combination hBDij - hABij

theorem h2ParameterC_eq_h2ParameterB
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2ParameterC K = h2ParameterB K := by
  have hAC := h2ParameterA_add_h2ParameterC h
  have hAB := h2ParameterA_add_h2ParameterB h
  ext i j
  have hACij := congrArg (fun M : Mat2 ↦ M i j) hAC
  have hABij := congrArg (fun M : Mat2 ↦ M i j) hAB
  simp only [Matrix.add_apply, Matrix.neg_apply] at hACij hABij
  linear_combination hACij - hABij

private theorem h2CoreA_entrywiseUnit
    {K : Mat6} (h : H2CanonicalPresentation K) :
    EntrywiseUnit (h2CoreA K) :=
  fun i j ↦ h.hadamard.1 (h2TailPairFirst i) (h2TailPairFirst j)

private theorem h2CoreB_entrywiseUnit
    {K : Mat6} (h : H2CanonicalPresentation K) :
    EntrywiseUnit (h2CoreB K) :=
  fun i j ↦ h.hadamard.1 (h2TailPairFirst i) (h2TailPairSecond j)

private theorem h2CoreC_entrywiseUnit
    {K : Mat6} (h : H2CanonicalPresentation K) :
    EntrywiseUnit (h2CoreC K) :=
  fun i j ↦ h.hadamard.1 (h2TailPairSecond i) (h2TailPairFirst j)

private theorem h2CoreD_entrywiseUnit
    {K : Mat6} (h : H2CanonicalPresentation K) :
    EntrywiseUnit (h2CoreD K) :=
  fun i j ↦ h.hadamard.1 (h2TailPairSecond i) (h2TailPairSecond j)

theorem h2ParameterA_norm_sum
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2ParameterA K 0 0 * star (h2ParameterA K 0 0) +
      h2ParameterA K 0 1 * star (h2ParameterA K 0 1) +
      h2ParameterA K 1 0 * star (h2ParameterA K 1 0) +
      h2ParameterA K 1 1 * star (h2ParameterA K 1 1) = 4 := by
  have hunit : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterA K) (h2Z₁ K)) := by
    rw [h2CoreA_reconstruct h]
    exact h2CoreA_entrywiseUnit h
  exact karlssonBlockProduct_core_norm_sum h.z₃_unit h.z₁_unit hunit

/-- Generic left-phase branch of Karlsson's core case split. -/
theorem h2ParameterA_row_cross_eq_zero_of_left_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hne : h2Z₄ K ≠ h2Z₃ K ∧ h2Z₄ K ≠ -h2Z₃ K) :
    h2ParameterA K 1 0 * star (h2ParameterA K 0 0) +
      h2ParameterA K 1 1 * star (h2ParameterA K 0 1) = 0 := by
  have hunitA : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterA K) (h2Z₁ K)) := by
    rw [h2CoreA_reconstruct h]
    exact h2CoreA_entrywiseUnit h
  have hunitD : EntrywiseUnit
      (karlssonBlockProduct (h2Z₄ K) (h2ParameterD K) (h2Z₂ K)) := by
    rw [h2CoreD_reconstruct h]
    exact h2CoreD_entrywiseUnit h
  have h₃ := karlssonBlockProduct_row_real_constraint h.z₁_unit hunitA
  have h₄ := karlssonBlockProduct_row_real_constraint h.z₂_unit hunitD
  rw [h2ParameterD_eq_h2ParameterA h] at h₄
  exact two_unit_real_mul_zero h.z₃_unit h.z₄_unit hne h₃ h₄

/-- Generic right-phase branch of Karlsson's core case split. -/
theorem h2ParameterA_column_cross_eq_zero_of_right_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hne : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    h2ParameterA K 0 1 * star (h2ParameterA K 0 0) +
      h2ParameterA K 1 1 * star (h2ParameterA K 1 0) = 0 := by
  have hunitA : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterA K) (h2Z₁ K)) := by
    rw [h2CoreA_reconstruct h]
    exact h2CoreA_entrywiseUnit h
  have hunitD : EntrywiseUnit
      (karlssonBlockProduct (h2Z₄ K) (h2ParameterD K) (h2Z₂ K)) := by
    rw [h2CoreD_reconstruct h]
    exact h2CoreD_entrywiseUnit h
  have h₁ := karlssonBlockProduct_column_real_constraint h.z₃_unit hunitA
  have h₂ := karlssonBlockProduct_column_real_constraint h.z₄_unit hunitD
  rw [h2ParameterD_eq_h2ParameterA h] at h₂
  exact two_unit_real_mul_zero h.z₁_unit h.z₂_unit hne h₁ h₂

theorem h2ParameterB_row_cross_eq_zero_of_left_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hne : h2Z₄ K ≠ h2Z₃ K ∧ h2Z₄ K ≠ -h2Z₃ K) :
    h2ParameterB K 1 0 * star (h2ParameterB K 0 0) +
      h2ParameterB K 1 1 * star (h2ParameterB K 0 1) = 0 := by
  have hunitB : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterB K) (h2Z₂ K)) := by
    rw [h2CoreB_reconstruct h]
    exact h2CoreB_entrywiseUnit h
  have hunitC : EntrywiseUnit
      (karlssonBlockProduct (h2Z₄ K) (h2ParameterC K) (h2Z₁ K)) := by
    rw [h2CoreC_reconstruct h]
    exact h2CoreC_entrywiseUnit h
  have h₃ := karlssonBlockProduct_row_real_constraint h.z₂_unit hunitB
  have h₄ := karlssonBlockProduct_row_real_constraint h.z₁_unit hunitC
  rw [h2ParameterC_eq_h2ParameterB h] at h₄
  exact two_unit_real_mul_zero h.z₃_unit h.z₄_unit hne h₃ h₄

theorem h2ParameterB_column_cross_eq_zero_of_right_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hne : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    h2ParameterB K 0 1 * star (h2ParameterB K 0 0) +
      h2ParameterB K 1 1 * star (h2ParameterB K 1 0) = 0 := by
  have hunitB : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterB K) (h2Z₂ K)) := by
    rw [h2CoreB_reconstruct h]
    exact h2CoreB_entrywiseUnit h
  have hunitC : EntrywiseUnit
      (karlssonBlockProduct (h2Z₄ K) (h2ParameterC K) (h2Z₁ K)) := by
    rw [h2CoreC_reconstruct h]
    exact h2CoreC_entrywiseUnit h
  have h₂ := karlssonBlockProduct_column_real_constraint h.z₃_unit hunitB
  have h₁ := karlssonBlockProduct_column_real_constraint h.z₄_unit hunitC
  rw [h2ParameterC_eq_h2ParameterB h] at h₁
  have hne' : h2Z₁ K ≠ h2Z₂ K ∧ h2Z₁ K ≠ -h2Z₂ K := by
    constructor
    · exact Ne.symm hne.1
    · intro he
      apply hne.2
      rw [he]
      ring
  exact two_unit_real_mul_zero h.z₂_unit h.z₁_unit hne' h₂ h₁

/-- In the one-degenerate branch, the checkerboard modulus identities at the
two nonparallel right phases force Karlsson's complex diagonal equation. -/
theorem h2ParameterA_diagonal_eq_zero_of_right_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K ∨ h2Z₄ K = -h2Z₃ K)
    (hright : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    h2Z₃ K * h2ParameterA K 1 1 * star (h2ParameterA K 0 0) +
      star (h2Z₃ K) * h2ParameterA K 0 1 *
        star (h2ParameterA K 1 0) = 0 := by
  let w : ℂ :=
    h2Z₃ K * h2ParameterA K 1 1 * star (h2ParameterA K 0 0) +
      star (h2Z₃ K) * h2ParameterA K 0 1 *
        star (h2ParameterA K 1 0)
  have hunitA : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterA K) (h2Z₁ K)) := by
    rw [h2CoreA_reconstruct h]
    exact h2CoreA_entrywiseUnit h
  have hunitD : EntrywiseUnit
      (karlssonBlockProduct (h2Z₄ K) (h2ParameterD K) (h2Z₂ K)) := by
    rw [h2CoreD_reconstruct h]
    exact h2CoreD_entrywiseUnit h
  have h₁raw := karlssonBlockProduct_diagonal_real_constraint hunitA
  have h₂raw := karlssonBlockProduct_diagonal_real_constraint hunitD
  rw [h2ParameterD_eq_h2ParameterA h] at h₂raw
  have h₁ : (h2Z₁ K * w).re = 0 := by
    dsimp [w]
    simp only [starRingEnd_apply]
    convert h₁raw using 1 <;> ring
  have h₂ : (h2Z₂ K * w).re = 0 := by
    rcases hleft with heq | heq
    · rw [heq] at h₂raw
      dsimp [w]
      simp only [starRingEnd_apply]
      convert h₂raw using 1 <;> ring
    · rw [heq] at h₂raw
      simp only [star_neg] at h₂raw
      have hexpr :
          -h2Z₃ K * h2Z₂ K * h2ParameterA K 1 1 *
              star (h2ParameterA K 0 0) +
            h2Z₂ K * -star (h2Z₃ K) * h2ParameterA K 0 1 *
              star (h2ParameterA K 1 0) = -(h2Z₂ K * w) := by
        dsimp [w]
        ring
      rw [hexpr] at h₂raw
      simpa only [Complex.neg_re, neg_eq_zero] using h₂raw
  exact two_unit_real_mul_zero h.z₁_unit h.z₂_unit hright h₁ h₂

theorem h2ParameterB_diagonal_eq_zero_of_right_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K ∨ h2Z₄ K = -h2Z₃ K)
    (hright : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    h2Z₃ K * h2ParameterB K 1 1 * star (h2ParameterB K 0 0) +
      star (h2Z₃ K) * h2ParameterB K 0 1 *
        star (h2ParameterB K 1 0) = 0 := by
  let w : ℂ :=
    h2Z₃ K * h2ParameterB K 1 1 * star (h2ParameterB K 0 0) +
      star (h2Z₃ K) * h2ParameterB K 0 1 *
        star (h2ParameterB K 1 0)
  have hunitB : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterB K) (h2Z₂ K)) := by
    rw [h2CoreB_reconstruct h]
    exact h2CoreB_entrywiseUnit h
  have hunitC : EntrywiseUnit
      (karlssonBlockProduct (h2Z₄ K) (h2ParameterC K) (h2Z₁ K)) := by
    rw [h2CoreC_reconstruct h]
    exact h2CoreC_entrywiseUnit h
  have h₂raw := karlssonBlockProduct_diagonal_real_constraint hunitB
  have h₁raw := karlssonBlockProduct_diagonal_real_constraint hunitC
  rw [h2ParameterC_eq_h2ParameterB h] at h₁raw
  have h₂ : (h2Z₂ K * w).re = 0 := by
    dsimp [w]
    simp only [starRingEnd_apply]
    convert h₂raw using 1 <;> ring
  have h₁ : (h2Z₁ K * w).re = 0 := by
    rcases hleft with heq | heq
    · rw [heq] at h₁raw
      dsimp [w]
      simp only [starRingEnd_apply]
      convert h₁raw using 1 <;> ring
    · rw [heq] at h₁raw
      simp only [star_neg] at h₁raw
      have hexpr :
          -h2Z₃ K * h2Z₁ K * h2ParameterB K 1 1 *
              star (h2ParameterB K 0 0) +
            h2Z₁ K * -star (h2Z₃ K) * h2ParameterB K 0 1 *
              star (h2ParameterB K 1 0) = -(h2Z₁ K * w) := by
        dsimp [w]
        ring
      rw [hexpr] at h₁raw
      simpa only [Complex.neg_re, neg_eq_zero] using h₁raw
  have hright' : h2Z₁ K ≠ h2Z₂ K ∧ h2Z₁ K ≠ -h2Z₂ K := by
    constructor
    · exact Ne.symm hright.1
    · intro he
      apply hright.2
      rw [he]
      ring
  exact two_unit_real_mul_zero h.z₂_unit h.z₁_unit hright' h₂ h₁

/-- A compact polynomial certificate for Karlsson's generic core step.  The
certificate uses `X + Y = -F₂`, the Frobenius norm of `X`, both cross
relations for `X`, and the row cross relation for `Y`. -/
theorem first_core_rowGram_of_karlsson_relations
    {X Y : Mat2}
    (hsum : X + Y = -karlssonF2)
    (hnorm : X 0 0 * star (X 0 0) + X 0 1 * star (X 0 1) +
      X 1 0 * star (X 1 0) + X 1 1 * star (X 1 1) = 4)
    (hXrow : X 1 0 * star (X 0 0) + X 1 1 * star (X 0 1) = 0)
    (hXcol : X 0 1 * star (X 0 0) + X 1 1 * star (X 1 0) = 0)
    (hYrow : Y 1 0 * star (Y 0 0) + Y 1 1 * star (Y 0 1) = 0) :
    X * Matrix.conjTranspose X = (2 : ℂ) • (1 : Mat2) := by
  have h00 := congrArg (fun M : Mat2 ↦ M 0 0) hsum
  have h01 := congrArg (fun M : Mat2 ↦ M 0 1) hsum
  have h10 := congrArg (fun M : Mat2 ↦ M 1 0) hsum
  have h11 := congrArg (fun M : Mat2 ↦ M 1 1) hsum
  simp [karlssonF2] at h00 h01 h10 h11
  have hXrowStar := congrArg star hXrow
  have hXcolStar := congrArg star hXcol
  have hYrowStar := congrArg star hYrow
  simp only [star_add, star_mul, star_star, star_zero] at hXrowStar
  simp only [star_add, star_mul, star_star, star_zero] at hXcolStar
  simp only [star_add, star_mul, star_star, star_zero] at hYrowStar
  have hY00 : Y 0 0 = -1 - X 0 0 := by linear_combination h00
  have hY01 : Y 0 1 = -1 - X 0 1 := by linear_combination h01
  have hY10 : Y 1 0 = -1 - X 1 0 := by linear_combination h10
  have hY11 : Y 1 1 = 1 - X 1 1 := by linear_combination h11
  rw [hY00, hY01, hY10, hY11] at hYrow hYrowStar
  simp only [star_sub, star_neg, star_one] at hYrow hYrowStar
  have hdiag0 :
      X 0 0 * star (X 0 0) + X 0 1 * star (X 0 1) = 2 := by
    linear_combination
      ((star (X 1 0) + star (X 1 1)) / 2) * hXrow +
      (1 / 2 : ℂ) * hXcol -
      ((star (X 0 0) - star (X 0 1)) / 2) * hXrowStar +
      (1 / 2 : ℂ) * hXcolStar -
      ((star (X 1 0) + star (X 1 1)) / 2) * hYrow +
      ((star (X 0 0) - star (X 0 1)) / 2) * hYrowStar +
      (1 / 2 : ℂ) * hnorm
  have hdiag1 :
      X 1 0 * star (X 1 0) + X 1 1 * star (X 1 1) = 2 := by
    linear_combination hnorm - hdiag0
  have hXrowStar' :
      X 0 0 * star (X 1 0) + X 0 1 * star (X 1 1) = 0 := by
    linear_combination hXrowStar
  ext i j
  fin_cases i <;> fin_cases j
  · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two] using hdiag0
  · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two] using hXrowStar'
  · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two] using hXrow
  · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two] using hdiag1

/-- Exact one-degenerate core lemma.  This packages Karlsson's Case 2 into
the two factors in (3.26), but closes the apparently exceptional factor by
unit-phase algebra rather than a real/imaginary subcase table. -/
theorem first_core_rowGram_of_one_degenerate_relations
    {X Y : Mat2} {z : ℂ}
    (hz : Complex.normSq z = 1)
    (hsum : X + Y = -karlssonF2)
    (hnorm : X 0 0 * star (X 0 0) + X 0 1 * star (X 0 1) +
      X 1 0 * star (X 1 0) + X 1 1 * star (X 1 1) = 4)
    (hXcol : X 0 1 * star (X 0 0) + X 1 1 * star (X 1 0) = 0)
    (hYcol : Y 0 1 * star (Y 0 0) + Y 1 1 * star (Y 1 0) = 0)
    (hXdiag : z * X 1 1 * star (X 0 0) +
      star z * X 0 1 * star (X 1 0) = 0)
    (hYdiag : z * Y 1 1 * star (Y 0 0) +
      star z * Y 0 1 * star (Y 1 0) = 0)
    (hXrowReal :
      z * (X 1 0 * star (X 0 0) + X 1 1 * star (X 0 1)) +
        star (z * (X 1 0 * star (X 0 0) +
          X 1 1 * star (X 0 1))) = 0) :
    X * Matrix.conjTranspose X = (2 : ℂ) • (1 : Mat2) := by
  have h00 := congrArg (fun M : Mat2 ↦ M 0 0) hsum
  have h01 := congrArg (fun M : Mat2 ↦ M 0 1) hsum
  have h10 := congrArg (fun M : Mat2 ↦ M 1 0) hsum
  have h11 := congrArg (fun M : Mat2 ↦ M 1 1) hsum
  simp [karlssonF2] at h00 h01 h10 h11
  have hY00 : Y 0 0 = -1 - X 0 0 := by linear_combination h00
  have hY01 : Y 0 1 = -1 - X 0 1 := by linear_combination h01
  have hY10 : Y 1 0 = -1 - X 1 0 := by linear_combination h10
  have hY11 : Y 1 1 = 1 - X 1 1 := by linear_combination h11
  rw [hY00, hY01, hY10, hY11] at hYcol hYdiag
  simp only [star_sub, star_neg, star_one] at hYcol hYdiag
  have h24 :
      star (X 0 0) + X 1 1 + X 0 1 - star (X 1 0) = 0 := by
    linear_combination hYcol - hXcol
  have h25 :
      z * (X 1 1 - 1) * (star (X 0 0) + 1) +
        star z * (X 0 1 + 1) * (star (X 1 0) + 1) = 0 := by
    linear_combination hYdiag
  have h26 :
      (star (X 0 0) - star (X 1 0)) *
        (X 0 1 - star (X 1 0)) = 0 := by
    linear_combination hXcol - star (X 1 0) * h24
  have h27 :
      z * (X 1 1 - star (X 0 0) - 1) +
        star z * (X 0 1 + star (X 1 0) + 1) = 0 := by
    linear_combination h25 - hXdiag
  rcases mul_eq_zero.mp h26 with hsameStar | hconjugate
  · have hac : X 1 0 = X 0 0 := by
      apply star_injective
      exact (sub_eq_zero.mp hsameStar).symm
    have hbd : X 0 1 = -X 1 1 := by
      rw [hac] at h24
      linear_combination h24
    have hnorm2 :
        X 0 0 * star (X 0 0) + X 1 1 * star (X 1 1) = 2 := by
      rw [hac, hbd] at hnorm
      simp only [star_neg] at hnorm
      linear_combination (1 / 2 : ℂ) * hnorm
    have hrealProduct :
        (X 0 0 * star (X 0 0) - X 1 1 * star (X 1 1)) *
          (z + star z) = 0 := by
      rw [hac, hbd] at hXrowReal
      simp only [star_neg, star_add, star_mul, star_star] at hXrowReal
      linear_combination hXrowReal
    have himagProduct :
        X 1 1 * star (X 0 0) * (z - star z) = 0 := by
      rw [hac, hbd] at hXdiag
      linear_combination hXdiag
    have hlink :
        (z - star z) * (X 1 1 - star (X 0 0) - 1) = 0 := by
      rw [hac, hbd] at h27
      linear_combination h27
    have hnormEq :
        X 0 0 * star (X 0 0) = X 1 1 * star (X 1 1) := by
      by_cases hsumz : z + star z = 0
      · have hdiffz : z - star z ≠ 0 := by
          intro hdiffz
          have hz0 : z = 0 := by linear_combination (1 / 2 : ℂ) * hsumz +
            (1 / 2 : ℂ) * hdiffz
          exact (ne_zero_of_normSq_eq_one hz) hz0
        have hda : X 1 1 * star (X 0 0) = 0 :=
          (mul_eq_zero.mp himagProduct).resolve_right hdiffz
        have hrelation : X 1 1 - star (X 0 0) - 1 = 0 :=
          (mul_eq_zero.mp hlink).resolve_left hdiffz
        rcases mul_eq_zero.mp hda with hd0 | hsa0
        · have hsa : star (X 0 0) = -1 := by
            rw [hd0] at hrelation
            linear_combination -hrelation
          have ha : X 0 0 = -1 := by
            apply star_injective
            simpa [hsa]
          rw [ha, hd0] at hnorm2
          norm_num at hnorm2
        · have ha0 : X 0 0 = 0 := star_eq_zero.mp hsa0
          have hd1 : X 1 1 = 1 := by
            rw [hsa0] at hrelation
            linear_combination hrelation
          rw [ha0, hd1] at hnorm2
          norm_num at hnorm2
      · exact sub_eq_zero.mp
          ((mul_eq_zero.mp hrealProduct).resolve_right hsumz)
    have hdiag0 :
        X 0 0 * star (X 0 0) + X 0 1 * star (X 0 1) = 2 := by
      rw [hbd]
      simp only [star_neg]
      linear_combination hnorm2
    have hdiag1 :
        X 1 0 * star (X 1 0) + X 1 1 * star (X 1 1) = 2 := by
      rw [hac]
      linear_combination hnorm2
    have hrow :
        X 1 0 * star (X 0 0) + X 1 1 * star (X 0 1) = 0 := by
      rw [hac, hbd]
      simp only [star_neg]
      linear_combination hnormEq
    have hrowStar := congrArg star hrow
    simp only [star_add, star_mul, star_star, star_zero] at hrowStar
    ext i j
    fin_cases i <;> fin_cases j
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hdiag0
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hrowStar
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hrow
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hdiag1
  · have hb : X 0 1 = star (X 1 0) := sub_eq_zero.mp hconjugate
    have hc : X 1 0 = star (X 0 1) := by
      apply star_injective
      simpa [hb]
    have hd : X 1 1 = -star (X 0 0) := by
      rw [hb] at h24
      linear_combination h24
    have hdiag0 :
        X 0 0 * star (X 0 0) + X 0 1 * star (X 0 1) = 2 := by
      rw [hb, hc, hd] at hnorm
      simp only [star_star, star_neg] at hnorm
      linear_combination (1 / 2 : ℂ) * hnorm
    have hdiag1 :
        X 1 0 * star (X 1 0) + X 1 1 * star (X 1 1) = 2 := by
      rw [hc, hd]
      simp only [star_star, star_neg]
      linear_combination hdiag0
    have hrow :
        X 1 0 * star (X 0 0) + X 1 1 * star (X 0 1) = 0 := by
      rw [hc, hd]
      ring
    have hrowStar := congrArg star hrow
    simp only [star_add, star_mul, star_star, star_zero] at hrowStar
    ext i j
    fin_cases i <;> fin_cases j
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hdiag0
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hrowStar
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hrow
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hdiag1

/-- Karlsson Case 1: when both phase pairs are genuinely distinct, the
extracted first core is already scaled unitary. -/
theorem h2ParameterA_rowGram_of_both_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K ≠ h2Z₃ K ∧ h2Z₄ K ≠ -h2Z₃ K)
    (hright : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    h2ParameterA K * Matrix.conjTranspose (h2ParameterA K) =
      (2 : ℂ) • (1 : Mat2) := by
  exact first_core_rowGram_of_karlsson_relations
    (h2ParameterA_add_h2ParameterB h)
    (h2ParameterA_norm_sum h)
    (h2ParameterA_row_cross_eq_zero_of_left_nondegenerate h hleft)
    (h2ParameterA_column_cross_eq_zero_of_right_nondegenerate h hright)
    (h2ParameterB_row_cross_eq_zero_of_left_nondegenerate h hleft)

theorem h2BlockNormalizedPresentation_of_both_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K ≠ h2Z₃ K ∧ h2Z₄ K ≠ -h2Z₃ K)
    (hright : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    H2BlockNormalizedPresentation K := by
  apply h2BlockNormalizedPresentation_of_some_core h
  left
  refine ⟨h2CoreA_entrywiseUnit h, ?_⟩
  rw [← h2CoreA_reconstruct h]
  exact karlssonBlockProduct_rowGram h.z₃_unit h.z₁_unit
    (h2ParameterA_rowGram_of_both_nondegenerate h hleft hright)

theorem h2ParameterA_rowGram_of_left_degenerate_right_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K ∨ h2Z₄ K = -h2Z₃ K)
    (hright : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    h2ParameterA K * Matrix.conjTranspose (h2ParameterA K) =
      (2 : ℂ) • (1 : Mat2) := by
  have hunitA : EntrywiseUnit
      (karlssonBlockProduct (h2Z₃ K) (h2ParameterA K) (h2Z₁ K)) := by
    rw [h2CoreA_reconstruct h]
    exact h2CoreA_entrywiseUnit h
  have hrowRe :=
    karlssonBlockProduct_row_real_constraint h.z₁_unit hunitA
  exact first_core_rowGram_of_one_degenerate_relations h.z₃_unit
    (h2ParameterA_add_h2ParameterB h)
    (h2ParameterA_norm_sum h)
    (h2ParameterA_column_cross_eq_zero_of_right_nondegenerate h hright)
    (h2ParameterB_column_cross_eq_zero_of_right_nondegenerate h hright)
    (h2ParameterA_diagonal_eq_zero_of_right_nondegenerate h hleft hright)
    (h2ParameterB_diagonal_eq_zero_of_right_nondegenerate h hleft hright)
    (add_star_eq_zero_of_re_eq_zero hrowRe)

theorem h2BlockNormalizedPresentation_of_left_degenerate_right_nondegenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K ∨ h2Z₄ K = -h2Z₃ K)
    (hright : h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K) :
    H2BlockNormalizedPresentation K := by
  apply h2BlockNormalizedPresentation_of_some_core h
  left
  refine ⟨h2CoreA_entrywiseUnit h, ?_⟩
  rw [← h2CoreA_reconstruct h]
  exact karlssonBlockProduct_rowGram h.z₃_unit h.z₁_unit
    (h2ParameterA_rowGram_of_left_degenerate_right_nondegenerate
      h hleft hright)

theorem isHadamard2_transpose {X : Mat2} (hX : IsHadamard2 X) :
    IsHadamard2 X.transpose := by
  refine ⟨(fun i j ↦ hX.1 j i), ?_⟩
  let Y : Mat2 := (1 / 2 : ℂ) • Matrix.conjTranspose X
  have hXY : X * Y = 1 := by
    simp only [Y, Matrix.mul_smul, hX.2]
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num
  have hYX : Y * X = 1 := mul_eq_one_comm.mp hXY
  simp only [Y, Matrix.smul_mul] at hYX
  have hcolScaled := congrArg (fun M : Mat2 ↦ (2 : ℂ) • M) hYX
  have hcol : Matrix.conjTranspose X * X = (2 : ℂ) • (1 : Mat2) := by
    simpa [smul_smul] using hcolScaled
  ext i j
  have hij := congrArg (fun M : Mat2 ↦ M j i) hcol
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.transpose_apply, Matrix.smul_apply, Matrix.one_apply] at hij ⊢
  simpa [mul_comm, eq_comm] using hij

/-- Transposition preserves the full canonical block-normalized property. -/
theorem h2BlockNormalizedPresentation_of_transpose
    {K : Mat6} (h : H2BlockNormalizedPresentation K.transpose) :
    H2BlockNormalizedPresentation K := by
  have hcanonical : H2CanonicalPresentation K := by
    simpa using h2CanonicalPresentation_transpose h.canonical
  refine ⟨hcanonical, ?_⟩
  rcases h.coreBlocks with ⟨hA, hB, hC, hD⟩
  rw [h2CoreA_of_transpose] at hA
  rw [h2CoreB_of_transpose] at hB
  rw [h2CoreC_of_transpose] at hC
  rw [h2CoreD_of_transpose] at hD
  have hAt := isHadamard2_transpose hA
  have hBt := isHadamard2_transpose hB
  have hCt := isHadamard2_transpose hC
  have hDt := isHadamard2_transpose hD
  constructor
  · simpa using hAt
  constructor
  · simpa using hCt
  constructor
  · simpa using hBt
  · simpa using hDt

theorem h2BlockNormalizedPresentation_of_left_nondegenerate_right_degenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K ≠ h2Z₃ K ∧ h2Z₄ K ≠ -h2Z₃ K)
    (hright : h2Z₂ K = h2Z₁ K ∨ h2Z₂ K = -h2Z₁ K) :
    H2BlockNormalizedPresentation K := by
  have ht := h2CanonicalPresentation_transpose h
  have htLeft :
      h2Z₄ K.transpose = h2Z₃ K.transpose ∨
        h2Z₄ K.transpose = -h2Z₃ K.transpose := by
    simpa [h2Z₂, h2Z₁, h2Z₄, h2Z₃] using hright
  have htRight :
      h2Z₂ K.transpose ≠ h2Z₁ K.transpose ∧
        h2Z₂ K.transpose ≠ -h2Z₁ K.transpose := by
    simpa [h2Z₂, h2Z₁, h2Z₄, h2Z₃] using hleft
  exact h2BlockNormalizedPresentation_of_transpose
    (h2BlockNormalizedPresentation_of_left_degenerate_right_nondegenerate
      ht htLeft htRight)

end

end Hadamard6
