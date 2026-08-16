import Hadamard6.QuotientReal
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Tactic.Ring

/-!
# The first factor-allocation reduction

This file isolates the elementary polynomial step following the quotient
modulus identity.  We use coefficient lists only through their evaluation
functions, which keeps the certificate transparent.
-/

namespace Hadamard6

open Polynomial

noncomputable section

def cubicEval (b₀ b₁ b₂ b₃ x : ℂ) : ℂ :=
  b₀ + b₁ * x + b₂ * x ^ 2 + b₃ * x ^ 3

/-- The degree-three reversed-conjugate polynomial. -/
def cubicSharpEval (b₀ b₁ b₂ b₃ x : ℂ) : ℂ :=
  star b₃ + star b₂ * x + star b₁ * x ^ 2 + star b₀ * x ^ 3

def quadraticEval (q₀ q₁ q₂ x : ℂ) : ℂ :=
  q₀ + q₁ * x + q₂ * x ^ 2

/-- The degree-two reversed-conjugate polynomial `Q#`. -/
def quadraticSharpEval (q₀ q₁ q₂ x : ℂ) : ℂ :=
  star q₂ + star q₁ * x + star q₀ * x ^ 2

def cubicPoly (b₀ b₁ b₂ b₃ : ℂ) : ℂ[X] :=
  C b₀ + C b₁ * X + C b₂ * X ^ 2 + C b₃ * X ^ 3

def cubicSharpPoly (b₀ b₁ b₂ b₃ : ℂ) : ℂ[X] :=
  C (star b₃) + C (star b₂) * X + C (star b₁) * X ^ 2 +
    C (star b₀) * X ^ 3

def quadraticPoly (q₀ q₁ q₂ : ℂ) : ℂ[X] :=
  C q₀ + C q₁ * X + C q₂ * X ^ 2

def quadraticSharpPoly (q₀ q₁ q₂ : ℂ) : ℂ[X] :=
  C (star q₂) + C (star q₁) * X + C (star q₀) * X ^ 2

def kappaPoly (s : ℂ) : ℂ[X] :=
  C (2 * star s) * X ^ 2 -
    C (((Complex.normSq s + 3 : ℝ) : ℂ)) * X + C (2 * s)

theorem cubicPoly_eq_zero_iff (b₀ b₁ b₂ b₃ : ℂ) :
    cubicPoly b₀ b₁ b₂ b₃ = 0 ↔
      b₀ = 0 ∧ b₁ = 0 ∧ b₂ = 0 ∧ b₃ = 0 := by
  constructor
  · intro h
    have h₀ := congrArg (fun p : ℂ[X] ↦ p.coeff 0) h
    have h₁ := congrArg (fun p : ℂ[X] ↦ p.coeff 1) h
    have h₂ := congrArg (fun p : ℂ[X] ↦ p.coeff 2) h
    have h₃ := congrArg (fun p : ℂ[X] ↦ p.coeff 3) h
    exact ⟨by simpa [cubicPoly] using h₀,
      by simpa [cubicPoly] using h₁,
      by simpa [cubicPoly] using h₂,
      by simpa [cubicPoly] using h₃⟩
  · rintro ⟨rfl, rfl, rfl, rfl⟩
    simp [cubicPoly]

@[simp] theorem eval_cubicPoly (b₀ b₁ b₂ b₃ x : ℂ) :
    (cubicPoly b₀ b₁ b₂ b₃).eval x = cubicEval b₀ b₁ b₂ b₃ x := by
  simp [cubicPoly, cubicEval]

@[simp] theorem eval_cubicSharpPoly (b₀ b₁ b₂ b₃ x : ℂ) :
    (cubicSharpPoly b₀ b₁ b₂ b₃).eval x =
      cubicSharpEval b₀ b₁ b₂ b₃ x := by
  simp [cubicSharpPoly, cubicSharpEval]

@[simp] theorem eval_quadraticPoly (q₀ q₁ q₂ x : ℂ) :
    (quadraticPoly q₀ q₁ q₂).eval x = quadraticEval q₀ q₁ q₂ x := by
  simp [quadraticPoly, quadraticEval]

@[simp] theorem eval_quadraticSharpPoly (q₀ q₁ q₂ x : ℂ) :
    (quadraticSharpPoly q₀ q₁ q₂).eval x =
      quadraticSharpEval q₀ q₁ q₂ x := by
  simp [quadraticSharpPoly, quadraticSharpEval]

@[simp] theorem eval_kappaPoly (s x : ℂ) :
    (kappaPoly s).eval x = kappa s x := by
  simp only [kappaPoly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X]
  simp [kappa]

theorem cubicPoly_zero_constant (b₁ b₂ b₃ : ℂ) :
    cubicPoly 0 b₁ b₂ b₃ = X * quadraticPoly b₁ b₂ b₃ := by
  simp only [cubicPoly, quadraticPoly, map_zero, zero_add]
  ring

theorem cubicSharpPoly_zero_constant (b₁ b₂ b₃ : ℂ) :
    cubicSharpPoly 0 b₁ b₂ b₃ = quadraticSharpPoly b₁ b₂ b₃ := by
  simp [cubicSharpPoly, quadraticSharpPoly]

theorem cubicPoly_zero_cubic (b₀ b₁ b₂ : ℂ) :
    cubicPoly b₀ b₁ b₂ 0 = quadraticPoly b₀ b₁ b₂ := by
  simp [cubicPoly, quadraticPoly]

theorem cubicSharpPoly_zero_cubic (b₀ b₁ b₂ : ℂ) :
    cubicSharpPoly b₀ b₁ b₂ 0 = X * quadraticSharpPoly b₀ b₁ b₂ := by
  simp only [cubicSharpPoly, quadraticSharpPoly, star_zero, map_zero, zero_add]
  ring

/-- The polynomial identity obtained from `|A| = |B|` after clearing the
unit-circle conjugates by a factor `x^3`. -/
def ClearedNormIdentity
    (s δ b₀ b₁ b₂ b₃ : ℂ) : Prop :=
  ∀ x,
    cubicEval b₀ b₁ b₂ b₃ x * cubicSharpEval b₀ b₁ b₂ b₃ x =
      δ * star δ * x * kappa s x ^ 2

theorem clearedNormIdentity_polynomial
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃) :
    cubicPoly b₀ b₁ b₂ b₃ * cubicSharpPoly b₀ b₁ b₂ b₃ =
      C (δ * star δ) * X * kappaPoly s ^ 2 := by
  apply Polynomial.funext
  intro x
  simpa [ClearedNormIdentity] using h x

theorem quadratic_polynomial_identity_of_constant_zero
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃)
    (hb₀ : b₀ = 0) :
    quadraticPoly b₁ b₂ b₃ * quadraticSharpPoly b₁ b₂ b₃ =
      C (δ * star δ) * kappaPoly s ^ 2 := by
  have hp := clearedNormIdentity_polynomial h
  rw [hb₀] at hp
  rw [cubicPoly_zero_constant, cubicSharpPoly_zero_constant] at hp
  have hX :
      X * (quadraticPoly b₁ b₂ b₃ * quadraticSharpPoly b₁ b₂ b₃) =
        X * (C (δ * star δ) * kappaPoly s ^ 2) := by
    calc
      _ = (X * quadraticPoly b₁ b₂ b₃) *
          quadraticSharpPoly b₁ b₂ b₃ := by ring
      _ = C (δ * star δ) * X * kappaPoly s ^ 2 := hp
      _ = _ := by ring
  exact mul_left_cancel₀ X_ne_zero hX

theorem quadratic_polynomial_identity_of_cubic_zero
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃)
    (hb₃ : b₃ = 0) :
    quadraticPoly b₀ b₁ b₂ * quadraticSharpPoly b₀ b₁ b₂ =
      C (δ * star δ) * kappaPoly s ^ 2 := by
  have hp := clearedNormIdentity_polynomial h
  rw [hb₃] at hp
  rw [cubicPoly_zero_cubic, cubicSharpPoly_zero_cubic] at hp
  have hX :
      X * (quadraticPoly b₀ b₁ b₂ * quadraticSharpPoly b₀ b₁ b₂) =
        X * (C (δ * star δ) * kappaPoly s ^ 2) := by
    calc
      _ = quadraticPoly b₀ b₁ b₂ *
          (X * quadraticSharpPoly b₀ b₁ b₂) := by ring
      _ = C (δ * star δ) * X * kappaPoly s ^ 2 := hp
      _ = _ := by ring
  exact mul_left_cancel₀ X_ne_zero hX

theorem quadraticSharpEval_real_reciprocal
    (q₀ q₁ q₂ : ℂ) {r : ℝ} (hr : r ≠ 0) :
    quadraticSharpEval q₀ q₁ q₂ (r : ℂ) =
      (r : ℂ) ^ 2 *
        star (quadraticEval q₀ q₁ q₂ ((r⁻¹ : ℝ) : ℂ)) := by
  simp only [quadraticSharpEval, quadraticEval, star_add, star_mul, star_pow]
  have histar : star ((r⁻¹ : ℝ) : ℂ) = ((r⁻¹ : ℝ) : ℂ) := by
    simp
  have hri : (((r⁻¹ : ℝ) : ℂ)) = (r : ℂ)⁻¹ := by
    norm_cast
  have hrC : (r : ℂ) ≠ 0 := by exact_mod_cast hr
  rw [histar]
  rw [hri]
  field_simp [hrC]
  ring

theorem quadraticEval_eq_leading_mul_two_roots
    {q₀ q₁ q₂ a b : ℂ} (hab : a ≠ b)
    (ha : quadraticEval q₀ q₁ q₂ a = 0)
    (hb : quadraticEval q₀ q₁ q₂ b = 0) (x : ℂ) :
    quadraticEval q₀ q₁ q₂ x = q₂ * (x - a) * (x - b) := by
  have hfactor : (a - b) * (q₁ + q₂ * (a + b)) = 0 := by
    calc
      _ = quadraticEval q₀ q₁ q₂ a - quadraticEval q₀ q₁ q₂ b := by
        simp only [quadraticEval]
        ring
      _ = 0 := by rw [ha, hb]; ring
  have hab' : a - b ≠ 0 := sub_ne_zero.mpr hab
  have hlinear : q₁ + q₂ * (a + b) = 0 :=
    (mul_eq_zero.mp hfactor).resolve_left hab'
  have hconstant : q₀ - q₂ * a * b = 0 := by
    calc
      _ = quadraticEval q₀ q₁ q₂ a -
          a * (q₁ + q₂ * (a + b)) := by
            simp only [quadraticEval]
            ring
      _ = 0 := by rw [ha, hlinear]; ring
  simp only [quadraticEval]
  linear_combination hconstant + x * hlinear

theorem quadraticEval_eq_leading_mul_double_root
    {q₀ q₁ q₂ a : ℂ}
    (ha : quadraticEval q₀ q₁ q₂ a = 0)
    (hder : q₁ + 2 * q₂ * a = 0) (x : ℂ) :
    quadraticEval q₀ q₁ q₂ x = q₂ * (x - a) ^ 2 := by
  have hconstant : q₀ - q₂ * a ^ 2 = 0 := by
    calc
      _ = quadraticEval q₀ q₁ q₂ a - a * (q₁ + 2 * q₂ * a) := by
        simp only [quadraticEval]
        ring
      _ = 0 := by rw [ha, hder]; ring
  simp only [quadraticEval]
  linear_combination hconstant + x * hder

theorem quadraticPoly_eq_leading_mul_two_roots
    {q₀ q₁ q₂ a b : ℂ} (hab : a ≠ b)
    (ha : quadraticEval q₀ q₁ q₂ a = 0)
    (hb : quadraticEval q₀ q₁ q₂ b = 0) :
    quadraticPoly q₀ q₁ q₂ = C q₂ * (X - C a) * (X - C b) := by
  apply Polynomial.funext
  intro x
  simpa using quadraticEval_eq_leading_mul_two_roots hab ha hb x

theorem quadraticPoly_eq_leading_mul_double_root
    {q₀ q₁ q₂ a : ℂ}
    (ha : quadraticEval q₀ q₁ q₂ a = 0)
    (hder : q₁ + 2 * q₂ * a = 0) :
    quadraticPoly q₀ q₁ q₂ = C q₂ * (X - C a) ^ 2 := by
  apply Polynomial.funext
  intro x
  simpa using quadraticEval_eq_leading_mul_double_root ha hder x

@[simp] theorem eval_derivative_quadraticPoly
    (q₀ q₁ q₂ x : ℂ) :
    (derivative (quadraticPoly q₀ q₁ q₂)).eval x = q₁ + 2 * q₂ * x := by
  simp [quadraticPoly]
  ring

/-- The unique-factor allocation step, proved by evaluating and
differentiating at the two reciprocal roots. -/
theorem quadratic_factor_allocation_at_reciprocal_roots
    {s r : ℝ} {δ q₀ q₁ q₂ : ℂ}
    (hs : s ≠ 0) (hr : r ≠ 0) (hrr : r ≠ r⁻¹)
    (hroot : realKappa s r = 0)
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly (s : ℂ) ^ 2) :
    quadraticPoly q₀ q₁ q₂ =
        C q₂ * (X - C (r : ℂ)) ^ 2 ∨
    quadraticPoly q₀ q₁ q₂ =
        C q₂ * (X - C (r : ℂ)) * (X - C ((r⁻¹ : ℝ) : ℂ)) ∨
    quadraticPoly q₀ q₁ q₂ =
        C q₂ * (X - C ((r⁻¹ : ℝ) : ℂ)) ^ 2 := by
  let a : ℂ := (r : ℂ)
  let b : ℂ := ((r⁻¹ : ℝ) : ℂ)
  let Q := quadraticPoly q₀ q₁ q₂
  let Qs := quadraticSharpPoly q₀ q₁ q₂
  let K := kappaPoly (s : ℂ)
  have hab : a ≠ b := by
    dsimp [a, b]
    exact_mod_cast hrr
  have ha0 : a ≠ 0 := by
    dsimp [a]
    exact_mod_cast hr
  have hb0 : b ≠ 0 := by
    dsimp [b]
    exact_mod_cast (inv_ne_zero hr)
  have hkA : K.eval a = 0 := by
    rw [show K.eval a = kappa (s : ℂ) a by simp [K]]
    rw [kappa_factor_at_real_root hs hr hroot]
    simp [a]
  have hkB : K.eval b = 0 := by
    rw [show K.eval b = kappa (s : ℂ) b by simp [K]]
    rw [kappa_factor_at_real_root hs hr hroot]
    simp [b]
  have hprodA : Q.eval a * Qs.eval a = 0 := by
    have he := congrArg (fun P : ℂ[X] ↦ P.eval a) hpoly
    simpa [Q, Qs, K, hkA] using he
  have hsharpA : Qs.eval a = a ^ 2 * star (Q.eval b) := by
    simpa [Q, Qs, a, b] using
      (quadraticSharpEval_real_reciprocal q₀ q₁ q₂ hr)
  have hrootChoice : Q.eval a = 0 ∨ Q.eval b = 0 := by
    rcases mul_eq_zero.mp hprodA with hQa | hQsa
    · exact Or.inl hQa
    · right
      rw [hsharpA] at hQsa
      rcases mul_eq_zero.mp hQsa with ha2 | hstar
      · exact False.elim ((pow_ne_zero 2 ha0) ha2)
      · exact star_eq_zero.mp hstar
  have hderivative_at_root
      (c : ℂ) (hk : K.eval c = 0) (hQc : Q.eval c = 0)
      (hQsc : Qs.eval c ≠ 0) :
      q₁ + 2 * q₂ * c = 0 := by
    have hd := congrArg derivative hpoly
    have he := congrArg (fun P : ℂ[X] ↦ P.eval c) hd
    have hright :
        (derivative (C (δ * star δ) * K ^ 2)).eval c = 0 := by
      simp [derivative_mul, derivative_pow, hk]
    rw [hright] at he
    have hmul :
        (derivative Q).eval c * Qs.eval c = 0 := by
      simpa [Q, Qs, K, derivative_mul, hQc] using he
    have hdQ : (derivative Q).eval c = 0 :=
      (mul_eq_zero.mp hmul).resolve_right hQsc
    simpa [Q] using hdQ
  by_cases hQa : Q.eval a = 0
  · by_cases hQb : Q.eval b = 0
    · right; left
      simpa [Q, a, b] using
        (quadraticPoly_eq_leading_mul_two_roots hab
          (by simpa [Q] using hQa) (by simpa [Q] using hQb))
    · left
      have hQsa : Qs.eval a ≠ 0 := by
        rw [hsharpA]
        exact mul_ne_zero (pow_ne_zero 2 ha0)
          (star_ne_zero.mpr hQb)
      have hder := hderivative_at_root a hkA hQa hQsa
      simpa [Q, a] using
        (quadraticPoly_eq_leading_mul_double_root
          (by simpa [Q] using hQa) hder)
  · right; right
    have hQb : Q.eval b = 0 := hrootChoice.resolve_left hQa
    have hsharpB : Qs.eval b = b ^ 2 * star (Q.eval a) := by
      have hrinv : r⁻¹ ≠ 0 := inv_ne_zero hr
      simpa [Q, Qs, a, b] using
        (quadraticSharpEval_real_reciprocal q₀ q₁ q₂ hrinv)
    have hQsb : Qs.eval b ≠ 0 := by
      rw [hsharpB]
      exact mul_ne_zero (pow_ne_zero 2 hb0)
        (star_ne_zero.mpr hQa)
    have hder := hderivative_at_root b hkB hQb hQsb
    simpa [Q, b] using
      (quadraticPoly_eq_leading_mul_double_root
        (by simpa [Q] using hQb) hder)

def QuadraticAllocatedAt (q₀ q₁ q₂ : ℂ) (r : ℝ) : Prop :=
  quadraticPoly q₀ q₁ q₂ = C q₂ * (X - C (r : ℂ)) ^ 2 ∨
  quadraticPoly q₀ q₁ q₂ =
    C q₂ * (X - C (r : ℂ)) * (X - C ((r⁻¹ : ℝ) : ℂ)) ∨
  quadraticPoly q₀ q₁ q₂ =
    C q₂ * (X - C ((r⁻¹ : ℝ) : ℂ)) ^ 2

theorem quadratic_leading_ne_zero_of_identity
    {s : ℝ} {δ q₀ q₁ q₂ : ℂ}
    (hs : s ≠ 0) (hδ : δ ≠ 0)
    (hpoly :
      quadraticPoly q₀ q₁ q₂ * quadraticSharpPoly q₀ q₁ q₂ =
        C (δ * star δ) * kappaPoly (s : ℂ) ^ 2) :
    q₂ ≠ 0 := by
  intro hq₂
  have he := congrArg (fun P : ℂ[X] ↦ P.eval 0) hpoly
  have he' : δ = 0 ∨ s = 0 := by
    simpa [hq₂, quadraticPoly, quadraticSharpPoly, kappaPoly] using he
  rcases he' with he | he
  · exact hδ he
  · exact hs he

/-- The constant coefficient of the cleared identity vanishes.  This is the
third Fourier-coefficient comparison in the paper. -/
theorem endpoint_coefficient_zero
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃) :
    b₀ * star b₃ = 0 := by
  have h0 := h 0
  simpa [cubicEval, cubicSharpEval] using h0

/-- Hence the cubic has either zero constant term or zero cubic term. -/
theorem quotient_degree_drop
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃) :
    b₀ = 0 ∨ b₃ = 0 := by
  rcases mul_eq_zero.mp (endpoint_coefficient_zero h) with h₀ | h₃
  · exact Or.inl h₀
  · exact Or.inr (star_eq_zero.mp h₃)

/-- The complete factor-allocation output directly from the original cleared
norm identity in the `0<s<1` branch. -/
theorem quotient_factor_allocation
    {s r : ℝ} {δ b₀ b₁ b₂ b₃ : ℂ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (hroot : realKappa s r = 0)
    (h : ClearedNormIdentity (s : ℂ) δ b₀ b₁ b₂ b₃) :
    (b₀ = 0 ∧ QuadraticAllocatedAt b₁ b₂ b₃ r) ∨
    (b₃ = 0 ∧ QuadraticAllocatedAt b₀ b₁ b₂ r) := by
  have hs : s ≠ 0 := ne_of_gt hs0
  have hr : r ≠ 0 := ne_of_gt hr0
  have hrr := realKappa_root_ne_reciprocal hs0 hs1 hr0 hroot
  rcases quotient_degree_drop h with hb₀ | hb₃
  · left
    refine ⟨hb₀, ?_⟩
    exact quadratic_factor_allocation_at_reciprocal_roots hs hr hrr hroot
      (quadratic_polynomial_identity_of_constant_zero h hb₀)
  · right
    refine ⟨hb₃, ?_⟩
    exact quadratic_factor_allocation_at_reciprocal_roots hs hr hrr hroot
      (quadratic_polynomial_identity_of_cubic_zero h hb₃)

/-- In the `B=xQ` case, cancellation gives the quadratic factor identity at
every nonzero point. -/
theorem quadratic_norm_identity_of_constant_zero
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃)
    (hb₀ : b₀ = 0) {x : ℂ} (hx : x ≠ 0) :
    quadraticEval b₁ b₂ b₃ x * quadraticSharpEval b₁ b₂ b₃ x =
      δ * star δ * kappa s x ^ 2 := by
  have he := h x
  rw [hb₀] at he
  simp only [cubicEval, cubicSharpEval, zero_add, star_zero,
    zero_mul, add_zero] at he
  have hfactor :
      x * (quadraticEval b₁ b₂ b₃ x *
        quadraticSharpEval b₁ b₂ b₃ x) =
      x * (δ * star δ * kappa s x ^ 2) := by
    calc
      _ = (b₁ * x + b₂ * x ^ 2 + b₃ * x ^ 3) *
          (star b₃ + star b₂ * x + star b₁ * x ^ 2) := by
            simp only [quadraticEval, quadraticSharpEval]
            ring
      _ = δ * star δ * x * kappa s x ^ 2 := he
      _ = _ := by ring
  exact mul_left_cancel₀ hx hfactor

/-- In the `B=Q` case, the reversed cubic contributes the cancellable
factor `x`. -/
theorem quadratic_norm_identity_of_cubic_zero
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃)
    (hb₃ : b₃ = 0) {x : ℂ} (hx : x ≠ 0) :
    quadraticEval b₀ b₁ b₂ x * quadraticSharpEval b₀ b₁ b₂ x =
      δ * star δ * kappa s x ^ 2 := by
  have he := h x
  rw [hb₃] at he
  simp only [cubicEval, cubicSharpEval,
    star_zero, zero_add] at he
  have hfactor :
      x * (quadraticEval b₀ b₁ b₂ x *
        quadraticSharpEval b₀ b₁ b₂ x) =
      x * (δ * star δ * kappa s x ^ 2) := by
    calc
      _ = (b₀ + b₁ * x + b₂ * x ^ 2 + 0 * x ^ 3) *
          (star b₂ * x + star b₁ * x ^ 2 + star b₀ * x ^ 3) := by
            simp only [quadraticEval, quadraticSharpEval]
            ring
      _ = δ * star δ * x * kappa s x ^ 2 := he
      _ = _ := by ring
  exact mul_left_cancel₀ hx hfactor

/-- The exact dichotomy needed before unique factor allocation. -/
theorem quotient_quadratic_reduction
    {s δ b₀ b₁ b₂ b₃ : ℂ}
    (h : ClearedNormIdentity s δ b₀ b₁ b₂ b₃) :
    (b₀ = 0 ∧ ∀ x, x ≠ 0 →
      quadraticEval b₁ b₂ b₃ x * quadraticSharpEval b₁ b₂ b₃ x =
        δ * star δ * kappa s x ^ 2) ∨
    (b₃ = 0 ∧ ∀ x, x ≠ 0 →
      quadraticEval b₀ b₁ b₂ x * quadraticSharpEval b₀ b₁ b₂ x =
        δ * star δ * kappa s x ^ 2) := by
  rcases quotient_degree_drop h with hb₀ | hb₃
  · exact Or.inl ⟨hb₀, fun _ hx ↦
      quadratic_norm_identity_of_constant_zero h hb₀ hx⟩
  · exact Or.inr ⟨hb₃, fun _ hx ↦
      quadratic_norm_identity_of_cubic_zero h hb₃ hx⟩

end

end Hadamard6
