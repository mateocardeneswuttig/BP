import Hadamard6.DependentBranch
import Hadamard6.CubicRoots
import Mathlib.Tactic.LinearCombination

/-!
# The `T=R=0` Fourier subcase of the dependent branch
-/

namespace Hadamard6

/-- Exact polynomial certificate behind the Fourier-row argument.  The
variables `a,b,-a-b` are the third row.  The first relation says that its
pairwise elementary symmetric sum vanishes.  The next two are the cleared
orthogonality equation and its conjugate. -/
theorem dependent_fourier_polynomial_certificate
    {x₁ x₂ x₃ a b : ℂ}
    (hq : a ^ 2 + a * b + b ^ 2 = 0)
    (hC : x₁ * b * (-a - b) + x₂ * a * (-a - b) + x₃ * a * b = 0)
    (hD : a * x₂ * x₃ + b * x₁ * x₃ + (-a - b) * x₁ * x₂ = 0) :
    a * b * (x₁ + x₂ + x₃) *
      Matrix.det (normalizedRows x₁ x₂ x₃ a b (-a - b)) = 0 := by
  have hdet : Matrix.det (normalizedRows x₁ x₂ x₃ a b (-a - b)) =
      x₂ * (-a - b) - x₃ * b - x₁ * (-a - b) + x₃ * a +
        x₁ * b - x₂ * a := by
    rw [Matrix.det_fin_three]
    simp [normalizedRows]
  rw [hdet]
  linear_combination
    (a * x₂ * x₃ + a * x₂ ^ 2 + 5 * b * x₁ * x₃ -
      4 * b * x₁ * x₂ - 2 * a * x₁ * x₂ - b * x₁ ^ 2) * hq +
    (-x₃ * b + x₃ * a + 2 * x₂ * b + x₂ * a - x₁ * b -
      2 * x₁ * a) * hC +
    (-6 * b ^ 2 - 3 * a * b) * hD

/-- If a unit row has zero sum and a second unit row is orthogonal to it,
then the second row also has zero sum unless the normalized three-row matrix
is singular. -/
theorem unit_row_orthogonal_to_zero_sum_row
    {x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1)
    (hysum : y₁ + y₂ + y₃ = 0)
    (horth : star x₁ * y₁ + star x₂ * y₂ + star x₃ * y₃ = 0) :
    x₁ + x₂ + x₃ = 0 ∨
      Matrix.det (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) = 0 := by
  have hxu₁ : x₁ * star x₁ = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hx₁
  have hxu₂ : x₂ * star x₂ = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hx₂
  have hxu₃ : x₃ * star x₃ = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hx₃
  have hyu₁ : y₁ * star y₁ = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hy₁
  have hyu₂ : y₂ * star y₂ = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hy₂
  have hyu₃ : y₃ * star y₃ = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one hy₃
  have hstarsum : star y₁ + star y₂ + star y₃ = 0 := by
    have h := congrArg star hysum
    simpa [star_add] using h
  have hypair : y₁ * y₂ + y₁ * y₃ + y₂ * y₃ = 0 := by
    calc
      y₁ * y₂ + y₁ * y₃ + y₂ * y₃ =
          (star y₁ * y₁) * (y₂ * y₃) +
          (star y₂ * y₂) * (y₁ * y₃) +
          (star y₃ * y₃) * (y₁ * y₂) := by
            rw [star_mul_self_of_normSq_one hy₁,
              star_mul_self_of_normSq_one hy₂,
              star_mul_self_of_normSq_one hy₃]
            ring
      _ = (star y₁ + star y₂ + star y₃) * (y₁ * y₂ * y₃) := by
            ring
      _ = 0 := by rw [hstarsum]; simp
  have horthStar :
      star y₁ * x₁ + star y₂ * x₂ + star y₃ * x₃ = 0 := by
    have h := congrArg star horth
    simpa [star_add, star_mul, add_comm, mul_comm] using h
  have hC :
      x₁ * y₂ * y₃ + x₂ * y₁ * y₃ + x₃ * y₁ * y₂ = 0 := by
    calc
      _ = (y₁ * star y₁) * (x₁ * y₂ * y₃) +
          (y₂ * star y₂) * (x₂ * y₁ * y₃) +
          (y₃ * star y₃) * (x₃ * y₁ * y₂) := by
            rw [hyu₁, hyu₂, hyu₃]
            ring
      _ = (y₁ * y₂ * y₃) *
          (star y₁ * x₁ + star y₂ * x₂ + star y₃ * x₃) := by
            ring
      _ = 0 := by rw [horthStar]; simp
  have hD :
      y₁ * x₂ * x₃ + y₂ * x₁ * x₃ + y₃ * x₁ * x₂ = 0 := by
    calc
      _ = (x₁ * star x₁) * (y₁ * x₂ * x₃) +
          (x₂ * star x₂) * (y₂ * x₁ * x₃) +
          (x₃ * star x₃) * (y₃ * x₁ * x₂) := by
            rw [hxu₁, hxu₂, hxu₃]
            ring
      _ = (x₁ * x₂ * x₃) *
          (star x₁ * y₁ + star x₂ * y₂ + star x₃ * y₃) := by
            ring
      _ = 0 := by rw [horth]; simp
  have hy₃eq : y₃ = -y₁ - y₂ := by linear_combination hysum
  have hq : y₁ ^ 2 + y₁ * y₂ + y₂ ^ 2 = 0 := by
    rw [hy₃eq] at hypair
    linear_combination -hypair
  have hC' :
      x₁ * y₂ * (-y₁ - y₂) + x₂ * y₁ * (-y₁ - y₂) +
        x₃ * y₁ * y₂ = 0 := by simpa [hy₃eq] using hC
  have hD' :
      y₁ * x₂ * x₃ + y₂ * x₁ * x₃ +
        (-y₁ - y₂) * x₁ * x₂ = 0 := by simpa [hy₃eq] using hD
  have hcert := dependent_fourier_polynomial_certificate hq hC' hD'
  rw [← hy₃eq] at hcert
  rcases mul_eq_zero.mp hcert with habs | hdet
  · rcases mul_eq_zero.mp habs with hab | hsum
    · rcases mul_eq_zero.mp hab with hy₁zero | hy₂zero
      · exact False.elim (ne_zero_of_normSq_eq_one hy₁ hy₁zero)
      · exact False.elim (ne_zero_of_normSq_eq_one hy₂ hy₂zero)
    · exact Or.inl hsum
  · exact Or.inr hdet

theorem dependent_zero_T_R_isHadamard3
    {G X : Mat3}
    (hX : X ∈ normalizedRowGramFibre G)
    (hT : G 2 0 = 0) (hR : G 2 1 = 0)
    (hdet : X.det ≠ 0) :
    IsHadamard3 X := by
  have hdata := normalized_fibre_fixed_data hX
  have hout := unit_row_orthogonal_to_zero_sum_row
    (hX.1 1 0) (hX.1 1 1) (hX.1 1 2)
    (hX.1 2 0) (hX.1 2 1) (hX.1 2 2)
    (hdata.2.1.trans hT)
    (hdata.2.2.trans hR)
  rcases hout with hSzero | hsing
  · have hS : G 1 0 = (0 : ℂ) := by
      rw [← hdata.1]
      simpa [fibreS] using hSzero
    have hgram := normalized_fibre_gram_eq_dependentGram hX hS hT
      (by simpa using hR : G 2 1 = (0 : ℂ) * 1)
    refine ⟨hX.1, ?_⟩
    rw [hX.2.2, hgram]
    ext i j
    fin_cases i <;> fin_cases j <;> simp [dependentGram]
  · exact False.elim (hdet (by
      rw [eq_normalizedRows_of_mem hX]
      exact hsing))

end Hadamard6
