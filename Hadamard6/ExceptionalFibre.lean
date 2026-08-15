import Hadamard6.TwoCircle
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# The finite exceptional-coordinate argument

This file isolates the elementary part of the repaired infinite-fibre proof.
It does not assume the quotient-branch calculation.  It proves that a finite
set of exceptional coordinates can contain a coordinate of infinitely many
unit triples having a fixed sum only when one exceptional coordinate equals
that sum.
-/

namespace Hadamard6

/-- The quadratic factor occurring in the eliminated Haagerup equation. -/
def kappa (S x : ℂ) : ℂ :=
  2 * star S * x ^ 2 - (Complex.normSq S + 3) * x + 2 * S

theorem kappa_one (x : ℂ) : kappa 1 x = 2 * (x - 1) ^ 2 := by
  simp [kappa]
  ring

/-- A normalized row: three phases having prescribed sum `s`. -/
def phaseTriplesAtSum (s : ℂ) : Set (ℂ × ℂ × ℂ) :=
  {t | Complex.normSq t.1 = 1 ∧
       Complex.normSq t.2.1 = 1 ∧
       Complex.normSq t.2.2 = 1 ∧
       t.1 + t.2.1 + t.2.2 = s}

def triplesWithFirst (s r : ℂ) : Set (ℂ × ℂ × ℂ) :=
  {t | t ∈ phaseTriplesAtSum s ∧ t.1 = r}

def triplesWithSecond (s r : ℂ) : Set (ℂ × ℂ × ℂ) :=
  {t | t ∈ phaseTriplesAtSum s ∧ t.2.1 = r}

def triplesWithThird (s r : ℂ) : Set (ℂ × ℂ × ℂ) :=
  {t | t ∈ phaseTriplesAtSum s ∧ t.2.2 = r}

theorem triplesWithFirst_finite {s r : ℂ} (h : s - r ≠ 0) :
    (triplesWithFirst s r).Finite := by
  have hp := phasePairs_finite h
  have hi : triplesWithFirst s r ⊆
      (fun p : ℂ × ℂ ↦ (r, p.1, p.2)) '' phasePairs (s - r) := by
    rintro ⟨x, y, z⟩ hx
    refine ⟨(y, z), ?_, ?_⟩
    · exact ⟨hx.1.2.1, hx.1.2.2.1, by
        linear_combination hx.1.2.2.2 - hx.2⟩
    · exact congrArg (fun w ↦ (w, y, z)) hx.2.symm
  exact (hp.image (fun p : ℂ × ℂ ↦ (r, p.1, p.2))).subset hi

theorem triplesWithSecond_finite {s r : ℂ} (h : s - r ≠ 0) :
    (triplesWithSecond s r).Finite := by
  have hp := phasePairs_finite h
  have hi : triplesWithSecond s r ⊆
      (fun p : ℂ × ℂ ↦ (p.1, r, p.2)) '' phasePairs (s - r) := by
    rintro ⟨x, y, z⟩ hx
    refine ⟨(x, z), ?_, ?_⟩
    · exact ⟨hx.1.1, hx.1.2.2.1, by
        linear_combination hx.1.2.2.2 - hx.2⟩
    · exact congrArg (fun w ↦ (x, w, z)) hx.2.symm
  exact (hp.image (fun p : ℂ × ℂ ↦ (p.1, r, p.2))).subset hi

theorem triplesWithThird_finite {s r : ℂ} (h : s - r ≠ 0) :
    (triplesWithThird s r).Finite := by
  have hp := phasePairs_finite h
  have hi : triplesWithThird s r ⊆
      (fun p : ℂ × ℂ ↦ (p.1, p.2, r)) '' phasePairs (s - r) := by
    rintro ⟨x, y, z⟩ hx
    refine ⟨(x, y), ?_, ?_⟩
    · exact ⟨hx.1.1, hx.1.2.1, by
        linear_combination hx.1.2.2.2 - hx.2⟩
    · exact congrArg (fun w ↦ (x, y, w)) hx.2.symm
  exact (hp.image (fun p : ℂ × ℂ ↦ (p.1, p.2, r))).subset hi

/-- The exceptional-locus pigeonhole step. -/
theorem infinite_phaseTriples_hit_finite_set
    {s : ℂ} {Z : Set ℂ} {Rows : Set (ℂ × ℂ × ℂ)}
    (hZ : Z.Finite) (hRows : Rows.Infinite)
    (hvalid : Rows ⊆ phaseTriplesAtSum s)
    (hhit : ∀ t ∈ Rows, t.1 ∈ Z ∨ t.2.1 ∈ Z ∨ t.2.2 ∈ Z) :
    ∃ r ∈ Z, s - r = 0 := by
  by_contra hnone
  push Not at hnone
  have hfirst :
      (⋃ r ∈ Z, triplesWithFirst s r).Finite := by
    exact hZ.biUnion fun r hr ↦ triplesWithFirst_finite (hnone r hr)
  have hsecond :
      (⋃ r ∈ Z, triplesWithSecond s r).Finite := by
    exact hZ.biUnion fun r hr ↦ triplesWithSecond_finite (hnone r hr)
  have hthird :
      (⋃ r ∈ Z, triplesWithThird s r).Finite := by
    exact hZ.biUnion fun r hr ↦ triplesWithThird_finite (hnone r hr)
  have hall := (hfirst.union hsecond).union hthird
  exact hRows (hall.subset (by
    intro t ht
    rcases hhit t ht with h0 | h1 | h2
    · apply Or.inl; apply Or.inl
      simp only [Set.mem_iUnion]
      exact ⟨t.1, h0, ⟨hvalid ht, rfl⟩⟩
    · apply Or.inl; apply Or.inr
      simp only [Set.mem_iUnion]
      exact ⟨t.2.1, h1, ⟨hvalid ht, rfl⟩⟩
    · apply Or.inr
      simp only [Set.mem_iUnion]
      exact ⟨t.2.2, h2, ⟨hvalid ht, rfl⟩⟩))

/-- A nonnegative real number which is also a complex phase and equals that
phase must be `1`. -/
theorem nonnegative_real_phase_eq_one {s : ℝ} {r : ℂ}
    (hs : 0 ≤ s) (hr : Complex.normSq r = 1) (hsr : (s : ℂ) = r) :
    s = 1 ∧ r = 1 := by
  have hmul : s * s = 1 := by
    have := hr
    rw [← hsr] at this
    simpa only [Complex.normSq_apply, Complex.ofReal_re,
      Complex.ofReal_im, mul_zero, sub_zero, add_zero] using this
  have hsone : s = 1 := by nlinarith
  refine ⟨hsone, ?_⟩
  simp [← hsr, hsone]

theorem infinite_exceptional_rows_force_sum_one
    {s : ℝ} {Z : Set ℂ} {Rows : Set (ℂ × ℂ × ℂ)}
    (hs : 0 ≤ s) (hZ : Z.Finite)
    (hZunit : ∀ r ∈ Z, Complex.normSq r = 1)
    (hRows : Rows.Infinite)
    (hvalid : Rows ⊆ phaseTriplesAtSum (s : ℂ))
    (hhit : ∀ t ∈ Rows, t.1 ∈ Z ∨ t.2.1 ∈ Z ∨ t.2.2 ∈ Z) :
    s = 1 := by
  rcases infinite_phaseTriples_hit_finite_set hZ hRows hvalid hhit with
    ⟨r, hrZ, hsr⟩
  have heq : (s : ℂ) = r := sub_eq_zero.mp hsr
  exact (nonnegative_real_phase_eq_one hs (hZunit r hrZ) heq).1

/-- A unit triple of sum one containing `1` is a permutation of
`(1,z,-z)`. -/
theorem phaseTriple_sum_one_containing_one
    {t : ℂ × ℂ × ℂ}
    (ht : t ∈ phaseTriplesAtSum 1)
    (hone : t.1 = 1 ∨ t.2.1 = 1 ∨ t.2.2 = 1) :
    (∃ z, Complex.normSq z = 1 ∧ t = (1, z, -z)) ∨
    (∃ z, Complex.normSq z = 1 ∧ t = (z, 1, -z)) ∨
    (∃ z, Complex.normSq z = 1 ∧ t = (z, -z, 1)) := by
  rcases t with ⟨x, y, z⟩
  rcases hone with hx | hy | hz
  · left
    change x = 1 at hx
    refine ⟨y, ht.2.1, ?_⟩
    have hneg : z = -y := by
      apply eq_neg_of_add_eq_zero_left
      linear_combination ht.2.2.2 - hx
    simp [hx, hneg]
  · right; left
    change y = 1 at hy
    refine ⟨x, ht.1, ?_⟩
    have hneg : z = -x := by
      apply eq_neg_of_add_eq_zero_left
      linear_combination ht.2.2.2 - hy
    simp [hy, hneg]
  · right; right
    change z = 1 at hz
    refine ⟨x, ht.1, ?_⟩
    have hneg : y = -x := by
      apply eq_neg_of_add_eq_zero_left
      linear_combination ht.2.2.2 - hz
    simp [hz, hneg]

def oppositePairHadamard (z : ℂ) : Mat2 :=
  !![1, 1; z, -z]

theorem oppositePairHadamard_isHadamard {z : ℂ}
    (hz : Complex.normSq z = 1) :
    IsHadamard2 (oppositePairHadamard z) := by
  constructor
  · intro i j
    fin_cases i <;> fin_cases j <;>
      simp [oppositePairHadamard, hz]
  · ext i j
    fin_cases i <;> fin_cases j <;>
      simp [oppositePairHadamard, Matrix.mul_apply,
        Matrix.conjTranspose_apply, Fin.sum_univ_two,
        Complex.star_def, Complex.mul_conj, hz] <;> norm_num

end Hadamard6
