import Hadamard6.H2KarlssonCore
import Mathlib.Tactic

/-!
# The fully degenerate `H₂` normalization

This file closes the last finite case in Karlsson's intrinsic block
normalization.  When both phase pairs in a canonical `H₂` presentation are
parallel, elementary tail permutations first make the phases equal.  Two
applications of the four-unit rhombus lemma then expose a Hadamard central
block after at most one further row swap and one further column swap.

No global Karlsson chart or published coverage predicate is used.
-/

namespace Hadamard6

noncomputable section

/-- Swap the two members of the second tail pair. -/
def h2SwapSecondTailPair : Equiv.Perm I6 :=
  Equiv.swap h2Tail₂ h2Tail₃

/-- Swap the negative members of the two tail pairs.  When the two phases
are equal this preserves the canonical opposite-pair skeleton. -/
def h2SwapNegativeTails : Equiv.Perm I6 :=
  Equiv.swap h2Tail₁ h2Tail₃

@[simp] theorem h2SwapSecondTailPair_inl_zero :
    h2SwapSecondTailPair (Sum.inl 0) = Sum.inl 0 := by decide

@[simp] theorem h2SwapSecondTailPair_inl_one :
    h2SwapSecondTailPair (Sum.inl 1) = Sum.inl 1 := by decide

@[simp] theorem h2SwapSecondTailPair_tail_zero :
    h2SwapSecondTailPair h2Tail₀ = h2Tail₀ := by decide

@[simp] theorem h2SwapSecondTailPair_tail_one :
    h2SwapSecondTailPair h2Tail₁ = h2Tail₁ := by decide

@[simp] theorem h2SwapSecondTailPair_tail_two :
    h2SwapSecondTailPair h2Tail₂ = h2Tail₃ := by decide

@[simp] theorem h2SwapSecondTailPair_tail_three :
    h2SwapSecondTailPair h2Tail₃ = h2Tail₂ := by decide

@[simp] theorem h2SwapNegativeTails_inl_zero :
    h2SwapNegativeTails (Sum.inl 0) = Sum.inl 0 := by decide

@[simp] theorem h2SwapNegativeTails_inl_one :
    h2SwapNegativeTails (Sum.inl 1) = Sum.inl 1 := by decide

@[simp] theorem h2SwapNegativeTails_tail_zero :
    h2SwapNegativeTails h2Tail₀ = h2Tail₀ := by decide

@[simp] theorem h2SwapNegativeTails_tail_one :
    h2SwapNegativeTails h2Tail₁ = h2Tail₃ := by decide

@[simp] theorem h2SwapNegativeTails_tail_two :
    h2SwapNegativeTails h2Tail₂ = h2Tail₂ := by decide

@[simp] theorem h2SwapNegativeTails_tail_three :
    h2SwapNegativeTails h2Tail₃ = h2Tail₁ := by decide

/-- Swapping the second column pair preserves a canonical presentation. -/
theorem h2CanonicalPresentation_swap_second_columns
    {K : Mat6} (h : H2CanonicalPresentation K) :
    H2CanonicalPresentation
      (reindexMatrix (Equiv.refl I6) h2SwapSecondTailPair K) := by
  let L := reindexMatrix (Equiv.refl I6) h2SwapSecondTailPair K
  have hrow₂ := h.row_pair₂
  refine {
    hadamard := reindexMatrix_isHadamard h.hadamard
    dephased := ⟨?_, ?_⟩
    leading_neg_one := by simpa [L, reindexMatrix] using h.leading_neg_one
    z₁_unit := by simpa [L, reindexMatrix] using h.z₁_unit
    z₂_unit := by
      simp only [L, reindexMatrix, Equiv.refl_apply,
        h2SwapSecondTailPair_tail_two]
      rw [hrow₂]
      simpa using h.z₂_unit
    z₃_unit := by simpa [L, reindexMatrix] using h.z₃_unit
    z₄_unit := by simpa [L, reindexMatrix] using h.z₄_unit
    row_pair₁ := by simpa [L, reindexMatrix] using h.row_pair₁
    row_pair₂ := by
      simp only [L, reindexMatrix, Equiv.refl_apply,
        h2SwapSecondTailPair_tail_two, h2SwapSecondTailPair_tail_three]
      rw [hrow₂]
      ring
    column_pair₁ := by simpa [L, reindexMatrix] using h.column_pair₁
    column_pair₂ := by simpa [L, reindexMatrix] using h.column_pair₂ }
  · intro j
    simp [L, reindexMatrix, h.dephased.1]
  · intro i
    simp [L, reindexMatrix, h.dephased.2]

/-- Swapping the second row pair preserves a canonical presentation. -/
theorem h2CanonicalPresentation_swap_second_rows
    {K : Mat6} (h : H2CanonicalPresentation K) :
    H2CanonicalPresentation
      (reindexMatrix h2SwapSecondTailPair (Equiv.refl I6) K) := by
  have ht := h2CanonicalPresentation_swap_second_columns
    (h2CanonicalPresentation_transpose h)
  have htt := h2CanonicalPresentation_transpose ht
  have heq :
      (reindexMatrix (Equiv.refl I6) h2SwapSecondTailPair K.transpose).transpose =
        reindexMatrix h2SwapSecondTailPair (Equiv.refl I6) K := by
    ext i j
    rfl
  rwa [heq] at htt

/-- Once the two right phases agree, swapping the negative tail columns
preserves the canonical presentation. -/
theorem h2CanonicalPresentation_swap_negative_columns
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hright : h2Z₂ K = h2Z₁ K) :
    H2CanonicalPresentation
      (reindexMatrix (Equiv.refl I6) h2SwapNegativeTails K) := by
  let L := reindexMatrix (Equiv.refl I6) h2SwapNegativeTails K
  have hneg : K (Sum.inl 1) h2Tail₃ =
      K (Sum.inl 1) h2Tail₁ := by
    rw [h.row_pair₂, h.row_pair₁]
    exact congrArg Neg.neg hright
  refine {
    hadamard := reindexMatrix_isHadamard h.hadamard
    dephased := ⟨?_, ?_⟩
    leading_neg_one := by simpa [L, reindexMatrix] using h.leading_neg_one
    z₁_unit := by simpa [L, reindexMatrix] using h.z₁_unit
    z₂_unit := by simpa [L, reindexMatrix] using h.z₂_unit
    z₃_unit := by simpa [L, reindexMatrix] using h.z₃_unit
    z₄_unit := by simpa [L, reindexMatrix] using h.z₄_unit
    row_pair₁ := by
      simp only [L, reindexMatrix, Equiv.refl_apply,
        h2SwapNegativeTails_tail_zero, h2SwapNegativeTails_tail_one]
      rw [hneg]
      exact h.row_pair₁
    row_pair₂ := by
      simp only [L, reindexMatrix, Equiv.refl_apply,
        h2SwapNegativeTails_tail_two, h2SwapNegativeTails_tail_three]
      rw [← hneg]
      exact h.row_pair₂
    column_pair₁ := by simpa [L, reindexMatrix] using h.column_pair₁
    column_pair₂ := by simpa [L, reindexMatrix] using h.column_pair₂ }
  · intro j
    simp [L, reindexMatrix, h.dephased.1]
  · intro i
    simp [L, reindexMatrix, h.dephased.2]

/-- Row analogue of `h2CanonicalPresentation_swap_negative_columns`. -/
theorem h2CanonicalPresentation_swap_negative_rows
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K) :
    H2CanonicalPresentation
      (reindexMatrix h2SwapNegativeTails (Equiv.refl I6) K) := by
  have ht := h2CanonicalPresentation_swap_negative_columns
    (h2CanonicalPresentation_transpose h) (by
      simpa [h2Z₁, h2Z₂, h2Z₃, h2Z₄] using hleft)
  have htt := h2CanonicalPresentation_transpose ht
  have heq :
      (reindexMatrix (Equiv.refl I6) h2SwapNegativeTails K.transpose).transpose =
        reindexMatrix h2SwapNegativeTails (Equiv.refl I6) K := by
    ext i j
    rfl
  rwa [heq] at htt

private theorem unit_mul_star_eq_one_deg {z : ℂ}
    (hz : Complex.normSq z = 1) : z * star z = 1 := by
  simpa [Complex.star_def] using Complex.mul_conj z |>.trans (by rw [hz]; norm_num)

/-- For an entrywise-unit order-two matrix, one row-cross equation is the
entire Hadamard condition. -/
theorem isHadamard2_of_entrywiseUnit_of_row_cross
    {X : Mat2} (hunit : EntrywiseUnit X)
    (hcross : X 0 0 * star (X 1 0) + X 0 1 * star (X 1 1) = 0) :
    IsHadamard2 X := by
  have h00 := unit_mul_star_eq_one_deg (hunit 0 0)
  have h01 := unit_mul_star_eq_one_deg (hunit 0 1)
  have h10 := unit_mul_star_eq_one_deg (hunit 1 0)
  have h11 := unit_mul_star_eq_one_deg (hunit 1 1)
  have hcrossStar := congrArg star hcross
  simp only [star_add, star_mul, star_star, star_zero] at hcrossStar
  refine ⟨hunit, ?_⟩
  ext i j
  fin_cases i <;> fin_cases j
  · simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two, Matrix.smul_apply, Matrix.one_apply, if_pos,
      smul_eq_mul, mul_one, starRingEnd_apply]
    change X 0 0 * star (X 0 0) + X 0 1 * star (X 0 1) = 2
    rw [h00, h01]
    norm_num
  · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two] using hcross
  · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two, add_comm, mul_comm] using hcrossStar
  · simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_two, Matrix.smul_apply, Matrix.one_apply, if_pos,
      smul_eq_mul, mul_one, starRingEnd_apply]
    change X 1 0 * star (X 1 0) + X 1 1 * star (X 1 1) = 2
    rw [h10, h11]
    norm_num

theorem h2CoreC_eq_h2CoreB_of_equal_phases
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K)
    (hright : h2Z₂ K = h2Z₁ K) :
    h2CoreC K = h2CoreB K := by
  rw [← h2CoreC_reconstruct h, ← h2CoreB_reconstruct h,
    h2ParameterC_eq_h2ParameterB h, hleft, hright]

theorem h2CoreD_eq_h2CoreA_of_equal_phases
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K)
    (hright : h2Z₂ K = h2Z₁ K) :
    h2CoreD K = h2CoreA K := by
  rw [← h2CoreD_reconstruct h, ← h2CoreA_reconstruct h,
    h2ParameterD_eq_h2ParameterA h, hleft, hright]

/-- Orthogonality of the first canonical tail-row pair, with the leading
`F₂` contributions cancelled. -/
theorem h2CoreAB_row_cross_sum
    {K : Mat6} (h : H2CanonicalPresentation K) :
    h2CoreA K 0 0 * star (h2CoreA K 1 0) +
      h2CoreA K 0 1 * star (h2CoreA K 1 1) +
      h2CoreB K 0 0 * star (h2CoreB K 1 0) +
      h2CoreB K 0 1 * star (h2CoreB K 1 1) = 0 := by
  have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₀ h2Tail₁)
    h.hadamard.2
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
    Fin.sum_univ_three] at hentry
  have hz₃ : K h2Tail₀ (Sum.inl 1) *
      star (K h2Tail₀ (Sum.inl 1)) = 1 :=
    unit_mul_star_eq_one_deg h.z₃_unit
  have hpair := h.column_pair₁
  simp only [h2Tail₀, h2Tail₁] at hz₃ hpair
  simp [h2Tail₀, h2Tail₁, h.dephased.2, hpair] at hentry
  simp only [starRingEnd_apply] at hentry
  rw [hz₃] at hentry
  norm_num at hentry
  simpa [h2CoreA, h2CoreB, h2TailPairFirst, h2TailPairSecond,
    h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry

/-- In the equal-phase case, orthogonality of tail rows zero and three gives
the crossed `A/B` rhombus used by the second finite pairing step. -/
theorem h2CoreAB_crossed_row_cross_sum
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K)
    (hright : h2Z₂ K = h2Z₁ K) :
    h2CoreA K 0 0 * star (h2CoreB K 1 0) +
      h2CoreA K 0 1 * star (h2CoreB K 1 1) +
      h2CoreB K 0 0 * star (h2CoreA K 1 0) +
      h2CoreB K 0 1 * star (h2CoreA K 1 1) = 0 := by
  have hCB := h2CoreC_eq_h2CoreB_of_equal_phases h hleft hright
  have hDA := h2CoreD_eq_h2CoreA_of_equal_phases h hleft hright
  have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₀ h2Tail₃)
    h.hadamard.2
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
    Fin.sum_univ_three] at hentry
  have hz₃ : K h2Tail₀ (Sum.inl 1) *
      star (K h2Tail₀ (Sum.inl 1)) = 1 :=
    unit_mul_star_eq_one_deg h.z₃_unit
  have hpair₂ : K h2Tail₃ (Sum.inl 1) =
      -K h2Tail₀ (Sum.inl 1) := by
    rw [h.column_pair₂]
    change -h2Z₄ K = -h2Z₃ K
    rw [hleft]
  simp only [h2Tail₀, h2Tail₃] at hz₃ hpair₂
  simp [h2Tail₀, h2Tail₃, h.dephased.2, hpair₂] at hentry
  simp only [starRingEnd_apply] at hentry
  rw [hz₃] at hentry
  norm_num at hentry
  have hcore : h2CoreA K 0 0 * star (h2CoreC K 1 0) +
        h2CoreA K 0 1 * star (h2CoreC K 1 1) +
        h2CoreB K 0 0 * star (h2CoreD K 1 0) +
        h2CoreB K 0 1 * star (h2CoreD K 1 1) = 0 := by
    simpa [h2CoreA, h2CoreB, h2CoreC, h2CoreD,
      h2TailPairFirst, h2TailPairSecond, h2Tail₀, h2Tail₁,
      h2Tail₂, h2Tail₃, add_assoc] using hentry
  rw [hCB, hDA] at hcore
  exact hcore

/-- In the equal-phase case, each column of the physical block difference
`A-B` has squared norm six.  This is the diagonal part of Karlsson's
division-free relation `(A-B)†(A-B)=6I`. -/
theorem h2CoreAB_difference_first_column_norm
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K)
    (hright : h2Z₂ K = h2Z₁ K) :
    (h2CoreA K 0 0 - h2CoreB K 0 0) *
        star (h2CoreA K 0 0 - h2CoreB K 0 0) +
      (h2CoreA K 1 0 - h2CoreB K 1 0) *
        star (h2CoreA K 1 0 - h2CoreB K 1 0) = 6 := by
  have hCB := h2CoreC_eq_h2CoreB_of_equal_phases h hleft hright
  have hDA := h2CoreD_eq_h2CoreA_of_equal_phases h hleft hright
  have hcol := hadamard_column_gram h.hadamard
  have hentry := congrArg (fun M : Mat6 ↦ M h2Tail₀ h2Tail₂) hcol
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
    Fin.sum_univ_three] at hentry
  have hz₁ : star (K (Sum.inl 1) h2Tail₀) *
      K (Sum.inl 1) h2Tail₀ = 1 := by
    rw [mul_comm]
    exact unit_mul_star_eq_one_deg h.z₁_unit
  have hphase : K (Sum.inl 1) h2Tail₂ =
      K (Sum.inl 1) h2Tail₀ := hright
  simp only [h2Tail₀, h2Tail₂] at hz₁ hphase
  simp [h2Tail₀, h2Tail₂, h.dephased.1, hphase] at hentry
  simp only [starRingEnd_apply] at hentry
  rw [hz₁] at hentry
  norm_num at hentry
  have hcross :
      star (h2CoreA K 0 0) * h2CoreB K 0 0 +
        star (h2CoreA K 1 0) * h2CoreB K 1 0 +
        star (h2CoreB K 0 0) * h2CoreA K 0 0 +
        star (h2CoreB K 1 0) * h2CoreA K 1 0 = -2 := by
    have hcore :
        star (h2CoreA K 0 0) * h2CoreB K 0 0 +
          star (h2CoreA K 1 0) * h2CoreB K 1 0 +
          star (h2CoreC K 0 0) * h2CoreD K 0 0 +
          star (h2CoreC K 1 0) * h2CoreD K 1 0 = -2 := by
      have hcoreZero : 2 +
          (star (h2CoreA K 0 0) * h2CoreB K 0 0 +
            star (h2CoreA K 1 0) * h2CoreB K 1 0 +
            star (h2CoreC K 0 0) * h2CoreD K 0 0 +
            star (h2CoreC K 1 0) * h2CoreD K 1 0) = 0 := by
        simpa [h2CoreA, h2CoreB, h2CoreC, h2CoreD,
          h2TailPairFirst, h2TailPairSecond, h2Tail₀, h2Tail₁,
          h2Tail₂, h2Tail₃, add_assoc] using hentry
      linear_combination hcoreZero
    rw [hCB, hDA] at hcore
    exact hcore
  have ha00 : h2CoreA K 0 0 * star (h2CoreA K 0 0) = 1 := by
    simpa [h2CoreA] using
      unit_mul_star_eq_one_deg (h.hadamard.1 h2Tail₀ h2Tail₀)
  have hb00 : h2CoreB K 0 0 * star (h2CoreB K 0 0) = 1 := by
    simpa [h2CoreB] using
      unit_mul_star_eq_one_deg (h.hadamard.1 h2Tail₀ h2Tail₂)
  have ha10 : h2CoreA K 1 0 * star (h2CoreA K 1 0) = 1 := by
    simpa [h2CoreA] using
      unit_mul_star_eq_one_deg (h.hadamard.1 h2Tail₁ h2Tail₀)
  have hb10 : h2CoreB K 1 0 * star (h2CoreB K 1 0) = 1 := by
    simpa [h2CoreB] using
      unit_mul_star_eq_one_deg (h.hadamard.1 h2Tail₁ h2Tail₂)
  simp only [star_sub]
  linear_combination ha00 + hb00 + ha10 + hb10 - hcross

private theorem h2Core_relative_phase_unit
    {K : Mat6} (h : H2CanonicalPresentation K)
    (r₁ r₂ c₁ c₂ : I6) :
    Complex.normSq (K r₁ c₁ * star (K r₂ c₂)) = 1 := by
  simp [Complex.normSq_mul, Complex.normSq_conj,
    h.hadamard.1 r₁ c₁, h.hadamard.1 r₂ c₂]

/-- Equal left and right phase pairs admit a block-normalized representative.
The proof is a zero-safe, division-free replacement for the sign choices in
Karlsson's Theorem 9. -/
theorem h2BlockNormalized_equiv_of_equal_phases
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K)
    (hright : h2Z₂ K = h2Z₁ K) :
    ∃ L : Mat6, Equivalent K L ∧ H2BlockNormalizedPresentation L := by
  let x₀ := h2CoreA K 0 0 * star (h2CoreA K 1 0)
  let x₁ := h2CoreA K 0 1 * star (h2CoreA K 1 1)
  let x₂ := h2CoreB K 0 0 * star (h2CoreB K 1 0)
  let x₃ := h2CoreB K 0 1 * star (h2CoreB K 1 1)
  have hx₀ : Complex.normSq x₀ = 1 := by
    exact h2Core_relative_phase_unit h h2Tail₀ h2Tail₁ h2Tail₀ h2Tail₀
  have hx₁ : Complex.normSq x₁ = 1 := by
    exact h2Core_relative_phase_unit h h2Tail₀ h2Tail₁ h2Tail₁ h2Tail₁
  have hx₂ : Complex.normSq x₂ = 1 := by
    exact h2Core_relative_phase_unit h h2Tail₀ h2Tail₁ h2Tail₂ h2Tail₂
  have hx₃ : Complex.normSq x₃ = 1 := by
    exact h2Core_relative_phase_unit h h2Tail₀ h2Tail₁ h2Tail₃ h2Tail₃
  have hxsum : x₀ + x₁ + x₂ + x₃ = 0 := by
    exact h2CoreAB_row_cross_sum h
  rcases four_unit_sum_zero_pairs hx₀ hx₁ hx₂ hx₃ hxsum with
      hpairA | hbad₁ | hpairColumns
  · have hcross : h2CoreA K 0 0 * star (h2CoreA K 1 0) +
        h2CoreA K 0 1 * star (h2CoreA K 1 1) = 0 := by
      dsimp [x₀, x₁] at hpairA
      simp only [starRingEnd_apply] at hpairA
      rw [hpairA.1]
      ring
    have hA : IsHadamard2 (h2CoreA K) :=
      isHadamard2_of_entrywiseUnit_of_row_cross
        (fun i j ↦ h.hadamard.1 _ _) hcross
    exact ⟨K, equivalent_refl K,
      h2BlockNormalizedPresentation_of_some_core h (Or.inl hA)⟩
  · let y₀ := h2CoreA K 0 0 * star (h2CoreB K 1 0)
    let y₁ := h2CoreA K 0 1 * star (h2CoreB K 1 1)
    let y₂ := h2CoreB K 0 0 * star (h2CoreA K 1 0)
    let y₃ := h2CoreB K 0 1 * star (h2CoreA K 1 1)
    have hy₀ : Complex.normSq y₀ = 1 := by
      rw [Complex.normSq_mul]
      simp only [Complex.star_def, Complex.normSq_conj]
      change Complex.normSq (K h2Tail₀ h2Tail₀) *
        Complex.normSq (K h2Tail₁ h2Tail₂) = 1
      rw [h.hadamard.1, h.hadamard.1]
      norm_num
    have hy₁ : Complex.normSq y₁ = 1 := by
      rw [Complex.normSq_mul]
      simp only [Complex.star_def, Complex.normSq_conj]
      change Complex.normSq (K h2Tail₀ h2Tail₁) *
        Complex.normSq (K h2Tail₁ h2Tail₃) = 1
      rw [h.hadamard.1, h.hadamard.1]
      norm_num
    have hy₂ : Complex.normSq y₂ = 1 := by
      rw [Complex.normSq_mul]
      simp only [Complex.star_def, Complex.normSq_conj]
      change Complex.normSq (K h2Tail₀ h2Tail₂) *
        Complex.normSq (K h2Tail₁ h2Tail₀) = 1
      rw [h.hadamard.1, h.hadamard.1]
      norm_num
    have hy₃ : Complex.normSq y₃ = 1 := by
      rw [Complex.normSq_mul]
      simp only [Complex.star_def, Complex.normSq_conj]
      change Complex.normSq (K h2Tail₀ h2Tail₃) *
        Complex.normSq (K h2Tail₁ h2Tail₁) = 1
      rw [h.hadamard.1, h.hadamard.1]
      norm_num
    have hysum : y₀ + y₁ + y₂ + y₃ = 0 := by
      exact h2CoreAB_crossed_row_cross_sum h hleft hright
    rcases four_unit_sum_zero_pairs hy₀ hy₁ hy₂ hy₃ hysum with
        hpairRows | hbad₂ | hpairBoth
    · let L := reindexMatrix h2SwapNegativeTails (Equiv.refl I6) K
      have hL : H2CanonicalPresentation L :=
        h2CanonicalPresentation_swap_negative_rows h hleft
      have hcross : h2CoreA L 0 0 * star (h2CoreA L 1 0) +
          h2CoreA L 0 1 * star (h2CoreA L 1 1) = 0 := by
        have hCB := h2CoreC_eq_h2CoreB_of_equal_phases h hleft hright
        have hCB10 := congrArg (fun M : Mat2 ↦ M 1 0) hCB
        have hCB11 := congrArg (fun M : Mat2 ↦ M 1 1) hCB
        simp only [h2CoreC, h2CoreB, Matrix.submatrix_apply,
          h2TailPairSecond_one, h2TailPairFirst_one,
          h2TailPairFirst_zero, h2TailPairSecond_zero] at hCB10 hCB11
        dsimp [y₀, y₁] at hpairRows
        simp only [starRingEnd_apply] at hpairRows
        have hp := hpairRows.1
        have hp' : K h2Tail₀ h2Tail₁ * star (K h2Tail₁ h2Tail₃) =
            -(K h2Tail₀ h2Tail₀ * star (K h2Tail₁ h2Tail₂)) := by
          simpa [h2CoreA, h2CoreB] using hp
        simp only [L, h2CoreA, Matrix.submatrix_apply,
          h2TailPairFirst_zero, h2TailPairFirst_one, reindexMatrix,
          Equiv.refl_apply, h2SwapNegativeTails_tail_zero,
          h2SwapNegativeTails_tail_one]
        rw [hCB10, hCB11]
        rw [hp']
        ring
      have hA : IsHadamard2 (h2CoreA L) :=
        isHadamard2_of_entrywiseUnit_of_row_cross
          (fun i j ↦ hL.hadamard.1 _ _) hcross
      exact ⟨L, equivalent_reindexMatrix _ _ _,
        h2BlockNormalizedPresentation_of_some_core hL (Or.inl hA)⟩
    · dsimp [x₀, x₂] at hbad₁
      dsimp [y₀, y₂] at hbad₂
      simp only [starRingEnd_apply] at hbad₁ hbad₂
      have heq₁ := hbad₁.1
      have heq₂ := hbad₂.1
      have hdiffProduct :
          (h2CoreA K 0 0 - h2CoreB K 0 0) *
            star (h2CoreA K 1 0 - h2CoreB K 1 0) = 0 := by
        simp only [star_sub]
        linear_combination heq₁ - heq₂
      have hsumProduct :
          (h2CoreA K 0 0 + h2CoreB K 0 0) *
            star (h2CoreA K 1 0 + h2CoreB K 1 0) = 0 := by
        simp only [star_add]
        linear_combination heq₁ + heq₂
      have hnorm := h2CoreAB_difference_first_column_norm h hleft hright
      have haUnit := unit_mul_star_eq_one_deg
        (h.hadamard.1 h2Tail₀ h2Tail₀)
      have hcUnit := unit_mul_star_eq_one_deg
        (h.hadamard.1 h2Tail₁ h2Tail₀)
      change h2CoreA K 0 0 * star (h2CoreA K 0 0) = 1 at haUnit
      change h2CoreA K 1 0 * star (h2CoreA K 1 0) = 1 at hcUnit
      rcases mul_eq_zero.mp hdiffProduct with habDiff | hcdStar
      · have habEq : h2CoreA K 0 0 = h2CoreB K 0 0 :=
          sub_eq_zero.mp habDiff
        rcases mul_eq_zero.mp hsumProduct with habSum | hcdSumStar
        · have ha0 : h2CoreA K 0 0 = 0 := by
            linear_combination (1 / 2 : ℂ) * habSum +
              (1 / 2 : ℂ) * habDiff
          rw [ha0] at haUnit
          norm_num at haUnit
        · have hcdSum : h2CoreA K 1 0 + h2CoreB K 1 0 = 0 :=
            star_eq_zero.mp hcdSumStar
          have hbd : h2CoreB K 1 0 = -h2CoreA K 1 0 :=
            by linear_combination hcdSum
          rw [habEq, hbd] at hnorm
          simp only [sub_self, zero_mul, star_zero, zero_add, sub_neg_eq_add,
            star_add, star_neg] at hnorm
          have hfalse : (0 : ℂ) = 2 := by
            linear_combination hnorm - 4 * hcUnit
          norm_num at hfalse
      · have hcd : h2CoreA K 1 0 = h2CoreB K 1 0 := by
          exact sub_eq_zero.mp (star_eq_zero.mp hcdStar)
        rcases mul_eq_zero.mp hsumProduct with habSum | hcdSumStar
        · have hba : h2CoreB K 0 0 = -h2CoreA K 0 0 :=
            by linear_combination habSum
          rw [hba, hcd] at hnorm
          simp only [sub_self, mul_zero, star_zero, add_zero, sub_neg_eq_add,
            star_add, star_neg] at hnorm
          have hfalse : (0 : ℂ) = 2 := by
            linear_combination hnorm - 4 * haUnit
          norm_num at hfalse
        · have hcdSum : h2CoreA K 1 0 + h2CoreB K 1 0 = 0 :=
            star_eq_zero.mp hcdSumStar
          have hc0 : h2CoreA K 1 0 = 0 := by
            have hcdDiff : h2CoreA K 1 0 - h2CoreB K 1 0 = 0 :=
              star_eq_zero.mp hcdStar
            linear_combination (1 / 2 : ℂ) * hcdSum +
              (1 / 2 : ℂ) * hcdDiff
          rw [hc0] at hcUnit
          norm_num at hcUnit
    · let L := reindexMatrix h2SwapNegativeTails h2SwapNegativeTails K
      have hRows := h2CanonicalPresentation_swap_negative_rows h hleft
      have hrightRows : h2Z₂
          (reindexMatrix h2SwapNegativeTails (Equiv.refl I6) K) =
          h2Z₁ (reindexMatrix h2SwapNegativeTails (Equiv.refl I6) K) := by
        simpa [h2Z₁, h2Z₂, reindexMatrix] using hright
      have hL : H2CanonicalPresentation L :=
        h2CanonicalPresentation_swap_negative_columns hRows hrightRows
      have hcross : h2CoreA L 0 0 * star (h2CoreA L 1 0) +
          h2CoreA L 0 1 * star (h2CoreA L 1 1) = 0 := by
        have hCB := h2CoreC_eq_h2CoreB_of_equal_phases h hleft hright
        have hDA := h2CoreD_eq_h2CoreA_of_equal_phases h hleft hright
        have hCB10 := congrArg (fun M : Mat2 ↦ M 1 0) hCB
        have hDA11 := congrArg (fun M : Mat2 ↦ M 1 1) hDA
        simp only [h2CoreC, h2CoreB, h2CoreD, h2CoreA,
          Matrix.submatrix_apply, h2TailPairSecond_one,
          h2TailPairFirst_one, h2TailPairFirst_zero,
          h2TailPairSecond_zero] at hCB10 hDA11
        dsimp [y₀, y₃] at hpairBoth
        simp only [starRingEnd_apply] at hpairBoth
        have hp := hpairBoth.1
        have hp' : K h2Tail₀ h2Tail₃ * star (K h2Tail₁ h2Tail₁) =
            -(K h2Tail₀ h2Tail₀ * star (K h2Tail₁ h2Tail₂)) := by
          simpa [h2CoreA, h2CoreB] using hp
        simp only [L, h2CoreA, Matrix.submatrix_apply,
          h2TailPairFirst_zero, h2TailPairFirst_one, reindexMatrix,
          h2SwapNegativeTails_tail_zero, h2SwapNegativeTails_tail_one]
        rw [hCB10, hDA11]
        rw [hp']
        ring
      have hA : IsHadamard2 (h2CoreA L) :=
        isHadamard2_of_entrywiseUnit_of_row_cross
          (fun i j ↦ hL.hadamard.1 _ _) hcross
      exact ⟨L, equivalent_reindexMatrix _ _ _,
        h2BlockNormalizedPresentation_of_some_core hL (Or.inl hA)⟩
  · let L := reindexMatrix (Equiv.refl I6) h2SwapNegativeTails K
    have hL : H2CanonicalPresentation L :=
      h2CanonicalPresentation_swap_negative_columns h hright
    have hcross : h2CoreA L 0 0 * star (h2CoreA L 1 0) +
        h2CoreA L 0 1 * star (h2CoreA L 1 1) = 0 := by
      dsimp [x₀, x₃] at hpairColumns
      simp only [starRingEnd_apply] at hpairColumns
      have hp := hpairColumns.1
      have hp' : K h2Tail₀ h2Tail₃ * star (K h2Tail₁ h2Tail₃) =
          -(K h2Tail₀ h2Tail₀ * star (K h2Tail₁ h2Tail₀)) := by
        simpa [h2CoreA, h2CoreB] using hp
      simp only [L, h2CoreA, Matrix.submatrix_apply,
        h2TailPairFirst_zero, h2TailPairFirst_one, reindexMatrix,
        Equiv.refl_apply, h2SwapNegativeTails_tail_zero,
        h2SwapNegativeTails_tail_one]
      rw [hp']
      ring
    have hA : IsHadamard2 (h2CoreA L) :=
      isHadamard2_of_entrywiseUnit_of_row_cross
        (fun i j ↦ hL.hadamard.1 _ _) hcross
    exact ⟨L, equivalent_reindexMatrix _ _ _,
      h2BlockNormalizedPresentation_of_some_core hL (Or.inl hA)⟩

/-- The fully parallel phase case, with arbitrary signs, admits a
block-normalized representative. -/
theorem h2BlockNormalized_equiv_of_both_degenerate
    {K : Mat6} (h : H2CanonicalPresentation K)
    (hleft : h2Z₄ K = h2Z₃ K ∨ h2Z₄ K = -h2Z₃ K)
    (hright : h2Z₂ K = h2Z₁ K ∨ h2Z₂ K = -h2Z₁ K) :
    ∃ L : Mat6, Equivalent K L ∧ H2BlockNormalizedPresentation L := by
  rcases hleft with hleft | hleft <;>
    rcases hright with hright | hright
  · exact h2BlockNormalized_equiv_of_equal_phases h hleft hright
  · let Kc := reindexMatrix (Equiv.refl I6) h2SwapSecondTailPair K
    have hKc : H2CanonicalPresentation Kc :=
      h2CanonicalPresentation_swap_second_columns h
    have hleftKc : h2Z₄ Kc = h2Z₃ Kc := by
      simpa [Kc, h2Z₃, h2Z₄, reindexMatrix] using hleft
    have hrightKc : h2Z₂ Kc = h2Z₁ Kc := by
      have hright' : K (Sum.inl 1) h2Tail₂ =
          -K (Sum.inl 1) h2Tail₀ := hright
      simp only [Kc, h2Z₁, h2Z₂, reindexMatrix, Equiv.refl_apply,
        h2SwapSecondTailPair_tail_zero, h2SwapSecondTailPair_tail_two]
      rw [h.row_pair₂, hright']
      ring
    rcases h2BlockNormalized_equiv_of_equal_phases hKc hleftKc hrightKc with
      ⟨L, hKcL, hL⟩
    exact ⟨L, equivalent_trans (equivalent_reindexMatrix _ _ _) hKcL, hL⟩
  · let Kr := reindexMatrix h2SwapSecondTailPair (Equiv.refl I6) K
    have hKr : H2CanonicalPresentation Kr :=
      h2CanonicalPresentation_swap_second_rows h
    have hleftKr : h2Z₄ Kr = h2Z₃ Kr := by
      have hleft' : K h2Tail₂ (Sum.inl 1) =
          -K h2Tail₀ (Sum.inl 1) := hleft
      simp only [Kr, h2Z₃, h2Z₄, reindexMatrix, Equiv.refl_apply,
        h2SwapSecondTailPair_tail_zero, h2SwapSecondTailPair_tail_two]
      rw [h.column_pair₂, hleft']
      ring
    have hrightKr : h2Z₂ Kr = h2Z₁ Kr := by
      simpa [Kr, h2Z₁, h2Z₂, reindexMatrix] using hright
    rcases h2BlockNormalized_equiv_of_equal_phases hKr hleftKr hrightKr with
      ⟨L, hKrL, hL⟩
    exact ⟨L, equivalent_trans (equivalent_reindexMatrix _ _ _) hKrL, hL⟩
  · let Kr := reindexMatrix h2SwapSecondTailPair (Equiv.refl I6) K
    have hKr : H2CanonicalPresentation Kr :=
      h2CanonicalPresentation_swap_second_rows h
    have hleftKr : h2Z₄ Kr = h2Z₃ Kr := by
      have hleft' : K h2Tail₂ (Sum.inl 1) =
          -K h2Tail₀ (Sum.inl 1) := hleft
      simp only [Kr, h2Z₃, h2Z₄, reindexMatrix, Equiv.refl_apply,
        h2SwapSecondTailPair_tail_zero, h2SwapSecondTailPair_tail_two]
      rw [h.column_pair₂, hleft']
      ring
    have hrightKrNeg : h2Z₂ Kr = -h2Z₁ Kr := by
      simpa [Kr, h2Z₁, h2Z₂, reindexMatrix] using hright
    let Krc := reindexMatrix (Equiv.refl I6) h2SwapSecondTailPair Kr
    have hKrc : H2CanonicalPresentation Krc :=
      h2CanonicalPresentation_swap_second_columns hKr
    have hleftKrc : h2Z₄ Krc = h2Z₃ Krc := by
      simpa [Krc, h2Z₃, h2Z₄, reindexMatrix] using hleftKr
    have hrightKrc : h2Z₂ Krc = h2Z₁ Krc := by
      have hrightKrNeg' : Kr (Sum.inl 1) h2Tail₂ =
          -Kr (Sum.inl 1) h2Tail₀ := hrightKrNeg
      simp only [Krc, h2Z₁, h2Z₂, reindexMatrix, Equiv.refl_apply,
        h2SwapSecondTailPair_tail_zero, h2SwapSecondTailPair_tail_two]
      rw [hKr.row_pair₂, hrightKrNeg']
      ring
    rcases h2BlockNormalized_equiv_of_equal_phases hKrc hleftKrc hrightKrc with
      ⟨L, hKrcL, hL⟩
    have hKKr : Equivalent K Kr := equivalent_reindexMatrix _ _ _
    have hKrKrc : Equivalent Kr Krc := equivalent_reindexMatrix _ _ _
    exact ⟨L, equivalent_trans hKKr (equivalent_trans hKrKrc hKrcL), hL⟩

/-- Complete intrinsic form of Karlsson's Theorem 4 for a canonical
presentation: all four phase configurations admit a block-normalized
representative. -/
theorem h2Canonical_equiv_h2BlockNormalized
    {K : Mat6} (h : H2CanonicalPresentation K) :
    ∃ L : Mat6, Equivalent K L ∧ H2BlockNormalizedPresentation L := by
  by_cases hleft : h2Z₄ K = h2Z₃ K ∨ h2Z₄ K = -h2Z₃ K
  · by_cases hright : h2Z₂ K = h2Z₁ K ∨ h2Z₂ K = -h2Z₁ K
    · exact h2BlockNormalized_equiv_of_both_degenerate h hleft hright
    · have hrightND :
          h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K := by
        constructor
        · intro heq; exact hright (Or.inl heq)
        · intro heq; exact hright (Or.inr heq)
      exact ⟨K, equivalent_refl K,
        h2BlockNormalizedPresentation_of_left_degenerate_right_nondegenerate
          h hleft hrightND⟩
  · have hleftND :
        h2Z₄ K ≠ h2Z₃ K ∧ h2Z₄ K ≠ -h2Z₃ K := by
      constructor
      · intro heq; exact hleft (Or.inl heq)
      · intro heq; exact hleft (Or.inr heq)
    by_cases hright : h2Z₂ K = h2Z₁ K ∨ h2Z₂ K = -h2Z₁ K
    · exact ⟨K, equivalent_refl K,
        h2BlockNormalizedPresentation_of_left_nondegenerate_right_degenerate
          h hleftND hright⟩
    · have hrightND :
          h2Z₂ K ≠ h2Z₁ K ∧ h2Z₂ K ≠ -h2Z₁ K := by
        constructor
        · intro heq; exact hright (Or.inl heq)
        · intro heq; exact hright (Or.inr heq)
      exact ⟨K, equivalent_refl K,
        h2BlockNormalizedPresentation_of_both_nondegenerate
          h hleftND hrightND⟩

/-- **Intrinsic `H₂` block normalization.**  One Hadamard order-two
submatrix is enough to produce, by equivalence alone, the complete `3 x 3`
array of Hadamard order-two blocks. -/
theorem hasHadamardTwoByTwo_equiv_h2BlockNormalized
    {H : Mat6} (hH : IsHadamard H)
    (hH₂ : HasHadamardTwoByTwo H) :
    ∃ K : Mat6, Equivalent H K ∧ H2BlockNormalizedPresentation K := by
  rcases hasHadamardTwoByTwo_equiv_h2Canonical hH hH₂ with
    ⟨K, hHK, hK⟩
  rcases h2Canonical_equiv_h2BlockNormalized hK with
    ⟨L, hKL, hL⟩
  exact ⟨L, equivalent_trans hHK hKL, hL⟩

end

end Hadamard6
