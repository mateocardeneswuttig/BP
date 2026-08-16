import Hadamard6.KarlssonResultantNonvanishing
import Mathlib.Tactic

/-!
# The two Karlsson Möbius boundary factors

The fixed mixed/mixed corner used on the regular Karlsson chart has the
factor `M₊`.  Its zero set is a single-Möbius-degeneracy curve, not merely
the affine-Fourier seam.  Reversing the Karlsson orientation replaces it by
`M₋`; only their common zero is the doubly degenerate Fourier point on the
canonical parameter domain.  These elementary identities are the
division-free parameter-level core of the corrected two-orientation cover.
-/

namespace Hadamard6

noncomputable section

noncomputable def karlssonMMinus (t : ℝ) (p : ℂ) : ℂ :=
  ((1 + t ^ 2 : ℝ) : ℂ) * (p ^ 2 - 1) -
    Complex.I * (Real.sqrt 3 : ℂ) * ((1 - t ^ 2 : ℝ) : ℂ) * (p ^ 2 + 1)

theorem karlssonMPlus_add_karlssonMMinus (t : ℝ) (p : ℂ) :
    karlssonMPlus t p + karlssonMMinus t p =
      2 * ((1 + t ^ 2 : ℝ) : ℂ) * (p ^ 2 - 1) := by
  unfold karlssonMPlus karlssonMMinus
  ring

theorem karlssonMPlus_sub_karlssonMMinus (t : ℝ) (p : ℂ) :
    karlssonMPlus t p - karlssonMMinus t p =
      2 * Complex.I * (Real.sqrt 3 : ℂ) *
        ((1 - t ^ 2 : ℝ) : ℂ) * (p ^ 2 + 1) := by
  unfold karlssonMPlus karlssonMMinus
  ring

/-- The sign-reversing Karlsson parameter change sends the other Möbius
factor to the fixed-corner factor, up to a nonzero square denominator. -/
theorem karlssonMPlus_inv_neg (t : ℝ) (p : ℂ) (ht0 : t ≠ 0) :
    karlssonMPlus (1 / t) (-p) =
      ((1 / t ^ 2 : ℝ) : ℂ) * karlssonMMinus t p := by
  unfold karlssonMPlus karlssonMMinus
  norm_num
  field_simp [ht0]
  ring

/-- Since the boundary factors depend only on `p²`, inversion of the
half-angle coordinate alone also exchanges the two orientations.  This
version preserves the canonical upper-half-circle choice of `p`. -/
theorem karlssonMPlus_inv (t : ℝ) (p : ℂ) (ht0 : t ≠ 0) :
    karlssonMPlus (1 / t) p =
      ((1 / t ^ 2 : ℝ) : ℂ) * karlssonMMinus t p := by
  unfold karlssonMPlus karlssonMMinus
  norm_num
  field_simp [ht0]
  ring

/-- On the canonical open domain, the two Möbius factors have a common zero
only at the doubly degenerate point `t = 1`, `p = 1`. -/
theorem karlssonMPlus_MMinus_common_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t) (hpNegOne : p ≠ -1)
    (hplus : karlssonMPlus t p = 0)
    (hminus : karlssonMMinus t p = 0) :
    t = 1 ∧ p = 1 := by
  have htdenReal : (1 + t ^ 2 : ℝ) ≠ 0 := by positivity
  have htden : (((1 + t ^ 2 : ℝ) : ℂ)) ≠ 0 := by
    exact_mod_cast htdenReal
  have hsum := karlssonMPlus_add_karlssonMMinus t p
  rw [hplus, hminus] at hsum
  norm_num at hsum
  have hpSq : p ^ 2 = 1 := by
    rcases hsum with hden | hpzero
    · exfalso
      apply htden
      simpa using hden
    · exact sub_eq_zero.mp hpzero
  have hp : p = 1 := by
    rcases (sq_eq_one_iff).mp (by simpa [pow_two] using hpSq) with hp | hp
    · exact hp
    · exact (hpNegOne hp).elim
  subst p
  unfold karlssonMPlus at hplus
  norm_num at hplus
  have htSq : t ^ 2 = 1 := by
    have htSqComplex : (t : ℂ) ^ 2 = 1 := (sub_eq_zero.mp hplus).symm
    exact_mod_cast htSqComplex
  have htOne : t = 1 := by nlinarith
  exact ⟨htOne, rfl⟩

/-- Consequently, away from the Fourier point, a zero of the first
orientation is covered by the second orientation. -/
theorem karlssonMMinus_ne_zero_of_MPlus_zero
    {t : ℝ} {p : ℂ} (ht : 0 < t) (hpNegOne : p ≠ -1)
    (hnotFourier : ¬(t = 1 ∧ p = 1))
    (hplus : karlssonMPlus t p = 0) :
    karlssonMMinus t p ≠ 0 := by
  intro hminus
  exact hnotFourier
    (karlssonMPlus_MMinus_common_zero ht hpNegOne hplus hminus)

/-- Corrected two-orientation cover at parameter level.  Away from the
doubly-degenerate Fourier point, either the original half-angle coordinate
or its reciprocal has a nonzero fixed-corner Möbius factor. -/
theorem karlssonMPlus_ne_zero_in_one_orientation
    {t : ℝ} {p : ℂ} (ht : 0 < t) (hpNegOne : p ≠ -1)
    (hnotFourier : ¬(t = 1 ∧ p = 1)) :
    karlssonMPlus t p ≠ 0 ∨ karlssonMPlus (1 / t) p ≠ 0 := by
  by_cases hplus : karlssonMPlus t p = 0
  · right
    rw [karlssonMPlus_inv t p (ne_of_gt ht)]
    exact mul_ne_zero
      (by exact_mod_cast (one_div_ne_zero (pow_ne_zero 2 (ne_of_gt ht))))
      (karlssonMMinus_ne_zero_of_MPlus_zero ht hpNegOne hnotFourier hplus)
  · exact Or.inl hplus

end

end Hadamard6
