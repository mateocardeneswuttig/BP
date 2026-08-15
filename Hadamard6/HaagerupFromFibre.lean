import Hadamard6.FactorAllocation
import Hadamard6.UnitSymmetric
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-!
# The cleared Haagerup equations for a normalized fibre
-/

namespace Hadamard6

def fibreS (x₁ x₂ x₃ : ℂ) : ℂ := x₁ + x₂ + x₃
def fibreT (y₁ y₂ y₃ : ℂ) : ℂ := y₁ + y₂ + y₃
def fibreR (x₁ x₂ x₃ y₁ y₂ y₃ : ℂ) : ℂ :=
  star x₁ * y₁ + star x₂ * y₂ + star x₃ * y₃

def gramDelta (T R : ℂ) : ℂ :=
  ((Complex.normSq R - Complex.normSq T : ℝ) : ℂ)

def specializedBeta0 (s : ℝ) (T R : ℂ) : ℂ :=
  eliminantBeta0 (s : ℂ) T (star T) (star R)

def specializedBeta1 (s : ℝ) (T R : ℂ) : ℂ :=
  eliminantBeta1 (s : ℂ) (s : ℂ) T (star T) R (star R)

def specializedBeta2 (s : ℝ) (T R : ℂ) : ℂ :=
  eliminantBeta2 (s : ℂ) (s : ℂ) T (star T) R (star R)

def specializedBeta3 (s : ℝ) (T R : ℂ) : ℂ :=
  eliminantBeta3 (s : ℂ) (star T) R (star R)

theorem specialized_eliminant_relation
    {s : ℝ} {T R x y : ℂ}
    (hf : clearedHaagerupF (s : ℂ) (s : ℂ) T (star T) R (star R) x y = 0)
    (hg : clearedHaagerupG (s : ℂ) (s : ℂ) T (star T) R (star R) x y = 0) :
    gramDelta T R * x * kappa (s : ℂ) x +
      cubicEval (specializedBeta0 s T R) (specializedBeta1 s T R)
        (specializedBeta2 s T R) (specializedBeta3 s T R) x * y = 0 := by
  have he := eliminant_eq_zero hf hg
  rw [eliminantA_factorization, eliminantB_coefficients] at he
  have hstars : star (s : ℂ) = (s : ℂ) := by simp
  have hdelta : R * star R - T * star T = gramDelta T R := by
    simp [gramDelta, Complex.normSq_eq_conj_mul_self,
      mul_comm]
  have hkappa :
      kappa (s : ℂ) x =
        2 * (s : ℂ) * x ^ 2 - ((s : ℂ) * (s : ℂ) + 3) * x +
          2 * (s : ℂ) := by
    simp [kappa, hstars, Complex.normSq_apply]
  rw [hdelta] at he
  rw [hkappa]
  simpa [specializedBeta0, specializedBeta1, specializedBeta2,
    specializedBeta3, cubicEval, mul_comm, mul_left_comm, mul_assoc] using he

theorem clearedHaagerup_first_coordinate
    {x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1) :
    let S := fibreS x₁ x₂ x₃
    let T := fibreT y₁ y₂ y₃
    let R := fibreR x₁ x₂ x₃ y₁ y₂ y₃
    clearedHaagerupF S (star S) T (star T) R (star R) x₁ y₁ = 0 ∧
    clearedHaagerupG S (star S) T (star T) R (star R) x₁ y₁ = 0 := by
  have hx₁0 := ne_zero_of_normSq_eq_one hx₁
  have hx₂0 := ne_zero_of_normSq_eq_one hx₂
  have hx₃0 := ne_zero_of_normSq_eq_one hx₃
  have hy₁0 := ne_zero_of_normSq_eq_one hy₁
  have hy₂0 := ne_zero_of_normSq_eq_one hy₂
  have hy₃0 := ne_zero_of_normSq_eq_one hy₃
  have hsx₁ := one_div_eq_star_of_normSq_eq_one hx₁
  have hsx₂ := one_div_eq_star_of_normSq_eq_one hx₂
  have hsx₃ := one_div_eq_star_of_normSq_eq_one hx₃
  have hsy₁ := one_div_eq_star_of_normSq_eq_one hy₁
  have hsy₂ := one_div_eq_star_of_normSq_eq_one hy₂
  have hsy₃ := one_div_eq_star_of_normSq_eq_one hy₃
  dsimp only [fibreS, fibreT, fibreR]
  simp only [star_add, star_mul, star_star]
  rw [← hsx₁, ← hsx₂, ← hsx₃, ← hsy₁, ← hsy₂, ← hsy₃]
  constructor <;>
    simp only [clearedHaagerupF, clearedHaagerupG, haagerupF0,
      haagerupF1, haagerupF2, haagerupG0, haagerupG1, haagerupG2] <;>
    field_simp [hx₁0, hx₂0, hx₃0, hy₁0, hy₂0, hy₃0] <;>
    ring

theorem clearedHaagerup_all_coordinates
    {x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1) :
    let S := fibreS x₁ x₂ x₃
    let T := fibreT y₁ y₂ y₃
    let R := fibreR x₁ x₂ x₃ y₁ y₂ y₃
    ∀ p ∈ ({(x₁, y₁), (x₂, y₂), (x₃, y₃)} : Set (ℂ × ℂ)),
      clearedHaagerupF S (star S) T (star T) R (star R) p.1 p.2 = 0 ∧
      clearedHaagerupG S (star S) T (star T) R (star R) p.1 p.2 = 0 := by
  dsimp only
  intro p hxy
  rcases p with ⟨x, y⟩
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hxy
  rcases hxy with hxy | hxy | hxy
  · rcases Prod.mk.inj hxy with ⟨rfl, rfl⟩
    exact clearedHaagerup_first_coordinate hx₁ hx₂ hx₃ hy₁ hy₂ hy₃
  · rcases Prod.mk.inj hxy with ⟨rfl, rfl⟩
    simpa [fibreS, fibreT, fibreR, add_comm, add_left_comm, add_assoc] using
      (clearedHaagerup_first_coordinate hx₂ hx₁ hx₃ hy₂ hy₁ hy₃)
  · rcases Prod.mk.inj hxy with ⟨rfl, rfl⟩
    simpa [fibreS, fibreT, fibreR, add_comm, add_left_comm, add_assoc] using
      (clearedHaagerup_first_coordinate hx₃ hx₁ hx₂ hy₃ hy₁ hy₂)

theorem specialized_relations_all_coordinates
    {s : ℝ} {x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hx₁ : Complex.normSq x₁ = 1)
    (hx₂ : Complex.normSq x₂ = 1)
    (hx₃ : Complex.normSq x₃ = 1)
    (hy₁ : Complex.normSq y₁ = 1)
    (hy₂ : Complex.normSq y₂ = 1)
    (hy₃ : Complex.normSq y₃ = 1)
    (hsum : fibreS x₁ x₂ x₃ = (s : ℂ)) :
    let T := fibreT y₁ y₂ y₃
    let R := fibreR x₁ x₂ x₃ y₁ y₂ y₃
    ∀ p ∈ ({(x₁, y₁), (x₂, y₂), (x₃, y₃)} : Set (ℂ × ℂ)),
      gramDelta T R * p.1 * kappa (s : ℂ) p.1 +
        cubicEval (specializedBeta0 s T R) (specializedBeta1 s T R)
          (specializedBeta2 s T R) (specializedBeta3 s T R) p.1 * p.2 = 0 := by
  dsimp only
  intro p hp
  have hfg := clearedHaagerup_all_coordinates hx₁ hx₂ hx₃ hy₁ hy₂ hy₃ p hp
  rw [hsum] at hfg
  have hstars : star (s : ℂ) = (s : ℂ) := by simp
  rw [hstars] at hfg
  exact specialized_eliminant_relation hfg.1 hfg.2

end Hadamard6
