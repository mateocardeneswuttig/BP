import Hadamard6.BlockGram
import Hadamard6.BlockSwapMatrices
import Hadamard6.EquivalentStrata
import Hadamard6.FibreGauge
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# Vanishing minors force a reducible `2 x 2` submatrix

The local algebra in Szöllősi's vanishing-minor lemma is separated from the
Karlsson classification.  This file first proves its structural core: a
singular dephased unimodular `3 x 3` corner has two equal rows or columns.
-/

namespace Hadamard6

def HasRepeatedRowOrColumn3 (X : Mat3) : Prop :=
  (∃ i k : I3, i ≠ k ∧ ∀ j, X i j = X k j) ∨
  (∃ j l : I3, j ≠ l ∧ ∀ i, X i j = X i l)

theorem singular_corner_hasRepeatedRowOrColumn
    {a b c d : ℂ}
    (ha : Complex.normSq a = 1) (hb : Complex.normSq b = 1)
    (hc : Complex.normSq c = 1) (hd : Complex.normSq d = 1)
    (hdet : Matrix.det (corner a b c d) = 0) :
    HasRepeatedRowOrColumn3 (corner a b c d) := by
  have hua : a * star a = 1 := by
    simpa [Complex.star_def, ha] using Complex.mul_conj a
  have hub : b * star b = 1 := by
    simpa [Complex.star_def, hb] using Complex.mul_conj b
  have huc : c * star c = 1 := by
    simpa [Complex.star_def, hc] using Complex.mul_conj c
  have hud : d * star d = 1 := by
    simpa [Complex.star_def, hd] using Complex.mul_conj d
  have hdet0 : a * d - b * c - d + b + c - a = 0 := by
    simpa [corner, Matrix.det_fin_three] using hdet
  have hdet' : b + c - a - d + a * d - b * c = 0 := by
    linear_combination hdet0
  by_cases ha1 : a = 1
  · subst a
    have hbc : (b - 1) * (c - 1) = 0 := by
      linear_combination -hdet'
    rcases mul_eq_zero.mp hbc with hb1 | hc1
    · left
      have hb1' : b = 1 := sub_eq_zero.mp hb1
      refine ⟨0, 1, by decide, ?_⟩
      intro j
      fin_cases j <;> simp [corner, hb1']
    · right
      have hc1' : c = 1 := sub_eq_zero.mp hc1
      refine ⟨0, 1, by decide, ?_⟩
      intro i
      fin_cases i <;> simp [corner, hc1']
  · by_cases hb1 : b = 1
    · subst b
      have had : (a - 1) * (d - 1) = 0 := by
        linear_combination hdet'
      rcases mul_eq_zero.mp had with ha' | hd1
      · exact False.elim (ha1 (sub_eq_zero.mp ha'))
      · right
        refine ⟨0, 2, by decide, ?_⟩
        intro i
        fin_cases i <;> simp [corner, sub_eq_zero.mp hd1]
    · by_cases hc1 : c = 1
      · subst c
        have had : (a - 1) * (d - 1) = 0 := by
          linear_combination hdet'
        rcases mul_eq_zero.mp had with ha' | hd1
        · exact False.elim (ha1 (sub_eq_zero.mp ha'))
        · left
          refine ⟨0, 2, by decide, ?_⟩
          intro j
          fin_cases j <;> simp [corner, sub_eq_zero.mp hd1]
      · by_cases hd1 : d = 1
        · subst d
          have hbc : (b - 1) * (c - 1) = 0 := by
            linear_combination -hdet'
          rcases mul_eq_zero.mp hbc with hb' | hc'
          · exact False.elim (hb1 (sub_eq_zero.mp hb'))
          · exact False.elim (hc1 (sub_eq_zero.mp hc'))
        · have hdsolve : (a - 1) * d = a + b * c - b - c := by
            linear_combination hdet'
          have hnorm :
              (a + b * c - b - c) * star (a + b * c - b - c) =
                (a - 1) * star (a - 1) := by
            rw [← hdsolve]
            simp only [star_mul, star_sub, star_one]
            calc
              ((a - 1) * d) * (star d * (star a - 1)) =
                  ((a - 1) * (star a - 1)) * (d * star d) := by ring
              _ = (a - 1) * (star a - 1) := by rw [hud, mul_one]
          have hnorm0 :
              (a + b * c - b - c) *
                  (star a + star c * star b - star b - star c) -
                (a - 1) * (star a - 1) = 0 := by
            simpa only [star_add, star_mul, star_sub, star_one,
              sub_eq_zero] using hnorm
          have hfactor :
              (a - b) * (a - c) * (b - 1) * (c - 1) = 0 := by
            linear_combination
              a * b * c * hnorm0 +
              (-b * c * (b - 1) * (c - 1)) * hua +
              (-a * c * (star c - 1) *
                (a + b * c - b - c)) * hub +
              (a * (b - 1) * (a + b * c - b - c)) * huc
          rcases mul_eq_zero.mp hfactor with habc | hc'
          · rcases mul_eq_zero.mp habc with hab | hac
            · rcases mul_eq_zero.mp hab with hab | hac
              · have hab' : a = b := sub_eq_zero.mp hab
                have hcd : c = d := by
                  have hprod : (c - d) * (1 - a) = 0 := by
                    rw [← hab'] at hdet'
                    linear_combination hdet'
                  rcases mul_eq_zero.mp hprod with hcd | ha'
                  · exact sub_eq_zero.mp hcd
                  · exact False.elim (ha1 (Eq.symm (sub_eq_zero.mp ha')))
                right
                refine ⟨1, 2, by decide, ?_⟩
                intro i
                fin_cases i <;> simp [corner, hab', hcd]
              · have hac' : a = c := sub_eq_zero.mp hac
                have hbd : b = d := by
                  have hprod : (b - d) * (1 - a) = 0 := by
                    rw [← hac'] at hdet'
                    linear_combination hdet'
                  rcases mul_eq_zero.mp hprod with hbd | ha'
                  · exact sub_eq_zero.mp hbd
                  · exact False.elim (ha1 (Eq.symm (sub_eq_zero.mp ha')))
                left
                refine ⟨1, 2, by decide, ?_⟩
                intro j
                fin_cases j <;> simp [corner, hac', hbd]
            · exact False.elim (hb1 (sub_eq_zero.mp hac))
          · exact False.elim (hc1 (sub_eq_zero.mp hc'))

theorem three_units_sum_eq_neg_three
    {x y z : ℂ}
    (hx : Complex.normSq x = 1) (hy : Complex.normSq y = 1)
    (hz : Complex.normSq z = 1) (hsum : x + y + z = -3) :
    x = -1 ∧ y = -1 ∧ z = -1 := by
  have hnx : x.re ^ 2 + x.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hx
  have hny : y.re ^ 2 + y.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hy
  have hnz : z.re ^ 2 + z.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hz
  have hre : x.re + y.re + z.re = -3 := by
    have := congrArg Complex.re hsum
    norm_num [Complex.add_re, Complex.neg_re] at this ⊢
    exact this
  have hxlo : -1 ≤ x.re := by
    nlinarith [sq_nonneg (x.re + 1), sq_nonneg x.im]
  have hylo : -1 ≤ y.re := by
    nlinarith [sq_nonneg (y.re + 1), sq_nonneg y.im]
  have hzlo : -1 ≤ z.re := by
    nlinarith [sq_nonneg (z.re + 1), sq_nonneg z.im]
  have hxre : x.re = -1 := by linarith
  have hyre : y.re = -1 := by linarith
  have hzre : z.re = -1 := by linarith
  have hxim : x.im = 0 := by nlinarith [sq_nonneg x.im]
  have hyim : y.im = 0 := by nlinarith [sq_nonneg y.im]
  have hzim : z.im = 0 := by nlinarith [sq_nonneg z.im]
  constructor
  · apply Complex.ext <;> simp [hxre, hxim]
  constructor
  · apply Complex.ext <;> simp [hyre, hyim]
  · apply Complex.ext <;> simp [hzre, hzim]

theorem unit_mul_star_of_normSq_one {z : ℂ}
    (hz : Complex.normSq z = 1) : z * star z = 1 := by
  calc
    z * star z = (Complex.normSq z : ℂ) := by
      simpa [Complex.star_def] using Complex.mul_conj z
    _ = 1 := by rw [hz]; norm_num

theorem unit_star_mul_of_normSq_one {z : ℂ}
    (hz : Complex.normSq z = 1) : star z * z = 1 := by
  rw [mul_comm]
  exact unit_mul_star_of_normSq_one hz

/-- The relative phase of two unit complex numbers is again a unit phase. -/
theorem normSq_mul_star_eq_one {x y : ℂ}
    (hx : Complex.normSq x = 1) (hy : Complex.normSq y = 1) :
    Complex.normSq (x * star y) = 1 := by
  simp [Complex.star_def, Complex.normSq_mul, Complex.normSq_conj, hx, hy]

/-- The conjugate-relative phase of two unit complex numbers is again a unit
phase. -/
theorem normSq_star_mul_eq_one {x y : ℂ}
    (hx : Complex.normSq x = 1) (hy : Complex.normSq y = 1) :
    Complex.normSq (star x * y) = 1 := by
  simp [Complex.star_def, Complex.normSq_mul, Complex.normSq_conj, hx, hy]

def pairEmbedding6 (a b : I6) (hab : a ≠ b) : I2 ↪ I6 where
  toFun := Fin.cases a (fun _ ↦ b)
  inj' := by
    intro i j h
    fin_cases i <;> fin_cases j
    · rfl
    · exact (hab h).elim
    · exact (hab h.symm).elim
    · rfl

@[simp] theorem pairEmbedding6_zero (a b : I6) (hab : a ≠ b) :
    pairEmbedding6 a b hab 0 = a := rfl

@[simp] theorem pairEmbedding6_one (a b : I6) (hab : a ≠ b) :
    pairEmbedding6 a b hab 1 = b := rfl

theorem isHadamard2_of_entrywise_cross
    {X : Mat2} (hunit : EntrywiseUnit X)
    (hcross : X 0 0 * star (X 1 0) + X 0 1 * star (X 1 1) = 0) :
    IsHadamard2 X := by
  constructor
  · exact hunit
  · ext i j
    fin_cases i <;> fin_cases j
    · simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two, Matrix.smul_apply, Matrix.one_apply, if_pos,
        smul_eq_mul, mul_one]
      change X 0 0 * star (X 0 0) + X 0 1 * star (X 0 1) = 2
      rw [unit_mul_star_of_normSq_one (hunit 0 0),
        unit_mul_star_of_normSq_one (hunit 0 1)]
      norm_num
    · simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two] using hcross
    · have hstar := congrArg star hcross
      simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two, star_add, star_mul, mul_comm] using hstar
    · simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
        Fin.sum_univ_two, Matrix.smul_apply, Matrix.one_apply, if_pos,
        smul_eq_mul, mul_one]
      change X 1 0 * star (X 1 0) + X 1 1 * star (X 1 1) = 2
      rw [unit_mul_star_of_normSq_one (hunit 1 0),
        unit_mul_star_of_normSq_one (hunit 1 1)]
      norm_num

theorem hasHadamardTwoByTwo_of_cross_sum
    {H : Mat6} (hunit : EntrywiseUnit H)
    {r₀ r₁ c₀ c₁ : I6} (hr : r₀ ≠ r₁) (hc : c₀ ≠ c₁)
    (hcross : H r₀ c₀ * star (H r₁ c₀) +
      H r₀ c₁ * star (H r₁ c₁) = 0) :
    HasHadamardTwoByTwo H := by
  let rows := pairEmbedding6 r₀ r₁ hr
  let cols := pairEmbedding6 c₀ c₁ hc
  refine ⟨rows, cols, ?_⟩
  apply isHadamard2_of_entrywise_cross
  · intro i j
    exact hunit (rows i) (cols j)
  · exact hcross

theorem repeatedRows_topLeft_hasHadamardTwoByTwo
    {H : Mat6} (hH : IsHadamard H) {i k : I3} (hik : i ≠ k)
    (heq : ∀ j, Matrix.toBlocks₁₁ H i j = Matrix.toBlocks₁₁ H k j) :
    HasHadamardTwoByTwo H := by
  let E := Matrix.toBlocks₁₁ H
  let B := Matrix.toBlocks₁₂ H
  have hEunit : EntrywiseUnit E := (hadamard_blocks_entrywiseUnit hH).1
  have hgram := (hadamard_row_block_grams hH).1
  have hEcross : (E * Matrix.conjTranspose E) i k = 3 := by
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three]
    change Matrix.toBlocks₁₁ H i 0 * star (Matrix.toBlocks₁₁ H k 0) +
      Matrix.toBlocks₁₁ H i 1 * star (Matrix.toBlocks₁₁ H k 1) +
      Matrix.toBlocks₁₁ H i 2 * star (Matrix.toBlocks₁₁ H k 2) = 3
    rw [heq 0, heq 1, heq 2]
    rw [unit_mul_star_of_normSq_one (hEunit k 0),
      unit_mul_star_of_normSq_one (hEunit k 1),
      unit_mul_star_of_normSq_one (hEunit k 2)]
    norm_num
  have hgik := congrArg (fun M : Mat3 ↦ M i k) hgram
  have hBcross : (B * Matrix.conjTranspose B) i k = -3 := by
    change (E * Matrix.conjTranspose E) i k +
      (B * Matrix.conjTranspose B) i k = sixI3 i k at hgik
    rw [hEcross] at hgik
    have hsix : sixI3 i k = 0 := by simp [sixI3, hik]
    rw [hsix] at hgik
    linear_combination hgik
  have hsum :
      B i 0 * star (B k 0) + B i 1 * star (B k 1) +
        B i 2 * star (B k 2) = -3 := by
    simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three] using hBcross
  have hu0 : Complex.normSq (B i 0 * star (B k 0)) = 1 := by
    exact normSq_mul_star_eq_one (hH.1 _ _) (hH.1 _ _)
  have hu1 : Complex.normSq (B i 1 * star (B k 1)) = 1 := by
    exact normSq_mul_star_eq_one (hH.1 _ _) (hH.1 _ _)
  have hu2 : Complex.normSq (B i 2 * star (B k 2)) = 1 := by
    exact normSq_mul_star_eq_one (hH.1 _ _) (hH.1 _ _)
  have hneg := (three_units_sum_eq_neg_three hu0 hu1 hu2 hsum).1
  apply hasHadamardTwoByTwo_of_cross_sum hH.1
    (r₀ := Sum.inl i) (r₁ := Sum.inl k)
    (c₀ := Sum.inl 0) (c₁ := Sum.inr 0)
    (by simpa using hik) (by simp)
  have heq0 : H (Sum.inl i) (Sum.inl 0) =
      H (Sum.inl k) (Sum.inl 0) := heq 0
  have hneg0 : H (Sum.inl i) (Sum.inr 0) *
      star (H (Sum.inl k) (Sum.inr 0)) = -1 := hneg
  rw [heq0, hneg0]
  rw [unit_mul_star_of_normSq_one (hH.1 _ _)]
  norm_num

theorem repeatedColumns_topLeft_hasHadamardTwoByTwo
    {H : Mat6} (hH : IsHadamard H) {j l : I3} (hjl : j ≠ l)
    (heq : ∀ i, Matrix.toBlocks₁₁ H i j = Matrix.toBlocks₁₁ H i l) :
    HasHadamardTwoByTwo H := by
  let E := Matrix.toBlocks₁₁ H
  let C := Matrix.toBlocks₂₁ H
  have hEunit : EntrywiseUnit E := (hadamard_blocks_entrywiseUnit hH).1
  have hgram := (hadamard_column_block_grams hH).1
  have hEcross : (Matrix.conjTranspose E * E) j l = 3 := by
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three]
    change star (Matrix.toBlocks₁₁ H 0 j) * Matrix.toBlocks₁₁ H 0 l +
      star (Matrix.toBlocks₁₁ H 1 j) * Matrix.toBlocks₁₁ H 1 l +
      star (Matrix.toBlocks₁₁ H 2 j) * Matrix.toBlocks₁₁ H 2 l = 3
    rw [← heq 0, ← heq 1, ← heq 2]
    rw [unit_star_mul_of_normSq_one (hEunit 0 j),
      unit_star_mul_of_normSq_one (hEunit 1 j),
      unit_star_mul_of_normSq_one (hEunit 2 j)]
    norm_num
  have hgjl := congrArg (fun M : Mat3 ↦ M j l) hgram
  have hCcross : (Matrix.conjTranspose C * C) j l = -3 := by
    change (Matrix.conjTranspose E * E) j l +
      (Matrix.conjTranspose C * C) j l = sixI3 j l at hgjl
    rw [hEcross] at hgjl
    have hsix : sixI3 j l = 0 := by simp [sixI3, hjl]
    rw [hsix] at hgjl
    linear_combination hgjl
  have hsum :
      star (C 0 j) * C 0 l + star (C 1 j) * C 1 l +
        star (C 2 j) * C 2 l = -3 := by
    simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three] using hCcross
  have hu0 : Complex.normSq (star (C 0 j) * C 0 l) = 1 := by
    exact normSq_star_mul_eq_one (hH.1 _ _) (hH.1 _ _)
  have hu1 : Complex.normSq (star (C 1 j) * C 1 l) = 1 := by
    exact normSq_star_mul_eq_one (hH.1 _ _) (hH.1 _ _)
  have hu2 : Complex.normSq (star (C 2 j) * C 2 l) = 1 := by
    exact normSq_star_mul_eq_one (hH.1 _ _) (hH.1 _ _)
  have hneg := (three_units_sum_eq_neg_three hu0 hu1 hu2 hsum).1
  have hCl : C 0 l = -C 0 j := by
    have hu : C 0 j * star (C 0 j) = 1 := by
      calc
        C 0 j * star (C 0 j) = (Complex.normSq (C 0 j) : ℂ) := by
          simpa [Complex.star_def] using Complex.mul_conj (C 0 j)
        _ = 1 := by rw [show Complex.normSq (C 0 j) = 1 from hH.1 _ _]; norm_num
    calc
      C 0 l = (C 0 j * star (C 0 j)) * C 0 l := by rw [hu, one_mul]
      _ = C 0 j * (star (C 0 j) * C 0 l) := by ring
      _ = -C 0 j := by rw [hneg]; ring
  apply hasHadamardTwoByTwo_of_cross_sum hH.1
    (r₀ := Sum.inl 0) (r₁ := Sum.inr 0)
    (c₀ := Sum.inl j) (c₁ := Sum.inl l)
    (by simp) (by simpa using hjl)
  have heq0 : H (Sum.inl 0) (Sum.inl j) =
      H (Sum.inl 0) (Sum.inl l) := heq 0
  have hCl0 : H (Sum.inr 0) (Sum.inl l) =
      -H (Sum.inr 0) (Sum.inl j) := hCl
  rw [← heq0, hCl0]
  simp

theorem singular_topLeft_hasHadamardTwoByTwo
    {H : Mat6} (hH : IsHadamard H)
    (hdet : Matrix.det (Matrix.toBlocks₁₁ H) = 0) :
    HasHadamardTwoByTwo H := by
  let K := dephase H
  have hK : IsHadamard K := dephase_isHadamard hH
  have hdeph : IsDephased K := dephase_isDephased hH.1
  let a := K (Sum.inl 1) (Sum.inl 1)
  let b := K (Sum.inl 1) (Sum.inl 2)
  let c := K (Sum.inl 2) (Sum.inl 1)
  let d := K (Sum.inl 2) (Sum.inl 2)
  have hcorner : Matrix.toBlocks₁₁ K = corner a b c d := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [Matrix.toBlocks₁₁, corner, a, b, c, d, hdeph.1, hdeph.2]
  have hdetK : Matrix.det (Matrix.toBlocks₁₁ K) = 0 := by
    change Matrix.det
      (biGauge (fun i ↦ dephaseRowFactor H (Sum.inl i))
        (fun j ↦ dephaseColumnFactor H (Sum.inl j))
        (Matrix.toBlocks₁₁ H)) = 0
    rw [biGauge_det, hdet]
    ring
  have hrep : HasRepeatedRowOrColumn3 (Matrix.toBlocks₁₁ K) := by
    rw [hcorner]
    apply singular_corner_hasRepeatedRowOrColumn
    · exact hK.1 _ _
    · exact hK.1 _ _
    · exact hK.1 _ _
    · exact hK.1 _ _
    · simpa [hcorner] using hdetK
  have htwoK : HasHadamardTwoByTwo K := by
    rcases hrep with hrows | hcols
    · rcases hrows with ⟨i, k, hik, heq⟩
      exact repeatedRows_topLeft_hasHadamardTwoByTwo hK hik heq
    · rcases hcols with ⟨j, l, hjl, heq⟩
      exact repeatedColumns_topLeft_hasHadamardTwoByTwo hK hjl heq
  exact hasHadamardTwoByTwo_of_equivalent
    (equivalent_dephase hH.1) htwoK

theorem singular_topRight_hasHadamardTwoByTwo
    {H : Mat6} (hH : IsHadamard H)
    (hdet : Matrix.det (Matrix.toBlocks₁₂ H) = 0) :
    HasHadamardTwoByTwo H := by
  let K := swapBlockColumns H
  have hK : IsHadamard K := swapBlockColumns_isHadamard hH
  have hdetK : Matrix.det (Matrix.toBlocks₁₁ K) = 0 := by
    simpa [K] using hdet
  exact hasHadamardTwoByTwo_of_equivalent
    (equivalent_swapBlockColumns H)
    (singular_topLeft_hasHadamardTwoByTwo hK hdetK)

theorem singular_bottomLeft_hasHadamardTwoByTwo
    {H : Mat6} (hH : IsHadamard H)
    (hdet : Matrix.det (Matrix.toBlocks₂₁ H) = 0) :
    HasHadamardTwoByTwo H := by
  let K := swapBlockRows H
  have hK : IsHadamard K := swapBlockRows_isHadamard hH
  have hdetK : Matrix.det (Matrix.toBlocks₁₁ K) = 0 := by
    simpa [K] using hdet
  exact hasHadamardTwoByTwo_of_equivalent
    (equivalent_swapBlockRows H)
    (singular_topLeft_hasHadamardTwoByTwo hK hdetK)

theorem singular_bottomRight_hasHadamardTwoByTwo
    {H : Mat6} (hH : IsHadamard H)
    (hdet : Matrix.det (Matrix.toBlocks₂₂ H) = 0) :
    HasHadamardTwoByTwo H := by
  let L := swapBlockRows H
  let K := swapBlockColumns L
  have hL : IsHadamard L := swapBlockRows_isHadamard hH
  have hK : IsHadamard K := swapBlockColumns_isHadamard hL
  have hdetK : Matrix.det (Matrix.toBlocks₁₁ K) = 0 := by
    simpa [K, L] using hdet
  have heq : Equivalent H K := equivalent_trans
    (equivalent_swapBlockRows H) (equivalent_swapBlockColumns L)
  exact hasHadamardTwoByTwo_of_equivalent heq
    (singular_topLeft_hasHadamardTwoByTwo hK hdetK)

end Hadamard6
