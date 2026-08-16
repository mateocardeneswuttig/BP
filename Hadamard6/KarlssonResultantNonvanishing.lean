import Hadamard6.KarlssonCayley
import Hadamard6.KarlssonQuadraticResultant
import Mathlib.Tactic

/-!
# Nonvanishing of the four Karlsson fixed-corner resultants

The exact symbolic pullback gives the same residual in all four quadratic
witnesses.  The exported residual retains its leading coefficient `-36864`.
Two resultants therefore have the factorization

`t^2 * M₊(t,p)^2 * R(t,p)`,

and the other two have one additional factor `p^4`.  This file isolates the
logical nonvanishing consequence.  The later matrix pullback layer only has to
identify its concrete quadratic resultants with these definitions.
-/

namespace Hadamard6

noncomputable def karlssonMPlus (t : ℝ) (p : ℂ) : ℂ :=
  ((1 + t ^ 2 : ℝ) : ℂ) * (p ^ 2 - 1) +
    Complex.I * (Real.sqrt 3 : ℂ) * ((1 - t ^ 2 : ℝ) : ℂ) * (p ^ 2 + 1)

noncomputable def karlssonHorizontalUnitResultant (t : ℝ) (p : ℂ) : ℂ :=
  (t : ℂ) ^ 2 * karlssonMPlus t p ^ 2 *
    karlssonSharedResidual (t : ℂ) p

noncomputable def karlssonVerticalUnitResultant (t : ℝ) (p : ℂ) : ℂ :=
  (t : ℂ) ^ 2 * p ^ 4 * karlssonMPlus t p ^ 2 *
    karlssonSharedResidual (t : ℂ) p

theorem karlssonHorizontalUnitResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    karlssonHorizontalUnitResultant t p ≠ 0 := by
  unfold karlssonHorizontalUnitResultant
  apply mul_ne_zero
  · apply mul_ne_zero
    · exact pow_ne_zero 2 (Complex.ofReal_ne_zero.mpr (ne_of_gt ht))
    · exact pow_ne_zero 2 hMPlus
  · exact karlssonSharedResidual_ne_zero_on_upperUnitChart
      ht.le hpUnit hpIm hpNegOne

theorem unitPhase_ne_zero {p : ℂ} (hpUnit : Complex.normSq p = 1) : p ≠ 0 := by
  intro hpZero
  subst p
  norm_num [Complex.normSq_apply] at hpUnit

theorem karlssonVerticalUnitResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    karlssonVerticalUnitResultant t p ≠ 0 := by
  unfold karlssonVerticalUnitResultant
  apply mul_ne_zero
  · apply mul_ne_zero
    · apply mul_ne_zero
      · exact pow_ne_zero 2 (Complex.ofReal_ne_zero.mpr (ne_of_gt ht))
      · exact pow_ne_zero 4 (unitPhase_ne_zero hpUnit)
    · exact pow_ne_zero 2 hMPlus
  · exact karlssonSharedResidual_ne_zero_on_upperUnitChart
      ht.le hpUnit hpIm hpNegOne

#print axioms karlssonHorizontalUnitResultant_ne_zero
#print axioms karlssonVerticalUnitResultant_ne_zero

end Hadamard6
