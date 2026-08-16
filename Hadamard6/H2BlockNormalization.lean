import Hadamard6.H2CanonicalForm
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Tactic

/-!
# The `2 x 2` block stage of Karlsson normalization

After `H2CanonicalForm.lean`, the remaining four rows and columns are already
paired.  This file names the resulting four central `2 x 2` blocks and
internalizes the elementary block-unitarity step used in Karlsson's proof.
In particular, if any one central block is Hadamard, the other three are
forced to be Hadamard as well.
-/

namespace Hadamard6

noncomputable section

def h2TailPairFirst : I2 ↪ I6 :=
  pairEmbedding h2Tail₀ h2Tail₁ (by decide)

def h2TailPairSecond : I2 ↪ I6 :=
  pairEmbedding h2Tail₂ h2Tail₃ (by decide)

@[simp] theorem h2TailPairFirst_zero : h2TailPairFirst 0 = h2Tail₀ := rfl
@[simp] theorem h2TailPairFirst_one : h2TailPairFirst 1 = h2Tail₁ := rfl
@[simp] theorem h2TailPairSecond_zero : h2TailPairSecond 0 = h2Tail₂ := rfl
@[simp] theorem h2TailPairSecond_one : h2TailPairSecond 1 = h2Tail₃ := rfl

def h2CoreA (K : Mat6) : Mat2 :=
  K.submatrix h2TailPairFirst h2TailPairFirst

def h2CoreB (K : Mat6) : Mat2 :=
  K.submatrix h2TailPairFirst h2TailPairSecond

def h2CoreC (K : Mat6) : Mat2 :=
  K.submatrix h2TailPairSecond h2TailPairFirst

def h2CoreD (K : Mat6) : Mat2 :=
  K.submatrix h2TailPairSecond h2TailPairSecond

private theorem twoByTwo_of_columnGram
    {X : Mat2} (hunit : EntrywiseUnit X)
    (hcol : Matrix.conjTranspose X * X = (2 : ℂ) • (1 : Mat2)) :
    IsHadamard2 X := by
  refine ⟨hunit, ?_⟩
  let Y : Mat2 := (1 / 2 : ℂ) • Matrix.conjTranspose X
  have hYX : Y * X = 1 := by
    simp only [Y, Matrix.smul_mul, hcol]
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num
  have hXY : X * Y = 1 := mul_eq_one_comm.mp hYX
  simp only [Y, Matrix.mul_smul] at hXY
  have hscaled := congrArg (fun M : Mat2 ↦ (2 : ℂ) • M) hXY
  simpa [smul_smul] using hscaled

private theorem twoByTwo_columnGram_of_rowGram
    {X : Mat2}
    (hrow : X * Matrix.conjTranspose X = (2 : ℂ) • (1 : Mat2)) :
    Matrix.conjTranspose X * X = (2 : ℂ) • (1 : Mat2) := by
  let Y : Mat2 := (1 / 2 : ℂ) • Matrix.conjTranspose X
  have hXY : X * Y = 1 := by
    simp only [Y, Matrix.mul_smul, hrow]
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num
  have hYX : Y * X = 1 := mul_eq_one_comm.mp hXY
  simp only [Y, Matrix.smul_mul] at hYX
  have hscaled := congrArg (fun M : Mat2 ↦ (2 : ℂ) • M) hYX
  simpa [smul_smul] using hscaled

private theorem unit_mul_star_eq_one {z : ℂ}
    (hz : Complex.normSq z = 1) : z * (starRingEnd ℂ) z = 1 := by
  simpa [mul_comm] using star_mul_self_of_normSq_one hz

private theorem star_mul_unit_eq_one {z : ℂ}
    (hz : Complex.normSq z = 1) : (starRingEnd ℂ) z * z = 1 :=
  star_mul_self_of_normSq_one hz

private theorem four_unit_mul_star_sum
    {a b c d : ℂ}
    (ha : Complex.normSq a = 1) (hb : Complex.normSq b = 1)
    (hc : Complex.normSq c = 1) (hd : Complex.normSq d = 1) :
    a * star a + b * star b + (c * star c + d * star d) = 4 := by
  simp [Complex.mul_conj, ha, hb, hc, hd]
  norm_num

private theorem four_star_mul_unit_sum
    {a b c d : ℂ}
    (ha : Complex.normSq a = 1) (hb : Complex.normSq b = 1)
    (hc : Complex.normSq c = 1) (hd : Complex.normSq d = 1) :
    star a * a + star b * b + (star c * c + star d * d) = 4 := by
  simp [mul_comm, Complex.mul_conj, ha, hb, hc, hd]
  norm_num

private theorem h2CoreAB_rowGram
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2CoreA K * Matrix.conjTranspose (h2CoreA K) +
      h2CoreB K * Matrix.conjTranspose (h2CoreB K) =
        (4 : ℂ) • (1 : Mat2) := by
  ext i j
  fin_cases i <;> fin_cases j
  · simp only [h2CoreA, h2CoreB, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_unit_mul_star_sum <;> exact h.hadamard.1 _ _
  · have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₀ h2Tail₁) h.hadamard.2
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₃ : K h2Tail₀ (Sum.inl 1) *
        (starRingEnd ℂ) (K h2Tail₀ (Sum.inl 1)) = 1 :=
      unit_mul_star_eq_one h.z₃_unit
    have hpair := h.column_pair₁
    simp only [h2Tail₀, h2Tail₁] at hz₃ hpair
    simp only [h2Tail₀, Fin.isValue, h.dephased.2, h2Tail₁, star_one,
      mul_one, hpair, star_neg, RCLike.star_def, mul_neg, reduceCtorEq,
      ↓reduceIte, smul_eq_mul, mul_zero] at hentry
    rw [hz₃] at hentry
    norm_num at hentry
    simpa [h2CoreA, h2CoreB, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₁ h2Tail₀) h.hadamard.2
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₃ : K h2Tail₀ (Sum.inl 1) *
        (starRingEnd ℂ) (K h2Tail₀ (Sum.inl 1)) = 1 :=
      unit_mul_star_eq_one h.z₃_unit
    have hpair := h.column_pair₁
    simp only [h2Tail₀, h2Tail₁] at hz₃ hpair
    simp only [h2Tail₁, Fin.isValue, h.dephased.2, h2Tail₀, star_one,
      mul_one, hpair, RCLike.star_def, neg_mul, reduceCtorEq, ↓reduceIte,
      smul_eq_mul, mul_zero] at hentry
    rw [hz₃] at hentry
    norm_num at hentry
    simpa [h2CoreA, h2CoreB, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · simp only [h2CoreA, h2CoreB, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_unit_mul_star_sum <;> exact h.hadamard.1 _ _

private theorem h2CoreCD_rowGram
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2CoreC K * Matrix.conjTranspose (h2CoreC K) +
      h2CoreD K * Matrix.conjTranspose (h2CoreD K) =
        (4 : ℂ) • (1 : Mat2) := by
  ext i j
  fin_cases i <;> fin_cases j
  · simp only [h2CoreC, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_unit_mul_star_sum <;> exact h.hadamard.1 _ _
  · have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₂ h2Tail₃) h.hadamard.2
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₄ : K h2Tail₂ (Sum.inl 1) *
        (starRingEnd ℂ) (K h2Tail₂ (Sum.inl 1)) = 1 :=
      unit_mul_star_eq_one h.z₄_unit
    have hpair := h.column_pair₂
    simp only [h2Tail₂, h2Tail₃] at hz₄ hpair
    simp only [h2Tail₂, Fin.isValue, h.dephased.2, h2Tail₃, star_one,
      mul_one, hpair, star_neg, RCLike.star_def, mul_neg, Sum.inr.injEq,
      Fin.reduceEq, ↓reduceIte, smul_eq_mul, mul_zero] at hentry
    rw [hz₄] at hentry
    norm_num at hentry
    simpa [h2CoreC, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₃ h2Tail₂) h.hadamard.2
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₄ : K h2Tail₂ (Sum.inl 1) *
        (starRingEnd ℂ) (K h2Tail₂ (Sum.inl 1)) = 1 :=
      unit_mul_star_eq_one h.z₄_unit
    have hpair := h.column_pair₂
    simp only [h2Tail₂, h2Tail₃] at hz₄ hpair
    simp only [h2Tail₃, Fin.isValue, h.dephased.2, h2Tail₂, star_one,
      mul_one, hpair, RCLike.star_def, neg_mul, Sum.inr.injEq,
      Fin.reduceEq, ↓reduceIte, smul_eq_mul, mul_zero] at hentry
    rw [hz₄] at hentry
    norm_num at hentry
    simpa [h2CoreC, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · simp only [h2CoreC, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_unit_mul_star_sum <;> exact h.hadamard.1 _ _

private theorem h2CoreAC_columnGram
    {K : Mat6} (h : H2CanonicalPresentation K) :
    Matrix.conjTranspose (h2CoreA K) * h2CoreA K +
      Matrix.conjTranspose (h2CoreC K) * h2CoreC K =
        (4 : ℂ) • (1 : Mat2) := by
  ext i j
  fin_cases i <;> fin_cases j
  · simp only [h2CoreA, h2CoreC, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_star_mul_unit_sum <;> exact h.hadamard.1 _ _
  · have hcol := hadamard_column_gram h.hadamard
    have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₀ h2Tail₁) hcol
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₁ : (starRingEnd ℂ) (K (Sum.inl 1) h2Tail₀) *
        K (Sum.inl 1) h2Tail₀ = 1 :=
      star_mul_unit_eq_one h.z₁_unit
    have hpair := h.row_pair₁
    simp only [h2Tail₀, h2Tail₁] at hz₁ hpair
    simp only [Fin.isValue, h2Tail₀, h.dephased.1, star_one, h2Tail₁,
      mul_one, RCLike.star_def, hpair, mul_neg, reduceCtorEq, ↓reduceIte,
      smul_eq_mul, mul_zero] at hentry
    rw [hz₁] at hentry
    norm_num at hentry
    simpa [h2CoreA, h2CoreC, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · have hcol := hadamard_column_gram h.hadamard
    have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₁ h2Tail₀) hcol
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₁ : (starRingEnd ℂ) (K (Sum.inl 1) h2Tail₀) *
        K (Sum.inl 1) h2Tail₀ = 1 :=
      star_mul_unit_eq_one h.z₁_unit
    have hpair := h.row_pair₁
    simp only [h2Tail₀, h2Tail₁] at hz₁ hpair
    simp only [Fin.isValue, h2Tail₁, h.dephased.1, star_one, h2Tail₀,
      mul_one, hpair, star_neg, RCLike.star_def, neg_mul, reduceCtorEq,
      ↓reduceIte, smul_eq_mul, mul_zero] at hentry
    rw [hz₁] at hentry
    norm_num at hentry
    simpa [h2CoreA, h2CoreC, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · simp only [h2CoreA, h2CoreC, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_star_mul_unit_sum <;> exact h.hadamard.1 _ _

private theorem h2CoreBD_columnGram
    {K : Mat6} (h : H2CanonicalPresentation K) :
    Matrix.conjTranspose (h2CoreB K) * h2CoreB K +
      Matrix.conjTranspose (h2CoreD K) * h2CoreD K =
        (4 : ℂ) • (1 : Mat2) := by
  ext i j
  fin_cases i <;> fin_cases j
  · simp only [h2CoreB, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_star_mul_unit_sum <;> exact h.hadamard.1 _ _
  · have hcol := hadamard_column_gram h.hadamard
    have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₂ h2Tail₃) hcol
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₂ : (starRingEnd ℂ) (K (Sum.inl 1) h2Tail₂) *
        K (Sum.inl 1) h2Tail₂ = 1 :=
      star_mul_unit_eq_one h.z₂_unit
    have hpair := h.row_pair₂
    simp only [h2Tail₂, h2Tail₃] at hz₂ hpair
    simp only [Fin.isValue, h2Tail₂, h.dephased.1, star_one, h2Tail₃,
      mul_one, RCLike.star_def, hpair, mul_neg, Sum.inr.injEq,
      Fin.reduceEq, ↓reduceIte, smul_eq_mul, mul_zero] at hentry
    rw [hz₂] at hentry
    norm_num at hentry
    simpa [h2CoreB, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · have hcol := hadamard_column_gram h.hadamard
    have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₃ h2Tail₂) hcol
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
      Fin.sum_univ_three] at hentry
    have hz₂ : (starRingEnd ℂ) (K (Sum.inl 1) h2Tail₂) *
        K (Sum.inl 1) h2Tail₂ = 1 :=
      star_mul_unit_eq_one h.z₂_unit
    have hpair := h.row_pair₂
    simp only [h2Tail₂, h2Tail₃] at hz₂ hpair
    simp only [Fin.isValue, h2Tail₃, h.dephased.1, star_one, h2Tail₂,
      mul_one, hpair, star_neg, RCLike.star_def, neg_mul, Sum.inr.injEq,
      Fin.reduceEq, ↓reduceIte, smul_eq_mul, mul_zero] at hentry
    rw [hz₂] at hentry
    norm_num at hentry
    simpa [h2CoreB, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry
  · simp only [h2CoreB, h2CoreD, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Matrix.submatrix_apply,
      Fin.sum_univ_two, Matrix.add_apply, Matrix.smul_apply,
      Matrix.one_apply, if_pos, smul_eq_mul, mul_one]
    apply four_star_mul_unit_sum <;> exact h.hadamard.1 _ _

private theorem h2Core_entrywiseUnit
    {K : Mat6} (h : H2CanonicalPresentation K) :
    EntrywiseUnit (h2CoreA K) ∧ EntrywiseUnit (h2CoreB K) ∧
      EntrywiseUnit (h2CoreC K) ∧ EntrywiseUnit (h2CoreD K) := by
  exact ⟨(fun i j ↦ h.hadamard.1 _ _), (fun i j ↦ h.hadamard.1 _ _),
    (fun i j ↦ h.hadamard.1 _ _), (fun i j ↦ h.hadamard.1 _ _)⟩

/-- Karlsson's elementary propagation lemma: in the normalized `3 x 3`
array of `2 x 2` blocks, one Hadamard central block forces all four. -/
theorem h2Canonical_all_core_blocks_of_one
    {K : Mat6} (h : H2CanonicalPresentation K)
    (ha : IsHadamard2 (h2CoreA K)) :
    IsHadamard2 (h2CoreA K) ∧ IsHadamard2 (h2CoreB K) ∧
      IsHadamard2 (h2CoreC K) ∧ IsHadamard2 (h2CoreD K) := by
  rcases h2Core_entrywiseUnit h with ⟨haUnit, hbUnit, hcUnit, hdUnit⟩
  have hab := h2CoreAB_rowGram h
  have hac := h2CoreAC_columnGram h
  have hbGram : h2CoreB K * Matrix.conjTranspose (h2CoreB K) =
      (2 : ℂ) • (1 : Mat2) := by
    rw [ha.2] at hab
    ext i j
    have hij := congrArg (fun M : Mat2 ↦ M i j) hab
    simp only [Matrix.add_apply, Matrix.smul_apply] at hij ⊢
    linear_combination hij
  have hcCol : Matrix.conjTranspose (h2CoreC K) * h2CoreC K =
      (2 : ℂ) • (1 : Mat2) := by
    have haCol : Matrix.conjTranspose (h2CoreA K) * h2CoreA K =
        (2 : ℂ) • (1 : Mat2) := by
      exact twoByTwo_columnGram_of_rowGram ha.2
    rw [haCol] at hac
    ext i j
    have hij := congrArg (fun M : Mat2 ↦ M i j) hac
    simp only [Matrix.add_apply, Matrix.smul_apply] at hij ⊢
    linear_combination hij
  have hb : IsHadamard2 (h2CoreB K) := ⟨hbUnit, hbGram⟩
  have hc : IsHadamard2 (h2CoreC K) :=
    twoByTwo_of_columnGram hcUnit hcCol
  have hcd := h2CoreCD_rowGram h
  have hdGram : h2CoreD K * Matrix.conjTranspose (h2CoreD K) =
      (2 : ℂ) • (1 : Mat2) := by
    rw [hc.2] at hcd
    ext i j
    have hij := congrArg (fun M : Mat2 ↦ M i j) hcd
    simp only [Matrix.add_apply, Matrix.smul_apply] at hij ⊢
    linear_combination hij
  exact ⟨ha, hb, hc, ⟨hdUnit, hdGram⟩⟩

/-- The intrinsic assertion that at least one central block in the canonical
`2 x 2` block array is Hadamard. -/
def H2SomeCoreBlockHadamard (K : Mat6) : Prop :=
  IsHadamard2 (h2CoreA K) ∨ IsHadamard2 (h2CoreB K) ∨
    IsHadamard2 (h2CoreC K) ∨ IsHadamard2 (h2CoreD K)

/-- The intrinsic assertion that all four central blocks in the canonical
`2 x 2` block array are Hadamard. -/
def H2AllCoreBlocksHadamard (K : Mat6) : Prop :=
  IsHadamard2 (h2CoreA K) ∧ IsHadamard2 (h2CoreB K) ∧
    IsHadamard2 (h2CoreC K) ∧ IsHadamard2 (h2CoreD K)

private theorem left_rowGram_of_sum_four
    {X Y : Mat2}
    (hsum : X * Matrix.conjTranspose X +
      Y * Matrix.conjTranspose Y = (4 : ℂ) • (1 : Mat2))
    (hY : Y * Matrix.conjTranspose Y = (2 : ℂ) • (1 : Mat2)) :
    X * Matrix.conjTranspose X = (2 : ℂ) • (1 : Mat2) := by
  rw [hY] at hsum
  ext i j
  have hij := congrArg (fun M : Mat2 ↦ M i j) hsum
  simp only [Matrix.add_apply, Matrix.smul_apply] at hij ⊢
  linear_combination hij

private theorem left_columnGram_of_sum_four
    {X Y : Mat2}
    (hsum : Matrix.conjTranspose X * X +
      Matrix.conjTranspose Y * Y = (4 : ℂ) • (1 : Mat2))
    (hY : Matrix.conjTranspose Y * Y = (2 : ℂ) • (1 : Mat2)) :
    Matrix.conjTranspose X * X = (2 : ℂ) • (1 : Mat2) := by
  rw [hY] at hsum
  ext i j
  have hij := congrArg (fun M : Mat2 ↦ M i j) hsum
  simp only [Matrix.add_apply, Matrix.smul_apply] at hij ⊢
  linear_combination hij

/-- Full form of Karlsson's elementary propagation proposition: any one of
the four central Hadamard blocks forces all four. -/
theorem h2Canonical_all_core_blocks_of_any
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hsome : H2SomeCoreBlockHadamard K) :
    H2AllCoreBlocksHadamard K := by
  rcases h2Core_entrywiseUnit h with ⟨haUnit, hbUnit, hcUnit, hdUnit⟩
  rcases hsome with ha | hb | hc | hd
  · exact h2Canonical_all_core_blocks_of_one h ha
  · have haGram := left_rowGram_of_sum_four (h2CoreAB_rowGram h) hb.2
    exact h2Canonical_all_core_blocks_of_one h ⟨haUnit, haGram⟩
  · have hcCol := twoByTwo_columnGram_of_rowGram hc.2
    have haCol := left_columnGram_of_sum_four (h2CoreAC_columnGram h) hcCol
    have ha := twoByTwo_of_columnGram haUnit haCol
    exact h2Canonical_all_core_blocks_of_one h ha
  · have hcGram := left_rowGram_of_sum_four (h2CoreCD_rowGram h) hd.2
    have hc : IsHadamard2 (h2CoreC K) := ⟨hcUnit, hcGram⟩
    have hcCol := twoByTwo_columnGram_of_rowGram hc.2
    have haCol := left_columnGram_of_sum_four (h2CoreAC_columnGram h) hcCol
    have ha := twoByTwo_of_columnGram haUnit haCol
    exact h2Canonical_all_core_blocks_of_one h ha

/-- A canonical `H₂` presentation in which Karlsson's complete `3 x 3`
array of order-two blocks is visible intrinsically. -/
structure H2BlockNormalizedPresentation (K : Mat6) : Prop where
  canonical : H2CanonicalPresentation K
  coreBlocks : H2AllCoreBlocksHadamard K

/-- Once the finite case analysis exposes any central block, the complete
block-normalized presentation follows without further classification input. -/
theorem h2BlockNormalizedPresentation_of_some_core
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hsome : H2SomeCoreBlockHadamard K) :
    H2BlockNormalizedPresentation K :=
  ⟨h, h2Canonical_all_core_blocks_of_any h hsome⟩

end

end Hadamard6
