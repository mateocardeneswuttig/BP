import Hadamard6.Strata
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-!
# Elementary cubic-root lemmas for the Fourier-block branch
-/

namespace Hadamard6

/-- Three unit phases of product one and sum zero are themselves cubic
roots.  This is the elementary algebra used after a Fourier coefficient
vanishes in the all-Fourier-block case. -/
theorem unit_sum_zero_product_one_are_cubic
    {x y z : ℂ}
    (hx : Complex.normSq x = 1)
    (hy : Complex.normSq y = 1)
    (hz : Complex.normSq z = 1)
    (hsum : x + y + z = 0)
    (hprod : x * y * z = 1) :
    IsCubicRoot x ∧ IsCubicRoot y ∧ IsCubicRoot z := by
  have hux := star_mul_self_of_normSq_one hx
  have huy := star_mul_self_of_normSq_one hy
  have huz := star_mul_self_of_normSq_one hz
  have hstarsum : star x + star y + star z = 0 := by
    have hs := congrArg star hsum
    simpa [star_add] using hs
  have hpair : x * y + x * z + y * z = 0 := by
    calc
      x * y + x * z + y * z =
          (star x * x) * (y * z) +
          (star y * y) * (x * z) +
          (star z * z) * (x * y) := by rw [hux, huy, huz]; ring
      _ = (star x + star y + star z) * (x * y * z) := by ring
      _ = 0 := by rw [hstarsum, zero_mul]
  have hx3 : x ^ 3 = 1 := by
    calc
      x ^ 3 = x * y * z := by
        linear_combination x ^ 2 * hsum - x * hpair
      _ = 1 := hprod
  have hy3 : y ^ 3 = 1 := by
    calc
      y ^ 3 = x * y * z := by
        linear_combination y ^ 2 * hsum - y * hpair
      _ = 1 := hprod
  have hz3 : z ^ 3 = 1 := by
    calc
      z ^ 3 = x * y * z := by
        linear_combination z ^ 2 * hsum - z * hpair
      _ = 1 := hprod
  exact ⟨hx3, hy3, hz3⟩

end Hadamard6
