import Hadamard6.FourierForcedCompletion
import Hadamard6.FibreGauge

/-!
# Elementary classification of dephased `3 x 3` Hadamard matrices
-/

namespace Hadamard6

def IsDephased3 (X : Mat3) : Prop :=
  (∀ j, X 0 j = 1) ∧ (∀ i, X i 0 = 1)

theorem unit_pair_with_one_sum_zero
    {x y : ℂ}
    (hx : Complex.normSq x = 1) (hy : Complex.normSq y = 1)
    (hsum : 1 + x + y = 0) :
    x ^ 2 + x + 1 = 0 ∧ y = x ^ 2 := by
  have hux := star_mul_self_of_normSq_one hx
  have huy := star_mul_self_of_normSq_one hy
  have hstarsum : 1 + star x + star y = 0 := by
    have h := congrArg star hsum
    simpa [star_add] using h
  have hyexpr : y = -1 - x := by
    linear_combination hsum
  have hsyexpr : star y = -1 - star x := by
    linear_combination hstarsum
  have htrace : x + star x + 1 = 0 := by
    rw [hsyexpr, hyexpr] at huy
    linear_combination huy - hux
  have hquad : x ^ 2 + x + 1 = 0 := by
    calc
      x ^ 2 + x + 1 = x ^ 2 + x + star x * x := by rw [hux]
      _ = x * (x + star x + 1) := by ring
      _ = 0 := by rw [htrace, mul_zero]
  constructor
  · exact hquad
  · calc
      y = -1 - x := hyexpr
      _ = x ^ 2 := by linear_combination -hquad

theorem quadratic_root_relative
    {ω z : ℂ}
    (hω : ω ^ 2 + ω + 1 = 0)
    (hz : z ^ 2 + z + 1 = 0) :
    z = ω ∨ z = ω ^ 2 := by
  have hω3 := cubic_of_quadratic hω
  unfold IsCubicRoot at hω3
  have hsumω : ω + ω ^ 2 = -1 := by
    linear_combination hω
  have hfac : (z - ω) * (z - ω ^ 2) = z ^ 2 + z + 1 := by
    calc
      (z - ω) * (z - ω ^ 2) = z ^ 2 - z * (ω + ω ^ 2) + ω ^ 3 := by ring
      _ = z ^ 2 + z + 1 := by rw [hsumω, hω3]; ring
  have : (z - ω) * (z - ω ^ 2) = 0 := by rw [hfac, hz]
  rcases mul_eq_zero.mp this with h | h
  · exact Or.inl (sub_eq_zero.mp h)
  · exact Or.inr (sub_eq_zero.mp h)

theorem dephased_hadamard3_eq_fourier
    {X : Mat3} (hX : IsHadamard3 X) (hdeph : IsDephased3 X) :
    ∃ ω : ℂ,
      Complex.normSq ω = 1 ∧
      ω ^ 2 + ω + 1 = 0 ∧
      X = fourier3 ω := by
  let ω := X 1 1
  let b := X 1 2
  let c := X 2 1
  let d := X 2 2
  have hrow1 : 1 + ω + b = 0 := by
    simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, hdeph.1, hdeph.2] using
        congrArg (fun M : Mat3 ↦ M 1 0) hX.2
  have hrow2 : 1 + c + d = 0 := by
    simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, hdeph.1, hdeph.2] using
        congrArg (fun M : Mat3 ↦ M 2 0) hX.2
  have hωu : Complex.normSq ω = 1 := hX.1 1 1
  have hbu : Complex.normSq b = 1 := hX.1 1 2
  have hcu : Complex.normSq c = 1 := hX.1 2 1
  have hdu : Complex.normSq d = 1 := hX.1 2 2
  rcases unit_pair_with_one_sum_zero hωu hbu hrow1 with ⟨hω, hb⟩
  rcases unit_pair_with_one_sum_zero hcu hdu hrow2 with ⟨hc, hd⟩
  have hcCases := quadratic_root_relative hω hc
  have hcω2 : c = ω ^ 2 := by
    rcases hcCases with hcω | hcω2
    · exfalso
      have hdω2 : d = ω ^ 2 := hd.trans (congrArg (fun z : ℂ ↦ z ^ 2) hcω)
      have huω : star ω * ω = 1 := star_mul_self_of_normSq_one hωu
      have huωr : ω * star ω = 1 := by simpa [mul_comm] using huω
      have huω2r : ω ^ 2 * (star ω) ^ 2 = 1 := by
        calc
          ω ^ 2 * (star ω) ^ 2 = (ω * star ω) ^ 2 := by ring
          _ = 1 := by rw [huωr]; norm_num
      have horth : 1 + ω * star ω + ω ^ 2 * (star ω) ^ 2 = 0 := by
        simpa [Matrix.mul_apply, Matrix.conjTranspose_apply,
          Fin.sum_univ_three, hdeph.2, ω, b, c, d, hb, hcω, hdω2] using
            congrArg (fun M : Mat3 ↦ M 1 2) hX.2
      rw [huωr, huω2r] at horth
      norm_num at horth
    · exact hcω2
  have hdω : d = ω := by
    rw [hd, hcω2]
    have hω3 := cubic_of_quadratic hω
    unfold IsCubicRoot at hω3
    calc
      (ω ^ 2) ^ 2 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hω3, mul_one]
  refine ⟨ω, hωu, hω, ?_⟩
  have hω3 := cubic_of_quadratic hω
  unfold IsCubicRoot at hω3
  have hω4 : ω ^ 4 = ω := by
    calc
      ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hω3, mul_one]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [fourier3, ω, b, c, d, hdeph.1, hdeph.2, hb, hcω2, hdω,
      hω4]

theorem biGauge_isHadamard3
    {r c : I3 → ℂ} {X : Mat3}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1)
    (hX : IsHadamard3 X) : IsHadamard3 (biGauge r c X) := by
  constructor
  · intro i j
    simp [biGauge, Complex.normSq_mul, hr i, hc j, hX.1 i j]
  · rw [biGauge_rowGram hc, hX.2]
    ext i j
    simp only [rowGaugeGram, Matrix.smul_apply, Matrix.one_apply]
    by_cases hij : i = j
    · subst j
      have hri : r i * star (r i) = 1 := by
        simpa [mul_comm] using star_mul_self_of_normSq_one (hr i)
      simp only [if_pos, smul_eq_mul, mul_one]
      calc
        r i * 3 * star (r i) = 3 * (r i * star (r i)) := by ring
        _ = 3 := by rw [hri]; norm_num
    · simp [hij]

noncomputable def dephase3Row (X : Mat3) (i : I3) : ℂ :=
  star (X i 0)

noncomputable def dephase3Column (X : Mat3) (j : I3) : ℂ :=
  star (X 0 j) * X 0 0

noncomputable def dephase3 (X : Mat3) : Mat3 :=
  biGauge (dephase3Row X) (dephase3Column X) X

theorem dephase3Row_unit {X : Mat3} (hX : EntrywiseUnit X) (i : I3) :
    Complex.normSq (dephase3Row X i) = 1 := by
  simpa [dephase3Row, Complex.normSq_conj] using hX i 0

theorem dephase3Column_unit {X : Mat3} (hX : EntrywiseUnit X) (j : I3) :
    Complex.normSq (dephase3Column X j) = 1 := by
  simp [dephase3Column, Complex.normSq_mul, Complex.normSq_conj,
    hX 0 j, hX 0 0]

theorem dephase3_isDephased {X : Mat3} (hX : EntrywiseUnit X) :
    IsDephased3 (dephase3 X) := by
  have h00 := star_mul_self_of_normSq_one (hX 0 0)
  constructor
  · intro j
    simp only [dephase3, biGauge, dephase3Row, dephase3Column]
    have hj := star_mul_self_of_normSq_one (hX 0 j)
    calc
      star (X 0 0) * X 0 j * (star (X 0 j) * X 0 0) =
          (star (X 0 j) * X 0 j) * (star (X 0 0) * X 0 0) := by ring
      _ = 1 := by rw [hj, h00]; norm_num
  · intro i
    simp only [dephase3, biGauge, dephase3Row, dephase3Column]
    have hi := star_mul_self_of_normSq_one (hX i 0)
    calc
      star (X i 0) * X i 0 * (star (X 0 0) * X 0 0) = 1 := by
        rw [hi, h00]
        norm_num

theorem dephase3_isHadamard3 {X : Mat3} (hX : IsHadamard3 X) :
    IsHadamard3 (dephase3 X) :=
  biGauge_isHadamard3
    (fun i ↦ dephase3Row_unit hX.1 i)
    (fun j ↦ dephase3Column_unit hX.1 j) hX

/-- Every `3 x 3` complex Hadamard is changed into a Fourier matrix by
unit-modulus row and column scalings. -/
theorem hadamard3_biGauge_eq_fourier {X : Mat3} (hX : IsHadamard3 X) :
    ∃ (r c : I3 → ℂ) (ω : ℂ),
      (∀ i, Complex.normSq (r i) = 1) ∧
      (∀ j, Complex.normSq (c j) = 1) ∧
      Complex.normSq ω = 1 ∧
      ω ^ 2 + ω + 1 = 0 ∧
      biGauge r c X = fourier3 ω := by
  rcases dephased_hadamard3_eq_fourier
      (dephase3_isHadamard3 hX) (dephase3_isDephased hX.1) with
    ⟨ω, hωu, hω, heq⟩
  exact ⟨dephase3Row X, dephase3Column X, ω,
    fun i ↦ dephase3Row_unit hX.1 i,
    fun j ↦ dephase3Column_unit hX.1 j,
    hωu, hω, heq⟩

/-- Once the first row is fixed to ones, only two row phases remain beyond
the Fourier matrix. -/
theorem hadamard3_firstRow_eq_rowGauge_fourier
    {X : Mat3} (hX : IsHadamard3 X) (hrow : ∀ j, X 0 j = 1) :
    ∃ (p q ω : ℂ),
      Complex.normSq p = 1 ∧ Complex.normSq q = 1 ∧
      Complex.normSq ω = 1 ∧ ω ^ 2 + ω + 1 = 0 ∧
      X = rowGauge (fourierParameters p q) (fourier3 ω) := by
  rcases dephased_hadamard3_eq_fourier
      (dephase3_isHadamard3 hX) (dephase3_isDephased hX.1) with
    ⟨ω, hωu, hω, heq⟩
  let p := X 1 0
  let q := X 2 0
  refine ⟨p, q, ω, hX.1 1 0, hX.1 2 0, hωu, hω, ?_⟩
  ext i j
  have hij := congrArg (fun M : Mat3 ↦ M i j) heq
  have hi := star_mul_self_of_normSq_one (hX.1 i 0)
  have h00 : X 0 0 = 1 := hrow 0
  simp only [dephase3, biGauge, dephase3Row, dephase3Column] at hij
  rw [hrow j, h00] at hij
  simp only [star_one, mul_one] at hij
  have hparam : fourierParameters p q i = X i 0 := by
    fin_cases i <;> simp [fourierParameters, p, q, h00]
  rw [rowGauge, hparam, ← hij]
  symm
  calc
    X i 0 * (star (X i 0) * X i j) =
        (star (X i 0) * X i 0) * X i j := by ring
    _ = X i j := by rw [hi]; simp

/-- Dually, once the first column is fixed to ones, only two column phases
remain beyond the Fourier matrix. -/
theorem hadamard3_firstColumn_eq_columnGauge_fourier
    {X : Mat3} (hX : IsHadamard3 X) (hcol : ∀ i, X i 0 = 1) :
    ∃ (r s ω : ℂ),
      Complex.normSq r = 1 ∧ Complex.normSq s = 1 ∧
      Complex.normSq ω = 1 ∧ ω ^ 2 + ω + 1 = 0 ∧
      X = columnGauge (fourierParameters r s) (fourier3 ω) := by
  have hXt : IsHadamard3 X.transpose := by
    rw [transpose_isHadamard3_iff]
    exact hX
  have hrowt : ∀ j, X.transpose 0 j = 1 := by
    intro j
    exact hcol j
  rcases hadamard3_firstRow_eq_rowGauge_fourier hXt hrowt with
    ⟨r, s, ω, hru, hsu, hωu, hω, heq⟩
  refine ⟨r, s, ω, hru, hsu, hωu, hω, ?_⟩
  have ht := congrArg Matrix.transpose heq
  have hFt : (fourier3 ω).transpose = fourier3 ω := by
    ext i j
    simp [fourier3, mul_comm]
  rw [columnGauge, hFt]
  exact ht

end Hadamard6
