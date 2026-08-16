import Hadamard6.BlockGram
import Hadamard6.EquivalentStrata
import Hadamard6.BlockOppositePair
import Mathlib.Logic.Equiv.Fintype
import Mathlib.Tactic

/-!
# Intrinsic normalization of an `H₂` witness

This file formalizes the coordinate-free part of Karlsson's `H₂` reduction.
Starting from an arbitrary Hadamard `2 x 2` submatrix, it moves that witness to
the leading position, dephases it to `F₂`, and pairs the remaining four phases
in the second row and column into opposite pairs.  No Karlsson parameter or
published chart-coverage statement is used.
-/

namespace Hadamard6

noncomputable section

/-- The first two order-six indices, used for the normalized `F₂` block. -/
def h2LeadingPair : I2 ↪ I6 :=
  pairEmbedding (Sum.inl 0) (Sum.inl 1) (by simp)

@[simp] theorem h2LeadingPair_zero : h2LeadingPair 0 = Sum.inl 0 := rfl
@[simp] theorem h2LeadingPair_one : h2LeadingPair 1 = Sum.inl 1 := rfl

/-- Four unit phases with zero sum occur in two opposite pairs.  This is the
exact algebraic form of Karlsson's elementary rhombus lemma. -/
theorem four_unit_sum_zero_pairs
    {a b c d : ℂ}
    (ha : Complex.normSq a = 1) (hb : Complex.normSq b = 1)
    (hc : Complex.normSq c = 1) (hd : Complex.normSq d = 1)
    (hsum : a + b + c + d = 0) :
    (b = -a ∧ d = -c) ∨
      (c = -a ∧ d = -b) ∨
      (d = -a ∧ c = -b) := by
  have ha' : a * star a = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one ha
  have hb' : b * star b = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hb
  have hc' : c * star c = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hc
  have hd' : d * star d = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hd
  have hstarSum : star a + star b + star c + star d = 0 := by
    simpa only [star_add, star_zero] using congrArg star hsum
  have he3 : b * c * d + a * c * d + a * b * d + a * b * c = 0 := by
    have hmul := congrArg (fun z : ℂ ↦ a * b * c * d * z) hstarSum
    have hrewrite :
        a * b * c * d * (star a + star b + star c + star d) =
          b * c * d * (a * star a) +
          a * c * d * (b * star b) +
          a * b * d * (c * star c) +
          a * b * c * (d * star d) := by ring
    rw [hrewrite, ha', hb', hc', hd'] at hmul
    simpa using hmul
  have hid :
      ((-a - a) * (-a - b) * (-a - c) * (-a - d)) -
          ((a - a) * (a - b) * (a - c) * (a - d)) =
        2 * a ^ 3 * (a + b + c + d) +
          2 * a * (b * c * d + a * c * d + a * b * d + a * b * c) := by
    ring
  rw [hsum, he3] at hid
  norm_num at hid
  have ha0 : a ≠ 0 := ne_zero_of_normSq_eq_one ha
  have hfirst : -a - a ≠ 0 := by
    intro h
    have : (2 : ℂ) * a = 0 := by linear_combination -h
    exact ha0 (by simpa using (mul_eq_zero.mp this).resolve_left (by norm_num))
  rcases hid with ((haa | hab) | hac) | had
  · exact (hfirst haa).elim
  · left
    have hb : b = -a := (sub_eq_zero.mp hab).symm
    refine ⟨hb, ?_⟩
    apply eq_neg_of_add_eq_zero_right
    rw [hb] at hsum
    linear_combination hsum
  · right; left
    have hcneg : c = -a := (sub_eq_zero.mp hac).symm
    refine ⟨hcneg, ?_⟩
    apply eq_neg_of_add_eq_zero_right
    rw [hcneg] at hsum
    linear_combination hsum
  · right; right
    have hdneg : d = -a := (sub_eq_zero.mp had).symm
    refine ⟨hdneg, ?_⟩
    apply eq_neg_of_add_eq_zero_left
    rw [hdneg] at hsum
    linear_combination hsum

def h2Tail₀ : I6 := Sum.inl 2
def h2Tail₁ : I6 := Sum.inr 0
def h2Tail₂ : I6 := Sum.inr 1
def h2Tail₃ : I6 := Sum.inr 2

/-- A zero-sum unit four-tuple in the tail can be reordered, without moving
the first two indices, into two consecutive opposite pairs. -/
theorem exists_h2Tail_pair_permutation
    (f : I6 → ℂ)
    (hunit : ∀ i, Complex.normSq (f i) = 1)
    (hsum : f h2Tail₀ + f h2Tail₁ + f h2Tail₂ + f h2Tail₃ = 0) :
    ∃ τ : Equiv.Perm I6,
      τ (Sum.inl 0) = Sum.inl 0 ∧
      τ (Sum.inl 1) = Sum.inl 1 ∧
      f (τ h2Tail₀) + f (τ h2Tail₁) = 0 ∧
      f (τ h2Tail₂) + f (τ h2Tail₃) = 0 := by
  rcases four_unit_sum_zero_pairs
      (hunit h2Tail₀) (hunit h2Tail₁) (hunit h2Tail₂)
      (hunit h2Tail₃) hsum with h | h | h
  · refine ⟨Equiv.refl I6, by simp, by simp, ?_, ?_⟩
    · simp only [Equiv.refl_apply]
      rw [h.1]; ring
    · simp only [Equiv.refl_apply]
      rw [h.2]; ring
  · let τ : Equiv.Perm I6 := Equiv.swap h2Tail₁ h2Tail₂
    have hτ0 : τ (Sum.inl 0) = Sum.inl 0 := by decide
    have hτ1 : τ (Sum.inl 1) = Sum.inl 1 := by decide
    have hτt0 : τ h2Tail₀ = h2Tail₀ := by decide
    have hτt1 : τ h2Tail₁ = h2Tail₂ := by decide
    have hτt2 : τ h2Tail₂ = h2Tail₁ := by decide
    have hτt3 : τ h2Tail₃ = h2Tail₃ := by decide
    refine ⟨τ, ?_, ?_, ?_, ?_⟩
    · exact hτ0
    · exact hτ1
    · rw [hτt0, hτt1, h.1]; ring
    · rw [hτt2, hτt3, h.2]; ring
  · let τ : Equiv.Perm I6 :=
      (Equiv.swap h2Tail₂ h2Tail₃).trans
        (Equiv.swap h2Tail₁ h2Tail₃)
    have hτ0 : τ (Sum.inl 0) = Sum.inl 0 := by decide
    have hτ1 : τ (Sum.inl 1) = Sum.inl 1 := by decide
    have hτt0 : τ h2Tail₀ = h2Tail₀ := by decide
    have hτt1 : τ h2Tail₁ = h2Tail₃ := by decide
    have hτt2 : τ h2Tail₂ = h2Tail₁ := by decide
    have hτt3 : τ h2Tail₃ = h2Tail₂ := by decide
    refine ⟨τ, ?_, ?_, ?_, ?_⟩
    · exact hτ0
    · exact hτ1
    · rw [hτt0, hτt1, h.1]; ring
    · rw [hτt2, hτt3, h.2]; ring

/-- The canonical `H₂` skeleton obtained before introducing Karlsson's core
parameters.  The first row and column are dephased, the leading block is
`F₂`, and the remaining entries in its second row and column occur in two
opposite pairs. -/
structure H2CanonicalPresentation (K : Mat6) : Prop where
  hadamard : IsHadamard K
  dephased : IsDephased K
  leading_neg_one : K (Sum.inl 1) (Sum.inl 1) = -1
  z₁_unit : Complex.normSq (K (Sum.inl 1) h2Tail₀) = 1
  z₂_unit : Complex.normSq (K (Sum.inl 1) h2Tail₂) = 1
  z₃_unit : Complex.normSq (K h2Tail₀ (Sum.inl 1)) = 1
  z₄_unit : Complex.normSq (K h2Tail₂ (Sum.inl 1)) = 1
  row_pair₁ : K (Sum.inl 1) h2Tail₁ = -K (Sum.inl 1) h2Tail₀
  row_pair₂ : K (Sum.inl 1) h2Tail₃ = -K (Sum.inl 1) h2Tail₂
  column_pair₁ : K h2Tail₁ (Sum.inl 1) = -K h2Tail₀ (Sum.inl 1)
  column_pair₂ : K h2Tail₃ (Sum.inl 1) = -K h2Tail₂ (Sum.inl 1)

private theorem dephased_leading_hadamard2_neg_one
    {K : Mat6} (hdeph : IsDephased K)
    (hsub : IsHadamard2 (K.submatrix h2LeadingPair h2LeadingPair)) :
    K (Sum.inl 1) (Sum.inl 1) = -1 := by
  have hentry := congrArg (fun M : Mat2 ↦ M 0 1) hsub.2
  have h00 := hdeph.1 (Sum.inl 0)
  have h01 := hdeph.1 (Sum.inl 1)
  have h10 := hdeph.2 (Sum.inl 1)
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.submatrix_apply, Matrix.smul_apply, Matrix.one_apply,
    Fin.sum_univ_two, h2LeadingPair_zero, h2LeadingPair_one] at hentry
  have hentry' :
      1 + star (K (Sum.inl 1) (Sum.inl 1)) = 0 := by
    simpa [h00, h01, h10] using hentry
  have hzstar : star (K (Sum.inl 1) (Sum.inl 1)) = -1 :=
    eq_neg_of_add_eq_zero_right hentry'
  calc
    K (Sum.inl 1) (Sum.inl 1) = star (star (K (Sum.inl 1) (Sum.inl 1))) :=
      (star_star _).symm
    _ = star (-1 : ℂ) := congrArg star hzstar
    _ = -1 := by simp

private theorem dephased_second_row_tail_sum
    {K : Mat6} (hK : IsHadamard K) (hdeph : IsDephased K)
    (hneg : K (Sum.inl 1) (Sum.inl 1) = -1) :
    K (Sum.inl 1) h2Tail₀ + K (Sum.inl 1) h2Tail₁ +
      K (Sum.inl 1) h2Tail₂ + K (Sum.inl 1) h2Tail₃ = 0 := by
  have hentry := congrArg
    (fun M : Mat6 ↦ M (Sum.inl 0) (Sum.inl 1)) hK.2
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
    Fin.sum_univ_three] at hentry
  have hstar := congrArg star hentry
  simp only [star_add, star_mul, star_star] at hstar
  simp [hdeph.1, hdeph.2, hneg] at hstar
  simpa [h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hstar

private theorem dephased_second_column_tail_sum
    {K : Mat6} (hK : IsHadamard K) (hdeph : IsDephased K)
    (hneg : K (Sum.inl 1) (Sum.inl 1) = -1) :
    K h2Tail₀ (Sum.inl 1) + K h2Tail₁ (Sum.inl 1) +
      K h2Tail₂ (Sum.inl 1) + K h2Tail₃ (Sum.inl 1) = 0 := by
  have hcol := hadamard_column_gram hK
  have hentry := congrArg
    (fun M : Mat6 ↦ M (Sum.inl 0) (Sum.inl 1)) hcol
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.smul_apply, Matrix.one_apply, Fintype.sum_sum_type,
    Fin.sum_univ_three] at hentry
  simp [hdeph.1, hdeph.2, hneg] at hentry
  simpa [h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃, add_assoc] using hentry

/-- **Intrinsic `H₂` normalization.**  Every order-six Hadamard matrix with
one Hadamard `2 x 2` submatrix is equivalent to a canonical presentation with
the standard `F₂` block and paired second row and column. -/
theorem hasHadamardTwoByTwo_equiv_h2Canonical
    {H : Mat6} (hH : IsHadamard H)
    (hH₂ : HasHadamardTwoByTwo H) :
    ∃ K : Mat6, Equivalent H K ∧ H2CanonicalPresentation K := by
  rcases hH₂ with ⟨rows, cols, hsub⟩
  obtain ⟨σ₀, hσ₀⟩ := Equiv.Perm.exists_extending_pair
    h2LeadingPair rows h2LeadingPair.injective rows.injective
  obtain ⟨τ₀, hτ₀⟩ := Equiv.Perm.exists_extending_pair
    h2LeadingPair cols h2LeadingPair.injective cols.injective
  let K₀ := reindexMatrix σ₀ τ₀ H
  have hHK₀ : Equivalent H K₀ := equivalent_reindexMatrix σ₀ τ₀ H
  have hK₀ : IsHadamard K₀ := reindexMatrix_isHadamard hH
  have hsub₀ : IsHadamard2 (K₀.submatrix h2LeadingPair h2LeadingPair) := by
    have heq : K₀.submatrix h2LeadingPair h2LeadingPair =
        H.submatrix rows cols := by
      ext i j
      simp [K₀, reindexMatrix, hσ₀, hτ₀]
    rwa [heq]
  let K₁ := dephase K₀
  have hK₀K₁ : Equivalent K₀ K₁ := equivalent_dephase hK₀.1
  have hK₁ : IsHadamard K₁ := dephase_isHadamard hK₀
  have hdeph₁ : IsDephased K₁ := dephase_isDephased hK₀.1
  let rr : I2 → ℂ := fun i ↦ dephaseRowFactor K₀ (h2LeadingPair i)
  let cc : I2 → ℂ := fun j ↦ dephaseColumnFactor K₀ (h2LeadingPair j)
  have hrr : ∀ i, Complex.normSq (rr i) = 1 :=
    fun i ↦ dephaseRowFactor_unit hK₀.1 _
  have hcc : ∀ j, Complex.normSq (cc j) = 1 :=
    fun j ↦ dephaseColumnFactor_unit hK₀.1 _
  have hsub₁ : IsHadamard2 (K₁.submatrix h2LeadingPair h2LeadingPair) := by
    have hphase := phaseTransform2_isHadamard2 hrr hcc hsub₀
    have heq : phaseTransform2 rr cc
        (K₀.submatrix h2LeadingPair h2LeadingPair) =
        K₁.submatrix h2LeadingPair h2LeadingPair := by
      ext i j
      rfl
    rwa [heq] at hphase
  have hneg := dephased_leading_hadamard2_neg_one hdeph₁ hsub₁
  have hrowSum := dephased_second_row_tail_sum hK₁ hdeph₁ hneg
  have hcolSum := dephased_second_column_tail_sum hK₁ hdeph₁ hneg
  obtain ⟨τ, hτ0, hτ1, hrowPair₁, hrowPair₂⟩ :=
    exists_h2Tail_pair_permutation
      (fun j ↦ K₁ (Sum.inl 1) j) (fun j ↦ hK₁.1 _ j) hrowSum
  obtain ⟨σ, hσ0, hσ1, hcolPair₁, hcolPair₂⟩ :=
    exists_h2Tail_pair_permutation
      (fun i ↦ K₁ i (Sum.inl 1)) (fun i ↦ hK₁.1 i _) hcolSum
  let K := reindexMatrix σ τ K₁
  have hK₁K : Equivalent K₁ K := equivalent_reindexMatrix σ τ K₁
  have hK : IsHadamard K := reindexMatrix_isHadamard hK₁
  have hdeph : IsDephased K := by
    constructor
    · intro j
      simp [K, reindexMatrix, hσ0, hdeph₁.1]
    · intro i
      simp [K, reindexMatrix, hτ0, hdeph₁.2]
  refine ⟨K, equivalent_trans hHK₀ (equivalent_trans hK₀K₁ hK₁K), ?_⟩
  refine {
    hadamard := hK
    dephased := hdeph
    leading_neg_one := by simp [K, reindexMatrix, hσ1, hτ1, hneg]
    z₁_unit := hK₁.1 _ _
    z₂_unit := hK₁.1 _ _
    z₃_unit := hK₁.1 _ _
    z₄_unit := hK₁.1 _ _
    row_pair₁ := by
      simp only [K, reindexMatrix, hσ1]
      exact eq_neg_of_add_eq_zero_right hrowPair₁
    row_pair₂ := by
      simp only [K, reindexMatrix, hσ1]
      exact eq_neg_of_add_eq_zero_right hrowPair₂
    column_pair₁ := by
      simp only [K, reindexMatrix, hτ1]
      exact eq_neg_of_add_eq_zero_right hcolPair₁
    column_pair₂ := by
      simp only [K, reindexMatrix, hτ1]
      exact eq_neg_of_add_eq_zero_right hcolPair₂ }

end

end Hadamard6
