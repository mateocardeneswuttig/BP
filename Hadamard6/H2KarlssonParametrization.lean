import Hadamard6.H2DegenerateNormalization
import Hadamard6.KarlssonGlobalModel
import Hadamard6.KarlssonParametrizationStatement
import Mathlib.Tactic

/-!
# Intrinsic extraction of Karlsson's core parameter

This file bridges the intrinsic `H₂` block normalization to Karlsson's
division-free core.  It does not assume a global chart-coverage statement.
The first stage proves that the inverse Fourier transform of each normalized
central block is scaled unitary.  The two complementary cores then determine
a Hermitian unitary matrix `Λ` by elementary matrix algebra.
-/

namespace Hadamard6

noncomputable section

theorem karlssonZLeft_conjTranspose_mul
    {z : ℂ} (hz : Complex.normSq z = 1) :
    Matrix.conjTranspose (karlssonZLeft z) * karlssonZLeft z =
      (2 : ℂ) • (1 : Mat2) := by
  have hunit : star z * z = 1 := star_mul_self_of_normSq_one hz
  have hunit' : (starRingEnd ℂ) z * z = 1 := hunit
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonZLeft, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_two, hunit'] <;>
    norm_num

/-- The inverse block Fourier transform preserves the scaled-unitary Gram
identity when both phase parameters are unit. -/
theorem h2InverseBlockTransform_rowGram
    {zLeft zRight : ℂ} {X : Mat2}
    (hzLeft : Complex.normSq zLeft = 1)
    (hzRight : Complex.normSq zRight = 1)
    (hX : X * Matrix.conjTranspose X = (2 : ℂ) • (1 : Mat2)) :
    h2InverseBlockTransform zLeft zRight X *
        Matrix.conjTranspose (h2InverseBlockTransform zLeft zRight X) =
      (2 : ℂ) • (1 : Mat2) := by
  have hL := karlssonZLeft_mul_conjTranspose hzLeft
  have hL' := karlssonZLeft_conjTranspose_mul hzLeft
  have hR := karlssonZRight_conjTranspose_mul hzRight
  unfold h2InverseBlockTransform
  simp only [Matrix.conjTranspose_smul, Matrix.conjTranspose_mul,
    Matrix.mul_smul, Matrix.smul_mul, smul_smul]
  norm_num
  calc
    (1 / 4 : ℂ) •
        ((Matrix.conjTranspose (karlssonZLeft zLeft) * X *
            Matrix.conjTranspose (karlssonZRight zRight)) *
          (karlssonZRight zRight *
            (Matrix.conjTranspose X * karlssonZLeft zLeft))) =
      (1 / 4 : ℂ) •
        (Matrix.conjTranspose (karlssonZLeft zLeft) * X *
          (Matrix.conjTranspose (karlssonZRight zRight) *
            karlssonZRight zRight) * Matrix.conjTranspose X *
          karlssonZLeft zLeft) := by
            congr 1
            noncomm_ring
    _ = (1 / 2 : ℂ) •
        (Matrix.conjTranspose (karlssonZLeft zLeft) *
          (X * Matrix.conjTranspose X) * karlssonZLeft zLeft) := by
      rw [hR]
      ext i j
      fin_cases i <;> fin_cases j <;>
        simp [Matrix.mul_apply, Fin.sum_univ_two] <;> ring
    _ = Matrix.conjTranspose (karlssonZLeft zLeft) *
        karlssonZLeft zLeft := by
      rw [hX]
      ext i j
      fin_cases i <;> fin_cases j <;>
        simp [Matrix.mul_apply, Fin.sum_univ_two]
    _ = (2 : ℂ) • (1 : Mat2) := hL'

theorem h2ParameterA_rowGram_of_blockNormalized
    {K : Mat6} (h : H2BlockNormalizedPresentation K) :
    h2ParameterA K * Matrix.conjTranspose (h2ParameterA K) =
      (2 : ℂ) • (1 : Mat2) := by
  exact h2InverseBlockTransform_rowGram
    h.canonical.z₃_unit h.canonical.z₁_unit h.coreBlocks.1.2

theorem h2ParameterB_rowGram_of_blockNormalized
    {K : Mat6} (h : H2BlockNormalizedPresentation K) :
    h2ParameterB K * Matrix.conjTranspose (h2ParameterB K) =
      (2 : ℂ) • (1 : Mat2) := by
  exact h2InverseBlockTransform_rowGram
    h.canonical.z₃_unit h.canonical.z₂_unit h.coreBlocks.2.1.2

/-- The ordinary unitary obtained after removing the leading Fourier
factor from the first Karlsson core. -/
def h2KarlssonUnitary (A : Mat2) : Mat2 :=
  (1 / 2 : ℂ) • (karlssonF2 * A)

/-- Solve `U = -I/2 + i sqrt(3) Λ/2` for `Λ`. -/
def h2KarlssonLambda (A : Mat2) : Mat2 :=
  (2 / (Complex.I * (Real.sqrt 3 : ℂ))) •
    (h2KarlssonUnitary A + (1 / 2 : ℂ) • (1 : Mat2))

theorem karlssonF2_mul_self :
    karlssonF2 * karlssonF2 = (2 : ℂ) • (1 : Mat2) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [karlssonF2, Matrix.mul_apply, Fin.sum_univ_two]

theorem karlssonF2_conjTranspose :
    Matrix.conjTranspose karlssonF2 = karlssonF2 := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [karlssonF2]

theorem h2KarlssonUnitary_rowGram
    {A : Mat2}
    (hA : A * Matrix.conjTranspose A = (2 : ℂ) • (1 : Mat2)) :
    h2KarlssonUnitary A * Matrix.conjTranspose (h2KarlssonUnitary A) =
      (1 : Mat2) := by
  unfold h2KarlssonUnitary
  rw [Matrix.conjTranspose_smul, Matrix.conjTranspose_mul,
    karlssonF2_conjTranspose]
  simp only [Matrix.mul_smul, Matrix.smul_mul, smul_smul]
  norm_num
  calc
    (1 / 4 : ℂ) •
        (karlssonF2 * A * (Matrix.conjTranspose A * karlssonF2)) =
      (1 / 4 : ℂ) •
        (karlssonF2 * (A * Matrix.conjTranspose A) * karlssonF2) := by
          congr 1
          noncomm_ring
    _ = (1 / 2 : ℂ) • (karlssonF2 * karlssonF2) := by
      rw [hA]
      ext i j
      fin_cases i <;> fin_cases j <;>
        simp [Matrix.mul_apply, Fin.sum_univ_two] <;> ring
    _ = (1 : Mat2) := by
      rw [karlssonF2_mul_self]
      ext i j
      fin_cases i <;> fin_cases j <;> norm_num

/-- If both complementary cores are scaled unitary and sum to `-F₂`, then
the ordinary unitary `U` satisfies `U + U† = -I`. -/
theorem h2KarlssonUnitary_add_conjTranspose
    {A B : Mat2}
    (hA : A * Matrix.conjTranspose A = (2 : ℂ) • (1 : Mat2))
    (hB : B * Matrix.conjTranspose B = (2 : ℂ) • (1 : Mat2))
    (hsum : A + B = -karlssonF2) :
    h2KarlssonUnitary A + Matrix.conjTranspose (h2KarlssonUnitary A) =
      -(1 : Mat2) := by
  have hBA : B = -karlssonF2 - A := by
    ext i j
    have hij := congrArg (fun M : Mat2 ↦ M i j) hsum
    simp only [Matrix.add_apply, Matrix.neg_apply, Matrix.sub_apply] at hij ⊢
    linear_combination hij
  rw [hBA] at hB
  have hF := karlssonF2_mul_self
  have hFstar := karlssonF2_conjTranspose
  have hB' :
      (-karlssonF2 - A) *
          (-karlssonF2 - Matrix.conjTranspose A) =
        (2 : ℂ) • (1 : Mat2) := by
    simpa [Matrix.conjTranspose_sub, hFstar] using hB
  have hcross :
      karlssonF2 * Matrix.conjTranspose A + A * karlssonF2 =
        -((2 : ℂ) • (1 : Mat2)) := by
    calc
      karlssonF2 * Matrix.conjTranspose A + A * karlssonF2 =
          ((-karlssonF2 - A) *
              (-karlssonF2 - Matrix.conjTranspose A)) -
            karlssonF2 * karlssonF2 -
            A * Matrix.conjTranspose A := by noncomm_ring
      _ = -((2 : ℂ) • (1 : Mat2)) := by
        rw [hB', hF, hA]
        ext i j
        fin_cases i <;> fin_cases j <;> norm_num
  have hsand := congrArg
    (fun X : Mat2 ↦ (1 / 4 : ℂ) •
      (karlssonF2 * X * karlssonF2)) hcross
  have hsandLeft :
      (1 / 4 : ℂ) •
          (karlssonF2 *
            (karlssonF2 * Matrix.conjTranspose A + A * karlssonF2) *
            karlssonF2) =
        h2KarlssonUnitary A +
          Matrix.conjTranspose (h2KarlssonUnitary A) := by
    unfold h2KarlssonUnitary
    rw [Matrix.conjTranspose_smul, Matrix.conjTranspose_mul, hFstar]
    calc
      (1 / 4 : ℂ) •
          (karlssonF2 *
            (karlssonF2 * Matrix.conjTranspose A + A * karlssonF2) *
            karlssonF2) =
        (1 / 4 : ℂ) •
          ((karlssonF2 * karlssonF2) * Matrix.conjTranspose A *
            karlssonF2 + karlssonF2 * A *
              (karlssonF2 * karlssonF2)) := by
            congr 1
            noncomm_ring
      _ = (1 / 2 : ℂ) • (Matrix.conjTranspose A * karlssonF2) +
          (1 / 2 : ℂ) • (karlssonF2 * A) := by
        rw [hF]
        ext i j
        fin_cases i <;> fin_cases j <;>
          simp [Matrix.mul_apply, Fin.sum_univ_two] <;> ring
      _ = (1 / 2 : ℂ) • (karlssonF2 * A) +
          star (1 / 2 : ℂ) • (Matrix.conjTranspose A * karlssonF2) := by
        norm_num
        abel
  have hsandRight :
      (1 / 4 : ℂ) •
          (karlssonF2 * (-((2 : ℂ) • (1 : Mat2))) * karlssonF2) =
        -(1 : Mat2) := by
    calc
      (1 / 4 : ℂ) •
          (karlssonF2 * (-((2 : ℂ) • (1 : Mat2))) * karlssonF2) =
        (-(1 / 2 : ℂ)) • (karlssonF2 * karlssonF2) := by
          ext i j
          fin_cases i <;> fin_cases j <;>
            simp [Matrix.mul_apply, Fin.sum_univ_two] <;> ring
      _ = -(1 : Mat2) := by
        rw [hF]
        ext i j
        fin_cases i <;> fin_cases j <;> norm_num
  rw [hsandLeft, hsandRight] at hsand
  exact hsand

theorem h2KarlssonLambda_conjTranspose
    {A B : Mat2}
    (hA : A * Matrix.conjTranspose A = (2 : ℂ) • (1 : Mat2))
    (hB : B * Matrix.conjTranspose B = (2 : ℂ) • (1 : Mat2))
    (hsum : A + B = -karlssonF2) :
    Matrix.conjTranspose (h2KarlssonLambda A) = h2KarlssonLambda A := by
  have hsqrt : (Real.sqrt 3 : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 3)))
  have hU := h2KarlssonUnitary_add_conjTranspose hA hB hsum
  let U := h2KarlssonUnitary A
  have hW :
      Matrix.conjTranspose (U + (1 / 2 : ℂ) • (1 : Mat2)) =
        -(U + (1 / 2 : ℂ) • (1 : Mat2)) := by
    rw [Matrix.conjTranspose_add, Matrix.conjTranspose_smul,
      Matrix.conjTranspose_one]
    norm_num
    change U + Matrix.conjTranspose U = -(1 : Mat2) at hU
    ext i j
    have hij := congrArg (fun M : Mat2 ↦ M i j) hU
    simp only [Matrix.add_apply, Matrix.neg_apply, Matrix.smul_apply] at hij ⊢
    fin_cases i <;> fin_cases j <;> norm_num at hij ⊢ <;>
      linear_combination hij
  have hcoeff :
      star (2 / (Complex.I * (Real.sqrt 3 : ℂ))) =
        -(2 / (Complex.I * (Real.sqrt 3 : ℂ))) := by
    simp
    field_simp [hsqrt]
  unfold h2KarlssonLambda
  change Matrix.conjTranspose
      ((2 / (Complex.I * (Real.sqrt 3 : ℂ))) •
        (U + (1 / 2 : ℂ) • (1 : Mat2))) =
    (2 / (Complex.I * (Real.sqrt 3 : ℂ))) •
      (U + (1 / 2 : ℂ) • (1 : Mat2))
  rw [Matrix.conjTranspose_smul, hcoeff, hW]
  simp
  abel

theorem h2KarlssonUnitary_eq_lambda (A : Mat2) :
    h2KarlssonUnitary A =
      (-(1 / 2 : ℂ)) • (1 : Mat2) +
        (Complex.I * (Real.sqrt 3 : ℂ) / 2) • h2KarlssonLambda A := by
  have hsqrt : (Real.sqrt 3 : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 3)))
  unfold h2KarlssonLambda
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.add_apply, Matrix.smul_apply] <;>
    field_simp [hsqrt] <;> ring

theorem h2KarlssonLambda_mul_self
    {A B : Mat2}
    (hA : A * Matrix.conjTranspose A = (2 : ℂ) • (1 : Mat2))
    (hB : B * Matrix.conjTranspose B = (2 : ℂ) • (1 : Mat2))
    (hsum : A + B = -karlssonF2) :
    h2KarlssonLambda A * h2KarlssonLambda A = (1 : Mat2) := by
  let L := h2KarlssonLambda A
  change L * L = (1 : Mat2)
  have hLstar : Matrix.conjTranspose L = L :=
    h2KarlssonLambda_conjTranspose hA hB hsum
  have hU := h2KarlssonUnitary_rowGram hA
  have hrec := h2KarlssonUnitary_eq_lambda A
  change h2KarlssonUnitary A =
      (-(1 / 2 : ℂ)) • (1 : Mat2) +
        (Complex.I * (Real.sqrt 3 : ℂ) / 2) • L at hrec
  have hsqrtSq : (Real.sqrt 3 : ℂ) ^ 2 = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hexpanded :
      ((-(1 / 2 : ℂ)) • (1 : Mat2) +
          (Complex.I * (Real.sqrt 3 : ℂ) / 2) • L) *
        ((-(1 / 2 : ℂ)) • (1 : Mat2) +
          star (Complex.I * (Real.sqrt 3 : ℂ) / 2) • L) =
      (1 : Mat2) := by
    rw [hrec] at hU
    simp only [Matrix.conjTranspose_add, Matrix.conjTranspose_smul,
      Matrix.conjTranspose_one, hLstar] at hU
    norm_num at hU
    simpa [Complex.star_def] using hU
  have hformula :
      ((-(1 / 2 : ℂ)) • (1 : Mat2) +
          (Complex.I * (Real.sqrt 3 : ℂ) / 2) • L) *
        ((-(1 / 2 : ℂ)) • (1 : Mat2) +
          star (Complex.I * (Real.sqrt 3 : ℂ) / 2) • L) =
      (1 / 4 : ℂ) • (1 : Mat2) +
        (3 / 4 : ℂ) • (L * L) := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [Matrix.mul_apply, Fin.sum_univ_two] <;>
      ring_nf <;> rw [hsqrtSq, Complex.I_sq] <;> ring
  rw [hformula] at hexpanded
  ext i j
  have hij := congrArg (fun M : Mat2 ↦ M i j) hexpanded
  simp only [Matrix.add_apply, Matrix.smul_apply] at hij
  fin_cases i <;> fin_cases j
  · norm_num at hij ⊢
    linear_combination (4 / 3 : ℂ) * hij
  · norm_num at hij ⊢
    exact hij
  · norm_num at hij ⊢
    exact hij
  · norm_num at hij ⊢
    linear_combination (4 / 3 : ℂ) * hij

/-- A Hermitian involution of order two is either scalar `±I` or traceless.
This is the finite algebraic split behind Karlsson's generic and Fourier
cases. -/
theorem hermitian_involution_scalar_or_traceless
    {L : Mat2} (hstar : Matrix.conjTranspose L = L)
    (hsquare : L * L = (1 : Mat2)) :
    L = (1 : Mat2) ∨ L = -(1 : Mat2) ∨ L 1 1 = -L 0 0 := by
  have h01 := congrArg (fun M : Mat2 ↦ M 0 1) hstar
  have h10 := congrArg (fun M : Mat2 ↦ M 1 0) hstar
  simp only [Matrix.conjTranspose_apply] at h01 h10
  have hc : L 1 0 = star (L 0 1) := by
    apply star_injective
    simpa using h01
  have hoff := congrArg (fun M : Mat2 ↦ M 0 1) hsquare
  have hoff' : L 0 0 * L 0 1 + L 0 1 * L 1 1 = 0 := by
    simpa [Matrix.mul_apply, Fin.sum_univ_two] using hoff
  have hfactor : (L 0 0 + L 1 1) * L 0 1 = 0 := by
    linear_combination hoff'
  rcases mul_eq_zero.mp hfactor with htrace | hb
  · exact Or.inr (Or.inr (by linear_combination htrace))
  · have hc0 : L 1 0 = 0 := by rw [hc, hb]; simp
    have h00 := congrArg (fun M : Mat2 ↦ M 0 0) hsquare
    have h11 := congrArg (fun M : Mat2 ↦ M 1 1) hsquare
    simp [Matrix.mul_apply, Fin.sum_univ_two, hb, hc0] at h00 h11
    rcases (sq_eq_one_iff).mp (by simpa [pow_two] using h00) with ha | ha <;>
      rcases (sq_eq_one_iff).mp (by simpa [pow_two] using h11) with hd | hd
    · left
      ext i j
      fin_cases i <;> fin_cases j <;> simp [ha, hd, hb, hc0]
    · exact Or.inr (Or.inr (by simp [ha, hd]))
    · exact Or.inr (Or.inr (by simp [ha, hd]))
    · right; left
      ext i j
      fin_cases i <;> fin_cases j <;> simp [ha, hd, hb, hc0]

/-- A traceless Hermitian involution whose off-diagonal entry vanishes is
literally one of the two diagonal sign matrices.  This removes the last
implicit description from the exceptional branch of intrinsic `H₂`
extraction. -/
theorem traceless_hermitian_involution_offdiag_zero
    {L : Mat2} (hstar : Matrix.conjTranspose L = L)
    (hsquare : L * L = (1 : Mat2))
    (htrace : L 1 1 = -L 0 0) (hoff : L 0 1 = 0) :
    L = karlssonSign2 ∨ L = -karlssonSign2 := by
  have h01 := congrArg (fun M : Mat2 ↦ M 0 1) hstar
  simp only [Matrix.conjTranspose_apply] at h01
  have h10 : L 1 0 = 0 := by
    apply star_injective
    simpa [hoff] using h01
  have h00 := congrArg (fun M : Mat2 ↦ M 0 0) hsquare
  have h00sq : L 0 0 ^ 2 = 1 := by
    simpa [Matrix.mul_apply, Fin.sum_univ_two, hoff, h10, pow_two] using h00
  rcases (sq_eq_one_iff).mp h00sq with hplus | hminus
  · left
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [karlssonSign2, hplus, htrace, hoff, h10]
  · right
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [karlssonSign2, hminus, htrace, hoff, h10]

/-- Every non-diagonal traceless Hermitian involution has Karlsson's
half-angle form with a positive finite half-angle coordinate. -/
theorem exists_karlsson_halfAngle_of_traceless_nonzero
    {L : Mat2} (hstar : Matrix.conjTranspose L = L)
    (hsquare : L * L = (1 : Mat2))
    (htrace : L 1 1 = -L 0 0) (hoff : L 0 1 ≠ 0) :
    ∃ t : ℝ, ∃ p : ℂ,
      0 < t ∧ Complex.normSq p = 1 ∧ L = karlssonLambda t p := by
  let a : ℂ := L 0 0
  let b : ℂ := L 0 1
  let u : ℝ := a.re
  let v : ℝ := Real.sqrt (Complex.normSq b)
  have haa := congrArg (fun M : Mat2 ↦ M 0 0) hstar
  simp only [Matrix.conjTranspose_apply] at haa
  have haStar : star a = a := haa
  have haIm : a.im = 0 := by
    have him := congrArg Complex.im haStar
    have him' : -a.im = a.im := by
      simpa [Complex.star_def] using him
    linarith
  have haReal : a = (u : ℂ) := by
    apply Complex.ext
    · rfl
    · simp [u, haIm]
  have h01 := congrArg (fun M : Mat2 ↦ M 0 1) hstar
  simp only [Matrix.conjTranspose_apply] at h01
  have hc : L 1 0 = star b := by
    apply star_injective
    simpa [b] using h01
  have h00 := congrArg (fun M : Mat2 ↦ M 0 0) hsquare
  simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.one_apply,
    ↓reduceIte] at h00
  have hnorm : u ^ 2 + Complex.normSq b = 1 := by
    rw [hc] at h00
    change a * a + b * star b = 1 at h00
    rw [haReal] at h00
    have hmul : b * star b = (Complex.normSq b : ℂ) := by
      simpa [Complex.star_def] using Complex.mul_conj b
    rw [hmul] at h00
    have hnormMul : u * u + Complex.normSq b = 1 := by
      exact_mod_cast h00
    simpa [pow_two] using hnormMul
  have hb0 : b ≠ 0 := by simpa [b] using hoff
  have hnormPos : 0 < Complex.normSq b := Complex.normSq_pos.2 hb0
  have hvPos : 0 < v := Real.sqrt_pos.2 hnormPos
  have hvSq : v ^ 2 = Complex.normSq b := by
    exact Real.sq_sqrt (Complex.normSq_nonneg b)
  have huLower : -1 < u := by nlinarith
  have hdenPos : 0 < 1 + u := by linarith
  let t : ℝ := v / (1 + u)
  let p : ℂ := b / (v : ℂ)
  have ht : 0 < t := div_pos hvPos hdenPos
  have hp : Complex.normSq p = 1 := by
    rw [Complex.normSq_div, Complex.normSq_ofReal, ← hvSq]
    field_simp [ne_of_gt hvPos]
  have htden : 1 + t ^ 2 ≠ 0 := by positivity
  have huFormula : (1 - t ^ 2) / (1 + t ^ 2) = u := by
    dsimp [t]
    field_simp [ne_of_gt hdenPos, htden]
    nlinarith
  have hvFormula : (2 * t) / (1 + t ^ 2) = v := by
    dsimp [t]
    field_simp [ne_of_gt hdenPos, htden]
    nlinarith
  refine ⟨t, p, ht, hp, ?_⟩
  ext i j
  fin_cases i <;> fin_cases j
  · change a = karlssonHalfAngleU t
    rw [haReal]
    change (u : ℂ) = (((1 - t ^ 2) / (1 + t ^ 2) : ℝ) : ℂ)
    exact_mod_cast huFormula.symm
  · change b = p * karlssonHalfAngleV t
    have hvFormulaC : karlssonHalfAngleV t = (v : ℂ) := by
      change (((2 * t) / (1 + t ^ 2) : ℝ) : ℂ) = (v : ℂ)
      exact_mod_cast hvFormula
    rw [hvFormulaC]
    dsimp [p]
    field_simp [ne_of_gt hvPos]
  · have hbNorm : b * star b = (v : ℂ) ^ 2 := by
      calc
        b * star b = (Complex.normSq b : ℂ) := by
          simpa [Complex.star_def] using Complex.mul_conj b
        _ = (v ^ 2 : ℝ) := by rw [hvSq]
        _ = (v : ℂ) ^ 2 := by norm_num
    change L 1 0 = karlssonHalfAngleV t / p
    rw [hc]
    have hvFormulaC : karlssonHalfAngleV t = (v : ℂ) := by
      change (((2 * t) / (1 + t ^ 2) : ℝ) : ℂ) = (v : ℂ)
      exact_mod_cast hvFormula
    rw [hvFormulaC]
    dsimp [p]
    field_simp [hb0, ne_of_gt hvPos]
    simpa [mul_comm] using hbNorm
  · change L 1 1 = -karlssonHalfAngleU t
    rw [htrace]
    change -a = -karlssonHalfAngleU t
    rw [haReal]
    have huFormulaC : karlssonHalfAngleU t = (u : ℂ) := by
      change (((1 - t ^ 2) / (1 + t ^ 2) : ℝ) : ℂ) = (u : ℂ)
      exact_mod_cast huFormula
    exact (congrArg Neg.neg huFormulaC).symm

theorem h2Parameter_eq_karlssonCoreA
    {A : Mat2} {t : ℝ} {p : ℂ}
    (hLambda : h2KarlssonLambda A = karlssonLambda t p) :
    A = karlssonCoreA t p := by
  have hU := h2KarlssonUnitary_eq_lambda A
  rw [hLambda] at hU
  have hrecover : karlssonF2 * h2KarlssonUnitary A = A := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [h2KarlssonUnitary, karlssonF2,
        Matrix.mul_apply, Matrix.vecMul, dotProduct,
        Fin.sum_univ_two] <;> ring
  rw [← hrecover]
  rw [hU]
  unfold karlssonCoreA
  rfl

theorem h2Parameter_eq_karlssonCoreB
    {A B : Mat2} {t : ℝ} {p : ℂ}
    (hsum : A + B = -karlssonF2)
    (hAcore : A = karlssonCoreA t p) :
    B = karlssonCoreB t p := by
  unfold karlssonCoreB
  ext i j
  have hij := congrArg (fun M : Mat2 ↦ M i j) hsum
  simp only [Matrix.add_apply, Matrix.neg_apply, Matrix.sub_apply] at hij ⊢
  rw [hAcore] at hij
  linear_combination hij

theorem h2BlockNormalized_core_parameterization
    {K : Mat6} (h : H2BlockNormalizedPresentation K)
    (htrace : h2KarlssonLambda (h2ParameterA K) 1 1 =
      -h2KarlssonLambda (h2ParameterA K) 0 0)
    (hoff : h2KarlssonLambda (h2ParameterA K) 0 1 ≠ 0) :
    ∃ t : ℝ, ∃ p : ℂ,
      0 < t ∧ Complex.normSq p = 1 ∧
      h2ParameterA K = karlssonCoreA t p ∧
      h2ParameterB K = karlssonCoreB t p := by
  let A := h2ParameterA K
  let B := h2ParameterB K
  have hA := h2ParameterA_rowGram_of_blockNormalized h
  have hB := h2ParameterB_rowGram_of_blockNormalized h
  have hsum := h2ParameterA_add_h2ParameterB h.canonical
  have hLstar := h2KarlssonLambda_conjTranspose hA hB hsum
  have hLsquare := h2KarlssonLambda_mul_self hA hB hsum
  rcases exists_karlsson_halfAngle_of_traceless_nonzero
      hLstar hLsquare htrace hoff with ⟨t, p, ht, hp, hL⟩
  have hAcore := h2Parameter_eq_karlssonCoreA hL
  have hBcore := h2Parameter_eq_karlssonCoreB hsum hAcore
  exact ⟨t, p, ht, hp, hAcore, hBcore⟩

/-- Once the two extracted cores have Karlsson's explicit form, the entire
canonical matrix is literally the standard division-free block matrix. -/
theorem h2BlockNormalized_eq_karlssonRawMatrix
    {K : Mat6} (h : H2BlockNormalizedPresentation K)
    {t : ℝ} {p : ℂ}
    (hAcore : h2ParameterA K = karlssonCoreA t p)
    (hBcore : h2ParameterB K = karlssonCoreB t p) :
    K = karlssonRawMatrix t p
      (h2Z₁ K) (h2Z₂ K) (h2Z₃ K) (h2Z₄ K) := by
  have hAeq := h2CoreA_reconstruct h.canonical
  have hBeq := h2CoreB_reconstruct h.canonical
  have hCeq := h2CoreC_reconstruct h.canonical
  have hDeq := h2CoreD_reconstruct h.canonical
  rw [hAcore] at hAeq
  rw [hBcore] at hBeq
  rw [h2ParameterC_eq_h2ParameterB h.canonical, hBcore] at hCeq
  rw [h2ParameterD_eq_h2ParameterA h.canonical, hAcore] at hDeq
  have hAentry (i j : I2) :
      karlssonBlockProduct (h2Z₃ K) (karlssonCoreA t p) (h2Z₁ K) i j =
        K (h2TailPairFirst i) (h2TailPairFirst j) := by
    simpa [h2CoreA] using congrArg (fun M : Mat2 ↦ M i j) hAeq
  have hBentry (i j : I2) :
      karlssonBlockProduct (h2Z₃ K) (karlssonCoreB t p) (h2Z₂ K) i j =
        K (h2TailPairFirst i) (h2TailPairSecond j) := by
    simpa [h2CoreB] using congrArg (fun M : Mat2 ↦ M i j) hBeq
  have hCentry (i j : I2) :
      karlssonBlockProduct (h2Z₄ K) (karlssonCoreB t p) (h2Z₁ K) i j =
        K (h2TailPairSecond i) (h2TailPairFirst j) := by
    simpa [h2CoreC] using congrArg (fun M : Mat2 ↦ M i j) hCeq
  have hDentry (i j : I2) :
      karlssonBlockProduct (h2Z₄ K) (karlssonCoreA t p) (h2Z₂ K) i j =
        K (h2TailPairSecond i) (h2TailPairSecond j) := by
    simpa [h2CoreD] using congrArg (fun M : Mat2 ↦ M i j) hDeq
  have hrow₁ : K (Sum.inl 1) (Sum.inr 0) =
      -K (Sum.inl 1) (Sum.inl 2) := by
    simpa [h2Tail₀, h2Tail₁] using h.canonical.row_pair₁
  have hrow₂ : K (Sum.inl 1) (Sum.inr 2) =
      -K (Sum.inl 1) (Sum.inr 1) := by
    simpa [h2Tail₂, h2Tail₃] using h.canonical.row_pair₂
  have hcol₁ : K (Sum.inr 0) (Sum.inl 1) =
      -K (Sum.inl 2) (Sum.inl 1) := by
    simpa [h2Tail₀, h2Tail₁] using h.canonical.column_pair₁
  have hcol₂ : K (Sum.inr 2) (Sum.inl 1) =
      -K (Sum.inr 1) (Sum.inl 1) := by
    simpa [h2Tail₂, h2Tail₃] using h.canonical.column_pair₂
  ext i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [karlssonRawMatrix, reindexMatrix,
      karlssonMixedChartMatrix, karlssonMixedE, karlssonMixedB,
      karlssonMixedC, karlssonMixedD, mixedLeadingBlock,
      mixedHorizontalBlock, h.canonical.dephased.1,
      h.canonical.dephased.2, h.canonical.leading_neg_one,
      h2TailPairFirst, h2TailPairSecond,
      h2Tail₀, h2Tail₁, h2Tail₂, h2Tail₃,
      hAentry, hBentry, hCentry, hDentry] <;>
    simp [h2Z₁, h2Z₂, h2Z₃, h2Z₄,
      h2Tail₀, h2Tail₂,
      hrow₁, hrow₂, hcol₁, hcol₂]

/-! ## Exhaustive intrinsic extraction

The preceding lemmas contain the complete nondegenerate parameter
extraction. The next theorem packages it without importing any published
coverage statement. Its right branch isolates exactly the diagonal core
cases that must be identified with the affine-Fourier seam. -/

/-- Raw Karlsson coordinates extracted solely from an intrinsic `H₂`
presentation. No canonical half-angle orientation or seam exclusion is
included yet. -/
structure IntrinsicKarlssonRawPresentation (H : Mat6) where
  t : ℝ
  p : ℂ
  z₁ : ℂ
  z₂ : ℂ
  z₃ : ℂ
  z₄ : ℂ
  t_pos : 0 < t
  p_unit : Complex.normSq p = 1
  z₁_unit : Complex.normSq z₁ = 1
  z₂_unit : Complex.normSq z₂ = 1
  z₃_unit : Complex.normSq z₃ = 1
  z₄_unit : Complex.normSq z₄ = 1
  equivalent_raw :
    Equivalent H (karlssonRawMatrix t p z₁ z₂ z₃ z₄)

/-- Intrinsically extracted raw coordinates in the canonical half-angle
orientation used by the finite-corner certificate. -/
structure CanonicalIntrinsicKarlssonRawPresentation (H : Mat6) extends
    IntrinsicKarlssonRawPresentation H where
  p_im_nonneg : 0 ≤ p.im
  p_ne_neg_one : p ≠ -1
  not_common_fourier : ¬ (t = 1 ∧ p = 1)

/-- The unique parameter point excluded from the regular raw chart, kept
with its four phase variables until the Hadamard equations identify the
resulting matrix with the affine-Fourier seam. -/
structure IntrinsicKarlssonCommonFourierPresentation (H : Mat6) where
  z₁ : ℂ
  z₂ : ℂ
  z₃ : ℂ
  z₄ : ℂ
  z₁_unit : Complex.normSq z₁ = 1
  z₂_unit : Complex.normSq z₂ = 1
  z₃_unit : Complex.normSq z₃ = 1
  z₄_unit : Complex.normSq z₄ = 1
  equivalent_raw :
    Equivalent H (karlssonRawMatrix 1 1 z₁ z₂ z₃ z₄)

private theorem intrinsic_normSq_one_div
    {z : ℂ} (hz : Complex.normSq z = 1) :
    Complex.normSq (1 / z) = 1 := by
  rw [one_div_eq_star_of_normSq_eq_one hz]
  simpa [Complex.star_def] using hz

private theorem canonical_raw_or_common
    {H : Mat6} (q : IntrinsicKarlssonRawPresentation H)
    (hpIm : 0 ≤ q.p.im) (hpNegOne : q.p ≠ -1) :
    Nonempty (CanonicalIntrinsicKarlssonRawPresentation H) ∨
      Nonempty (IntrinsicKarlssonCommonFourierPresentation H) := by
  by_cases hcommon : q.t = 1 ∧ q.p = 1
  · rcases hcommon with ⟨ht, hp⟩
    right
    refine ⟨⟨q.z₁, q.z₂, q.z₃, q.z₄,
      q.z₁_unit, q.z₂_unit, q.z₃_unit, q.z₄_unit, ?_⟩⟩
    simpa [ht, hp] using q.equivalent_raw
  · left
    exact ⟨⟨q, hpIm, hpNegOne, hcommon⟩⟩

/-- Canonicalize the phase orientation of an intrinsically extracted raw
presentation.  The proof uses only the explicit `p ↦ -p` matrix
equivalence; no published fundamental-domain statement is assumed. -/
theorem intrinsicKarlssonRaw_canonical_or_common
    {H : Mat6} (q : IntrinsicKarlssonRawPresentation H) :
    Nonempty (CanonicalIntrinsicKarlssonRawPresentation H) ∨
      Nonempty (IntrinsicKarlssonCommonFourierPresentation H) := by
  by_cases hpIm : 0 ≤ q.p.im
  · by_cases hpNegOne : q.p ≠ -1
    · exact canonical_raw_or_common q hpIm hpNegOne
    · have hpEq : q.p = -1 := not_ne_iff.mp hpNegOne
      let q' : IntrinsicKarlssonRawPresentation H :=
        { t := q.t
          p := -q.p
          z₁ := q.z₁
          z₂ := q.z₂
          z₃ := 1 / q.z₃
          z₄ := 1 / q.z₄
          t_pos := q.t_pos
          p_unit := by simpa using q.p_unit
          z₁_unit := q.z₁_unit
          z₂_unit := q.z₂_unit
          z₃_unit := intrinsic_normSq_one_div q.z₃_unit
          z₄_unit := intrinsic_normSq_one_div q.z₄_unit
          equivalent_raw := equivalent_trans q.equivalent_raw
            (equivalent_karlssonRawMatrix_neg_phase
              q.z₃_unit q.z₄_unit) }
      have hqIm : 0 ≤ q'.p.im := by simp [q', hpEq]
      have hqNegOne : q'.p ≠ -1 := by
        have hone : (1 : ℂ) ≠ -1 := by norm_num
        simpa [q', hpEq] using hone
      exact canonical_raw_or_common q' hqIm hqNegOne
  · have hpImLt : q.p.im < 0 := lt_of_not_ge hpIm
    let q' : IntrinsicKarlssonRawPresentation H :=
      { t := q.t
        p := -q.p
        z₁ := q.z₁
        z₂ := q.z₂
        z₃ := 1 / q.z₃
        z₄ := 1 / q.z₄
        t_pos := q.t_pos
        p_unit := by simpa using q.p_unit
        z₁_unit := q.z₁_unit
        z₂_unit := q.z₂_unit
        z₃_unit := intrinsic_normSq_one_div q.z₃_unit
        z₄_unit := intrinsic_normSq_one_div q.z₄_unit
        equivalent_raw := equivalent_trans q.equivalent_raw
          (equivalent_karlssonRawMatrix_neg_phase
            q.z₃_unit q.z₄_unit) }
    have hqIm : 0 ≤ q'.p.im := by
      simp only [q', Complex.neg_im]
      linarith
    have hqNegOne : q'.p ≠ -1 := by
      intro hneg
      have hpOne : q.p = 1 := neg_injective hneg
      rw [hpOne] at hpImLt
      norm_num at hpImLt
    exact canonical_raw_or_common q' hqIm hqNegOne

/-- The exact exceptional remainder of intrinsic core extraction. It consists
of the two scalar Hermitian involutions and the two diagonal traceless
involutions. These are the cases that must be converted to the explicit
affine-Fourier seam. -/
structure H2ExceptionalCorePresentation (H : Mat6) where
  K : Mat6
  equivalent : Equivalent H K
  normalized : H2BlockNormalizedPresentation K
  exceptional :
    h2KarlssonLambda (h2ParameterA K) = (1 : Mat2) ∨
    h2KarlssonLambda (h2ParameterA K) = -(1 : Mat2) ∨
    h2KarlssonLambda (h2ParameterA K) = karlssonSign2 ∨
    h2KarlssonLambda (h2ParameterA K) = -karlssonSign2

/-- **Intrinsic raw-coordinate extraction.** Every order-six Hadamard matrix
with an `H₂` submatrix either has explicit positive-half-angle Karlsson raw
coordinates or has one of the four exceptional cores above (two scalar and
two diagonal). This
theorem uses no published Karlsson parametrization input. -/
theorem hasHadamardTwoByTwo_intrinsic_raw_or_exceptional
    {H : Mat6} (hH : IsHadamard H)
    (hH₂ : HasHadamardTwoByTwo H) :
    Nonempty (IntrinsicKarlssonRawPresentation H) ∨
      Nonempty (H2ExceptionalCorePresentation H) := by
  rcases hasHadamardTwoByTwo_equiv_h2BlockNormalized hH hH₂ with
    ⟨K, hHK, hK⟩
  let A := h2ParameterA K
  let B := h2ParameterB K
  let L := h2KarlssonLambda A
  have hA : A * Matrix.conjTranspose A = (2 : ℂ) • (1 : Mat2) :=
    h2ParameterA_rowGram_of_blockNormalized hK
  have hB : B * Matrix.conjTranspose B = (2 : ℂ) • (1 : Mat2) :=
    h2ParameterB_rowGram_of_blockNormalized hK
  have hsum : A + B = -karlssonF2 := h2ParameterA_add_h2ParameterB hK.canonical
  have hLstar : Matrix.conjTranspose L = L :=
    h2KarlssonLambda_conjTranspose hA hB hsum
  have hLsquare : L * L = (1 : Mat2) :=
    h2KarlssonLambda_mul_self hA hB hsum
  rcases hermitian_involution_scalar_or_traceless hLstar hLsquare with
      hscalar | hscalar | htrace
  · exact Or.inr ⟨⟨K, hHK, hK, Or.inl hscalar⟩⟩
  · exact Or.inr ⟨⟨K, hHK, hK, Or.inr (Or.inl hscalar)⟩⟩
  · by_cases hoff : L 0 1 = 0
    · rcases traceless_hermitian_involution_offdiag_zero
          hLstar hLsquare htrace hoff with hdiag | hdiag
      · exact Or.inr ⟨⟨K, hHK, hK,
          Or.inr (Or.inr (Or.inl hdiag))⟩⟩
      · exact Or.inr ⟨⟨K, hHK, hK,
          Or.inr (Or.inr (Or.inr hdiag))⟩⟩
    · rcases exists_karlsson_halfAngle_of_traceless_nonzero
          hLstar hLsquare htrace hoff with ⟨t, p, ht, hp, hLambda⟩
      have hAcore : A = karlssonCoreA t p :=
        h2Parameter_eq_karlssonCoreA hLambda
      have hBcore : B = karlssonCoreB t p :=
        h2Parameter_eq_karlssonCoreB hsum hAcore
      have hKraw : K = karlssonRawMatrix t p
          (h2Z₁ K) (h2Z₂ K) (h2Z₃ K) (h2Z₄ K) :=
        h2BlockNormalized_eq_karlssonRawMatrix hK hAcore hBcore
      have hHKraw : Equivalent H (karlssonRawMatrix t p
          (h2Z₁ K) (h2Z₂ K) (h2Z₃ K) (h2Z₄ K)) := by
        rw [← hKraw]
        exact hHK
      exact Or.inl ⟨⟨t, p, h2Z₁ K, h2Z₂ K, h2Z₃ K, h2Z₄ K,
        ht, hp, hK.canonical.z₁_unit, hK.canonical.z₂_unit,
        hK.canonical.z₃_unit, hK.canonical.z₄_unit, hHKraw⟩⟩

/-- **Canonical intrinsic `H₂` trichotomy.** Every `H₂`-reducible
order-six Hadamard matrix has regular canonical Karlsson coordinates, lies
at the single common Fourier parameter point, or has one of the four
explicit diagonal seam cores.  No published Karlsson coverage theorem is
used. -/
theorem hasHadamardTwoByTwo_canonical_raw_or_seam_remainder
    {H : Mat6} (hH : IsHadamard H)
    (hH₂ : HasHadamardTwoByTwo H) :
    Nonempty (CanonicalIntrinsicKarlssonRawPresentation H) ∨
      Nonempty (IntrinsicKarlssonCommonFourierPresentation H) ∨
      Nonempty (H2ExceptionalCorePresentation H) := by
  rcases hasHadamardTwoByTwo_intrinsic_raw_or_exceptional hH hH₂ with
      hraw | hexceptional
  · rcases hraw with ⟨q⟩
    rcases intrinsicKarlssonRaw_canonical_or_common q with
        hcanonical | hcommon
    · exact Or.inl hcanonical
    · exact Or.inr (Or.inl hcommon)
  · exact Or.inr (Or.inr hexceptional)

/-- Forget the derivation history of canonical intrinsic coordinates and
expose exactly the raw tuple consumed by the finite-corner theorem. -/
def CanonicalIntrinsicKarlssonRawPresentation.toCanonicalRaw
    {H : Mat6} (q : CanonicalIntrinsicKarlssonRawPresentation H) :
    CanonicalKarlssonRawPresentation H :=
  { t := q.t
    p := q.p
    z₁ := q.z₁
    z₂ := q.z₂
    z₃ := q.z₃
    z₄ := q.z₄
    t_pos := q.t_pos
    p_unit := q.p_unit
    p_im_nonneg := q.p_im_nonneg
    p_ne_neg_one := q.p_ne_neg_one
    not_common_fourier := q.not_common_fourier
    z₁_unit := q.z₁_unit
    z₂_unit := q.z₂_unit
    z₃_unit := q.z₃_unit
    z₄_unit := q.z₄_unit
    equivalent_raw := q.equivalent_raw }

/-- The only remaining bridge needed to turn the intrinsic derivation into
Karlsson's complete published coordinate statement.  Both clauses are
explicit seam-identification problems; the broad `H₂` coverage and all
regular-coordinate extraction have already been proved above. -/
def IntrinsicKarlssonSeamIdentification : Prop :=
  (∀ H : Mat6, IsHadamard H →
    Nonempty (IntrinsicKarlssonCommonFourierPresentation H) →
    IsAffineFourierSeam H) ∧
  (∀ H : Mat6, IsHadamard H →
    Nonempty (H2ExceptionalCorePresentation H) →
    IsAffineFourierSeam H)

/-- The published Karlsson parametrization follows from the internal
normalization and extraction proof plus only the explicit seam bridge. -/
theorem karlssonRawOrSeamCoverage_of_intrinsic_seam
    (hseam : IntrinsicKarlssonSeamIdentification) :
    KarlssonRawOrSeamCoverage := by
  intro H hH hH₂
  rcases hasHadamardTwoByTwo_canonical_raw_or_seam_remainder hH hH₂ with
      hcanonical | hcommon | hexceptional
  · rcases hcanonical with ⟨q⟩
    exact Or.inl ⟨q.toCanonicalRaw⟩
  · exact Or.inr (hseam.1 H hH hcommon)
  · exact Or.inr (hseam.2 H hH hexceptional)

end

end Hadamard6
