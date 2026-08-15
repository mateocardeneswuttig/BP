import Hadamard6.DependentFibre
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-!
# Coefficient algebra in the dependent branch

After phasing the three rows, the fixed Gram data have the canonical form
`S=s`, `T=t`, `R=t*z`, where `s,t` are nonnegative real numbers and `z` is a
phase.  This file verifies the four displayed coefficient formulas and the
factorization obtained when all four coefficients vanish.
-/

namespace Hadamard6

def dependentPi (s t : ℝ) (z : ℂ) : ℂ :=
  (s : ℂ) ^ 2 * z ^ 2 - (s : ℂ) * (t : ℂ) ^ 2 * z +
    3 * (s : ℂ) * z + (t : ℂ) ^ 2

def dependentTheta (s t : ℝ) (z : ℂ) : ℂ :=
  (s : ℂ) ^ 2 - (s : ℂ) * (t : ℂ) ^ 2 * z +
    3 * (s : ℂ) * z + (t : ℂ) ^ 2 * z ^ 2

def dependentGram (s t : ℝ) (z : ℂ) : Mat3 :=
  !![(3 : ℂ), (s : ℂ), (t : ℂ);
     (s : ℂ), 3, (t : ℂ) * star z;
     (t : ℂ), (t : ℂ) * z, 3]

theorem dependentGram_det {s t : ℝ} {z : ℂ}
    (hz : Complex.normSq z = 1) :
    Matrix.det (dependentGram s t z) =
      (27 : ℂ) - 3 * (s : ℂ) ^ 2 - 6 * (t : ℂ) ^ 2 +
        (s : ℂ) * (t : ℂ) ^ 2 * (z + star z) := by
  have hu : star z * z = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun a : ℝ ↦ (a : ℂ)) hz
  rw [Matrix.det_fin_three]
  simp [dependentGram]
  simp only [starRingEnd_apply]
  ring_nf at hu ⊢
  linear_combination -3 * (t : ℂ) ^ 2 * hu

theorem gramTau_dependentGram (s t : ℝ) (z : ℂ) :
    gramTau (dependentGram s t z) =
      (s : ℂ) * (t : ℂ) ^ 2 * star z := by
  simp [gramTau, dependentGram]
  ring

theorem dependent_beta0_formula {s t : ℝ} {z : ℂ}
    (hz : Complex.normSq z = 1) :
    specializedBeta0 s (t : ℂ) ((t : ℂ) * z) =
      -(t : ℂ) * dependentPi s t z / z ^ 2 := by
  have hz0 := ne_zero_of_normSq_eq_one hz
  have hstarz : star z = 1 / z :=
    (one_div_eq_star_of_normSq_eq_one hz).symm
  simp only [specializedBeta0, eliminantBeta0, star_mul,
    Complex.star_def, Complex.conj_ofReal, hstarz]
  field_simp [hz0]
  simp only [dependentPi]
  ring

theorem dependent_beta1_formula {s t : ℝ} {z : ℂ}
    (hz : Complex.normSq z = 1) :
    specializedBeta1 s (t : ℂ) ((t : ℂ) * z) =
      (s : ℂ) * (t : ℂ) * dependentPi s t z / z ^ 2 := by
  have hz0 := ne_zero_of_normSq_eq_one hz
  have hstarz : star z = 1 / z :=
    (one_div_eq_star_of_normSq_eq_one hz).symm
  simp only [specializedBeta1, eliminantBeta1, star_mul,
    Complex.star_def, Complex.conj_ofReal, hstarz]
  field_simp [hz0]
  simp only [dependentPi]
  ring

theorem dependent_beta2_formula {s t : ℝ} {z : ℂ}
    (hz : Complex.normSq z = 1) :
    specializedBeta2 s (t : ℂ) ((t : ℂ) * z) =
      -(s : ℂ) * (t : ℂ) * dependentTheta s t z / z := by
  have hz0 := ne_zero_of_normSq_eq_one hz
  have hstarz : star z = 1 / z :=
    (one_div_eq_star_of_normSq_eq_one hz).symm
  simp only [specializedBeta2, eliminantBeta2, star_mul,
    Complex.star_def, Complex.conj_ofReal, hstarz]
  field_simp [hz0]
  simp only [dependentTheta]
  ring

theorem dependent_beta3_formula {s t : ℝ} {z : ℂ}
    (hz : Complex.normSq z = 1) :
    specializedBeta3 s (t : ℂ) ((t : ℂ) * z) =
      (t : ℂ) * dependentTheta s t z / z := by
  have hz0 := ne_zero_of_normSq_eq_one hz
  have hstarz : star z = 1 / z :=
    (one_div_eq_star_of_normSq_eq_one hz).symm
  simp only [specializedBeta3, eliminantBeta3, star_mul,
    Complex.star_def, Complex.conj_ofReal, hstarz]
  field_simp [hz0]
  simp only [dependentTheta]
  ring

theorem dependentPi_sub_Theta (s t : ℝ) (z : ℂ) :
    dependentPi s t z - dependentTheta s t z =
      ((s : ℂ) ^ 2 - (t : ℂ) ^ 2) * (z ^ 2 - 1) := by
  simp only [dependentPi, dependentTheta]
  ring

theorem dependent_z_one_forces_s_t_three
    {s t : ℝ} (hs0 : 0 ≤ s) (hs3 : s ≤ 3)
    (ht0 : 0 < t) (ht3 : t ≤ 3)
    (hPi : dependentPi s t 1 = 0) :
    s = 3 ∧ t = 3 := by
  have hp : s ^ 2 - s * t ^ 2 + 3 * s + t ^ 2 = 0 := by
    have h := hPi
    norm_num [dependentPi] at h
    exact_mod_cast h
  have hs1 : 1 < s := by
    by_contra h
    have hsle : s ≤ 1 := le_of_not_gt h
    have hterm : 0 ≤ (1 - s) * t ^ 2 :=
      mul_nonneg (sub_nonneg.mpr hsle) (sq_nonneg t)
    have hp' : s ^ 2 + 3 * s + (1 - s) * t ^ 2 = 0 := by
      linear_combination hp
    nlinarith [sq_pos_of_pos ht0, sq_nonneg s]
  have htSq : t ^ 2 ≤ 9 := by nlinarith
  have hsEq : s = 3 := by
    have hprod : (s - 1) * t ^ 2 ≤ (s - 1) * 9 :=
      mul_le_mul_of_nonneg_left htSq (sub_nonneg.mpr hs1.le)
    nlinarith [sq_nonneg (s - 3)]
  have htEq : t = 3 := by
    rw [hsEq] at hp
    nlinarith
  exact ⟨hsEq, htEq⟩

theorem dependent_z_one_gram_singular
    {s t : ℝ} (hs0 : 0 ≤ s) (hs3 : s ≤ 3)
    (ht0 : 0 < t) (ht3 : t ≤ 3)
    (hPi : dependentPi s t 1 = 0) :
    Matrix.det (dependentGram s t 1) = 0 := by
  rcases dependent_z_one_forces_s_t_three hs0 hs3 ht0 ht3 hPi with
    ⟨rfl, rfl⟩
  norm_num [dependentGram, Matrix.det_fin_three]

theorem dependent_z_neg_one_tau_negative
    {s t : ℝ} (hs0 : 0 ≤ s) (ht0 : 0 < t)
    (hPi : dependentPi s t (-1) = 0) :
    (gramTau (dependentGram s t (-1))).re < 0 := by
  have hp : s ^ 2 + s * t ^ 2 - 3 * s + t ^ 2 = 0 := by
    have h := hPi
    norm_num [dependentPi] at h
    exact_mod_cast h
  have hspos : 0 < s := by
    by_contra h
    have hsEq : s = 0 := le_antisymm (le_of_not_gt h) hs0
    rw [hsEq] at hp
    nlinarith
  rw [gramTau_dependentGram]
  have htau :
      (s : ℂ) * (t : ℂ) ^ 2 * star (-1 : ℂ) =
        ((-s * t ^ 2 : ℝ) : ℂ) := by
    norm_num [Complex.star_def]
  rw [htau]
  change -s * t ^ 2 < 0
  have hprod : 0 < s * t ^ 2 := mul_pos hspos (sq_pos_of_pos ht0)
  nlinarith

theorem dependent_equal_critical_relation
    {s : ℝ} {z : ℂ} (hz : Complex.normSq z = 1)
    (hPi : dependentPi s s z = 0) :
    (s : ℂ) ^ 2 * (z + star z) =
      (s : ℂ) ^ 3 - 3 * (s : ℂ) := by
  have hu : z * star z = 1 := by
    have hu' : star z * z = 1 := by
      simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
        congrArg (fun a : ℝ ↦ (a : ℂ)) hz
    simpa [mul_comm] using hu'
  have hu0 : z * star z - 1 = 0 := sub_eq_zero.mpr hu
  have hp := hPi
  simp only [dependentPi] at hp
  linear_combination star z * hp -
    ((s : ℂ) ^ 2 * z - (s : ℂ) ^ 3 + 3 * (s : ℂ)) * hu0

theorem dependent_equal_gram_det
    {s : ℝ} {z : ℂ} (hz : Complex.normSq z = 1)
    (hPi : dependentPi s s z = 0) :
    Matrix.det (dependentGram s s z) =
      (((s ^ 2 - 3) * (s ^ 2 - 9) : ℝ) : ℂ) := by
  rw [dependentGram_det hz]
  have hrel := dependent_equal_critical_relation hz hPi
  push_cast
  linear_combination (s : ℂ) * hrel

theorem dependent_equal_real_critical
    {s : ℝ} {z : ℂ} (hs : 0 < s)
    (hz : Complex.normSq z = 1)
    (hPi : dependentPi s s z = 0) :
    2 * s * z.re = s ^ 2 - 3 := by
  have hrel := dependent_equal_critical_relation hz hPi
  have hcast2 : (s : ℂ) ^ 2 = ((s ^ 2 : ℝ) : ℂ) := by
    push_cast
    rfl
  have hcast3 : (s : ℂ) ^ 3 = ((s ^ 3 : ℝ) : ℂ) := by
    push_cast
    rfl
  rw [hcast2, hcast3] at hrel
  have hzsum : z + star z = ((2 * z.re : ℝ) : ℂ) := by
    apply Complex.ext
    · simp
      ring
    · simp
  rw [hzsum] at hrel
  have hre : s ^ 2 * (2 * z.re) = s ^ 3 - 3 * s := by
    exact_mod_cast hrel
  nlinarith

theorem dependent_equal_s_ge_one
    {s : ℝ} {z : ℂ} (hs : 0 < s)
    (hz : Complex.normSq z = 1)
    (hPi : dependentPi s s z = 0) :
    1 ≤ s := by
  have hcrit := dependent_equal_real_critical hs hz hPi
  have hcircle : z.re ^ 2 + z.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hz
  have hreLower : -1 ≤ z.re := by
    nlinarith [sq_nonneg z.im, sq_nonneg (z.re + 1)]
  have hmul := mul_le_mul_of_nonneg_left hreLower (by positivity : 0 ≤ 2 * s)
  nlinarith

theorem dependent_equal_tau_formula
    {s : ℝ} {z : ℂ} (hs : 0 < s)
    (hz : Complex.normSq z = 1)
    (hPi : dependentPi s s z = 0) :
    (gramTau (dependentGram s s z)).re =
      s ^ 2 * (s ^ 2 - 3) / 2 := by
  have hcrit := dependent_equal_real_critical hs hz hPi
  rw [gramTau_dependentGram]
  have hcoef : (s : ℂ) * (s : ℂ) ^ 2 = ((s ^ 3 : ℝ) : ℂ) := by
    push_cast
    ring
  rw [hcoef]
  have hre : (((s ^ 3 : ℝ) : ℂ) * star z).re = s ^ 3 * z.re := by
    rw [Complex.mul_re]
    have hs3re : (((s ^ 3 : ℝ) : ℂ)).re = s ^ 3 := by
      simp [pow_succ, Complex.mul_re]
    have hs3im : (((s ^ 3 : ℝ) : ℂ)).im = 0 := by
      simp [pow_succ, Complex.mul_im]
    rw [hs3re, hs3im]
    simp
  rw [hre]
  nlinarith

theorem dependent_equal_tau_negative_of_positive_gram_det
    {s : ℝ} {z : ℂ} (hs : 0 < s) (hs3 : s ≤ 3)
    (hz : Complex.normSq z = 1)
    (hPi : dependentPi s s z = 0)
    (hdet : 0 < (Matrix.det (dependentGram s s z)).re) :
    (gramTau (dependentGram s s z)).re < 0 := by
  have hs1 := dependent_equal_s_ge_one hs hz hPi
  have hdetFormula := dependent_equal_gram_det hz hPi
  have hsSqLt : s ^ 2 < 3 := by
    have hsSqLe9 : s ^ 2 ≤ 9 := by nlinarith
    rw [hdetFormula] at hdet
    change 0 < (s ^ 2 - 3) * (s ^ 2 - 9) at hdet
    nlinarith
  rw [dependent_equal_tau_formula hs hz hPi]
  nlinarith [sq_pos_of_pos hs]

theorem dependent_factor_of_Pi_Theta
    {s t : ℝ} {z : ℂ}
    (hPi : dependentPi s t z = 0)
    (hTheta : dependentTheta s t z = 0) :
    s ^ 2 = t ^ 2 ∨ z ^ 2 = 1 := by
  have hfactor :
      ((s : ℂ) ^ 2 - (t : ℂ) ^ 2) * (z ^ 2 - 1) = 0 := by
    rw [← dependentPi_sub_Theta, hPi, hTheta]
    simp
  rcases mul_eq_zero.mp hfactor with hst | hzsq
  · exact Or.inl (by exact_mod_cast sub_eq_zero.mp hst)
  · exact Or.inr (sub_eq_zero.mp hzsq)

/-- The complete positive-`t` canonical dependent calculation.  The
`z=1` allocation contradicts positive definiteness of the Gram matrix;
`z=-1` and the genuinely nonreal equal-modulus branch both have negative
cubic invariant. -/
theorem dependent_positive_t_tau_negative
    {s t : ℝ} {z : ℂ}
    (hs0 : 0 ≤ s) (hs3 : s ≤ 3)
    (ht0 : 0 < t) (ht3 : t ≤ 3)
    (hz : Complex.normSq z = 1)
    (hPi : dependentPi s t z = 0)
    (hTheta : dependentTheta s t z = 0)
    (hdet : 0 < (Matrix.det (dependentGram s t z)).re) :
    (gramTau (dependentGram s t z)).re < 0 := by
  rcases dependent_factor_of_Pi_Theta hPi hTheta with hst | hzsq
  · have hstEq : s = t := by nlinarith
    subst t
    exact dependent_equal_tau_negative_of_positive_gram_det
      ht0 hs3 hz hPi hdet
  · rcases sq_eq_one_iff.mp hzsq with rfl | rfl
    · have hzero := dependent_z_one_gram_singular
        hs0 hs3 ht0 ht3 hPi
      rw [hzero] at hdet
      norm_num at hdet
    · exact dependent_z_neg_one_tau_negative hs0 ht0 hPi

end Hadamard6
