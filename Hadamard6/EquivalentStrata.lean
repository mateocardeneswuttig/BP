import Hadamard6.PhaseEquivalence
import Hadamard6.Strata

/-!
# Equivalence transport for the `2 x 2` reducible stratum
-/

namespace Hadamard6

def phaseTransform2 (r c : I2 → ℂ) (X : Mat2) : Mat2 :=
  fun i j ↦ r i * X i j * c j

theorem phaseTransform2_isHadamard2
    {r c : I2 → ℂ} {X : Mat2}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1)
    (hX : IsHadamard2 X) : IsHadamard2 (phaseTransform2 r c X) := by
  refine ⟨?_, ?_⟩
  · intro i j
    simp [phaseTransform2, Complex.normSq_mul, hr i, hc j, hX.1 i j]
  · ext i j
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      phaseTransform2, star_mul]
    have hgram := congrArg (fun M : Mat2 ↦ M i j) hX.2
    simp only [Matrix.smul_apply, Matrix.one_apply] at hgram
    have hsum : (∑ k, X i k * star (X j k)) =
        (2 : ℂ) • (if i = j then 1 else 0) := by
      simpa [Matrix.mul_apply, Matrix.conjTranspose_apply] using hgram
    calc
      (∑ k, (r i * X i k * c k) *
          (star (c k) * (star (X j k) * star (r j)))) =
        r i * (∑ k, X i k * star (X j k)) * star (r j) := by
          rw [Finset.mul_sum, Finset.sum_mul]
          apply Finset.sum_congr rfl
          intro k hk
          have hck : c k * star (c k) = 1 := by
            simpa [mul_comm] using star_mul_self_of_normSq_one (hc k)
          rw [show (r i * X i k * c k) *
              (star (c k) * (star (X j k) * star (r j))) =
              r i * (X i k * star (X j k)) * star (r j) *
                (c k * star (c k)) by ring,
            hck]
          ring
      _ = ((2 : ℂ) • (1 : Mat2)) i j := by
        rw [hsum]
        simp only [Matrix.smul_apply, Matrix.one_apply]
        by_cases hij : i = j
        · subst j
          have hri : r i * star (r i) = 1 := by
            simpa [mul_comm] using star_mul_self_of_normSq_one (hr i)
          simp only [if_pos, smul_eq_mul, mul_one]
          change r i * (2 : ℂ) * star (r i) = (2 : ℂ)
          rw [show r i * (2 : ℂ) * star (r i) =
            (2 : ℂ) * (r i * star (r i)) by ring, hri]
          norm_num
        · simp [hij]

theorem hasHadamardTwoByTwo_of_equivalent
    {H K : Mat6} (hHK : Equivalent H K)
    (hK : HasHadamardTwoByTwo K) : HasHadamardTwoByTwo H := by
  rcases hHK with ⟨σ, τ, r, c, hr, hc, hHK⟩
  rcases hK with ⟨rows, cols, hsub⟩
  let rowsH : I2 ↪ I6 :=
    { toFun := fun i ↦ σ (rows i)
      inj' := fun i j h ↦ rows.injective (σ.injective h) }
  let colsH : I2 ↪ I6 :=
    { toFun := fun j ↦ τ (cols j)
      inj' := fun i j h ↦ cols.injective (τ.injective h) }
  let rr : I2 → ℂ := fun i ↦ star (r (rows i))
  let cc : I2 → ℂ := fun j ↦ star (c (cols j))
  have hrr : ∀ i, Complex.normSq (rr i) = 1 := by
    intro i
    simp [rr, Complex.normSq_conj, hr (rows i)]
  have hcc : ∀ j, Complex.normSq (cc j) = 1 := by
    intro j
    simp [cc, Complex.normSq_conj, hc (cols j)]
  refine ⟨rowsH, colsH, ?_⟩
  have hphase := phaseTransform2_isHadamard2 hrr hcc hsub
  have heq : phaseTransform2 rr cc (K.submatrix rows cols) =
      H.submatrix rowsH colsH := by
    ext i j
    simp only [phaseTransform2, Matrix.submatrix_apply]
    rw [hHK]
    have hri : star (r (rows i)) * r (rows i) = 1 :=
      star_mul_self_of_normSq_one (hr (rows i))
    have hcj : c (cols j) * star (c (cols j)) = 1 := by
      simpa [mul_comm] using star_mul_self_of_normSq_one (hc (cols j))
    simp only [rr, cc, rowsH, colsH]
    rw [show star (r (rows i)) *
        (r (rows i) * H (σ (rows i)) (τ (cols j)) * c (cols j)) *
          star (c (cols j)) =
        (star (r (rows i)) * r (rows i)) *
          H (σ (rows i)) (τ (cols j)) *
          (c (cols j) * star (c (cols j))) by ring,
      hri, hcj]
    simp
    rfl
  rwa [heq] at hphase

/-- The intrinsic `2 x 2` Hadamard condition is an equivalence invariant. -/
theorem equivalent_hasHadamardTwoByTwo_iff
    {H K : Mat6} (hHK : Equivalent H K) :
    HasHadamardTwoByTwo H ↔ HasHadamardTwoByTwo K := by
  constructor
  · exact hasHadamardTwoByTwo_of_equivalent (equivalent_symm hHK)
  · exact hasHadamardTwoByTwo_of_equivalent hHK

end Hadamard6
