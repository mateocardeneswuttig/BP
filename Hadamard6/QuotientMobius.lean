import Hadamard6.QuotientAlgebra
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-!
# Möbius trace identities

These are the three rational identities used in the `0<s<1` quotient
branch.  They are proved from the elementary symmetric functions of the
three coordinates and the critical equation for `r`.
-/

namespace Hadamard6

noncomputable def mobius (r z : ℂ) : ℂ := (r * z - 1) / (z - r)

/-- For a real parameter, the critical Möbius factor preserves the unit
circle wherever its denominator is nonzero. -/
theorem normSq_mobius_of_real {r : ℝ} {z : ℂ}
    (hz : Complex.normSq z = 1) (hden : z - (r : ℂ) ≠ 0) :
    Complex.normSq (mobius (r : ℂ) z) = 1 := by
  have hnumeq :
      Complex.normSq ((r : ℂ) * z - 1) =
        Complex.normSq (z - (r : ℂ)) := by
    rw [Complex.normSq_sub, Complex.normSq_sub,
      Complex.normSq_mul, hz]
    simp only [mul_one, Complex.normSq_apply, Complex.ofReal_re,
      Complex.ofReal_im, Complex.conj_ofReal, map_one]
    ring
  rw [mobius, Complex.normSq_div, hnumeq]
  exact div_self (fun h ↦ hden (Complex.normSq_eq_zero.mp h))

theorem reciprocal_sum_at_critical
    {s r u x₁ x₂ x₃ : ℂ}
    (hsum : x₁ + x₂ + x₃ = s)
    (hpair : x₁ * x₂ + x₁ * x₃ + x₂ * x₃ = u * s)
    (hprod : x₁ * x₂ * x₃ = u)
    (hcrit : 2 * s * r ^ 2 - (s ^ 2 + 3) * r + 2 * s = 0)
    (h₁ : x₁ - r ≠ 0) (h₂ : x₂ - r ≠ 0) (h₃ : x₃ - r ≠ 0)
    (hsr : 1 - s * r ≠ 0) :
    1 / (x₁ - r) + 1 / (x₂ - r) + 1 / (x₃ - r) =
      s / (1 - s * r) := by
  have hden :
      (x₁ - r) * (x₂ - r) * (x₃ - r) =
        u - r * (u * s) + r ^ 2 * s - r ^ 3 := by
    calc
      (x₁ - r) * (x₂ - r) * (x₃ - r) =
          x₁ * x₂ * x₃ -
          r * (x₁ * x₂ + x₁ * x₃ + x₂ * x₃) +
          r ^ 2 * (x₁ + x₂ + x₃) - r ^ 3 := by ring
      _ = u - r * (u * s) + r ^ 2 * s - r ^ 3 := by
        rw [hsum, hpair, hprod]
  have hnum :
      (x₂ - r) * (x₃ - r) +
      (x₁ - r) * (x₃ - r) +
      (x₁ - r) * (x₂ - r) =
        u * s - 2 * r * s + 3 * r ^ 2 := by
    calc
      _ = (x₁ * x₂ + x₁ * x₃ + x₂ * x₃) -
          2 * r * (x₁ + x₂ + x₃) + 3 * r ^ 2 := by ring
      _ = u * s - 2 * r * s + 3 * r ^ 2 := by rw [hsum, hpair]
  have hcross :
      (u * s - 2 * r * s + 3 * r ^ 2) * (1 - s * r) =
        s * (u - r * (u * s) + r ^ 2 * s - r ^ 3) := by
    linear_combination (-r) * hcrit
  have hD : (x₁ - r) * (x₂ - r) * (x₃ - r) ≠ 0 :=
    mul_ne_zero (mul_ne_zero h₁ h₂) h₃
  have hfrac :
      1 / (x₁ - r) + 1 / (x₂ - r) + 1 / (x₃ - r) =
        ((x₂ - r) * (x₃ - r) +
          (x₁ - r) * (x₃ - r) +
          (x₁ - r) * (x₂ - r)) /
            ((x₁ - r) * (x₂ - r) * (x₃ - r)) := by
    field_simp [h₁, h₂, h₃]
  rw [hfrac, hnum, hden]
  have hD' : u - r * (u * s) + r ^ 2 * s - r ^ 3 ≠ 0 := by
    rwa [hden] at hD
  rw [div_eq_iff hD']
  rw [show s / (1 - s * r) *
      (u - r * (u * s) + r ^ 2 * s - r ^ 3) =
      (s * (u - r * (u * s) + r ^ 2 * s - r ^ 3)) /
        (1 - s * r) by ring]
  exact (eq_div_iff hsr).2 hcross

theorem mobius_sum_at_critical
    {s r u x₁ x₂ x₃ : ℂ}
    (hsum : x₁ + x₂ + x₃ = s)
    (hpair : x₁ * x₂ + x₁ * x₃ + x₂ * x₃ = u * s)
    (hprod : x₁ * x₂ * x₃ = u)
    (hcrit : 2 * s * r ^ 2 - (s ^ 2 + 3) * r + 2 * s = 0)
    (h₁ : x₁ - r ≠ 0) (h₂ : x₂ - r ≠ 0) (h₃ : x₃ - r ≠ 0)
    (hsr : 1 - s * r ≠ 0) :
    mobius r x₁ + mobius r x₂ + mobius r x₃ = s := by
  have hL := reciprocal_sum_at_critical hsum hpair hprod hcrit h₁ h₂ h₃ hsr
  have hm (x : ℂ) (hx : x - r ≠ 0) :
      mobius r x = r + (r ^ 2 - 1) / (x - r) := by
    rw [mobius]
    field_simp [hx]
    ring
  have hscaled :
      (r ^ 2 - 1) / (x₁ - r) + (r ^ 2 - 1) / (x₂ - r) +
          (r ^ 2 - 1) / (x₃ - r) =
        (r ^ 2 - 1) * (s / (1 - s * r)) := by
    calc
      _ = (r ^ 2 - 1) *
          (1 / (x₁ - r) + 1 / (x₂ - r) + 1 / (x₃ - r)) := by ring
      _ = (r ^ 2 - 1) * (s / (1 - s * r)) := by rw [hL]
  calc
    mobius r x₁ + mobius r x₂ + mobius r x₃ =
        3 * r + ((r ^ 2 - 1) / (x₁ - r) +
          (r ^ 2 - 1) / (x₂ - r) + (r ^ 2 - 1) / (x₃ - r)) := by
      rw [hm x₁ h₁, hm x₂ h₂, hm x₃ h₃]
      ring
    _ = 3 * r + (r ^ 2 - 1) * (s / (1 - s * r)) := by rw [hscaled]
    _ = s := by
      have hsrcomm : 1 - r * s ≠ 0 := by simpa [mul_comm] using hsr
      field_simp [hsr, hsrcomm]
      linear_combination (-1) * hcrit

theorem mobius_over_sum_at_critical
    {s r u x₁ x₂ x₃ : ℂ}
    (hsum : x₁ + x₂ + x₃ = s)
    (hinvsum : 1 / x₁ + 1 / x₂ + 1 / x₃ = s)
    (hpair : x₁ * x₂ + x₁ * x₃ + x₂ * x₃ = u * s)
    (hprod : x₁ * x₂ * x₃ = u)
    (hcrit : 2 * s * r ^ 2 - (s ^ 2 + 3) * r + 2 * s = 0)
    (hr : r ≠ 0) (hx₁ : x₁ ≠ 0) (hx₂ : x₂ ≠ 0) (hx₃ : x₃ ≠ 0)
    (h₁ : x₁ - r ≠ 0) (h₂ : x₂ - r ≠ 0) (h₃ : x₃ - r ≠ 0)
    (hsr : 1 - s * r ≠ 0) :
    mobius r x₁ / x₁ + mobius r x₂ / x₂ + mobius r x₃ / x₃ =
      s * (r - s) / (1 - s * r) := by
  have hL := reciprocal_sum_at_critical hsum hpair hprod hcrit h₁ h₂ h₃ hsr
  have hm (x : ℂ) (hx : x ≠ 0) (hxr : x - r ≠ 0) :
      mobius r x / x = (1 / r) * (1 / x) +
        (r - 1 / r) / (x - r) := by
    rw [mobius]
    field_simp [hr, hx, hxr]
    ring
  have hscaled :
      (r - 1 / r) / (x₁ - r) + (r - 1 / r) / (x₂ - r) +
          (r - 1 / r) / (x₃ - r) =
        (r - 1 / r) * (s / (1 - s * r)) := by
    calc
      _ = (r - 1 / r) *
          (1 / (x₁ - r) + 1 / (x₂ - r) + 1 / (x₃ - r)) := by ring
      _ = (r - 1 / r) * (s / (1 - s * r)) := by rw [hL]
  calc
    mobius r x₁ / x₁ + mobius r x₂ / x₂ + mobius r x₃ / x₃ =
        (1 / r) * (1 / x₁ + 1 / x₂ + 1 / x₃) +
          ((r - 1 / r) / (x₁ - r) + (r - 1 / r) / (x₂ - r) +
            (r - 1 / r) / (x₃ - r)) := by
      rw [hm x₁ hx₁ h₁, hm x₂ hx₂ h₂, hm x₃ hx₃ h₃]
      ring
    _ = (1 / r) * s + (r - 1 / r) * (s / (1 - s * r)) := by
      rw [hinvsum, hscaled]
    _ = s * (r - s) / (1 - s * r) := by
      have hsrcomm : 1 - r * s ≠ 0 := by simpa [mul_comm] using hsr
      field_simp [hr, hsr, hsrcomm]
      ring

theorem x_mul_mobius_sum_at_critical
    {s r u x₁ x₂ x₃ : ℂ}
    (hsum : x₁ + x₂ + x₃ = s)
    (hpair : x₁ * x₂ + x₁ * x₃ + x₂ * x₃ = u * s)
    (hprod : x₁ * x₂ * x₃ = u)
    (hcrit : 2 * s * r ^ 2 - (s ^ 2 + 3) * r + 2 * s = 0)
    (hr : r ≠ 0)
    (h₁ : x₁ - r ≠ 0) (h₂ : x₂ - r ≠ 0) (h₃ : x₃ - r ≠ 0)
    (hsr : 1 - s * r ≠ 0) (hsr' : 1 - s / r ≠ 0) :
    x₁ * mobius r x₁ + x₂ * mobius r x₂ + x₃ * mobius r x₃ =
      s * (1 / r - s) / (1 - s / r) := by
  have hL := reciprocal_sum_at_critical hsum hpair hprod hcrit h₁ h₂ h₃ hsr
  have hm (x : ℂ) (hxr : x - r ≠ 0) :
      x * mobius r x = r * x + (r ^ 2 - 1) +
        r * (r ^ 2 - 1) / (x - r) := by
    rw [mobius]
    field_simp [hxr]
    ring
  have hscaled :
      r * (r ^ 2 - 1) / (x₁ - r) + r * (r ^ 2 - 1) / (x₂ - r) +
          r * (r ^ 2 - 1) / (x₃ - r) =
        r * (r ^ 2 - 1) * (s / (1 - s * r)) := by
    calc
      _ = r * (r ^ 2 - 1) *
          (1 / (x₁ - r) + 1 / (x₂ - r) + 1 / (x₃ - r)) := by ring
      _ = r * (r ^ 2 - 1) * (s / (1 - s * r)) := by rw [hL]
  calc
    x₁ * mobius r x₁ + x₂ * mobius r x₂ + x₃ * mobius r x₃ =
        r * (x₁ + x₂ + x₃) + 3 * (r ^ 2 - 1) +
          (r * (r ^ 2 - 1) / (x₁ - r) +
           r * (r ^ 2 - 1) / (x₂ - r) +
           r * (r ^ 2 - 1) / (x₃ - r)) := by
      rw [hm x₁ h₁, hm x₂ h₂, hm x₃ h₃]
      ring
    _ = r * s + 3 * (r ^ 2 - 1) +
          r * (r ^ 2 - 1) * (s / (1 - s * r)) := by rw [hsum, hscaled]
    _ = s * (1 / r - s) / (1 - s / r) := by
      have hsrcomm : 1 - r * s ≠ 0 := by simpa [mul_comm] using hsr
      have hrs : r - s ≠ 0 := by
        intro hrs
        apply hsr'
        have hrs' : r = s := sub_eq_zero.mp hrs
        rw [← hrs']
        field_simp [hr]
        ring
      field_simp [hr, hrs, hsr, hsrcomm, hsr']
      have hc := congrArg (fun z : ℂ ↦ (r ^ 2 - 1) * z) hcrit
      simp only [mul_zero] at hc
      linear_combination (-1) * hc

end Hadamard6
