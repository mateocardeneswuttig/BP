import Hadamard6.GramInvariant
import Hadamard6.QuotientReal
import Hadamard6.UnitSymmetric
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-!
# The two nonsingular Möbius allocations
-/

namespace Hadamard6

def normalizedRows
    (x₁ x₂ x₃ y₁ y₂ y₃ : ℂ) : Mat3 :=
  !![1, 1, 1; x₁, x₂, x₃; y₁, y₂, y₃]

theorem rowTau_normalizedRows
    (x₁ x₂ x₃ y₁ y₂ y₃ : ℂ) :
    rowTau (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃) =
      star (x₁ + x₂ + x₃) *
      star (star x₁ * y₁ + star x₂ * y₂ + star x₃ * y₃) *
      (y₁ + y₂ + y₃) := by
  have h01 :
      (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃ *
        Matrix.conjTranspose (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃)) 0 1 =
        star (x₁ + x₂ + x₃) := by
    simp [normalizedRows, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, star_add]
  have h12 :
      (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃ *
        Matrix.conjTranspose (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃)) 1 2 =
        star (star x₁ * y₁ + star x₂ * y₂ + star x₃ * y₃) := by
    simp [normalizedRows, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, star_add, star_mul]
    ring
  have h20 :
      (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃ *
        Matrix.conjTranspose (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃)) 2 0 =
        y₁ + y₂ + y₃ := by
    simp [normalizedRows, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three]
  simp [rowTau, h01, h12, h20]

theorem phased_real_tau_first {s q : ℝ} {ell : ℂ}
    (hell : Complex.normSq ell = 1) :
    (star (s : ℂ) * star (ell * (q : ℂ)) * (ell * (s : ℂ))).re =
      s ^ 2 * q := by
  have hu : star ell * ell = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun a : ℝ ↦ (a : ℂ)) hell
  have hsstar : star (s : ℂ) = (s : ℂ) := by
    simp [Complex.star_def]
  have hqstar : star (q : ℂ) = (q : ℂ) := by
    simp [Complex.star_def]
  have hc :
      star (s : ℂ) * star (ell * (q : ℂ)) * (ell * (s : ℂ)) =
        ((s ^ 2 * q : ℝ) : ℂ) := by
    rw [star_mul, hsstar, hqstar]
    calc
      (s : ℂ) * ((q : ℂ) * star ell) * (ell * (s : ℂ)) =
          ((s : ℂ) ^ 2 * (q : ℂ)) * (star ell * ell) := by ring
      _ = (s : ℂ) ^ 2 * (q : ℂ) := by rw [hu]; ring
      _ = ((s ^ 2 * q : ℝ) : ℂ) := by push_cast; ring
  rw [hc]
  change s ^ 2 * q = s ^ 2 * q
  rfl

theorem phased_real_tau_second {s q : ℝ} {ell : ℂ}
    (hell : Complex.normSq ell = 1) :
    (star (s : ℂ) * star (ell * (s : ℂ)) * (ell * (q : ℂ))).re =
      s ^ 2 * q := by
  have hu : star ell * ell = 1 := by
    simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
      congrArg (fun a : ℝ ↦ (a : ℂ)) hell
  have hsstar : star (s : ℂ) = (s : ℂ) := by
    simp [Complex.star_def]
  have hqstar : star (q : ℂ) = (q : ℂ) := by
    simp [Complex.star_def]
  have hc :
      star (s : ℂ) * star (ell * (s : ℂ)) * (ell * (q : ℂ)) =
        ((s ^ 2 * q : ℝ) : ℂ) := by
    rw [star_mul, hsstar]
    calc
      (s : ℂ) * ((s : ℂ) * star ell) * (ell * (q : ℂ)) =
          ((s : ℂ) ^ 2 * (q : ℂ)) * (star ell * ell) := by ring
      _ = (s : ℂ) ^ 2 * (q : ℂ) := by rw [hu]; ring
      _ = ((s ^ 2 * q : ℝ) : ℂ) := by push_cast; ring
  rw [hc]
  change s ^ 2 * q = s ^ 2 * q
  rfl

theorem first_allocation_rowTau_negative
    {s r : ℝ} {x₁ x₂ x₃ ell : ℂ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (ht : (x₁, x₂, x₃) ∈ phaseTriplesAtSum (s : ℂ))
    (hell : Complex.normSq ell = 1)
    (hcrit : realKappa s r = 0)
    (hd₁ : x₁ - (r : ℂ) ≠ 0)
    (hd₂ : x₂ - (r : ℂ) ≠ 0)
    (hd₃ : x₃ - (r : ℂ) ≠ 0) :
    (rowTau (normalizedRows x₁ x₂ x₃
      (ell * mobius (r : ℂ) x₁) (ell * mobius (r : ℂ) x₂)
      (ell * mobius (r : ℂ) x₃))).re < 0 := by
  let q : ℝ := s * (r - s) / (1 - s * r)
  have hq : q < 0 := first_mobius_ratio_negative hs0 hs1 hr0 hcrit
  have hsrR : 1 - s * r ≠ 0 := by
    intro hz
    simp [q, hz] at hq
  have hsrC : (1 : ℂ) - (s : ℂ) * (r : ℂ) ≠ 0 := by
    exact_mod_cast hsrR
  have hcritC :
      2 * (s : ℂ) * (r : ℂ) ^ 2 -
        ((s : ℂ) ^ 2 + 3) * (r : ℂ) + 2 * (s : ℂ) = 0 := by
    exact_mod_cast hcrit
  rcases phaseTriple_symmetric_data ht (by simp) with
    ⟨hsum, hinvsum, hpair, hprod⟩
  let u := x₁ * x₂ * x₃
  have hrC : (r : ℂ) ≠ 0 := by exact_mod_cast (ne_of_gt hr0)
  have hx₁ := ne_zero_of_normSq_eq_one ht.1
  have hx₂ := ne_zero_of_normSq_eq_one ht.2.1
  have hx₃ := ne_zero_of_normSq_eq_one ht.2.2.1
  have hm := mobius_sum_at_critical hsum hpair hprod hcritC
    hd₁ hd₂ hd₃ hsrC
  have hmover := mobius_over_sum_at_critical hsum hinvsum hpair hprod hcritC
    hrC hx₁ hx₂ hx₃ hd₁ hd₂ hd₃ hsrC
  have hqcast :
      (q : ℂ) =
        (s : ℂ) * ((r : ℂ) - (s : ℂ)) /
          (1 - (s : ℂ) * (r : ℂ)) := by
    dsimp [q]
    push_cast
    rfl
  have hT :
      ell * mobius (r : ℂ) x₁ + ell * mobius (r : ℂ) x₂ +
        ell * mobius (r : ℂ) x₃ = ell * (s : ℂ) := by
    linear_combination ell * hm
  have hR :
      star x₁ * (ell * mobius (r : ℂ) x₁) +
      star x₂ * (ell * mobius (r : ℂ) x₂) +
      star x₃ * (ell * mobius (r : ℂ) x₃) = ell * (q : ℂ) := by
    rw [← one_div_eq_star_of_normSq_eq_one ht.1,
      ← one_div_eq_star_of_normSq_eq_one ht.2.1,
      ← one_div_eq_star_of_normSq_eq_one ht.2.2.1]
    calc
      1 / x₁ * (ell * mobius (r : ℂ) x₁) +
          1 / x₂ * (ell * mobius (r : ℂ) x₂) +
          1 / x₃ * (ell * mobius (r : ℂ) x₃) =
          ell * (mobius (r : ℂ) x₁ / x₁ +
            mobius (r : ℂ) x₂ / x₂ +
            mobius (r : ℂ) x₃ / x₃) := by ring
      _ = ell * (q : ℂ) := by rw [hmover, hqcast]
  rw [rowTau_normalizedRows, hsum, hR, hT]
  rw [phased_real_tau_first hell]
  exact mul_neg_of_pos_of_neg (sq_pos_of_pos hs0) hq

theorem second_allocation_rowTau_negative
    {s r : ℝ} {x₁ x₂ x₃ ell : ℂ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (ht : (x₁, x₂, x₃) ∈ phaseTriplesAtSum (s : ℂ))
    (hell : Complex.normSq ell = 1)
    (hcrit : realKappa s r = 0)
    (hd₁ : x₁ - (r : ℂ) ≠ 0)
    (hd₂ : x₂ - (r : ℂ) ≠ 0)
    (hd₃ : x₃ - (r : ℂ) ≠ 0) :
    (rowTau (normalizedRows x₁ x₂ x₃
      (ell * x₁ * mobius (r : ℂ) x₁) (ell * x₂ * mobius (r : ℂ) x₂)
      (ell * x₃ * mobius (r : ℂ) x₃))).re < 0 := by
  let q : ℝ := s * (1 / r - s) / (1 - s / r)
  have hq : q < 0 := by
    simpa [q, one_div] using
      (second_mobius_ratio_negative hs0 hs1 hr0 hcrit)
  have hsrR : 1 - s * r ≠ 0 := by
    intro hz
    have hout := realKappa_root_outside hs0 hs1 hr0 hcrit
    rcases hout with h | h
    · nlinarith
    · nlinarith
  have hsrR' : 1 - s / r ≠ 0 := by
    intro hz
    simp [q, hz] at hq
  have hsrC : (1 : ℂ) - (s : ℂ) * (r : ℂ) ≠ 0 := by exact_mod_cast hsrR
  have hsrC' : (1 : ℂ) - (s : ℂ) / (r : ℂ) ≠ 0 := by exact_mod_cast hsrR'
  have hrC : (r : ℂ) ≠ 0 := by exact_mod_cast (ne_of_gt hr0)
  have hcritC :
      2 * (s : ℂ) * (r : ℂ) ^ 2 -
        ((s : ℂ) ^ 2 + 3) * (r : ℂ) + 2 * (s : ℂ) = 0 := by
    exact_mod_cast hcrit
  rcases phaseTriple_symmetric_data ht (by simp) with
    ⟨hsum, hinvsum, hpair, hprod⟩
  have hm := mobius_sum_at_critical hsum hpair hprod hcritC
    hd₁ hd₂ hd₃ hsrC
  have hxm := x_mul_mobius_sum_at_critical hsum hpair hprod hcritC hrC
    hd₁ hd₂ hd₃ hsrC hsrC'
  have hqcast :
      (q : ℂ) =
        (s : ℂ) * (1 / (r : ℂ) - (s : ℂ)) /
          (1 - (s : ℂ) / (r : ℂ)) := by
    dsimp [q]
    push_cast
    rfl
  have hT :
      ell * x₁ * mobius (r : ℂ) x₁ + ell * x₂ * mobius (r : ℂ) x₂ +
        ell * x₃ * mobius (r : ℂ) x₃ = ell * (q : ℂ) := by
    calc
      ell * x₁ * mobius (r : ℂ) x₁ + ell * x₂ * mobius (r : ℂ) x₂ +
          ell * x₃ * mobius (r : ℂ) x₃ =
          ell * (x₁ * mobius (r : ℂ) x₁ +
            x₂ * mobius (r : ℂ) x₂ +
            x₃ * mobius (r : ℂ) x₃) := by ring
      _ = ell * (q : ℂ) := by rw [hxm, hqcast]
  have hR :
      star x₁ * (ell * x₁ * mobius (r : ℂ) x₁) +
      star x₂ * (ell * x₂ * mobius (r : ℂ) x₂) +
      star x₃ * (ell * x₃ * mobius (r : ℂ) x₃) = ell * (s : ℂ) := by
    have hu₁ : star x₁ * x₁ = 1 := by
      simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
        congrArg (fun a : ℝ ↦ (a : ℂ)) ht.1
    have hu₂ : star x₂ * x₂ = 1 := by
      simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
        congrArg (fun a : ℝ ↦ (a : ℂ)) ht.2.1
    have hu₃ : star x₃ * x₃ = 1 := by
      simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
        congrArg (fun a : ℝ ↦ (a : ℂ)) ht.2.2.1
    have he₁ : star x₁ * (ell * x₁ * mobius (r : ℂ) x₁) =
        ell * mobius (r : ℂ) x₁ := by
      calc
        _ = ell * (star x₁ * x₁) * mobius (r : ℂ) x₁ := by ring
        _ = ell * mobius (r : ℂ) x₁ := by rw [hu₁]; simp
    have he₂ : star x₂ * (ell * x₂ * mobius (r : ℂ) x₂) =
        ell * mobius (r : ℂ) x₂ := by
      calc
        _ = ell * (star x₂ * x₂) * mobius (r : ℂ) x₂ := by ring
        _ = ell * mobius (r : ℂ) x₂ := by rw [hu₂]; simp
    have he₃ : star x₃ * (ell * x₃ * mobius (r : ℂ) x₃) =
        ell * mobius (r : ℂ) x₃ := by
      calc
        _ = ell * (star x₃ * x₃) * mobius (r : ℂ) x₃ := by ring
        _ = ell * mobius (r : ℂ) x₃ := by rw [hu₃]; simp
    rw [he₁, he₂, he₃]
    linear_combination ell * hm
  rw [rowTau_normalizedRows, hsum, hR, hT]
  rw [phased_real_tau_second hell]
  exact mul_neg_of_pos_of_neg (sq_pos_of_pos hs0) hq

/-- The conclusion of the unique-factor allocation step, stated directly
for the three companion coordinates. -/
def HasNonsingularCriticalAllocation
    (r x₁ x₂ x₃ y₁ y₂ y₃ : ℂ) : Prop :=
  ∃ ell, Complex.normSq ell = 1 ∧
    ((y₁ = ell * mobius r x₁ ∧
      y₂ = ell * mobius r x₂ ∧
      y₃ = ell * mobius r x₃) ∨
     (y₁ = ell * x₁ * mobius r x₁ ∧
      y₂ = ell * x₂ * mobius r x₂ ∧
      y₃ = ell * x₃ * mobius r x₃))

/-- Once factor allocation has produced either nonsingular Möbius form, the
negative invariant conclusion is automatic. -/
theorem nonsingular_critical_allocation_rowTau_negative
    {s r : ℝ} {x₁ x₂ x₃ y₁ y₂ y₃ : ℂ}
    (hs0 : 0 < s) (hs1 : s < 1) (hr0 : 0 < r)
    (ht : (x₁, x₂, x₃) ∈ phaseTriplesAtSum (s : ℂ))
    (hcrit : realKappa s r = 0)
    (hd₁ : x₁ - (r : ℂ) ≠ 0)
    (hd₂ : x₂ - (r : ℂ) ≠ 0)
    (hd₃ : x₃ - (r : ℂ) ≠ 0)
    (halloc : HasNonsingularCriticalAllocation (r : ℂ)
      x₁ x₂ x₃ y₁ y₂ y₃) :
    (rowTau (normalizedRows x₁ x₂ x₃ y₁ y₂ y₃)).re < 0 := by
  rcases halloc with ⟨ell, hell, hfirst | hsecond⟩
  · rcases hfirst with ⟨rfl, rfl, rfl⟩
    exact first_allocation_rowTau_negative hs0 hs1 hr0 ht hell hcrit
      hd₁ hd₂ hd₃
  · rcases hsecond with ⟨rfl, rfl, rfl⟩
    exact second_allocation_rowTau_negative hs0 hs1 hr0 ht hell hcrit
      hd₁ hd₂ hd₃

end Hadamard6
