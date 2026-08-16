import Hadamard6.KarlssonWitnessResultant4
import Hadamard6.KarlssonWitnessResultant6
import Hadamard6.KarlssonWitnessResultant8
import Hadamard6.KarlssonWitnessResultant10

/-! Nonvanishing consequences of the four generated resultant identities.

The identities themselves are in the imported per-witness modules. -/

namespace Hadamard6

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

theorem karlssonWitness4_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness4A (t : ℂ) p) (karlssonWitness4B (t : ℂ) p) (karlssonWitness4C (t : ℂ) p)
      (star (karlssonWitness4C (t : ℂ) p))
      (star (karlssonWitness4B (t : ℂ) p))
      (star (karlssonWitness4A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 6 * z) hzero
  rw [karlssonWitness4_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonHorizontalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness4_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness4A (t : ℂ) p * z ^ 2 +
        karlssonWitness4B (t : ℂ) p * z + karlssonWitness4C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness4_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)

theorem karlssonWitness6_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness6A (t : ℂ) p) (karlssonWitness6B (t : ℂ) p) (karlssonWitness6C (t : ℂ) p)
      (star (karlssonWitness6C (t : ℂ) p))
      (star (karlssonWitness6B (t : ℂ) p))
      (star (karlssonWitness6A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 6 * z) hzero
  rw [karlssonWitness6_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonHorizontalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness6_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness6A (t : ℂ) p * z ^ 2 +
        karlssonWitness6B (t : ℂ) p * z + karlssonWitness6C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness6_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)

theorem karlssonWitness8_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness8A (t : ℂ) p) (karlssonWitness8B (t : ℂ) p) (karlssonWitness8C (t : ℂ) p)
      (star (karlssonWitness8C (t : ℂ) p))
      (star (karlssonWitness8B (t : ℂ) p))
      (star (karlssonWitness8A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 10 * z) hzero
  rw [karlssonWitness8_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonVerticalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness8_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness8A (t : ℂ) p * z ^ 2 +
        karlssonWitness8B (t : ℂ) p * z + karlssonWitness8C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness8_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)

theorem karlssonWitness10_reciprocalResultant_ne_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    quadraticResultant
      (karlssonWitness10A (t : ℂ) p) (karlssonWitness10B (t : ℂ) p) (karlssonWitness10C (t : ℂ) p)
      (star (karlssonWitness10C (t : ℂ) p))
      (star (karlssonWitness10B (t : ℂ) p))
      (star (karlssonWitness10A (t : ℂ) p)) ≠ 0 := by
  intro hzero
  have hfactor := congrArg (fun z : ℂ ↦ p ^ 10 * z) hzero
  rw [karlssonWitness10_resultant_identity t p hpUnit] at hfactor
  simp only [mul_zero] at hfactor
  exact karlssonVerticalUnitResultant_ne_zero ht hpUnit hpIm hpNegOne hMPlus hfactor

theorem karlssonWitness10_has_no_unit_root
    {t : ℝ} {p : ℂ} (ht : 0 < t)
    (hpUnit : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      karlssonWitness10A (t : ℂ) p * z ^ 2 +
        karlssonWitness10B (t : ℂ) p * z + karlssonWitness10C (t : ℂ) p = 0 :=
  no_unit_root_of_reciprocal_resultant_ne_zero
    (karlssonWitness10_reciprocalResultant_ne_zero
      ht hpUnit hpIm hpNegOne hMPlus)


#print axioms karlssonWitness4_has_no_unit_root
#print axioms karlssonWitness6_has_no_unit_root
#print axioms karlssonWitness8_has_no_unit_root
#print axioms karlssonWitness10_has_no_unit_root


end Hadamard6
