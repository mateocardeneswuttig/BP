import Hadamard6.KarlssonResidualGlobal
import Mathlib.Tactic

/-!
# The canonical Cayley chart for the Karlsson phase
-/

namespace Hadamard6

theorem upperRealCircle_has_nonnegativeCayleyParameter
    {u v : ℝ} (hcircle : u ^ 2 + v ^ 2 = 1)
    (hv : 0 ≤ v) (huNegOne : u ≠ -1) :
    ∃ t : ℝ, 0 ≤ t ∧
      u = (1 - t ^ 2) / (1 + t ^ 2) ∧
      v = 2 * t / (1 + t ^ 2) := by
  have huLower : -1 ≤ u := by
    nlinarith [sq_nonneg v, sq_nonneg (u + 1)]
  have hdenPos : 0 < 1 + u := by
    refine lt_of_le_of_ne (by linarith) ?_
    intro hzero
    apply huNegOne
    linarith
  let t : ℝ := v / (1 + u)
  have ht : 0 ≤ t := div_nonneg hv hdenPos.le
  refine ⟨t, ht, ?_, ?_⟩
  · dsimp [t]
    field_simp [ne_of_gt hdenPos]
    nlinarith [hcircle]
  · dsimp [t]
    field_simp [ne_of_gt hdenPos]
    nlinarith [hcircle]

theorem upperUnitPhase_has_nonnegativeCayleyParameter
    {p : ℂ} (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1) :
    ∃ rho : ℝ, 0 ≤ rho ∧
      p = ((1 : ℂ) + Complex.I * (rho : ℂ)) /
        ((1 : ℂ) - Complex.I * (rho : ℂ)) := by
  have hpcoords : p.re ^ 2 + p.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hpUnit
  have hpreLower : -1 ≤ p.re := by
    nlinarith [sq_nonneg p.im, sq_nonneg (p.re + 1)]
  have hdenNonneg : 0 ≤ 1 + p.re := by linarith
  have hdenPos : 0 < 1 + p.re := by
    refine lt_of_le_of_ne hdenNonneg ?_
    intro hzero
    have hpre : p.re = -1 := by linarith
    have hpim : p.im = 0 := by nlinarith [sq_nonneg p.im]
    apply hpNegOne
    apply Complex.ext
    · norm_num [hpre]
    · norm_num [hpim]
  let rho : ℝ := p.im / (1 + p.re)
  have hrho : 0 ≤ rho := div_nonneg hpIm hdenPos.le
  have hcomplexDen : (1 : ℂ) - Complex.I * (rho : ℂ) ≠ 0 := by
    intro hzero
    have hre := congrArg Complex.re hzero
    norm_num [Complex.mul_re] at hre
  have hcross :
      p * ((1 : ℂ) - Complex.I * (rho : ℂ)) =
        (1 : ℂ) + Complex.I * (rho : ℂ) := by
    apply Complex.ext
    · simp only [Complex.mul_re, Complex.mul_im, Complex.sub_re,
        Complex.sub_im, Complex.add_re, Complex.one_re, Complex.one_im,
        Complex.I_re, Complex.I_im, Complex.ofReal_re, Complex.ofReal_im]
      ring_nf
      dsimp [rho]
      field_simp [ne_of_gt hdenPos]
      nlinarith
    · simp only [Complex.mul_re, Complex.mul_im, Complex.sub_re,
        Complex.sub_im, Complex.add_im, Complex.one_re, Complex.one_im,
        Complex.I_re, Complex.I_im, Complex.ofReal_re, Complex.ofReal_im]
      ring_nf
      dsimp [rho]
      field_simp [ne_of_gt hdenPos]
      ring
  refine ⟨rho, hrho, ?_⟩
  exact (eq_div_iff hcomplexDen).2 hcross

theorem karlssonSharedResidual_ne_zero_on_upperUnitChart
    {t : ℝ} {p : ℂ} (ht : 0 ≤ t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1) :
    karlssonSharedResidual (t : ℂ) p ≠ 0 := by
  obtain ⟨rho, hrho, rfl⟩ :=
    upperUnitPhase_has_nonnegativeCayleyParameter hpUnit hpIm hpNegOne
  exact karlssonSharedResidual_cayley_ne_zero ht hrho

end Hadamard6
