import Hadamard6.FactorAllocation
import Hadamard6.UnitSymmetric
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-!
# From infinitely many unit companions to the cleared norm identity
-/

namespace Hadamard6

open Polynomial

theorem cubicSharpEval_on_unit
    {x : ℂ} (hx : Complex.normSq x = 1) (b₀ b₁ b₂ b₃ : ℂ) :
    cubicSharpEval b₀ b₁ b₂ b₃ x =
      x ^ 3 * star (cubicEval b₀ b₁ b₂ b₃ x) := by
  have hx0 := ne_zero_of_normSq_eq_one hx
  have hsx := one_div_eq_star_of_normSq_eq_one hx
  simp only [cubicSharpEval, cubicEval, star_add, star_mul, star_pow]
  rw [← hsx]
  field_simp [hx0]
  ring

theorem kappa_star_on_unit_real
    {s : ℝ} {x : ℂ} (hx : Complex.normSq x = 1) :
    x ^ 2 * star (kappa (s : ℂ) x) = kappa (s : ℂ) x := by
  have hx0 := ne_zero_of_normSq_eq_one hx
  have hsx := one_div_eq_star_of_normSq_eq_one hx
  have hstars : star (s : ℂ) = (s : ℂ) := by simp [Complex.star_def]
  have hnorms : Complex.normSq (s : ℂ) = s ^ 2 := by
    simp [Complex.normSq_apply]
    ring
  have hstar2 : star (2 : ℂ) = 2 := by norm_num [Complex.star_def]
  have hstar3 : star (3 : ℂ) = 3 := by norm_num [Complex.star_def]
  have hstarSq : star ((s ^ 2 : ℝ) : ℂ) = ((s ^ 2 : ℝ) : ℂ) := by
    simp [Complex.star_def]
  simp only [kappa, star_add, star_sub, star_mul, star_pow, map_ofNat,
    hstars, hnorms, hstar2, hstar3, hstarSq]
  rw [← hsx]
  field_simp [hx0]
  ring

theorem cleared_norm_point_of_unit_relation
    {s : ℝ} {δ b₀ b₁ b₂ b₃ x y : ℂ}
    (hx : Complex.normSq x = 1) (hy : Complex.normSq y = 1)
    (hrel :
      δ * x * kappa (s : ℂ) x + cubicEval b₀ b₁ b₂ b₃ x * y = 0) :
    cubicEval b₀ b₁ b₂ b₃ x * cubicSharpEval b₀ b₁ b₂ b₃ x =
      δ * star δ * x * kappa (s : ℂ) x ^ 2 := by
  let A := δ * x * kappa (s : ℂ) x
  let B := cubicEval b₀ b₁ b₂ b₃ x
  have hyu : y * star y = 1 := by
    have hunit : star y * y = 1 := by
      simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
        congrArg (fun q : ℝ ↦ (q : ℂ)) hy
    simpa [mul_comm] using hunit
  have hAB : A = -(B * y) := by
    dsimp [A, B]
    exact eq_neg_of_add_eq_zero_left hrel
  have hnorm : A * star A = B * star B := by
    rw [hAB, star_neg, star_mul]
    calc
      -(B * y) * -(star y * star B) =
          B * (y * star y) * star B := by ring
      _ = B * star B := by rw [hyu]; ring
  have hBsharp := cubicSharpEval_on_unit hx b₀ b₁ b₂ b₃
  have hkstar := kappa_star_on_unit_real (s := s) hx
  rw [hBsharp]
  dsimp [A, B] at hnorm
  have hx0 := ne_zero_of_normSq_eq_one hx
  have hstarx := one_div_eq_star_of_normSq_eq_one hx
  change 1 / x = (starRingEnd ℂ) x at hstarx
  rw [map_mul, map_mul] at hnorm
  rw [← hstarx] at hnorm
  have hscaled := congrArg (fun z : ℂ ↦ x ^ 3 * z) hnorm
  field_simp [hx0] at hscaled
  change x ^ 2 * (starRingEnd ℂ) (kappa (s : ℂ) x) =
    kappa (s : ℂ) x at hkstar
  calc
    cubicEval b₀ b₁ b₂ b₃ x *
        (x ^ 3 * star (cubicEval b₀ b₁ b₂ b₃ x)) =
      x ^ 3 * (cubicEval b₀ b₁ b₂ b₃ x *
        (starRingEnd ℂ) (cubicEval b₀ b₁ b₂ b₃ x)) := by
          change cubicEval b₀ b₁ b₂ b₃ x *
              (x ^ 3 * (starRingEnd ℂ) (cubicEval b₀ b₁ b₂ b₃ x)) = _
          ring
    _ = x ^ 3 * (δ * kappa (s : ℂ) x * (starRingEnd ℂ) δ *
        (starRingEnd ℂ) (kappa (s : ℂ) x)) := by rw [← hscaled]
    _ = δ * star δ * x * kappa (s : ℂ) x ^ 2 := by
      rw [show (starRingEnd ℂ) δ = star δ by rfl]
      calc
        _ = δ * star δ * x * kappa (s : ℂ) x *
            (x ^ 2 * (starRingEnd ℂ) (kappa (s : ℂ) x)) := by ring
        _ = _ := by rw [hkstar]; ring

/-- Infinitely many unit-circle points satisfying the companion relation
force the global polynomial identity used by factor allocation. -/
theorem clearedNormIdentity_of_infinite_unit_relations
    {s : ℝ} {δ b₀ b₁ b₂ b₃ : ℂ} {Xset : Set ℂ}
    (hX : Xset.Infinite)
    (hrel : ∀ x ∈ Xset,
      Complex.normSq x = 1 ∧
      ∃ y, Complex.normSq y = 1 ∧
        δ * x * kappa (s : ℂ) x +
          cubicEval b₀ b₁ b₂ b₃ x * y = 0) :
    ClearedNormIdentity (s : ℂ) δ b₀ b₁ b₂ b₃ := by
  let P := cubicPoly b₀ b₁ b₂ b₃ * cubicSharpPoly b₀ b₁ b₂ b₃
  let Q := C (δ * star δ) * X * kappaPoly (s : ℂ) ^ 2
  have heqset : Xset ⊆ {x | P.eval x = Q.eval x} := by
    intro x hxmem
    rcases hrel x hxmem with ⟨hx, y, hy, hxy⟩
    simpa [P, Q] using
      (cleared_norm_point_of_unit_relation hx hy hxy)
  have hinf : ({x | P.eval x = Q.eval x} : Set ℂ).Infinite :=
    hX.mono heqset
  have hpq : P = Q := P.eq_of_infinite_eval_eq Q hinf
  intro x
  have he := congrArg (fun R : ℂ[X] ↦ R.eval x) hpq
  simpa [P, Q] using he

end Hadamard6
