import Hadamard6.Basic
import Mathlib.Tactic

/-!
# Reciprocal quadratic resultants

This is the abstract algebraic bridge for the four remaining Karlsson witness
factors.  A quadratic with a unit-circle root and its reciprocal-conjugate
quadratic have a common root, so their explicit Sylvester resultant vanishes.
-/

namespace Hadamard6

def quadraticResultant (a b c aa bb cc : ℂ) : ℂ :=
  aa ^ 2 * c ^ 2 - aa * bb * b * c - 2 * aa * cc * a * c +
    aa * cc * b ^ 2 + bb ^ 2 * a * c - bb * cc * a * b +
    cc ^ 2 * a ^ 2

theorem quadraticResultant_eq_compact (a b c aa bb cc : ℂ) :
    quadraticResultant a b c aa bb cc =
      (a * cc - c * aa) ^ 2 -
        (a * bb - b * aa) * (b * cc - c * bb) := by
  unfold quadraticResultant
  ring

theorem quadraticResultant_eq_zero_of_common_root
    {a b c aa bb cc z : ℂ}
    (hz : z ≠ 0)
    (hf : a * z ^ 2 + b * z + c = 0)
    (hg : aa * z ^ 2 + bb * z + cc = 0) :
    quadraticResultant a b c aa bb cc = 0 := by
  let U := a * cc - c * aa
  let V := a * bb - b * aa
  let W := b * cc - c * bb
  have hVU : V * z + U = 0 := by
    dsimp [U, V]
    linear_combination a * hg - aa * hf
  have hzUW : z * (U * z + W) = 0 := by
    dsimp [U, W]
    linear_combination -(c * hg - cc * hf)
  have hUW : U * z + W = 0 :=
    (mul_eq_zero.mp hzUW).resolve_left hz
  rw [quadraticResultant_eq_compact]
  change U ^ 2 - V * W = 0
  linear_combination U * hVU - V * hUW

theorem reciprocalQuadratic_root_of_unit_root
    {a b c z : ℂ}
    (hzUnit : Complex.normSq z = 1)
    (hf : a * z ^ 2 + b * z + c = 0) :
    star c * z ^ 2 + star b * z + star a = 0 := by
  have hzstar : z * star z = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hzUnit
  have hstar : star a * star z ^ 2 + star b * star z + star c = 0 := by
    simpa using congrArg star hf
  have hzstarPow : z ^ 2 * star z ^ 2 = 1 := by
    rw [← mul_pow, hzstar, one_pow]
  have hzstarOnce : z ^ 2 * star z = z := by
    rw [pow_two]
    calc
      z * z * star z = z * (z * star z) := by ring
      _ = z := by rw [hzstar]; ring
  have hrearrange :
      z ^ 2 * (star a * star z ^ 2 + star b * star z + star c) =
        star c * z ^ 2 + star b * z + star a := by
    calc
      z ^ 2 * (star a * star z ^ 2 + star b * star z + star c) =
          star a * (z ^ 2 * star z ^ 2) +
            star b * (z ^ 2 * star z) + star c * z ^ 2 := by ring
      _ = star c * z ^ 2 + star b * z + star a := by
        rw [hzstarPow, hzstarOnce]
        ring
  calc
    star c * z ^ 2 + star b * z + star a =
        z ^ 2 * (star a * star z ^ 2 + star b * star z + star c) :=
          hrearrange.symm
    _ = 0 := by rw [hstar, mul_zero]

theorem quadraticResultant_reciprocal_eq_zero_of_unit_root
    {a b c z : ℂ}
    (hzUnit : Complex.normSq z = 1)
    (hf : a * z ^ 2 + b * z + c = 0) :
    quadraticResultant a b c (star c) (star b) (star a) = 0 := by
  have hz : z ≠ 0 := by
    intro hzero
    rw [hzero] at hzUnit
    norm_num at hzUnit
  exact quadraticResultant_eq_zero_of_common_root hz hf
    (reciprocalQuadratic_root_of_unit_root hzUnit hf)

theorem no_unit_root_of_reciprocal_resultant_ne_zero
    {a b c : ℂ}
    (hresultant :
      quadraticResultant a b c (star c) (star b) (star a) ≠ 0) :
    ¬ ∃ z : ℂ, Complex.normSq z = 1 ∧
      a * z ^ 2 + b * z + c = 0 := by
  rintro ⟨z, hzUnit, hzRoot⟩
  exact hresultant
    (quadraticResultant_reciprocal_eq_zero_of_unit_root hzUnit hzRoot)

end Hadamard6
