import Hadamard6.DependentFourier
import Hadamard6.FibreNormIdentity
import Hadamard6.AllocationToMobius
import Hadamard6.InfiniteFibreExceptional
import Mathlib.Algebra.QuadraticDiscriminant
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring

/-!
# Endpoint cases of the quotient identity

This file treats the values of the normalized first-row sum not covered by
the regular `0 < s < 1` argument.  The first part is the elementary
constant-modulus calculation at `s = 0`.
-/

namespace Hadamard6

open Polynomial

noncomputable section

/-- If `Q Q#` is the square of `kappa_0 = -3 X`, then `Q` is a monomial.
This coefficient proof is the exact finite version of the familiar statement
that a polynomial of constant modulus on the unit circle is a monomial. -/
theorem quadratic_monomial_of_zero_endpoint
    {δ q₀ q₁ q₂ : ℂ}
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly 0 ^ 2) :
    (q₀ = 0 ∧ q₁ = 0) ∨
    (q₀ = 0 ∧ q₂ = 0) ∨
    (q₁ = 0 ∧ q₂ = 0) := by
  have h₀ : q₀ = 0 ∨ q₂ = 0 := by
    simpa [quadraticPoly, quadraticSharpPoly, kappaPoly,
      pow_two, Polynomial.coeff_mul] using
      congrArg (fun p : ℂ[X] ↦ p.coeff 0) hpoly
  have hrhs : C (δ * star δ) * kappaPoly 0 ^ 2 =
      (C (δ * star δ) * C 9) * X ^ 2 := by
    have hk : kappaPoly 0 = -(C 3 * X) := by
      simp [kappaPoly]
    have hC3 : C (3 : ℂ) * C 3 = C 9 := by
      rw [← map_mul]
      norm_num
    rw [hk]
    calc
      C (δ * star δ) * (-(C 3 * X)) ^ 2 =
          (C (δ * star δ) * (C 3 * C 3)) * X ^ 2 := by ring
      _ = (C (δ * star δ) * C 9) * X ^ 2 := by rw [hC3]
  rcases h₀ with hq₀ | hq₂
  · have hfact :
        X * ((C q₁ + C q₂ * X) *
          (C (star q₂) + C (star q₁) * X)) =
          (C (δ * star δ) * C 9) * X ^ 2 := by
      rw [← hrhs, ← hpoly]
      simp [hq₀, quadraticPoly, quadraticSharpPoly]
      ring
    have h₁ := congrArg (fun p : ℂ[X] ↦ p.coeff 1) hfact
    have hlhs :
        (X * ((C q₁ + C q₂ * X) *
          (C (star q₂) + C (star q₁) * X))).coeff 1 =
          q₁ * star q₂ := by simp [Polynomial.coeff_X_mul]
    have hrhsCoeff :
        ((C (δ * star δ) * C 9) * X ^ 2).coeff 1 = 0 := by
      rw [Polynomial.coeff_mul_X_pow']
      simp
    rw [hlhs, hrhsCoeff] at h₁
    rcases mul_eq_zero.mp h₁ with hq₁ | hsq₂
    · exact Or.inl ⟨hq₀, hq₁⟩
    · exact Or.inr (Or.inl ⟨hq₀, star_eq_zero.mp hsq₂⟩)
  · have hfact :
        X * ((C q₀ + C q₁ * X) *
          (C (star q₁) + C (star q₀) * X)) =
          (C (δ * star δ) * C 9) * X ^ 2 := by
      rw [← hrhs, ← hpoly]
      simp [hq₂, quadraticPoly, quadraticSharpPoly]
      ring
    have h₃ := congrArg (fun p : ℂ[X] ↦ p.coeff 3) hfact
    have hlhs :
        (X * ((C q₀ + C q₁ * X) *
          (C (star q₁) + C (star q₀) * X))).coeff 3 =
          q₁ * star q₀ := by
      have hP :
          (C q₀ + C q₁ * X) * (C (star q₁) + C (star q₀) * X) =
            C (q₀ * star q₁) +
            C (q₀ * star q₀ + q₁ * star q₁) * X +
            C (q₁ * star q₀) * X ^ 2 := by
        simp only [map_add, map_mul]
        ring
      rw [Polynomial.coeff_X_mul, hP]
      have hterm₁ :
          (C (q₁ * star q₀) * X ^ 2).coeff 2 = q₁ * star q₀ := by
        calc
          _ = (C (q₁ * star q₀)).coeff 0 := by
            simpa using
              (Polynomial.coeff_mul_X_pow (C (q₁ * star q₀)) 2 0)
          _ = q₁ * star q₀ := by simp
      simp only [coeff_add, coeff_mul_X, coeff_C, if_false,
        OfNat.ofNat, Nat.reduceEqDiff]
      rw [hterm₁]
      change (0 : ℂ) + 0 + q₁ * star q₀ = q₁ * star q₀
      ring
    have hrhsCoeff :
        ((C (δ * star δ) * C 9) * X ^ 2).coeff 3 = 0 := by
      rw [Polynomial.coeff_mul_X_pow]
      simp
    rw [hlhs, hrhsCoeff] at h₃
    rcases mul_eq_zero.mp h₃ with hq₁ | hsq₀
    · exact Or.inr (Or.inr ⟨hq₁, hq₂⟩)
    · exact Or.inr (Or.inl ⟨star_eq_zero.mp hsq₀, hq₂⟩)

theorem quadratic_nonzero_of_zero_endpoint
    {δ q₀ q₁ q₂ : ℂ} (hδ : δ ≠ 0)
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly 0 ^ 2) :
    ¬ (q₀ = 0 ∧ q₁ = 0 ∧ q₂ = 0) := by
  rintro ⟨rfl, rfl, rfl⟩
  have hne : δ * star δ * 9 ≠ 0 :=
    mul_ne_zero (mul_ne_zero hδ (star_ne_zero.mpr hδ)) (by norm_num)
  apply hne
  have he := congrArg (fun p : ℂ[X] ↦ p.eval 1) hpoly
  simpa [quadraticPoly, quadraticSharpPoly, kappaPoly, mul_assoc] using he.symm

/-- A zero-sum triple of unit phases also has zero pairwise symmetric sum. -/
theorem unit_zero_sum_pair_sum
    {x₁ x₂ x₃ : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hsum : x₁ + x₂ + x₃ = 0) :
    x₁ * x₂ + x₁ * x₃ + x₂ * x₃ = 0 := by
  have hstar : star x₁ + star x₂ + star x₃ = 0 := by
    have h := congrArg star hsum
    simpa [star_add] using h
  have hu₁ := star_mul_self_of_normSq_one hx₁
  have hu₂ := star_mul_self_of_normSq_one hx₂
  have hu₃ := star_mul_self_of_normSq_one hx₃
  calc
    x₁ * x₂ + x₁ * x₃ + x₂ * x₃ =
        (star x₁ * x₁) * (x₂ * x₃) +
        (star x₂ * x₂) * (x₁ * x₃) +
        (star x₃ * x₃) * (x₁ * x₂) := by
      rw [hu₁, hu₂, hu₃]
      ring
    _ =
        (star x₁ + star x₂ + star x₃) * (x₁ * x₂ * x₃) := by
      ring
    _ = 0 := by rw [hstar]; simp

theorem unit_zero_sum_squares
    {x₁ x₂ x₃ : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hsum : x₁ + x₂ + x₃ = 0) :
    x₁ ^ 2 + x₂ ^ 2 + x₃ ^ 2 = 0 := by
  have hp := unit_zero_sum_pair_sum hx₁ hx₂ hx₃ hsum
  linear_combination hsum * (x₁ + x₂ + x₃) - 2 * hp

/-- The coordinate form of a normalized `3 x 3` Hadamard matrix. -/
theorem normalizedRows_isHadamard3_of_row_equations
    {x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1)
    (hxsum : x₁ + x₂ + x₃ = 0)
    (hysum : y₁ + y₂ + y₃ = 0)
    (hxy : star x₁ * y₁ + star x₂ * y₂ + star x₃ * y₃ = 0) :
    IsHadamard3 (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) := by
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
  have hxstar : star x₁ + star x₂ + star x₃ = 0 := by
    have h := congrArg star hxsum
    simpa [star_add] using h
  have hystar : star y₁ + star y₂ + star y₃ = 0 := by
    have h := congrArg star hysum
    simpa [star_add] using h
  have hxystar : x₁ * star y₁ + x₂ * star y₂ + x₃ * star y₃ = 0 := by
    have h := congrArg star hxy
    simpa [star_add, star_mul, add_comm, mul_comm] using h
  change x₁ * (starRingEnd ℂ) x₁ = 1 at hxu₁
  change x₂ * (starRingEnd ℂ) x₂ = 1 at hxu₂
  change x₃ * (starRingEnd ℂ) x₃ = 1 at hxu₃
  change y₁ * (starRingEnd ℂ) y₁ = 1 at hyu₁
  change y₂ * (starRingEnd ℂ) y₂ = 1 at hyu₂
  change y₃ * (starRingEnd ℂ) y₃ = 1 at hyu₃
  change (starRingEnd ℂ) x₁ + (starRingEnd ℂ) x₂ +
    (starRingEnd ℂ) x₃ = 0 at hxstar
  change (starRingEnd ℂ) y₁ + (starRingEnd ℂ) y₂ +
    (starRingEnd ℂ) y₃ = 0 at hystar
  change (starRingEnd ℂ) x₁ * y₁ + (starRingEnd ℂ) x₂ * y₂ +
    (starRingEnd ℂ) x₃ * y₃ = 0 at hxy
  change x₁ * (starRingEnd ℂ) y₁ + x₂ * (starRingEnd ℂ) y₂ +
    x₃ * (starRingEnd ℂ) y₃ = 0 at hxystar
  refine ⟨?_, ?_⟩
  · intro i j
    fin_cases i <;> fin_cases j <;>
      simp [normalizedRows, hx₁, hx₂, hx₃, hy₁, hy₂, hy₃]
  · ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [normalizedRows, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk,
        Fin.isValue, Matrix.mul_apply, Matrix.of_apply, Matrix.cons_val',
        Matrix.cons_val_fin_one, Matrix.cons_val_zero, Matrix.cons_val_one,
        Matrix.cons_val, Matrix.conjTranspose_apply, RCLike.star_def,
        Fin.sum_univ_three, Matrix.smul_apply, Matrix.one_apply_eq,
        Matrix.one_apply_ne, smul_eq_mul, map_one, one_mul, mul_one,
        mul_zero, Nat.reduceAdd, ne_eq, zero_ne_one, one_ne_zero,
        Fin.reduceEq, not_false_eq_true]
    · norm_num
    · simpa [add_comm, add_left_comm, add_assoc] using hxstar
    · simpa [add_comm, add_left_comm, add_assoc] using hystar
    · simpa [add_comm, add_left_comm, add_assoc] using hxsum
    · rw [hxu₁, hxu₂, hxu₃]
      norm_num
    · simpa [add_comm, add_left_comm, add_assoc] using hxystar
    · simpa [add_comm, add_left_comm, add_assoc] using hysum
    · simpa [add_comm, add_left_comm, add_assoc, mul_comm] using hxy
    · rw [hyu₁, hyu₂, hyu₃]
      norm_num

theorem zero_endpoint_top_monomial_relation
    {δ b x y : ℂ} (hb : b ≠ 0) (hx : Complex.normSq x = 1)
    (hrel : δ * x * kappa 0 x + cubicEval 0 0 0 b x * y = 0) :
    y = (3 * δ / b) * star x := by
  have hx0 := ne_zero_of_normSq_eq_one hx
  have he : b * x * y = 3 * δ := by
    have hscaled : x ^ 2 * (b * x * y - 3 * δ) = 0 := by
      simp [kappa, cubicEval] at hrel
      linear_combination hrel
    exact sub_eq_zero.mp
      ((mul_eq_zero.mp hscaled).resolve_left (pow_ne_zero 2 hx0))
  apply (mul_left_cancel₀ (mul_ne_zero hb hx0))
  rw [he]
  have hu := star_mul_self_of_normSq_one hx
  field_simp [hb]
  have hux : x * star x = 1 := by simpa [mul_comm] using hu
  calc
    δ = δ * (x * star x) := by rw [hux]; ring
    _ = δ * x * star x := by ring

theorem zero_endpoint_middle_high_relation
    {δ b x y : ℂ} (hb : b ≠ 0) (hx : Complex.normSq x = 1)
    (hrel : δ * x * kappa 0 x + cubicEval 0 0 b 0 x * y = 0) :
    y = 3 * δ / b := by
  have hx0 := ne_zero_of_normSq_eq_one hx
  have he : b * y = 3 * δ := by
    have hscaled : x ^ 2 * (b * y - 3 * δ) = 0 := by
      simp [kappa, cubicEval] at hrel
      linear_combination hrel
    exact sub_eq_zero.mp
      ((mul_eq_zero.mp hscaled).resolve_left (pow_ne_zero 2 hx0))
  exact (eq_div_iff hb).2 (by simpa [mul_comm] using he)

theorem zero_endpoint_middle_low_relation
    {δ b x y : ℂ} (hb : b ≠ 0) (hx : Complex.normSq x = 1)
    (hrel : δ * x * kappa 0 x + cubicEval 0 b 0 0 x * y = 0) :
    y = (3 * δ / b) * x := by
  have hx0 := ne_zero_of_normSq_eq_one hx
  have he : b * y = 3 * δ * x := by
    have hscaled : x * (b * y - 3 * δ * x) = 0 := by
      simp [kappa, cubicEval] at hrel
      linear_combination hrel
    exact sub_eq_zero.mp ((mul_eq_zero.mp hscaled).resolve_left hx0)
  apply (mul_left_cancel₀ hb)
  rw [he]
  field_simp [hb]

theorem zero_endpoint_constant_monomial_relation
    {δ b x y : ℂ} (hb : b ≠ 0)
    (hrel : δ * x * kappa 0 x + cubicEval b 0 0 0 x * y = 0) :
    y = (3 * δ / b) * x ^ 2 := by
  have he : b * y = 3 * δ * x ^ 2 := by
    simp [kappa, cubicEval] at hrel
    linear_combination hrel
  apply (mul_left_cancel₀ hb)
  rw [he]
  field_simp [hb]

theorem normalizedRows_inverse_third_isHadamard3
    {x₁ x₂ x₃ y₁ y₂ y₃ ell : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1)
    (hsum : x₁ + x₂ + x₃ = 0)
    (he₁ : y₁ = ell * star x₁)
    (he₂ : y₂ = ell * star x₂)
    (he₃ : y₃ = ell * star x₃) :
    IsHadamard3 (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) := by
  have hstarsum : star x₁ + star x₂ + star x₃ = 0 := by
    have h := congrArg star hsum
    simpa [star_add] using h
  have hsquares := unit_zero_sum_squares hx₁ hx₂ hx₃ hsum
  have hstarSquares : (star x₁) ^ 2 + (star x₂) ^ 2 +
      (star x₃) ^ 2 = 0 := by
    have h := congrArg star hsquares
    simpa [star_add, star_pow] using h
  apply normalizedRows_isHadamard3_of_row_equations
    hx₁ hx₂ hx₃ hy₁ hy₂ hy₃ hsum
  · rw [he₁, he₂, he₃]
    linear_combination ell * hstarsum
  · rw [he₁, he₂, he₃]
    linear_combination ell * hstarSquares

theorem normalizedRows_square_third_isHadamard3
    {x₁ x₂ x₃ y₁ y₂ y₃ ell : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1)
    (hsum : x₁ + x₂ + x₃ = 0)
    (he₁ : y₁ = ell * x₁ ^ 2)
    (he₂ : y₂ = ell * x₂ ^ 2)
    (he₃ : y₃ = ell * x₃ ^ 2) :
    IsHadamard3 (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) := by
  have hsquares := unit_zero_sum_squares hx₁ hx₂ hx₃ hsum
  have hu₁ := star_mul_self_of_normSq_one hx₁
  have hu₂ := star_mul_self_of_normSq_one hx₂
  have hu₃ := star_mul_self_of_normSq_one hx₃
  apply normalizedRows_isHadamard3_of_row_equations
    hx₁ hx₂ hx₃ hy₁ hy₂ hy₃ hsum
  · rw [he₁, he₂, he₃]
    linear_combination ell * hsquares
  · rw [he₁, he₂, he₃]
    calc
      star x₁ * (ell * x₁ ^ 2) + star x₂ * (ell * x₂ ^ 2) +
          star x₃ * (ell * x₃ ^ 2) =
          ell * ((star x₁ * x₁) * x₁ +
            (star x₂ * x₂) * x₂ + (star x₃ * x₃) * x₃) := by ring
      _ = ell * (x₁ + x₂ + x₃) := by rw [hu₁, hu₂, hu₃]; ring
      _ = 0 := by rw [hsum]; simp

/-- Complete nonsingular `s = 0` endpoint for one normalized quotient row. -/
theorem zero_endpoint_good_row_isHadamard3
    {δ b₀ b₁ b₂ b₃ x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hδ : δ ≠ 0)
    (ht : (x₁, x₂, x₃) ∈ phaseTriplesAtSum 0)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1)
    (hdet : Matrix.det (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) ≠ 0)
    (hrel₁ : δ * x₁ * kappa 0 x₁ +
      cubicEval b₀ b₁ b₂ b₃ x₁ * y₁ = 0)
    (hrel₂ : δ * x₂ * kappa 0 x₂ +
      cubicEval b₀ b₁ b₂ b₃ x₂ * y₂ = 0)
    (hrel₃ : δ * x₃ * kappa 0 x₃ +
      cubicEval b₀ b₁ b₂ b₃ x₃ * y₃ = 0)
    (hnorm : ClearedNormIdentity 0 δ b₀ b₁ b₂ b₃) :
    IsHadamard3 (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) := by
  rcases ht with ⟨hx₁, hx₂, hx₃, hsum⟩
  rcases quotient_degree_drop hnorm with hb₀ | hb₃
  · have hpoly := quadratic_polynomial_identity_of_constant_zero hnorm hb₀
    have hnz := quadratic_nonzero_of_zero_endpoint hδ hpoly
    rcases quadratic_monomial_of_zero_endpoint hpoly with
      ⟨hb₁, hb₂⟩ | ⟨hb₁, hb₃⟩ | ⟨hb₂, hb₃⟩
    · have hb₃ne : b₃ ≠ 0 := by
        intro hz
        exact hnz ⟨hb₁, hb₂, hz⟩
      have he₁ := zero_endpoint_top_monomial_relation hb₃ne hx₁
        (by simpa [hb₀, hb₁, hb₂] using hrel₁)
      have he₂ := zero_endpoint_top_monomial_relation hb₃ne hx₂
        (by simpa [hb₀, hb₁, hb₂] using hrel₂)
      have he₃ := zero_endpoint_top_monomial_relation hb₃ne hx₃
        (by simpa [hb₀, hb₁, hb₂] using hrel₃)
      exact normalizedRows_inverse_third_isHadamard3
        hx₁ hx₂ hx₃ hy₁ hy₂ hy₃ hsum he₁ he₂ he₃
    · have hb₂ne : b₂ ≠ 0 := by
        intro hz
        exact hnz ⟨hb₁, hz, hb₃⟩
      have he₁ := zero_endpoint_middle_high_relation hb₂ne hx₁
        (by simpa [hb₀, hb₁, hb₃] using hrel₁)
      have he₂ := zero_endpoint_middle_high_relation hb₂ne hx₂
        (by simpa [hb₀, hb₁, hb₃] using hrel₂)
      have he₃ := zero_endpoint_middle_high_relation hb₂ne hx₃
        (by simpa [hb₀, hb₁, hb₃] using hrel₃)
      exfalso
      apply hdet
      rw [he₁, he₂, he₃]
      exact normalizedRows_constant_third_det_zero x₁ x₂ x₃ (3 * δ / b₂)
    · have hb₁ne : b₁ ≠ 0 := by
        intro hz
        exact hnz ⟨hz, hb₂, hb₃⟩
      have he₁ := zero_endpoint_middle_low_relation hb₁ne hx₁
        (by simpa [hb₀, hb₂, hb₃] using hrel₁)
      have he₂ := zero_endpoint_middle_low_relation hb₁ne hx₂
        (by simpa [hb₀, hb₂, hb₃] using hrel₂)
      have he₃ := zero_endpoint_middle_low_relation hb₁ne hx₃
        (by simpa [hb₀, hb₂, hb₃] using hrel₃)
      exfalso
      apply hdet
      rw [he₁, he₂, he₃]
      exact normalizedRows_proportional_third_det_zero x₁ x₂ x₃
        (3 * δ / b₁)
  · have hpoly := quadratic_polynomial_identity_of_cubic_zero hnorm hb₃
    have hnz := quadratic_nonzero_of_zero_endpoint hδ hpoly
    rcases quadratic_monomial_of_zero_endpoint hpoly with
      ⟨hb₀, hb₁⟩ | ⟨hb₀, hb₂⟩ | ⟨hb₁, hb₂⟩
    · have hb₂ne : b₂ ≠ 0 := by
        intro hz
        exact hnz ⟨hb₀, hb₁, hz⟩
      have he₁ := zero_endpoint_middle_high_relation hb₂ne hx₁
        (by simpa [hb₀, hb₁, hb₃] using hrel₁)
      have he₂ := zero_endpoint_middle_high_relation hb₂ne hx₂
        (by simpa [hb₀, hb₁, hb₃] using hrel₂)
      have he₃ := zero_endpoint_middle_high_relation hb₂ne hx₃
        (by simpa [hb₀, hb₁, hb₃] using hrel₃)
      exfalso
      apply hdet
      rw [he₁, he₂, he₃]
      exact normalizedRows_constant_third_det_zero x₁ x₂ x₃ (3 * δ / b₂)
    · have hb₁ne : b₁ ≠ 0 := by
        intro hz
        exact hnz ⟨hb₀, hz, hb₂⟩
      have he₁ := zero_endpoint_middle_low_relation hb₁ne hx₁
        (by simpa [hb₀, hb₂, hb₃] using hrel₁)
      have he₂ := zero_endpoint_middle_low_relation hb₁ne hx₂
        (by simpa [hb₀, hb₂, hb₃] using hrel₂)
      have he₃ := zero_endpoint_middle_low_relation hb₁ne hx₃
        (by simpa [hb₀, hb₂, hb₃] using hrel₃)
      exfalso
      apply hdet
      rw [he₁, he₂, he₃]
      exact normalizedRows_proportional_third_det_zero x₁ x₂ x₃
        (3 * δ / b₁)
    · have hb₀ne : b₀ ≠ 0 := by
        intro hz
        exact hnz ⟨hz, hb₁, hb₂⟩
      have he₁ := zero_endpoint_constant_monomial_relation hb₀ne
        (by simpa [hb₁, hb₂, hb₃] using hrel₁)
      have he₂ := zero_endpoint_constant_monomial_relation hb₀ne
        (by simpa [hb₁, hb₂, hb₃] using hrel₂)
      have he₃ := zero_endpoint_constant_monomial_relation hb₀ne
        (by simpa [hb₁, hb₂, hb₃] using hrel₃)
      exact normalizedRows_square_third_isHadamard3
        hx₁ hx₂ hx₃ hy₁ hy₂ hy₃ hsum he₁ he₂ he₃

/-- The reversed quadratic is conjugation of the original quadratic on the
unit circle, with the usual clearing factor. -/
theorem quadraticSharpEval_on_unit
    {z : ℂ} (hz : Complex.normSq z = 1) (q₀ q₁ q₂ : ℂ) :
    quadraticSharpEval q₀ q₁ q₂ z =
      z ^ 2 * star (quadraticEval q₀ q₁ q₂ z) := by
  have hz0 := ne_zero_of_normSq_eq_one hz
  have hsz := one_div_eq_star_of_normSq_eq_one hz
  simp only [quadraticSharpEval, quadraticEval, star_add, star_mul, star_pow]
  rw [← hsz]
  field_simp [hz0]
  ring

/-- Every unit-circle root of the critical quadratic is forced to be a root
of `Q` by the reversed-product identity. -/
theorem quadratic_vanishes_at_unit_kappa_root
    {s δ q₀ q₁ q₂ z : ℂ}
    (hz : Complex.normSq z = 1)
    (hk : kappa s z = 0)
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly s ^ 2) :
    quadraticEval q₀ q₁ q₂ z = 0 := by
  have he := congrArg (fun p : ℂ[X] ↦ p.eval z) hpoly
  have hprod : quadraticEval q₀ q₁ q₂ z *
      quadraticSharpEval q₀ q₁ q₂ z = 0 := by
    simpa [hk] using he
  rw [quadraticSharpEval_on_unit hz] at hprod
  rcases mul_eq_zero.mp hprod with hq | hrest
  · exact hq
  rcases mul_eq_zero.mp hrest with hz2 | hstar
  · exact False.elim ((pow_ne_zero 2 (ne_zero_of_normSq_eq_one hz)) hz2)
  · exact star_eq_zero.mp hstar

/-- For the closed endpoint interval, every root of the critical quadratic
lies on the unit circle. -/
theorem kappa_root_normSq_one_of_one_le_three
    {s : ℝ} {z : ℂ} (hs1 : 1 ≤ s) (hs3 : s ≤ 3)
    (hk : kappa (s : ℂ) z = 0) :
    Complex.normSq z = 1 := by
  have hre :
      2 * s * (z.re ^ 2 - z.im ^ 2) - (s ^ 2 + 3) * z.re + 2 * s = 0 := by
    simpa [kappa, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
      Complex.add_re, Complex.add_im, Complex.sub_re, Complex.sub_im,
      pow_two, Complex.star_def] using congrArg Complex.re hk
  have him : z.im * (4 * s * z.re - (s ^ 2 + 3)) = 0 := by
    have himRaw := congrArg Complex.im hk
    simp [kappa, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
      Complex.add_re, Complex.add_im, Complex.sub_im, pow_two] at himRaw
    nlinarith
  have hs0 : 0 < s := lt_of_lt_of_le zero_lt_one hs1
  by_cases hb : z.im = 0
  · have hdiscNonpos :
        (s ^ 2 + 3) ^ 2 - 16 * s ^ 2 ≤ 0 := by
      rw [realKappa_discriminant_identity]
      have hleft : 0 ≤ s ^ 2 - 1 := by nlinarith
      have hright : s ^ 2 - 9 ≤ 0 := by nlinarith
      exact mul_nonpos_of_nonneg_of_nonpos hleft hright
    have hsquare :
        (4 * s * z.re - (s ^ 2 + 3)) ^ 2 =
          (s ^ 2 + 3) ^ 2 - 16 * s ^ 2 := by
      rw [hb] at hre
      nlinarith
    have hsquareZero : 4 * s * z.re - (s ^ 2 + 3) = 0 := by
      have hsqle : (4 * s * z.re - (s ^ 2 + 3)) ^ 2 ≤ 0 := by
        rw [hsquare]
        exact hdiscNonpos
      nlinarith [sq_nonneg (4 * s * z.re - (s ^ 2 + 3))]
    have hdiscZero : (s ^ 2 - 1) * (s ^ 2 - 9) = 0 := by
      rw [← realKappa_discriminant_identity, ← hsquare]
      rw [hsquareZero]
      norm_num
    rcases mul_eq_zero.mp hdiscZero with hs | hs
    · have hseq : s = 1 := by nlinarith
      rw [hseq] at hsquareZero
      have hzre : z.re = 1 := by nlinarith
      simp [Complex.normSq_apply, hb, hzre]
    · have hseq : s = 3 := by nlinarith
      rw [hseq] at hsquareZero
      have hzre : z.re = 1 := by nlinarith
      simp [Complex.normSq_apply, hb, hzre]
  · have him' : 4 * s * z.re - (s ^ 2 + 3) = 0 := by
      have hfactor : z.im * (4 * s * z.re - (s ^ 2 + 3)) = 0 := by
        nlinarith [him]
      exact (mul_eq_zero.mp hfactor).resolve_left hb
    have hnorm : z.re ^ 2 + z.im ^ 2 = 1 := by
      nlinarith [hre, mul_pos hs0 hs0]
    simpa [Complex.normSq_apply, pow_two] using hnorm

/-- In the open part of the closed endpoint interval, the two distinct roots
of `kappa_s` force a quadratic factor to be proportional to `kappa_s`. -/
theorem quadratic_proportional_kappa_of_strict_endpoint
    {s : ℝ} {δ q₀ q₁ q₂ : ℂ}
    (hs1 : 1 < s) (hs3 : s < 3)
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly (s : ℂ) ^ 2) :
    ∃ ell : ℂ, quadraticPoly q₀ q₁ q₂ = C ell * kappaPoly (s : ℂ) := by
  let a : ℂ := 2 * (s : ℂ)
  let b : ℂ := -(((s ^ 2 + 3 : ℝ) : ℂ))
  let c : ℂ := 2 * (s : ℂ)
  have ha : a ≠ 0 := by
    dsimp [a]
    exact mul_ne_zero (by norm_num) (by exact_mod_cast (ne_of_gt (lt_trans zero_lt_one hs1)))
  obtain ⟨d, hd⟩ := IsAlgClosed.exists_eq_mul_self (discrim a b c)
  let u : ℂ := (-b + d) / (2 * a)
  let v : ℂ := (-b - d) / (2 * a)
  have huquad : a * (u * u) + b * u + c = 0 := by
    apply (quadratic_eq_zero_iff ha hd u).2
    exact Or.inl rfl
  have hvquad : a * (v * v) + b * v + c = 0 := by
    apply (quadratic_eq_zero_iff ha hd v).2
    exact Or.inr rfl
  have hnorms : Complex.normSq (s : ℂ) = s ^ 2 := by
    simp [Complex.normSq_apply]
    ring
  have hstars : star (s : ℂ) = (s : ℂ) := by simp
  have hku : kappa (s : ℂ) u = 0 := by
    have h := huquad
    dsimp [a, b, c] at h
    rw [kappa, hnorms, hstars]
    push_cast at h ⊢
    linear_combination h
  have hkv : kappa (s : ℂ) v = 0 := by
    have h := hvquad
    dsimp [a, b, c] at h
    rw [kappa, hnorms, hstars]
    push_cast at h ⊢
    linear_combination h
  have hDne : discrim a b c ≠ 0 := by
    have hreal : (s ^ 2 - 1) * (s ^ 2 - 9) ≠ 0 := by
      apply mul_ne_zero <;> nlinarith
    intro hzero
    apply hreal
    have hcast : (((s ^ 2 - 1) * (s ^ 2 - 9) : ℝ) : ℂ) = 0 := by
      rw [← realKappa_discriminant_identity]
      have h := hzero
      dsimp [a, b, c, discrim] at h
      push_cast at h ⊢
      linear_combination h
    exact_mod_cast hcast
  have hdne : d ≠ 0 := by
    intro hz
    apply hDne
    rw [hd, hz, zero_mul]
  have huv : u ≠ v := by
    intro huv
    have hden : 2 * a ≠ 0 := mul_ne_zero (by norm_num) ha
    apply hdne
    have h := congrArg (fun z : ℂ ↦ z * (2 * a)) huv
    dsimp [u, v] at h
    field_simp [hden] at h
    linear_combination h / 2
  have hqu := quadratic_vanishes_at_unit_kappa_root
    (kappa_root_normSq_one_of_one_le_three hs1.le hs3.le hku) hku hpoly
  have hqv := quadratic_vanishes_at_unit_kappa_root
    (kappa_root_normSq_one_of_one_le_three hs1.le hs3.le hkv) hkv hpoly
  have hQfactor := quadraticPoly_eq_leading_mul_two_roots huv hqu hqv
  have hKfactor : kappaPoly (s : ℂ) =
      C (2 * (s : ℂ)) * (X - C u) * (X - C v) := by
    have huEval : quadraticEval c b a u = 0 := by
      simpa [quadraticEval, add_comm, add_left_comm, add_assoc,
        mul_comm, pow_two] using huquad
    have hvEval : quadraticEval c b a v = 0 := by
      simpa [quadraticEval, add_comm, add_left_comm, add_assoc,
        mul_comm, pow_two] using hvquad
    have hfactor := quadraticPoly_eq_leading_mul_two_roots huv huEval hvEval
    have hpolyEq : quadraticPoly c b a = kappaPoly (s : ℂ) := by
      simp [quadraticPoly, kappaPoly, a, b, c]
      ring
    rw [hpolyEq] at hfactor
    simpa [a] using hfactor
  refine ⟨q₂ / (2 * (s : ℂ)), ?_⟩
  rw [hKfactor]
  have hsC : (2 : ℂ) * (s : ℂ) ≠ 0 :=
    mul_ne_zero (by norm_num) (by exact_mod_cast
      (ne_of_gt (lt_trans zero_lt_one hs1)))
  have hscalar : C (q₂ / (2 * (s : ℂ))) * C (2 * (s : ℂ)) = C q₂ := by
    rw [← map_mul]
    congr 1
    field_simp [hsC, show (s : ℂ) ≠ 0 by
      exact_mod_cast (ne_of_gt (lt_trans zero_lt_one hs1))]
  symm
  calc
    C (q₂ / (2 * (s : ℂ))) *
        (C (2 * (s : ℂ)) * (X - C u) * (X - C v)) =
        (C (q₂ / (2 * (s : ℂ))) * C (2 * (s : ℂ))) *
          (X - C u) * (X - C v) := by ring
    _ = C q₂ * (X - C u) * (X - C v) := by rw [hscalar]
    _ = quadraticPoly q₀ q₁ q₂ := hQfactor.symm

/-- At `s = 1` and `s = 3`, the critical quadratic has the double root `1`.
The second derivative of the product identity forces the same double root in
`Q`. -/
theorem quadratic_proportional_kappa_of_boundary_endpoint
    {s : ℝ} {δ q₀ q₁ q₂ : ℂ}
    (hs : s = 1 ∨ s = 3)
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly (s : ℂ) ^ 2) :
    ∃ ell : ℂ, quadraticPoly q₀ q₁ q₂ = C ell * kappaPoly (s : ℂ) := by
  have hs0 : s ≠ 0 := by rcases hs with rfl | rfl <;> norm_num
  have hk1 : kappa (s : ℂ) 1 = 0 := by
    rcases hs with rfl | rfl <;> norm_num [kappa, Complex.normSq_apply]
  have hq1 := quadratic_vanishes_at_unit_kappa_root
    (s := (s : ℂ)) (by norm_num) hk1 hpoly
  have hqs1 : quadraticSharpEval q₀ q₁ q₂ 1 = 0 := by
    rw [quadraticSharpEval_on_unit (by norm_num)]
    simp [hq1]
  have hKfactor : kappaPoly (s : ℂ) =
      C (2 * (s : ℂ)) * (X - C 1) ^ 2 := by
    rcases hs with rfl | rfl
    · apply Polynomial.funext
      intro x
      simp [kappaPoly]
      ring
    · apply Polynomial.funext
      intro x
      simp [kappaPoly]
      ring
  have hqsum : q₀ + q₁ + q₂ = 0 := by
    simpa [quadraticEval] using hq1
  have hqsharpSum : star q₀ + star q₁ + star q₂ = 0 := by
    have h := congrArg star hqsum
    simpa [star_add] using h
  change (starRingEnd ℂ) q₀ + (starRingEnd ℂ) q₁ +
    (starRingEnd ℂ) q₂ = 0 at hqsharpSum
  have hsecond := congrArg derivative (congrArg derivative hpoly)
  have heval := congrArg (fun p : ℂ[X] ↦ p.eval 1) hsecond
  have hprod :
      (q₁ + 2 * q₂) *
        ((starRingEnd ℂ) q₁ + 2 * (starRingEnd ℂ) q₀) = 0 := by
    rw [hKfactor] at heval
    simp [derivative_mul, derivative_pow, quadraticPoly,
      quadraticSharpPoly] at heval
    linear_combination heval / 2 - q₂ * hqsharpSum -
      (starRingEnd ℂ) q₀ * hqsum
  have hsharpDer : (starRingEnd ℂ) q₁ + 2 * (starRingEnd ℂ) q₀ =
      -(starRingEnd ℂ) (q₁ + 2 * q₂) := by
    have hmap : (starRingEnd ℂ) (q₁ + 2 * q₂) =
        (starRingEnd ℂ) q₁ + 2 * (starRingEnd ℂ) q₂ := by
      have htwo : star (2 : ℂ) = 2 := by norm_num [Complex.star_def]
      change (starRingEnd ℂ) (2 : ℂ) = 2 at htwo
      rw [map_add, map_mul]
      rw [htwo]
    rw [hmap]
    linear_combination 2 * hqsharpSum
  have hder : q₁ + 2 * q₂ = 0 := by
    rcases mul_eq_zero.mp hprod with h | h
    · exact h
    · rw [hsharpDer] at h
      have hsder : (starRingEnd ℂ) (q₁ + 2 * q₂) = 0 := neg_eq_zero.mp h
      exact star_eq_zero.mp hsder
  have hQfactor := quadraticPoly_eq_leading_mul_double_root hq1
    (by simpa using hder)
  refine ⟨q₂ / (2 * (s : ℂ)), ?_⟩
  rw [hQfactor, hKfactor]
  have hsC : (2 : ℂ) * (s : ℂ) ≠ 0 :=
    mul_ne_zero (by norm_num) (by exact_mod_cast hs0)
  have hscalar : C (q₂ / (2 * (s : ℂ))) * C (2 * (s : ℂ)) = C q₂ := by
    rw [← map_mul]
    congr 1
    field_simp [hsC, show (s : ℂ) ≠ 0 by exact_mod_cast hs0]
  symm
  calc
    C (q₂ / (2 * (s : ℂ))) *
        (C (2 * (s : ℂ)) * (X - C 1) ^ 2) =
        (C (q₂ / (2 * (s : ℂ))) * C (2 * (s : ℂ))) *
          (X - C 1) ^ 2 := by ring
    _ = C q₂ * (X - C 1) ^ 2 := by rw [hscalar]

theorem quadratic_proportional_kappa_of_closed_endpoint
    {s : ℝ} {δ q₀ q₁ q₂ : ℂ}
    (hs1 : 1 ≤ s) (hs3 : s ≤ 3)
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly (s : ℂ) ^ 2) :
    ∃ ell : ℂ, quadraticPoly q₀ q₁ q₂ = C ell * kappaPoly (s : ℂ) := by
  by_cases h1 : s = 1
  · exact quadratic_proportional_kappa_of_boundary_endpoint (Or.inl h1) hpoly
  by_cases h3 : s = 3
  · exact quadratic_proportional_kappa_of_boundary_endpoint (Or.inr h3) hpoly
  exact quadratic_proportional_kappa_of_strict_endpoint
    (lt_of_le_of_ne hs1 (Ne.symm h1)) (lt_of_le_of_ne hs3 h3) hpoly

/-- A normalized row avoiding the common roots is singular throughout the
closed endpoint interval. -/
theorem closed_endpoint_avoiding_row_det_zero
    {s : ℝ} {δ b₀ b₁ b₂ b₃ x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hs1 : 1 ≤ s) (hs3 : s ≤ 3) (hδ : δ ≠ 0)
    (ht : (x₁, x₂, x₃) ∈ phaseTriplesAtSum (s : ℂ))
    (hrel₁ : δ * x₁ * kappa (s : ℂ) x₁ +
      cubicEval b₀ b₁ b₂ b₃ x₁ * y₁ = 0)
    (hrel₂ : δ * x₂ * kappa (s : ℂ) x₂ +
      cubicEval b₀ b₁ b₂ b₃ x₂ * y₂ = 0)
    (hrel₃ : δ * x₃ * kappa (s : ℂ) x₃ +
      cubicEval b₀ b₁ b₂ b₃ x₃ * y₃ = 0)
    (hnorm : ClearedNormIdentity (s : ℂ) δ b₀ b₁ b₂ b₃)
    (havoid₁ : kappa (s : ℂ) x₁ ≠ 0)
    (havoid₂ : kappa (s : ℂ) x₂ ≠ 0)
    (havoid₃ : kappa (s : ℂ) x₃ ≠ 0) :
    Matrix.det (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) = 0 := by
  have hx₁0 := ne_zero_of_normSq_eq_one ht.1
  have hx₂0 := ne_zero_of_normSq_eq_one ht.2.1
  have hx₃0 := ne_zero_of_normSq_eq_one ht.2.2.1
  rcases quotient_degree_drop hnorm with hb₀ | hb₃
  · have hpoly := quadratic_polynomial_identity_of_constant_zero hnorm hb₀
    rcases quadratic_proportional_kappa_of_closed_endpoint hs1 hs3 hpoly with
      ⟨ell, hQ⟩
    have hQeval (x : ℂ) : quadraticEval b₁ b₂ b₃ x =
        ell * kappa (s : ℂ) x := by
      have h := congrArg (fun p : ℂ[X] ↦ p.eval x) hQ
      simpa using h
    have hcomp (x y : ℂ) (hx0 : x ≠ 0)
        (hk : kappa (s : ℂ) x ≠ 0)
        (hrel : δ * x * kappa (s : ℂ) x +
          cubicEval b₀ b₁ b₂ b₃ x * y = 0) :
        δ + ell * y = 0 := by
      rw [hb₀] at hrel
      simp only [cubicEval, zero_add] at hrel
      rw [show b₁ * x + b₂ * x ^ 2 + b₃ * x ^ 3 =
          x * quadraticEval b₁ b₂ b₃ x by
        simp [quadraticEval]; ring, hQeval] at hrel
      have hfactor : x * kappa (s : ℂ) x * (δ + ell * y) = 0 := by
        linear_combination hrel
      rcases mul_eq_zero.mp hfactor with hxk | hcomp
      · exact False.elim ((mul_ne_zero hx0 hk) hxk)
      · exact hcomp
    have hc₁ := hcomp x₁ y₁ hx₁0 havoid₁ hrel₁
    have hc₂ := hcomp x₂ y₂ hx₂0 havoid₂ hrel₂
    have hc₃ := hcomp x₃ y₃ hx₃0 havoid₃ hrel₃
    have hell : ell ≠ 0 := by
      intro hz
      apply hδ
      simpa [hz] using hc₁
    have he₁ : y₁ = -δ / ell :=
      (eq_div_iff hell).2 (by simpa [mul_comm] using eq_neg_of_add_eq_zero_right hc₁)
    have he₂ : y₂ = -δ / ell :=
      (eq_div_iff hell).2 (by simpa [mul_comm] using eq_neg_of_add_eq_zero_right hc₂)
    have he₃ : y₃ = -δ / ell :=
      (eq_div_iff hell).2 (by simpa [mul_comm] using eq_neg_of_add_eq_zero_right hc₃)
    rw [he₁, he₂, he₃]
    exact normalizedRows_constant_third_det_zero x₁ x₂ x₃ (-δ / ell)
  · have hpoly := quadratic_polynomial_identity_of_cubic_zero hnorm hb₃
    rcases quadratic_proportional_kappa_of_closed_endpoint hs1 hs3 hpoly with
      ⟨ell, hQ⟩
    have hQeval (x : ℂ) : quadraticEval b₀ b₁ b₂ x =
        ell * kappa (s : ℂ) x := by
      have h := congrArg (fun p : ℂ[X] ↦ p.eval x) hQ
      simpa using h
    have hcomp (x y : ℂ) (hk : kappa (s : ℂ) x ≠ 0)
        (hrel : δ * x * kappa (s : ℂ) x +
          cubicEval b₀ b₁ b₂ b₃ x * y = 0) :
        δ * x + ell * y = 0 := by
      rw [hb₃] at hrel
      simp only [cubicEval] at hrel
      rw [show b₀ + b₁ * x + b₂ * x ^ 2 =
          quadraticEval b₀ b₁ b₂ x by rfl, hQeval] at hrel
      have hfactor : kappa (s : ℂ) x * (δ * x + ell * y) = 0 := by
        linear_combination hrel
      exact (mul_eq_zero.mp hfactor).resolve_left hk
    have hc₁ := hcomp x₁ y₁ havoid₁ hrel₁
    have hc₂ := hcomp x₂ y₂ havoid₂ hrel₂
    have hc₃ := hcomp x₃ y₃ havoid₃ hrel₃
    have hell : ell ≠ 0 := by
      intro hz
      apply hδ
      have hzero : δ * x₁ = 0 := by simpa [hz] using hc₁
      rcases mul_eq_zero.mp hzero with h | h
      · exact h
      · exact False.elim (hx₁0 h)
    have he₁ : y₁ = (-δ / ell) * x₁ := by
      apply (mul_left_cancel₀ hell)
      field_simp [hell]
      linear_combination hc₁
    have he₂ : y₂ = (-δ / ell) * x₂ := by
      apply (mul_left_cancel₀ hell)
      field_simp [hell]
      linear_combination hc₂
    have he₃ : y₃ = (-δ / ell) * x₃ := by
      apply (mul_left_cancel₀ hell)
      field_simp [hell]
      linear_combination hc₃
    rw [he₁, he₂, he₃]
    exact normalizedRows_proportional_third_det_zero x₁ x₂ x₃ (-δ / ell)

/-- Complete infinite-fibre conclusion in the closed endpoint interval.  An
invertible fibre can only survive at `s = 1`, and then every specified member
has the opposite-pair row required by the block argument. -/
theorem closed_endpoint_infinite_fibre_forces_opposite_pair
    {G : Mat3} {s : ℝ}
    (hs1 : 1 ≤ s) (hs3 : s ≤ 3)
    (hS : G 1 0 = (s : ℂ))
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedRowGramFibre G)
    (hdet₀ : X₀.det ≠ 0)
    (hδ : gramDelta (G 2 0) (G 2 1) ≠ 0) :
    s = 1 ∧
      ((∃ z, Complex.normSq z = 1 ∧ rowTriple X₀ 1 = (1, z, -z)) ∨
       (∃ z, Complex.normSq z = 1 ∧ rowTriple X₀ 1 = (z, 1, -z)) ∨
       (∃ z, Complex.normSq z = 1 ∧ rowTriple X₀ 1 = (z, -z, 1))) := by
  let Z : Set ℂ := {z | kappa (s : ℂ) z = 0}
  have hsne : (s : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (lt_of_lt_of_le zero_lt_one hs1))
  have hkpoly : kappaPoly (s : ℂ) ≠ 0 := by
    intro hp
    have he := congrArg (fun p : ℂ[X] ↦ p.eval 0) hp
    have htwo : (2 : ℂ) ≠ 0 := by norm_num
    apply hsne
    exact (mul_eq_zero.mp (by simpa [eval_kappaPoly, kappa] using he)).resolve_left htwo
  have hZfinite : Z.Finite := by
    apply (Polynomial.finite_setOfPred_isRoot hkpoly).subset
    intro z hz
    change (kappaPoly (s : ℂ)).eval z = 0
    simpa [Z] using hz
  have hZunit : ∀ z ∈ Z, Complex.normSq z = 1 := by
    intro z hz
    exact kappa_root_normSq_one_of_one_le_three hs1 hs3 hz
  let Rows := (fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G
  have hhit : ∀ t ∈ Rows,
      t.1 ∈ Z ∨ t.2.1 ∈ Z ∨ t.2.2 ∈ Z := by
    intro t ht
    by_contra hnone
    push Not at hnone
    rcases ht with ⟨X, hX, rfl⟩
    have hnorm := clearedNormIdentity_of_infinite_second_rows hS hinf
    have hdata := normalized_fibre_fixed_data hX
    have hsum : fibreS (X 1 0) (X 1 1) (X 1 2) = (s : ℂ) :=
      hdata.1.trans hS
    have hrels := specialized_relations_all_coordinates
      (hX.1 1 0) (hX.1 1 1) (hX.1 1 2)
      (hX.1 2 0) (hX.1 2 1) (hX.1 2 2) hsum
    have hrel₁ := hrels (X 1 0, X 2 0) (by simp)
    have hrel₂ := hrels (X 1 1, X 2 1) (by simp)
    have hrel₃ := hrels (X 1 2, X 2 2) (by simp)
    have hsing := closed_endpoint_avoiding_row_det_zero hs1 hs3 hδ
      (by simpa [rowTriple, hS] using rowTriple_mem_phaseTriplesAtSum hX 1)
      (by simpa [hdata.2.1, hdata.2.2] using hrel₁)
      (by simpa [hdata.2.1, hdata.2.2] using hrel₂)
      (by simpa [hdata.2.1, hdata.2.2] using hrel₃)
      hnorm
      (by simpa [Z, rowTriple] using hnone.1)
      (by simpa [Z, rowTriple] using hnone.2.1)
      (by simpa [Z, rowTriple] using hnone.2.2)
    have hdetX : X.det ≠ 0 :=
      det_ne_zero_of_same_rowGram (hX₀.2.2.trans hX.2.2.symm) hdet₀
    apply hdetX
    rw [eq_normalizedRows_of_mem hX]
    exact hsing
  apply infinite_exceptional_fibre_forces_opposite_pair
    (s := s) (le_trans (by norm_num) hs1) (G := G) (Z := Z) hS hZfinite hZunit
      (fun z hz ↦ hz) hinf hhit hX₀

end

end Hadamard6
