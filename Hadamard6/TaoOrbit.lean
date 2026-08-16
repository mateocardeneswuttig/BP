import Hadamard6.PhaseEquivalence
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# The concrete Tao orbit

The Tao stratum is not left as an opaque predicate here.  We display the
standard dephased exponent matrix over a primitive cubic phase and take its
ordinary Hadamard-equivalence orbit.
-/

namespace Hadamard6

def IsPrimitiveCubicPhase (omega : ℂ) : Prop :=
  Complex.normSq omega = 1 ∧ omega ^ 2 + omega + 1 = 0

def taoMatrix (omega : ℂ) : Mat6 :=
  Matrix.fromBlocks
    !![1, 1, 1;
       1, 1, omega;
       1, omega, 1]
    !![1, 1, 1;
       omega, omega ^ 2, omega ^ 2;
       omega ^ 2, omega ^ 2, omega]
    !![1, omega, omega ^ 2;
       1, omega ^ 2, omega ^ 2;
       1, omega ^ 2, omega]
    !![1, omega, omega ^ 2;
       omega, 1, omega;
       omega ^ 2, omega, 1]

/-- Membership in the Tao orbit, with either primitive cubic phase allowed. -/
def IsTaoOrbit (H : Mat6) : Prop :=
  ∃ omega : ℂ, IsPrimitiveCubicPhase omega ∧ Equivalent H (taoMatrix omega)

/-- Tao-orbit membership is unchanged when the matrix is replaced by an
equivalent representative. -/
theorem isTaoOrbit_of_equivalent {H K : Mat6}
    (hHK : Equivalent H K) (hK : IsTaoOrbit K) : IsTaoOrbit H := by
  rcases hK with ⟨omega, homega, hKtao⟩
  exact ⟨omega, homega, equivalent_trans hHK hKtao⟩

theorem equivalent_isTaoOrbit_iff {H K : Mat6}
    (hHK : Equivalent H K) : IsTaoOrbit H ↔ IsTaoOrbit K := by
  constructor
  · exact isTaoOrbit_of_equivalent (equivalent_symm hHK)
  · exact isTaoOrbit_of_equivalent hHK

theorem primitiveCubicPhase_cube {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega ^ 3 = 1 := by
  rcases homega with ⟨_, hpoly⟩
  have h : omega ^ 3 - 1 = 0 := by
    calc
      omega ^ 3 - 1 = (omega - 1) * (omega ^ 2 + omega + 1) := by ring
      _ = 0 := by rw [hpoly, mul_zero]
  linear_combination h

theorem primitiveCubicPhase_ne_zero {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega ≠ 0 := by
  intro hzero
  have := homega.1
  simp [hzero] at this

theorem primitiveCubicPhase_star {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : star omega = omega ^ 2 := by
  have hstar : star omega * omega = 1 :=
    star_mul_self_of_normSq_one homega.1
  have hsq : omega ^ 2 * omega = 1 := by
    simpa [pow_succ] using primitiveCubicPhase_cube homega
  apply (mul_right_cancel₀ (primitiveCubicPhase_ne_zero homega))
  rw [hstar, hsq]

theorem primitiveCubicPhase_sq_norm {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    Complex.normSq (omega ^ 2) = 1 := by
  rw [pow_two, Complex.normSq_mul, homega.1]
  norm_num

/-- Relative to either primitive cubic phase, these are the only three
cubic roots.  This is the finite case split used in the Tao reduction. -/
theorem cubicRoot_eq_one_or_primitive_or_sq {omega z : ℂ}
    (homega : IsPrimitiveCubicPhase omega) (hz : IsCubicRoot z) :
    z = 1 ∨ z = omega ∨ z = omega ^ 2 := by
  have hfactor : (z - 1) * (z ^ 2 + z + 1) = 0 := by
    calc
      (z - 1) * (z ^ 2 + z + 1) = z ^ 3 - 1 := by ring
      _ = 0 := by rw [hz]; norm_num
  rcases mul_eq_zero.mp hfactor with hone | hzpoly
  · exact Or.inl (sub_eq_zero.mp hone)
  · right
    have hsum : omega + omega ^ 2 = -1 := by
      linear_combination homega.2
    have hprod : omega * omega ^ 2 = 1 := by
      calc
        omega * omega ^ 2 = omega ^ 3 := by ring
        _ = 1 := primitiveCubicPhase_cube homega
    have hfactor' : (z - omega) * (z - omega ^ 2) = 0 := by
      calc
        (z - omega) * (z - omega ^ 2) =
            z ^ 2 - z * (omega + omega ^ 2) + omega * omega ^ 2 := by ring
        _ = z ^ 2 + z + 1 := by rw [hsum, hprod]; ring
        _ = 0 := hzpoly
    rcases mul_eq_zero.mp hfactor' with h | h
    · exact Or.inl (sub_eq_zero.mp h)
    · exact Or.inr (sub_eq_zero.mp h)

theorem taoMatrix_entrywiseUnit {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    EntrywiseUnit (taoMatrix omega) := by
  intro i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [taoMatrix, homega.1, primitiveCubicPhase_sq_norm homega]

theorem taoMatrix_isHadamard {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    IsHadamard (taoMatrix omega) := by
  refine ⟨taoMatrix_entrywiseUnit homega, ?_⟩
  have hstar : (starRingEnd ℂ) omega = omega ^ 2 :=
    primitiveCubicPhase_star homega
  have hcube : omega ^ 3 = 1 := primitiveCubicPhase_cube homega
  have hpowFour : omega ^ 4 = omega := by
    calc
      omega ^ 4 = omega * omega ^ 3 := by ring
      _ = omega := by rw [hcube, mul_one]
  have hstarSq : (starRingEnd ℂ) (omega ^ 2) = omega := by
    rw [map_pow, hstar]
    calc
      (omega ^ 2) ^ 2 = omega * omega ^ 3 := by ring
      _ = omega := by rw [hcube, mul_one]
  have hsum : 1 + omega + omega ^ 2 = 0 := by
    calc
      1 + omega + omega ^ 2 = omega ^ 2 + omega + 1 := by ring
      _ = 0 := homega.2
  have hsumTwo : 2 + omega * 2 + omega ^ 2 * 2 = 0 := by
    calc
      2 + omega * 2 + omega ^ 2 * 2 = 2 * (1 + omega + omega ^ 2) := by ring
      _ = 0 := by rw [hsum, mul_zero]
  have hshifted : omega ^ 2 + omega ^ 3 + omega ^ 4 = 0 := by
    rw [hcube, hpowFour]
    calc
      omega ^ 2 + 1 + omega = 1 + omega + omega ^ 2 := by ring
      _ = 0 := hsum
  have hmixed :
      1 + omega + omega ^ 2 * 2 + omega ^ 3 + omega ^ 4 = 0 := by
    rw [hcube, hpowFour]
    calc
      1 + omega + omega ^ 2 * 2 + 1 + omega =
          2 + omega * 2 + omega ^ 2 * 2 := by ring
      _ = 0 := hsumTwo
  have hcubeFour : -4 + omega ^ 3 * 4 = 0 := by
    rw [hcube]
    norm_num
  have hdiag : 2 + omega ^ 3 * 4 = 6 := by
    rw [hcube]
    norm_num
  ext i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Matrix.conjTranspose_apply, taoMatrix,
      Fin.sum_univ_three, hstar, hstarSq] <;>
    ring_nf <;>
    assumption

/-- Every representative in the concrete Tao orbit is Hadamard. -/
theorem isTaoOrbit_isHadamard {H : Mat6} (hH : IsTaoOrbit H) :
    IsHadamard H := by
  rcases hH with ⟨omega, homega, heq⟩
  exact (equivalent_isHadamard_iff heq).2
    (taoMatrix_isHadamard homega)

end Hadamard6
