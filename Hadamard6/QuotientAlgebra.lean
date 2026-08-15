import Hadamard6.ExceptionalFibre
import Mathlib.Tactic.Ring

/-!
# Algebraic certificates for the quotient branch

The two cleared Haagerup equations are quadratics in `y`.  This file gives
their coefficients explicitly and checks, by normalization in the kernel,
the elimination identity used in the paper.  Conjugate parameters are kept
as independent variables here; the unit-circle substitutions are imposed in
later lemmas.
-/

namespace Hadamard6

def haagerupF0 (S Sb T R x : ℂ) : ℂ :=
  -x * (-R * S + R * x + Sb * T * x - T)

def haagerupF1 (S Sb T Tb R Rb x : ℂ) : ℂ :=
  -R * S * Tb * x + R * Tb * x ^ 2 + Rb * Sb * T * x -
    Rb * T - S + Sb * x ^ 2

def haagerupF2 (S Sb Tb Rb x : ℂ) : ℂ :=
  -Rb * Sb * x + Rb + S * Tb - Tb * x

def haagerupG0 (S T R x : ℂ) : ℂ :=
  -x * (-R * S + 2 * R * x + T)

def haagerupG1 (S Sb T Tb R Rb x : ℂ) : ℂ :=
  R * Rb * x - R * S * Tb * x + R * Tb * x ^ 2 +
    S * Sb * x - 2 * S - Sb * x ^ 2 + T * Tb * x

def haagerupG2 (S Tb Rb x : ℂ) : ℂ :=
  -Rb + S * Tb - 2 * Tb * x

def clearedHaagerupF (S Sb T Tb R Rb x y : ℂ) : ℂ :=
  haagerupF0 S Sb T R x + haagerupF1 S Sb T Tb R Rb x * y +
    haagerupF2 S Sb Tb Rb x * y ^ 2

def clearedHaagerupG (S Sb T Tb R Rb x y : ℂ) : ℂ :=
  haagerupG0 S T R x + haagerupG1 S Sb T Tb R Rb x * y +
    haagerupG2 S Tb Rb x * y ^ 2

def eliminantA (S Sb T Tb R Rb x : ℂ) : ℂ :=
  haagerupF2 S Sb Tb Rb x * haagerupG0 S T R x -
    haagerupF0 S Sb T R x * haagerupG2 S Tb Rb x

def eliminantB (S Sb T Tb R Rb x : ℂ) : ℂ :=
  haagerupF2 S Sb Tb Rb x * haagerupG1 S Sb T Tb R Rb x -
    haagerupF1 S Sb T Tb R Rb x * haagerupG2 S Tb Rb x

/-- Eliminating the quadratic coefficient gives `A(x)+B(x)y`. -/
theorem haagerup_elimination_identity
    (S Sb T Tb R Rb x y : ℂ) :
    haagerupF2 S Sb Tb Rb x *
        clearedHaagerupG S Sb T Tb R Rb x y -
      haagerupG2 S Tb Rb x *
        clearedHaagerupF S Sb T Tb R Rb x y =
      eliminantA S Sb T Tb R Rb x +
        eliminantB S Sb T Tb R Rb x * y := by
  simp only [clearedHaagerupF, clearedHaagerupG, eliminantA, eliminantB]
  ring

theorem eliminant_eq_zero
    {S Sb T Tb R Rb x y : ℂ}
    (hf : clearedHaagerupF S Sb T Tb R Rb x y = 0)
    (hg : clearedHaagerupG S Sb T Tb R Rb x y = 0) :
    eliminantA S Sb T Tb R Rb x +
      eliminantB S Sb T Tb R Rb x * y = 0 := by
  rw [← haagerup_elimination_identity]
  simp [hf, hg]

/-- The factorization `A=x(|R|²-|T|²)κ_S` before conjugate
parameters are identified. -/
theorem eliminantA_factorization
    (S Sb T Tb R Rb x : ℂ) :
    eliminantA S Sb T Tb R Rb x =
      x * (R * Rb - T * Tb) *
        (2 * Sb * x ^ 2 - (S * Sb + 3) * x + 2 * S) := by
  simp only [eliminantA, haagerupF0, haagerupF2,
    haagerupG0, haagerupG2]
  ring

def eliminantBeta0 (S T Tb Rb : ℂ) : ℂ :=
  -Rb ^ 2 * T + Rb * S * T * Tb - 3 * Rb * S - S ^ 2 * Tb

def eliminantBeta1 (S Sb T Tb R Rb : ℂ) : ℂ :=
  R * Rb ^ 2 - R * Rb * S * Tb + Rb ^ 2 * Sb * T -
    Rb * S * Sb * T * Tb + 3 * Rb * S * Sb - Rb * T * Tb +
    S ^ 2 * Sb * Tb + S * T * Tb ^ 2

def eliminantBeta2 (S Sb T Tb R Rb : ℂ) : ℂ :=
  -R * Rb ^ 2 * Sb + R * Rb * S * Sb * Tb + R * Rb * Tb -
    R * S * Tb ^ 2 - Rb * S * Sb ^ 2 + Rb * Sb * T * Tb -
    3 * S * Sb * Tb - T * Tb ^ 2

def eliminantBeta3 (Sb Tb R Rb : ℂ) : ℂ :=
  -R * Rb * Sb * Tb + R * Tb ^ 2 + Rb * Sb ^ 2 + 3 * Sb * Tb

/-- `B` really has degree at most three, with the displayed coefficients. -/
theorem eliminantB_coefficients
    (S Sb T Tb R Rb x : ℂ) :
    eliminantB S Sb T Tb R Rb x =
      eliminantBeta0 S T Tb Rb +
      eliminantBeta1 S Sb T Tb R Rb * x +
      eliminantBeta2 S Sb T Tb R Rb * x ^ 2 +
      eliminantBeta3 Sb Tb R Rb * x ^ 3 := by
  simp only [eliminantB, haagerupF1, haagerupF2,
    haagerupG1, haagerupG2, eliminantBeta0, eliminantBeta1,
    eliminantBeta2, eliminantBeta3]
  ring

theorem kappa_eq_eliminant_factor (S x : ℂ) :
    2 * star S * x ^ 2 - (S * star S + 3) * x + 2 * S =
      kappa S x := by
  simp only [kappa, Complex.normSq_eq_conj_mul_self, Complex.star_def]
  ring

end Hadamard6
