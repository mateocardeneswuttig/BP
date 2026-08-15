import Hadamard6.KarlssonChartBoundary
import Hadamard6.KarlssonMixedBlocks
import Mathlib.Tactic

/-!
# Karlsson's global division-free block model

This file records the literal `3 x 3` array of `2 x 2` blocks from
Karlsson's normal form.  It then checks that the paper's fixed mixed/mixed
corner is exactly the three explicit blocks audited in
`KarlssonMixedBlocks.lean`.  This is the matrix-coordinate link needed by
the intrinsic `H₂` normalization proof; no chart-coverage assumption occurs
here.
-/

namespace Hadamard6

noncomputable section

/-- New order `(0,2,3,1,4,5)`, corresponding to the paper's one-based
mixed/mixed corner `{1,3,4}`. -/
def karlssonMixedPermutation : Equiv.Perm I6 :=
  (Equiv.swap (Sum.inl 2) (Sum.inr 0)).trans
    (Equiv.swap (Sum.inl 1) (Sum.inl 2))

theorem karlssonMixedPermutation_order :
    karlssonMixedPermutation (Sum.inl 0) = Sum.inl 0 ∧
    karlssonMixedPermutation (Sum.inl 1) = Sum.inl 2 ∧
    karlssonMixedPermutation (Sum.inl 2) = Sum.inr 0 ∧
    karlssonMixedPermutation (Sum.inr 0) = Sum.inl 1 ∧
    karlssonMixedPermutation (Sum.inr 1) = Sum.inr 1 ∧
    karlssonMixedPermutation (Sum.inr 2) = Sum.inr 2 := by
  decide

@[simp] theorem karlssonMixedPermutation_inl_zero :
    karlssonMixedPermutation (Sum.inl 0) = Sum.inl 0 := by decide
@[simp] theorem karlssonMixedPermutation_inl_one :
    karlssonMixedPermutation (Sum.inl 1) = Sum.inl 2 := by decide
@[simp] theorem karlssonMixedPermutation_inl_two :
    karlssonMixedPermutation (Sum.inl 2) = Sum.inr 0 := by decide
@[simp] theorem karlssonMixedPermutation_inr_zero :
    karlssonMixedPermutation (Sum.inr 0) = Sum.inl 1 := by decide
@[simp] theorem karlssonMixedPermutation_inr_one :
    karlssonMixedPermutation (Sum.inr 1) = Sum.inr 1 := by decide
@[simp] theorem karlssonMixedPermutation_inr_two :
    karlssonMixedPermutation (Sum.inr 2) = Sum.inr 2 := by decide

@[simp] theorem karlssonMixedPermutation_symm_inl_zero :
    karlssonMixedPermutation.symm (Sum.inl 0) = Sum.inl 0 := by decide
@[simp] theorem karlssonMixedPermutation_symm_inl_one :
    karlssonMixedPermutation.symm (Sum.inl 1) = Sum.inr 0 := by decide
@[simp] theorem karlssonMixedPermutation_symm_inl_two :
    karlssonMixedPermutation.symm (Sum.inl 2) = Sum.inl 1 := by decide
@[simp] theorem karlssonMixedPermutation_symm_inr_zero :
    karlssonMixedPermutation.symm (Sum.inr 0) = Sum.inl 2 := by decide
@[simp] theorem karlssonMixedPermutation_symm_inr_one :
    karlssonMixedPermutation.symm (Sum.inr 1) = Sum.inr 1 := by decide
@[simp] theorem karlssonMixedPermutation_symm_inr_two :
    karlssonMixedPermutation.symm (Sum.inr 2) = Sum.inr 2 := by decide

/-- The fourth `3 x 3` block, included so the fixed-corner presentation is
a literal full matrix rather than three disconnected projections. -/
def karlssonMixedD (t : ℝ) (p z₂ z₄ : ℂ) : Mat3 :=
  let M := karlssonBlockProduct z₄ (karlssonCoreA t p) z₂
  !![-1, z₂, -z₂;
     z₄, M 0 0, M 0 1;
     -z₄, M 1 0, M 1 1]

/-- The full Karlsson matrix in the mixed/mixed order used by the paper's
finite-corner proof. -/
def karlssonMixedChartMatrix
    (t : ℝ) (p z₁ z₂ z₃ z₄ : ℂ) : Mat6 :=
  Matrix.fromBlocks
    (karlssonMixedE t p z₁ z₃) (karlssonMixedB t p z₂ z₃)
    (karlssonMixedC t p z₁ z₄) (karlssonMixedD t p z₂ z₄)

/-- Karlsson's standard `2 x 2`-block order is the inverse reindexing of the
mixed/mixed chart.  Keeping this relation definitional prevents the two
coordinate presentations from drifting apart. -/
def karlssonRawMatrix (t : ℝ) (p z₁ z₂ z₃ z₄ : ℂ) : Mat6 :=
  reindexMatrix karlssonMixedPermutation.symm karlssonMixedPermutation.symm
    (karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄)

/-- The two elementary order-two matrices implementing reversal of the
Karlsson half-angle orientation. -/
def karlssonSwap2 : Mat2 := !![0, 1; 1, 0]
def karlssonSign2 : Mat2 := !![1, 0; 0, -1]

theorem karlssonHalfAngleU_inv (t : ℝ) (ht0 : t ≠ 0) :
    karlssonHalfAngleU (1 / t) = -karlssonHalfAngleU t := by
  unfold karlssonHalfAngleU
  norm_num
  field_simp [ht0]
  ring

theorem karlssonHalfAngleV_inv (t : ℝ) (ht0 : t ≠ 0) :
    karlssonHalfAngleV (1 / t) = karlssonHalfAngleV t := by
  unfold karlssonHalfAngleV
  norm_num
  field_simp [ht0]
  ring

/-- Reciprocal half-angle coordinates negate `Λ` up to the elementary
sign conjugation that can be absorbed by row/column equivalence. -/
theorem karlssonLambda_inv (t : ℝ) (p : ℂ) (ht0 : t ≠ 0) :
    karlssonLambda (1 / t) p =
      -(karlssonSign2 * karlssonLambda t p * karlssonSign2) := by
  unfold karlssonLambda
  rw [karlssonHalfAngleU_inv t ht0, karlssonHalfAngleV_inv t ht0]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonSign2]

theorem karlssonF2_mul_sign :
    karlssonF2 * karlssonSign2 = karlssonSwap2 * karlssonF2 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [karlssonF2, karlssonSign2, karlssonSwap2,
      Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two]

/-- Changing the sign of the unit phase conjugates the Karlsson involution
by the elementary sign matrix. -/
theorem karlssonLambda_neg (t : ℝ) (p : ℂ) :
    karlssonLambda t (-p) =
      karlssonSign2 * karlssonLambda t p * karlssonSign2 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonLambda, karlssonSign2, Matrix.mul_apply,
      Fin.sum_univ_two]; ring

/-- The same sign change acts on each core by a row swap and a column sign. -/
theorem karlssonCoreA_neg (t : ℝ) (p : ℂ) :
    karlssonCoreA t (-p) =
      karlssonSwap2 * karlssonCoreA t p * karlssonSign2 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonCoreA, karlssonLambda, karlssonF2,
      karlssonSwap2, karlssonSign2,
      Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two] <;>
    ring

theorem karlssonCoreB_neg (t : ℝ) (p : ℂ) :
    karlssonCoreB t (-p) =
      karlssonSwap2 * karlssonCoreB t p * karlssonSign2 := by
  unfold karlssonCoreB
  rw [karlssonCoreA_neg]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonF2, karlssonSwap2, karlssonSign2,
      Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two] <;>
    ring

theorem karlssonCoreA_neg_apply (t : ℝ) (p : ℂ) (i j : I2) :
    karlssonCoreA t (-p) i j =
      (karlssonSwap2 * karlssonCoreA t p * karlssonSign2) i j := by
  exact congrFun (congrFun (karlssonCoreA_neg t p) i) j

theorem karlssonCoreB_neg_apply (t : ℝ) (p : ℂ) (i j : I2) :
    karlssonCoreB t (-p) i j =
      (karlssonSwap2 * karlssonCoreB t p * karlssonSign2) i j := by
  exact congrFun (congrFun (karlssonCoreB_neg t p) i) j

/-- Column permutation which reverses each of the three standard order-two
pairs.  Together with `karlssonNegPhaseRowPhase`, it implements the harmless
choice `p ↦ -p` in the half-angle orientation. -/
def karlssonNegPhaseColumnPermutation : Equiv.Perm I6 :=
  ((Equiv.swap (Sum.inl 0) (Sum.inl 1)).trans
      (Equiv.swap (Sum.inl 2) (Sum.inr 0))).trans
      (Equiv.swap (Sum.inr 1) (Sum.inr 2))

@[simp] theorem karlssonNegPhaseColumnPermutation_inl_zero :
    karlssonNegPhaseColumnPermutation (Sum.inl 0) = Sum.inl 1 := by decide
@[simp] theorem karlssonNegPhaseColumnPermutation_inl_one :
    karlssonNegPhaseColumnPermutation (Sum.inl 1) = Sum.inl 0 := by decide
@[simp] theorem karlssonNegPhaseColumnPermutation_inl_two :
    karlssonNegPhaseColumnPermutation (Sum.inl 2) = Sum.inr 0 := by decide
@[simp] theorem karlssonNegPhaseColumnPermutation_inr_zero :
    karlssonNegPhaseColumnPermutation (Sum.inr 0) = Sum.inl 2 := by decide
@[simp] theorem karlssonNegPhaseColumnPermutation_inr_one :
    karlssonNegPhaseColumnPermutation (Sum.inr 1) = Sum.inr 2 := by decide
@[simp] theorem karlssonNegPhaseColumnPermutation_inr_two :
    karlssonNegPhaseColumnPermutation (Sum.inr 2) = Sum.inr 1 := by decide

def karlssonNegPhaseRowPhase (z₃ z₄ : ℂ) : I6 → ℂ
  | Sum.inl i => ![1, -1, 1 / z₃] i
  | Sum.inr i => ![-1 / z₃, 1 / z₄, -1 / z₄] i

theorem karlssonNegPhaseRowPhase_unit
    {z₃ z₄ : ℂ} (hz₃ : Complex.normSq z₃ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    ∀ i, Complex.normSq (karlssonNegPhaseRowPhase z₃ z₄ i) = 1 := by
  intro i
  rcases i with i | i <;> fin_cases i <;>
    simp [karlssonNegPhaseRowPhase, hz₃, hz₄]

set_option maxHeartbeats 1000000 in
-- The proof checks all 36 entries after expanding the three pair reversals,
-- so it needs a larger heartbeat allowance than a scalar identity.
/-- Negating the unit phase `p` is only an orientation change.  In standard
block order it reverses each order-two column pair, inverts the two left
phases, and applies unit row phases. -/
theorem equivalent_karlssonRawMatrix_neg_phase
    {t : ℝ} {p z₁ z₂ z₃ z₄ : ℂ}
    (hz₃ : Complex.normSq z₃ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    Equivalent (karlssonRawMatrix t p z₁ z₂ z₃ z₄)
      (karlssonRawMatrix t (-p) z₁ z₂ (1 / z₃) (1 / z₄)) := by
  refine ⟨Equiv.refl I6, karlssonNegPhaseColumnPermutation,
    karlssonNegPhaseRowPhase z₃ z₄, (fun _ ↦ 1),
    karlssonNegPhaseRowPhase_unit hz₃ hz₄,
    (by intro j; norm_num), ?_⟩
  intro i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [karlssonRawMatrix, reindexMatrix,
      karlssonMixedChartMatrix,
      karlssonMixedE, karlssonMixedB, karlssonMixedC, karlssonMixedD,
      mixedLeadingBlock, mixedHorizontalBlock, karlssonBlockProduct,
      karlssonZLeft, karlssonZRight,
      karlssonNegPhaseRowPhase,
      karlssonSwap2, karlssonSign2,
      Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two,
      karlssonCoreA_neg_apply t p, karlssonCoreB_neg_apply t p] <;>
    field_simp [ne_zero_of_normSq_eq_one hz₃,
      ne_zero_of_normSq_eq_one hz₄] <;>
    ring

/-- Reversing the half-angle coordinate exchanges the two Karlsson core
matrices, up to the same elementary row swap and column sign. -/
theorem karlssonCoreB_inv (t : ℝ) (p : ℂ) (ht0 : t ≠ 0) :
    karlssonCoreB (1 / t) p =
      karlssonSwap2 * karlssonCoreA t p * karlssonSign2 := by
  unfold karlssonCoreB karlssonCoreA karlssonLambda
  rw [karlssonHalfAngleU_inv t ht0, karlssonHalfAngleV_inv t ht0]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonF2,
      karlssonSwap2, karlssonSign2, Matrix.mul_apply, Matrix.vecMul,
      dotProduct, Fin.sum_univ_two] <;>
    ring

theorem karlssonCoreA_inv (t : ℝ) (p : ℂ) (ht0 : t ≠ 0) :
    karlssonCoreA (1 / t) p =
      karlssonSwap2 * karlssonCoreB t p * karlssonSign2 := by
  have hsolve : karlssonCoreA (1 / t) p =
      -karlssonF2 - karlssonCoreB (1 / t) p := by
    unfold karlssonCoreB
    abel
  rw [hsolve, karlssonCoreB_inv t p ht0]
  unfold karlssonCoreB
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonF2, karlssonSwap2, karlssonSign2,
      Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two] <;>
    ring

theorem karlssonCoreA_inv_apply (t : ℝ) (p : ℂ) (ht0 : t ≠ 0)
    (i j : I2) :
    karlssonCoreA (1 / t) p i j =
      (karlssonSwap2 * karlssonCoreB t p * karlssonSign2) i j := by
  exact congrFun (congrFun (karlssonCoreA_inv t p ht0) i) j

theorem karlssonCoreB_inv_apply (t : ℝ) (p : ℂ) (ht0 : t ≠ 0)
    (i j : I2) :
    karlssonCoreB (1 / t) p i j =
      (karlssonSwap2 * karlssonCoreA t p * karlssonSign2) i j := by
  exact congrFun (congrFun (karlssonCoreB_inv t p ht0) i) j

theorem karlssonCoreA_inv_apply' (t : ℝ) (p : ℂ) (ht0 : t ≠ 0)
    (i j : I2) :
    karlssonCoreA t⁻¹ p i j =
      (karlssonSwap2 * karlssonCoreB t p * karlssonSign2) i j := by
  simpa [one_div] using karlssonCoreA_inv_apply t p ht0 i j

theorem karlssonCoreB_inv_apply' (t : ℝ) (p : ℂ) (ht0 : t ≠ 0)
    (i j : I2) :
    karlssonCoreB t⁻¹ p i j =
      (karlssonSwap2 * karlssonCoreA t p * karlssonSign2) i j := by
  simpa [one_div] using karlssonCoreB_inv_apply t p ht0 i j

/-- Column reindexing used when the reciprocal half-angle coordinate is
chosen.  In the standard `2 x 2`-block order it reverses the leading pair
and exchanges the two remaining column pairs. -/
def karlssonReciprocalColumnPermutation : Equiv.Perm I6 :=
  ((Equiv.swap (Sum.inl 0) (Sum.inl 1)).trans
      (Equiv.swap (Sum.inl 2) (Sum.inr 1))).trans
      (Equiv.swap (Sum.inr 0) (Sum.inr 2))

theorem karlssonReciprocalColumnPermutation_order :
    karlssonReciprocalColumnPermutation (Sum.inl 0) = Sum.inl 1 ∧
    karlssonReciprocalColumnPermutation (Sum.inl 1) = Sum.inl 0 ∧
    karlssonReciprocalColumnPermutation (Sum.inl 2) = Sum.inr 1 ∧
    karlssonReciprocalColumnPermutation (Sum.inr 0) = Sum.inr 2 ∧
    karlssonReciprocalColumnPermutation (Sum.inr 1) = Sum.inl 2 ∧
    karlssonReciprocalColumnPermutation (Sum.inr 2) = Sum.inr 0 := by
  decide

/-- Row phases accompanying `karlssonReciprocalColumnPermutation`. -/
def karlssonReciprocalRowPhase (z₃ z₄ : ℂ) : I6 → ℂ
  | Sum.inl i => ![1, -1, 1 / z₃] i
  | Sum.inr i => ![-1 / z₃, 1 / z₄, -1 / z₄] i

theorem karlssonReciprocalRowPhase_unit
    {z₃ z₄ : ℂ} (hz₃ : Complex.normSq z₃ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    ∀ i, Complex.normSq (karlssonReciprocalRowPhase z₃ z₄ i) = 1 := by
  intro i
  rcases i with i | i <;> fin_cases i <;>
    simp [karlssonReciprocalRowPhase, hz₃, hz₄]

/-- The same transformation expressed in the mixed/mixed order.  Here the
column permutation simply exchanges the two three-column halves. -/
def karlssonMixedReciprocalColumnPermutation : Equiv.Perm I6 :=
  Equiv.sumComm I3 I3

def karlssonMixedReciprocalRowPhase (z₃ z₄ : ℂ) : I6 → ℂ
  | Sum.inl i => ![1, 1 / z₃, -1 / z₃] i
  | Sum.inr i => ![-1, 1 / z₄, -1 / z₄] i

theorem karlssonMixedReciprocalRowPhase_unit
    {z₃ z₄ : ℂ} (hz₃ : Complex.normSq z₃ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    ∀ i, Complex.normSq (karlssonMixedReciprocalRowPhase z₃ z₄ i) = 1 := by
  intro i
  rcases i with i | i <;> fin_cases i <;>
    simp [karlssonMixedReciprocalRowPhase, hz₃, hz₄]

set_option maxHeartbeats 1000000 in
-- The proof expands the reciprocal coordinate change in all 36 entries.
-- A local allowance keeps this finite calculation out of global settings.
/-- Reversing the half-angle orientation does not change the Karlsson
equivalence class.  The phase parameters transform exactly as dictated by
the standard block form: the right phases are exchanged and negated, while
the left phases are inverted. -/
theorem equivalent_karlssonMixedChartMatrix_reciprocal
    {t : ℝ} {p z₁ z₂ z₃ z₄ : ℂ} (ht0 : t ≠ 0)
    (hz₃ : Complex.normSq z₃ = 1) (hz₄ : Complex.normSq z₄ = 1) :
    Equivalent (karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄)
      (karlssonMixedChartMatrix (1 / t) p
        (-z₂) (-z₁) (1 / z₃) (1 / z₄)) := by
  refine ⟨Equiv.refl I6, karlssonMixedReciprocalColumnPermutation,
    karlssonMixedReciprocalRowPhase z₃ z₄, (fun _ ↦ 1),
    karlssonMixedReciprocalRowPhase_unit hz₃ hz₄,
    (by intro j; norm_num), ?_⟩
  intro i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [karlssonMixedChartMatrix,
      karlssonMixedE, karlssonMixedB, karlssonMixedC, karlssonMixedD,
      mixedLeadingBlock, mixedHorizontalBlock, karlssonBlockProduct,
      karlssonZLeft, karlssonZRight,
      karlssonMixedReciprocalColumnPermutation,
      karlssonMixedReciprocalRowPhase, karlssonSwap2, karlssonSign2,
      Matrix.mul_apply, Matrix.vecMul,
      dotProduct, Fin.sum_univ_two, karlssonCoreA_inv_apply' t p ht0,
      karlssonCoreB_inv_apply' t p ht0] <;>
    field_simp [ne_zero_of_normSq_eq_one hz₃,
      ne_zero_of_normSq_eq_one hz₄] <;>
    ring

set_option maxHeartbeats 1000000 in
-- The fixed-corner leading block is the literal audited `E` block.
theorem karlssonMixedChart_toBlocks₁₁
    (t : ℝ) (p z₁ z₂ z₃ z₄ : ℂ) :
    Matrix.toBlocks₁₁ (karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄) =
      karlssonMixedE t p z₁ z₃ := by
  rfl

set_option maxHeartbeats 1000000 in
-- The fixed-corner horizontal block is the literal audited `B` block.
theorem karlssonMixedChart_toBlocks₁₂
    (t : ℝ) (p z₁ z₂ z₃ z₄ : ℂ) :
    Matrix.toBlocks₁₂ (karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄) =
      karlssonMixedB t p z₂ z₃ := by
  rfl

set_option maxHeartbeats 1000000 in
-- The fixed-corner vertical block is the literal audited `C` block.
theorem karlssonMixedChart_toBlocks₂₁
    (t : ℝ) (p z₁ z₂ z₃ z₄ : ℂ) :
    Matrix.toBlocks₂₁ (karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄) =
      karlssonMixedC t p z₁ z₄ := by
  rfl

/-- Parameter-level constructor for the exact regular-chart predicate used
by the containment theorem. -/
theorem karlssonMixedChart_isRegular
    {t : ℝ} {p z₁ z₂ z₃ z₄ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    IsRegularKarlssonBlockPresentation
      (karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄) := by
  let q : RegularKarlssonData :=
    { t := t
      p := p
      z₁ := z₁
      z₂ := z₂
      z₃ := z₃
      z₄ := z₄
      t_pos := ht
      p_unit := hp
      p_im_nonneg := hpIm
      p_ne_neg_one := hpNegOne
      mPlus_ne_zero := hMPlus
      z₁_unit := hz₁
      z₂_unit := hz₂
      z₃_unit := hz₃
      z₄_unit := hz₄ }
  exact ⟨q, karlssonMixedChart_toBlocks₁₁ _ _ _ _ _ _,
    karlssonMixedChart_toBlocks₁₂ _ _ _ _ _ _,
    karlssonMixedChart_toBlocks₂₁ _ _ _ _ _ _⟩

theorem equivalent_karlssonMixedChartMatrix
    (t : ℝ) (p z₁ z₂ z₃ z₄ : ℂ) :
    Equivalent (karlssonRawMatrix t p z₁ z₂ z₃ z₄)
      (karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄) :=
  ⟨karlssonMixedPermutation, karlssonMixedPermutation,
    (fun _ ↦ 1), (fun _ ↦ 1),
    (by intro i; norm_num), (by intro j; norm_num), by
      intro i j
      simp [karlssonRawMatrix, reindexMatrix]⟩

/-- Raw standard-order version of the reciprocal-orientation equivalence. -/
theorem equivalent_karlssonRawMatrix_reciprocal
    {t : ℝ} {p z₁ z₂ z₃ z₄ : ℂ} (ht0 : t ≠ 0)
    (hz₃ : Complex.normSq z₃ = 1) (hz₄ : Complex.normSq z₄ = 1) :
    Equivalent (karlssonRawMatrix t p z₁ z₂ z₃ z₄)
      (karlssonRawMatrix (1 / t) p (-z₂) (-z₁) (1 / z₃) (1 / z₄)) := by
  apply equivalent_trans
    (equivalent_karlssonMixedChartMatrix t p z₁ z₂ z₃ z₄)
  apply equivalent_trans
    (equivalent_karlssonMixedChartMatrix_reciprocal ht0 hz₃ hz₄)
  exact equivalent_symm
    (equivalent_karlssonMixedChartMatrix
      (1 / t) p (-z₂) (-z₁) (1 / z₃) (1 / z₄))

end

end Hadamard6
