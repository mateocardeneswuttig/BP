import Hadamard6.KarlssonFourierSeam
import Hadamard6.TaoAtlas
import Mathlib.Tactic

/-!
# Kernel certificate for the affine-Fourier seam

This file is the Lean audit trail for the finite six-corner calculation in
the paper.  It deliberately treats only the exceptional affine-Fourier seam;
the regular Karlsson chart is proved separately in `KarlssonMixedBlocks`.
-/

namespace Hadamard6

noncomputable section

private abbrev s3 : ℝ := Real.sqrt 3

/-- The real Cayley chart on the unit circle, missing only `-1`. -/
noncomputable def seamCayley (x : ℝ) : ℂ :=
  ((1 : ℂ) + Complex.I * (x : ℂ)) /
    ((1 : ℂ) - Complex.I * (x : ℂ))

private theorem s3_sq : s3 ^ 2 = 3 :=
  Real.sq_sqrt (by norm_num)

private theorem s3_pos : 0 < s3 :=
  Real.sqrt_pos.2 (by norm_num)

private theorem s3_pow3 : s3 ^ 3 = 3 * s3 := by
  calc s3 ^ 3 = s3 ^ 2 * s3 := by ring
       _ = 3 * s3 := by rw [s3_sq]

private theorem s3_pow4 : s3 ^ 4 = 9 := by
  calc s3 ^ 4 = (s3 ^ 2) ^ 2 := by ring
       _ = 9 := by rw [s3_sq]; norm_num

private theorem s3_pow5 : s3 ^ 5 = 9 * s3 := by
  calc s3 ^ 5 = (s3 ^ 2) ^ 2 * s3 := by ring
       _ = 9 * s3 := by rw [s3_sq]; norm_num

private theorem s3_pow6 : s3 ^ 6 = 27 := by
  calc s3 ^ 6 = (s3 ^ 2) ^ 3 := by ring
       _ = 27 := by rw [s3_sq]; norm_num

private theorem s3_pow7 : s3 ^ 7 = 27 * s3 := by
  calc s3 ^ 7 = (s3 ^ 2) ^ 3 * s3 := by ring
       _ = 27 * s3 := by rw [s3_sq]; norm_num

private theorem s3_pow8 : s3 ^ 8 = 81 := by
  calc s3 ^ 8 = (s3 ^ 2) ^ 4 := by ring
       _ = 81 := by rw [s3_sq]; norm_num

private theorem s3_pow9 : s3 ^ 9 = 81 * s3 := by
  calc s3 ^ 9 = (s3 ^ 2) ^ 4 * s3 := by ring
       _ = 81 * s3 := by rw [s3_sq]; norm_num

private theorem s3_pow10 : s3 ^ 10 = 243 := by
  calc s3 ^ 10 = (s3 ^ 2) ^ 5 := by ring
       _ = 243 := by rw [s3_sq]; norm_num

theorem seamCayley_normSq (x : ℝ) :
    Complex.normSq (seamCayley x) = 1 := by
  have hn : Complex.normSq
      ((1 : ℂ) + Complex.I * (x : ℂ)) = 1 + x ^ 2 := by
    simp [Complex.normSq_apply, Complex.mul_re, Complex.mul_im]
    ring
  have hd : Complex.normSq
      ((1 : ℂ) - Complex.I * (x : ℂ)) = 1 + x ^ 2 := by
    simp [Complex.normSq_apply, Complex.mul_re, Complex.mul_im]
    ring
  rw [seamCayley, Complex.normSq_div, hn, hd]
  exact div_self (by nlinarith [sq_nonneg x])

/-- Every unit phase other than `-1` has a real Cayley coordinate. -/
theorem exists_seamCayley_of_normSq_one {z : ℂ}
    (hz : Complex.normSq z = 1) (hne : z ≠ -1) :
    ∃ x : ℝ, z = seamCayley x := by
  have hcoords : z.re ^ 2 + z.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hz
  have hden : 1 + z.re ≠ 0 := by
    intro hzero
    have hre : z.re = -1 := by linarith
    have him : z.im = 0 := by nlinarith [sq_nonneg z.im]
    apply hne
    apply Complex.ext <;> norm_num [hre, him]
  let x : ℝ := z.im / (1 + z.re)
  refine ⟨x, ?_⟩
  have hdenComplex : (1 : ℂ) - Complex.I * (x : ℂ) ≠ 0 := by
    intro hzero
    have hre := congrArg Complex.re hzero
    norm_num [Complex.mul_re] at hre
  rw [seamCayley, eq_div_iff hdenComplex]
  apply Complex.ext
  · simp only [Complex.mul_re, Complex.mul_im, Complex.sub_re,
      Complex.sub_im, Complex.add_re, Complex.one_re, Complex.one_im,
      Complex.I_re, Complex.I_im, Complex.ofReal_re, Complex.ofReal_im]
    ring_nf
    dsimp [x]
    field_simp [hden]
    nlinarith
  · simp only [Complex.mul_re, Complex.mul_im, Complex.sub_re,
      Complex.sub_im, Complex.add_im, Complex.one_re, Complex.one_im,
      Complex.I_re, Complex.I_im, Complex.ofReal_re, Complex.ofReal_im]
    ring_nf
    dsimp [x]
    field_simp [hden]
    ring

private theorem seamMinusDen_ne (x : ℝ) :
    (1 : ℂ) - Complex.I * (x : ℂ) ≠ 0 := by
  intro h
  have hre := congrArg Complex.re h
  norm_num [Complex.mul_re] at hre

private theorem seamPlusDen_ne (x : ℝ) :
    (1 : ℂ) + Complex.I * (x : ℂ) ≠ 0 := by
  intro h
  have hre := congrArg Complex.re h
  norm_num [Complex.mul_re] at hre

private theorem star_seamCayley (x : ℝ) :
    star (seamCayley x) =
      ((1 : ℂ) - Complex.I * (x : ℂ)) /
        ((1 : ℂ) + Complex.I * (x : ℂ)) := by
  simp [seamCayley, star_div, star_add, star_sub, star_mul,
    Complex.star_def]
  ring

private noncomputable def seamCayleyCoord (x : ℝ) : ℂ :=
  ⟨(1 - x ^ 2) / (1 + x ^ 2), (2 * x) / (1 + x ^ 2)⟩

private theorem seamCayley_eq_coordinates (x : ℝ) :
    seamCayley x = seamCayleyCoord x := by
  have hden : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  rw [seamCayley]
  apply (div_eq_iff (seamMinusDen_ne x)).2
  apply Complex.ext <;>
    simp [seamCayleyCoord, Complex.mul_re, Complex.mul_im] <;>
    field_simp [hden] <;> ring

private theorem seamCayley_zero : seamCayley 0 = 1 := by
  norm_num [seamCayley]

private theorem seamCayley_s3 : seamCayley s3 = standardOmega := by
  rw [seamCayley_eq_coordinates]
  apply Complex.ext <;>
    simp [seamCayleyCoord, standardOmega] <;>
    field_simp <;> nlinarith [s3_sq]

private theorem seamCayley_neg_s3 : seamCayley (-s3) = standardOmega ^ 2 := by
  rw [seamCayley_eq_coordinates]
  apply Complex.ext <;>
    simp [seamCayleyCoord, standardOmega, pow_two,
      Complex.mul_re, Complex.mul_im] <;>
    field_simp <;> nlinarith [s3_sq]

private theorem seamCayley_neg_third_s3 :
    seamCayley (-s3 / 3) = -standardOmega := by
  rw [seamCayley_eq_coordinates]
  apply Complex.ext <;>
    simp [seamCayleyCoord, standardOmega] <;>
    field_simp <;> nlinarith [s3_sq]

private theorem seamCayley_third_s3 :
    seamCayley (s3 / 3) = -(standardOmega ^ 2) := by
  rw [seamCayley_eq_coordinates]
  apply Complex.ext <;>
    simp [seamCayleyCoord, standardOmega, pow_two,
      Complex.mul_re, Complex.mul_im] <;>
    field_simp <;> nlinarith [s3_sq]

/-- The first displayed positional corner, after its canonical dephasing. -/
def firstSeamChart (omega z₁ z₂ : ℂ) : Mat6 :=
  Matrix.fromBlocks
    !![1, 1, 1;
       1, z₁, z₂;
       1, omega, omega ^ 2]
    !![1, 1, 1;
       -1, -z₁, -z₂;
       1, omega, omega ^ 2]
    !![1, omega * z₁, omega ^ 2 * z₂;
       1, omega ^ 2, omega;
       1, omega ^ 2 * z₁, omega * z₂]
    !![-1, -(omega * z₁), -(omega ^ 2 * z₂);
       1, omega ^ 2, omega;
       -1, -(omega ^ 2 * z₁), -(omega * z₂)]

theorem seamCornerChart_zero_zero_eq
    {omega z₁ z₂ : ℂ} (homega : IsPrimitiveCubicPhase omega)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    seamCornerChart 0 0 (affineFourierMatrix omega z₁ z₂) =
      firstSeamChart omega z₁ z₂ := by
  have hreindex :
      reindexMatrix (seamRowPermutation 0) (seamColumnPermutation 0)
          (affineFourierMatrix omega z₁ z₂) =
        firstSeamChart omega z₁ z₂ := by
    rcases seamColumns024_order with
      ⟨hc0, hc1, hc2, hc3, hc4, hc5⟩
    ext i j
    rcases i with i | i <;> rcases j with j | j <;>
      fin_cases i <;> fin_cases j <;>
      simp [reindexMatrix, seamRowPermutation, seamColumnPermutation,
        seamRows012, hc0, hc1, hc2, hc3, hc4, hc5,
        affineFourierMatrix, firstSeamChart] <;> ring
  rw [seamCornerChart, hreindex]
  have hstarOmega : star omega = omega ^ 2 :=
    primitiveCubicPhase_star homega
  have hstarOmegaSq : star (omega ^ 2) = omega := by
    rw [star_pow, hstarOmega]
    calc
      (omega ^ 2) ^ 2 = omega * omega ^ 3 := by ring
      _ = omega := by rw [primitiveCubicPhase_cube homega, mul_one]
  have hstarZ₁ : star z₁ * z₁ = 1 :=
    star_mul_self_of_normSq_one hz₁
  have hstarZ₂ : star z₂ * z₂ = 1 :=
    star_mul_self_of_normSq_one hz₂
  ext i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [dephase, phaseTransform, dephaseRowFactor, dephaseColumnFactor,
      firstSeamChart, hstarOmega, hstarOmegaSq] <;>
    ring_nf <;>
    simp [hstarZ₁, hstarZ₂, primitiveCubicPhase_cube homega]

private def seamA (x y : ℝ) : ℝ :=
  x ^ 2 * y ^ 2 + x ^ 2 + 8 * x * y + y ^ 2 + 9

private def seamQminus (x y : ℝ) : ℝ :=
  x ^ 2 * y ^ 2 - s3 * x ^ 2 * y + x ^ 2 +
    s3 * x * y ^ 2 - x * y + y ^ 2

private def seamQplus (x y : ℝ) : ℝ :=
  x ^ 2 * y ^ 2 + s3 * x ^ 2 * y + x ^ 2 -
    s3 * x * y ^ 2 - x * y + y ^ 2

private def seamLminus (x y : ℝ) : ℝ :=
  x * y - s3 * x / 3 + s3 * y / 3 + 1

private def seamLplus (x y : ℝ) : ℝ :=
  x * y + s3 * x / 3 - s3 * y / 3 + 1

private theorem seamA_eq_sumsq (x y : ℝ) :
    seamA x y = (x * y + 3) ^ 2 + (x + y) ^ 2 := by
  simp [seamA]
  ring

private theorem seamQminus_sumsq (x y : ℝ) :
    4 * (y ^ 2 - s3 * y + 1) * seamQminus x y =
      (2 * (y ^ 2 - s3 * y + 1) * x + (s3 * y ^ 2 - y)) ^ 2 +
        (y * (y - s3)) ^ 2 := by
  simp [seamQminus]
  ring_nf
  rw [s3_sq]
  ring

private theorem seamQminus_zero_cases {x y : ℝ}
    (h : seamQminus x y = 0) :
    (x = 0 ∧ y = 0) ∨ (x = -s3 ∧ y = s3) := by
  have hid := seamQminus_sumsq x y
  rw [h] at hid
  have hlinear :
      2 * (y ^ 2 - s3 * y + 1) * x + (s3 * y ^ 2 - y) = 0 := by
    nlinarith [sq_nonneg
      (2 * (y ^ 2 - s3 * y + 1) * x + (s3 * y ^ 2 - y)),
      sq_nonneg (y * (y - s3))]
  have hyprod : y * (y - s3) = 0 := by
    nlinarith [sq_nonneg
      (2 * (y ^ 2 - s3 * y + 1) * x + (s3 * y ^ 2 - y)),
      sq_nonneg (y * (y - s3))]
  rcases mul_eq_zero.mp hyprod with hy | hy
  · left
    constructor
    · simp [hy] at hlinear
      linarith
    · exact hy
  · right
    have hy' : y = s3 := by linarith
    constructor
    · rw [hy'] at hlinear
      have hcub : s3 ^ 3 = 3 * s3 := by
        calc
          s3 ^ 3 = s3 * s3 ^ 2 := by ring
          _ = 3 * s3 := by rw [s3_sq]; ring
      nlinarith [s3_sq, hcub]
    · exact hy'

private theorem seamQplus_zero_cases {x y : ℝ}
    (h : seamQplus x y = 0) :
    (x = 0 ∧ y = 0) ∨ (x = s3 ∧ y = -s3) := by
  have hminus : seamQminus (-x) (-y) = 0 := by
    have heq : seamQminus (-x) (-y) = seamQplus x y := by
      simp [seamQplus, seamQminus]
      ring
    rw [heq, h]
  rcases seamQminus_zero_cases hminus with hzero | hs
  · left
    constructor <;> linarith [hzero.1, hzero.2]
  · right
    constructor <;> linarith [hs.1, hs.2]

private theorem seamA_zero_cases {x y : ℝ} (h : seamA x y = 0) :
    (x = s3 ∧ y = -s3) ∨ (x = -s3 ∧ y = s3) := by
  rw [seamA_eq_sumsq] at h
  have hxy : x * y + 3 = 0 := by
    nlinarith [sq_nonneg (x * y + 3), sq_nonneg (x + y)]
  have hsum : x + y = 0 := by
    nlinarith [sq_nonneg (x * y + 3), sq_nonneg (x + y)]
  have hsquare : x ^ 2 = 3 := by nlinarith
  have hfactor : (x - s3) * (x + s3) = 0 := by
    nlinarith [s3_sq]
  rcases mul_eq_zero.mp hfactor with hx | hx
  · left
    constructor <;> linarith
  · right
    constructor <;> linarith

/-- Cleared exact determinant formula for the first seam corner. -/
private theorem firstSeam_detE_cayley_clear (x y : ℝ) :
    (((x : ℂ) + Complex.I) * ((y : ℂ) + Complex.I)) *
        (Matrix.toBlocks₁₁
          (firstSeamChart standardOmega (seamCayley x)
            (seamCayley y))).det =
      (-(s3 : ℂ) * ((x : ℂ) + (y : ℂ))) +
        Complex.I * (2 * (s3 : ℂ) *
          ((x : ℂ) * (y : ℂ) +
            (s3 : ℂ) * ((x : ℂ) - (y : ℂ)) / 2)) := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  apply Complex.ext <;>
    simp [firstSeamChart, standardOmega, Matrix.det_fin_three,
      seamCayleyCoord, pow_two, Complex.mul_re, Complex.mul_im] <;>
    field_simp [hx, hy] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4] <;> ring

private theorem firstSeam_detB_cayley_clear (x y : ℝ) :
    (((x : ℂ) + Complex.I) * ((y : ℂ) + Complex.I)) *
        (Matrix.toBlocks₁₂
          (firstSeamChart standardOmega (seamCayley x)
            (seamCayley y))).det =
      ((s3 : ℂ) * ((x : ℂ) + (y : ℂ))) -
        Complex.I * (2 * (s3 : ℂ) *
          ((x : ℂ) * (y : ℂ) +
            (s3 : ℂ) * ((x : ℂ) - (y : ℂ)) / 2)) := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  apply Complex.ext <;>
    simp [firstSeamChart, standardOmega, Matrix.det_fin_three,
      seamCayleyCoord, pow_two, Complex.mul_re, Complex.mul_im] <;>
    field_simp [hx, hy] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4] <;> ring

private theorem firstSeam_detC_cayley_clear (x y : ℝ) :
    (((x : ℂ) + Complex.I) * ((y : ℂ) + Complex.I)) *
        (Matrix.toBlocks₂₁
          (firstSeamChart standardOmega (seamCayley x)
            (seamCayley y))).det =
      ((s3 : ℂ) * ((x : ℂ) + (y : ℂ))) +
        Complex.I * (2 * (s3 : ℂ) *
          ((x : ℂ) * (y : ℂ) +
            (s3 : ℂ) * ((x : ℂ) - (y : ℂ)) / 2)) := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  apply Complex.ext <;>
    simp [firstSeamChart, standardOmega, Matrix.det_fin_three,
      seamCayleyCoord, pow_two, Complex.mul_re, Complex.mul_im] <;>
    field_simp [hx, hy] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4] <;> ring

private def seamP_B0 (z₁ z₂ : ℂ) : ℂ :=
  (z₁ * z₂ + z₁ + z₂) *
    (z₁ * z₂ + standardOmega ^ 2 * z₁ + standardOmega * z₂)

private def seamP_B3 (z₁ z₂ : ℂ) : ℂ :=
  (z₁ * z₂ + z₁ + z₂) ^ 2 *
    (standardOmega ^ 2 * z₁ + standardOmega * z₂ + 1)

private def seamP_Bswap0 (z₁ z₂ : ℂ) : ℂ :=
  -(z₁ * z₂ + z₁ + z₂) *
    (-z₁ ^ 2 + (2 * standardOmega + 1) * z₁ ^ 2 +
      4 * z₁ * z₂ - 2 * z₁ -
      2 * (2 * standardOmega + 1) * z₁ - z₂ ^ 2 -
      (2 * standardOmega + 1) * z₂ ^ 2 - 2 * z₂ +
      2 * (2 * standardOmega + 1) * z₂ + 2) / 2

private def seamK : ℂ := 2 * standardOmega + 1

private def seamP_C0 (z₁ z₂ : ℂ) : ℂ :=
  3 * z₁ ^ 2 * z₂ - z₁ * z₂ ^ 3 + z₁ * z₂ ^ 2 -
    seamK * z₁ * z₂ ^ 2 + z₁ * z₂ + seamK * z₁ * z₂ -
    z₁ - z₂ ^ 3 - seamK * z₂ ^ 3 - z₂ ^ 2 - z₂ + seamK * z₂

private def seamP_C3 (z₁ z₂ : ℂ) : ℂ :=
  z₁ ^ 3 - 3 * z₁ ^ 2 * z₂ ^ 2 - z₁ ^ 2 * z₂ +
    seamK * z₁ ^ 2 * z₂ + z₁ ^ 2 + seamK * z₁ ^ 2 -
    z₁ * z₂ ^ 2 - seamK * z₁ * z₂ ^ 2 + z₁ * z₂ +
    z₂ ^ 3 + z₂ ^ 2 - seamK * z₂ ^ 2

private def seamP_Cswap0 (z₁ z₂ : ℂ) : ℂ :=
  -(z₁ ^ 3 * z₂ + z₁ ^ 3 - seamK * z₁ ^ 3 -
    z₁ ^ 2 * z₂ - seamK * z₁ ^ 2 * z₂ + z₁ ^ 2 -
    3 * z₁ * z₂ ^ 2 - z₁ * z₂ + seamK * z₁ * z₂ +
    z₁ + seamK * z₁ + z₂)

private theorem firstSeam_B0_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ ^ 2 * z₂ ^ 2 *
        rowEndpoint0 (Matrix.toBlocks₁₂
          (firstSeamChart standardOmega z₁ z₂)) =
      3 * seamP_B0 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ := by
    exact (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ := by
    exact (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint0_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, seamP_B0, fibreS, fibreT, fibreR,
    hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem firstSeam_B3_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ ^ 2 * z₂ ^ 2 *
        rowEndpoint3 (Matrix.toBlocks₁₂
          (firstSeamChart standardOmega z₁ z₂)) =
      seamP_B3 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ := by
    exact (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ := by
    exact (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint3_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, seamP_B3, fibreS, fibreT, fibreR,
    hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem firstSeam_Bswap0_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ * z₂ *
        rowEndpoint0 (swapNoninitialRows (Matrix.toBlocks₁₂
          (firstSeamChart standardOmega z₁ z₂))) =
      seamP_Bswap0 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint0_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, swapNoninitialRows, seamP_Bswap0,
    fibreS, fibreT, fibreR, hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem firstSeam_C0_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ ^ 2 * z₂ *
        rowEndpoint0 ((Matrix.toBlocks₂₁
          (firstSeamChart standardOmega z₁ z₂)).transpose) =
      seamP_C0 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint0_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, seamP_C0, seamK, fibreS, fibreT, fibreR,
    hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem firstSeam_C3_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ ^ 2 * z₂ ^ 2 *
        rowEndpoint3 ((Matrix.toBlocks₂₁
          (firstSeamChart standardOmega z₁ z₂)).transpose) =
      seamP_C3 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint3_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, seamP_C3, seamK, fibreS, fibreT, fibreR,
    hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem firstSeam_Cswap0_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ * z₂ ^ 2 *
        rowEndpoint0 (swapNoninitialRows ((Matrix.toBlocks₂₁
          (firstSeamChart standardOmega z₁ z₂)).transpose)) =
      seamP_Cswap0 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint0_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, swapNoninitialRows, seamP_Cswap0, seamK,
    fibreS, fibreT, fibreR, hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_two, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem firstSeam_Bswap3_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ ^ 2 * z₂ ^ 2 *
        rowEndpoint3 (swapNoninitialRows (Matrix.toBlocks₁₂
          (firstSeamChart standardOmega z₁ z₂))) =
      seamP_B3 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint3_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, swapNoninitialRows, seamP_B3,
    fibreS, fibreT, fibreR, hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem firstSeam_Cswap3_formula {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    z₁ ^ 2 * z₂ ^ 2 *
        rowEndpoint3 (swapNoninitialRows ((Matrix.toBlocks₂₁
          (firstSeamChart standardOmega z₁ z₂)).transpose)) =
      seamP_C3 z₁ z₂ := by
  have hs1 : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hs2 : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  rw [rowEndpoint3_eq_fibreData _ (by intro j; fin_cases j <;> rfl)]
  simp [firstSeamChart, swapNoninitialRows, seamP_C3, seamK,
    fibreS, fibreT, fibreR, hs1, hs2, standardOmega, Complex.star_def]
  field_simp [ne_zero_of_normSq_eq_one hz₁,
    ne_zero_of_normSq_eq_one hz₂]
  apply Complex.ext <;>
    simp [standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

private def seamDen (x : ℝ) : ℂ :=
  1 - Complex.I * (x : ℂ)

set_option maxRecDepth 100000 in
private theorem seamP_B0_pullback_norm (x y : ℝ) :
    Complex.normSq
        (seamDen x ^ 2 * seamDen y ^ 2 *
          seamP_B0 (seamCayley x) (seamCayley y)) =
      4 * seamA x y * seamQminus x y := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  simp [seamDen, seamP_B0, seamCayleyCoord, seamA, seamQminus,
    standardOmega, Complex.normSq_apply, pow_succ,
    Complex.mul_re, Complex.mul_im]
  field_simp [hx, hy]
  ring_nf
  simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
    s3_pow7, s3_pow8, s3_pow9, s3_pow10]
  ring

set_option maxRecDepth 100000 in
private theorem seamP_B3_pullback_norm (x y : ℝ) :
    Complex.normSq
        (seamDen x ^ 3 * seamDen y ^ 3 *
          seamP_B3 (seamCayley x) (seamCayley y)) =
      4 * seamA x y ^ 2 * seamQminus x y := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  simp [seamDen, seamP_B3, seamCayleyCoord, seamA, seamQminus,
    standardOmega, Complex.normSq_apply, pow_succ,
    Complex.mul_re, Complex.mul_im]
  field_simp [hx, hy]
  ring_nf
  simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
    s3_pow7, s3_pow8, s3_pow9, s3_pow10]
  ring

set_option maxRecDepth 100000 in
private theorem seamP_Bswap0_pullback_norm (x y : ℝ) :
    Complex.normSq
        (seamDen x ^ 3 * seamDen y ^ 3 *
          seamP_Bswap0 (seamCayley x) (seamCayley y)) =
      16 * seamA x y * seamQminus x y ^ 2 := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  simp [seamDen, seamP_Bswap0, seamCayleyCoord, seamA, seamQminus,
    standardOmega, Complex.normSq_apply, pow_succ,
    Complex.mul_re, Complex.mul_im]
  field_simp [hx, hy]
  ring_nf
  simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
    s3_pow7, s3_pow8, s3_pow9, s3_pow10]
  ring

set_option maxRecDepth 100000 in
private theorem seamP_C0_pullback (x y : ℝ) :
    seamDen x ^ 2 * seamDen y ^ 3 *
        seamP_C0 (seamCayley x) (seamCayley y) =
      ⟨2 * s3 * y * (x + s3) * (y + s3) * seamLminus x y,
        2 * (y - s3) ^ 2 * (x ^ 2 * y + 2 * x - y)⟩ := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  apply Complex.ext <;>
    simp [seamDen, seamP_C0, seamK, seamLminus, seamCayleyCoord,
      standardOmega, pow_succ, Complex.mul_re, Complex.mul_im] <;>
    field_simp [hx, hy] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem seamP_C3_pullback (x y : ℝ) :
    seamDen x ^ 3 * seamDen y ^ 3 *
        seamP_C3 (seamCayley x) (seamCayley y) =
      ⟨2 * s3 * (x + s3) * (x - y) * (y - s3) * seamLplus x y,
        -(6 * (x + y) * seamLminus x y ^ 2)⟩ := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  apply Complex.ext <;>
    simp [seamDen, seamP_C3, seamK, seamLminus, seamLplus,
      seamCayleyCoord, standardOmega, pow_succ,
      Complex.mul_re, Complex.mul_im] <;>
    field_simp [hx, hy] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

set_option maxRecDepth 100000 in
private theorem seamP_Cswap0_pullback (x y : ℝ) :
    seamDen x ^ 3 * seamDen y ^ 2 *
        seamP_Cswap0 (seamCayley x) (seamCayley y) =
      ⟨-(2 * s3 * x * (x - s3) * (y - s3) * seamLminus x y),
        2 * (x + s3) ^ 2 * (x * y ^ 2 - x + 2 * y)⟩ := by
  rw [seamCayley_eq_coordinates, seamCayley_eq_coordinates]
  have hx : 1 + x ^ 2 ≠ 0 := by nlinarith [sq_nonneg x]
  have hy : 1 + y ^ 2 ≠ 0 := by nlinarith [sq_nonneg y]
  apply Complex.ext <;>
    simp [seamDen, seamP_Cswap0, seamK, seamLminus,
      seamCayleyCoord, standardOmega, pow_succ,
      Complex.mul_re, Complex.mul_im] <;>
    field_simp [hx, hy] <;>
    ring_nf <;>
    simp only [s3_sq, s3_pow3, s3_pow4, s3_pow5, s3_pow6,
      s3_pow7, s3_pow8, s3_pow9, s3_pow10] <;> ring

/-- The six finite Cayley pairs at which the first seam corner can fail. -/
private def FirstSeamExceptional (x y : ℝ) : Prop :=
  (x = 0 ∧ y = 0) ∨
  (x = s3 ∧ y = -s3) ∨
  (x = -s3 ∧ y = s3) ∨
  (x = -s3 / 3 ∧ y = -s3) ∨
  (x = -s3 / 3 ∧ y = s3 / 3) ∨
  (x = s3 ∧ y = s3 / 3)

private theorem determinant_equations_exceptional {x y : ℝ}
    (hsum : x + y = 0)
    (hq : x * y + s3 * (x - y) / 2 = 0) :
    FirstSeamExceptional x y := by
  have hy : y = -x := by linarith
  have hfactor : x * (x - s3) = 0 := by
    calc
      x * (x - s3) =
          -(x * y + s3 * (x - y) / 2) := by rw [hy]; ring
      _ = 0 := by rw [hq]; ring
  rcases mul_eq_zero.mp hfactor with hx | hx
  · exact Or.inl ⟨hx, by linarith⟩
  · have hxs : x = s3 := sub_eq_zero.mp hx
    exact Or.inr (Or.inl ⟨hxs, by rw [hxs] at hsum; linarith⟩)

private theorem firstSeam_detE_zero_cases {x y : ℝ}
    (h : (Matrix.toBlocks₁₁
      (firstSeamChart standardOmega (seamCayley x) (seamCayley y))).det = 0) :
    FirstSeamExceptional x y := by
  have hid := firstSeam_detE_cayley_clear x y
  rw [h, mul_zero] at hid
  have hmk : (0 : ℂ) =
      ⟨-s3 * (x + y),
        2 * s3 * (x * y + s3 * (x - y) / 2)⟩ := by
    convert hid using 1 <;>
      apply Complex.ext <;>
      simp [Complex.mul_re, Complex.mul_im] <;> ring
  have hre := congrArg Complex.re hmk
  have him := congrArg Complex.im hmk
  have hsum : x + y = 0 := by
    change 0 = -s3 * (x + y) at hre
    have := (mul_eq_zero.mp hre.symm).resolve_left (by nlinarith [s3_pos])
    linarith
  have hq : x * y + s3 * (x - y) / 2 = 0 := by
    change 0 = 2 * s3 * (x * y + s3 * (x - y) / 2) at him
    rcases mul_eq_zero.mp him.symm with hleft | hq
    · rcases mul_eq_zero.mp hleft with htwo | hs
      · norm_num at htwo
      · exact (ne_of_gt s3_pos hs).elim
    · exact hq
  exact determinant_equations_exceptional hsum hq

private theorem firstSeam_detB_zero_cases {x y : ℝ}
    (h : (Matrix.toBlocks₁₂
      (firstSeamChart standardOmega (seamCayley x) (seamCayley y))).det = 0) :
    FirstSeamExceptional x y := by
  have hid := firstSeam_detB_cayley_clear x y
  rw [h, mul_zero] at hid
  have hmk : (0 : ℂ) =
      ⟨s3 * (x + y),
        -(2 * s3 * (x * y + s3 * (x - y) / 2))⟩ := by
    convert hid using 1 <;>
      apply Complex.ext <;>
      simp [Complex.mul_re, Complex.mul_im] <;> ring
  have hre := congrArg Complex.re hmk
  have him := congrArg Complex.im hmk
  have hsum : x + y = 0 := by
    change 0 = s3 * (x + y) at hre
    exact (mul_eq_zero.mp hre.symm).resolve_left (ne_of_gt s3_pos)
  have hq : x * y + s3 * (x - y) / 2 = 0 := by
    change 0 = -(2 * s3 * (x * y + s3 * (x - y) / 2)) at him
    have hz : 2 * s3 * (x * y + s3 * (x - y) / 2) = 0 := by linarith
    rcases mul_eq_zero.mp hz with hleft | hq
    · rcases mul_eq_zero.mp hleft with htwo | hs
      · norm_num at htwo
      · exact (ne_of_gt s3_pos hs).elim
    · exact hq
  exact determinant_equations_exceptional hsum hq

private theorem firstSeam_detC_zero_cases {x y : ℝ}
    (h : (Matrix.toBlocks₂₁
      (firstSeamChart standardOmega (seamCayley x) (seamCayley y))).det = 0) :
    FirstSeamExceptional x y := by
  have hid := firstSeam_detC_cayley_clear x y
  rw [h, mul_zero] at hid
  have hmk : (0 : ℂ) =
      ⟨s3 * (x + y),
        2 * s3 * (x * y + s3 * (x - y) / 2)⟩ := by
    convert hid using 1 <;>
      apply Complex.ext <;>
      simp [Complex.mul_re, Complex.mul_im] <;> ring
  have hre := congrArg Complex.re hmk
  have him := congrArg Complex.im hmk
  have hsum : x + y = 0 := by
    change 0 = s3 * (x + y) at hre
    exact (mul_eq_zero.mp hre.symm).resolve_left (ne_of_gt s3_pos)
  have hq : x * y + s3 * (x - y) / 2 = 0 := by
    change 0 = 2 * s3 * (x * y + s3 * (x - y) / 2) at him
    rcases mul_eq_zero.mp him.symm with hleft | hq
    · rcases mul_eq_zero.mp hleft with htwo | hs
      · norm_num at htwo
      · exact (ne_of_gt s3_pos hs).elim
    · exact hq
  exact determinant_equations_exceptional hsum hq

private theorem low_endpoint_cases_of_AQ
    {x y : ℝ} (h : seamA x y * seamQminus x y = 0) :
    FirstSeamExceptional x y := by
  rcases mul_eq_zero.mp h with hA | hQ
  · rcases seamA_zero_cases hA with hp | hp
    · exact Or.inr (Or.inl hp)
    · exact Or.inr (Or.inr (Or.inl hp))
  · rcases seamQminus_zero_cases hQ with hp | hp
    · exact Or.inl hp
    · exact Or.inr (Or.inr (Or.inl hp))

private theorem seamP_B0_zero_cases {x y : ℝ}
    (h : seamP_B0 (seamCayley x) (seamCayley y) = 0) :
    FirstSeamExceptional x y := by
  have hid := seamP_B0_pullback_norm x y
  rw [h, mul_zero, Complex.normSq_zero] at hid
  have hprod : seamA x y * seamQminus x y = 0 := by nlinarith
  exact low_endpoint_cases_of_AQ hprod

private theorem seamP_B3_zero_cases {x y : ℝ}
    (h : seamP_B3 (seamCayley x) (seamCayley y) = 0) :
    FirstSeamExceptional x y := by
  have hid := seamP_B3_pullback_norm x y
  rw [h, mul_zero, Complex.normSq_zero] at hid
  have hprod : seamA x y * seamQminus x y = 0 := by
    have : seamA x y ^ 2 * seamQminus x y = 0 := by nlinarith
    rcases mul_eq_zero.mp this with hA | hQ
    · exact mul_eq_zero.mpr
        (Or.inl ((pow_eq_zero_iff (by norm_num : (2 : ℕ) ≠ 0)).mp hA))
    · exact mul_eq_zero.mpr (Or.inr hQ)
  exact low_endpoint_cases_of_AQ hprod

private theorem seamP_Bswap0_zero_cases {x y : ℝ}
    (h : seamP_Bswap0 (seamCayley x) (seamCayley y) = 0) :
    FirstSeamExceptional x y := by
  have hid := seamP_Bswap0_pullback_norm x y
  rw [h, mul_zero, Complex.normSq_zero] at hid
  have hprod : seamA x y * seamQminus x y = 0 := by
    have : seamA x y * seamQminus x y ^ 2 = 0 := by nlinarith
    rcases mul_eq_zero.mp this with hA | hQ
    · exact mul_eq_zero.mpr (Or.inl hA)
    · exact mul_eq_zero.mpr
        (Or.inr ((pow_eq_zero_iff (by norm_num : (2 : ℕ) ≠ 0)).mp hQ))
  exact low_endpoint_cases_of_AQ hprod

set_option maxHeartbeats 1000000 in
private theorem seamP_C0_zero_cases {x y : ℝ}
    (h : seamP_C0 (seamCayley x) (seamCayley y) = 0) :
    FirstSeamExceptional x y := by
  have hid := seamP_C0_pullback x y
  rw [h, mul_zero] at hid
  have hre := congrArg Complex.re hid
  have him := congrArg Complex.im hid
  have hRfull :
      2 * s3 * y * (x + s3) * (y + s3) * seamLminus x y = 0 := by
    exact hre.symm
  have hIfull :
      2 * (y - s3) ^ 2 * (x ^ 2 * y + 2 * x - y) = 0 := by
    exact him.symm
  have hR :
      y = 0 ∨ x + s3 = 0 ∨ y + s3 = 0 ∨ seamLminus x y = 0 := by
    rcases mul_eq_zero.mp hRfull with hleft | hL
    · rcases mul_eq_zero.mp hleft with hleft | hys
      · rcases mul_eq_zero.mp hleft with hleft | hxs
        · rcases mul_eq_zero.mp hleft with hleft | hy
          · rcases mul_eq_zero.mp hleft with htwo | hs
            · norm_num at htwo
            · exact (ne_of_gt s3_pos hs).elim
          · exact Or.inl hy
        · exact Or.inr (Or.inl hxs)
      · exact Or.inr (Or.inr (Or.inl hys))
    · exact Or.inr (Or.inr (Or.inr hL))
  have hI : y = s3 ∨ x ^ 2 * y + 2 * x - y = 0 := by
    rcases mul_eq_zero.mp hIfull with hrest | hM
    · rcases mul_eq_zero.mp hrest with htwo | hy
      · norm_num at htwo
      · left
        have : y - s3 = 0 := (sq_eq_zero_iff.mp hy)
        linarith
    · exact Or.inr hM
  rcases hR with hy0 | hR
  · have hM : x ^ 2 * y + 2 * x - y = 0 :=
      hI.resolve_left (by intro hys; linarith [s3_pos])
    exact Or.inl ⟨by nlinarith [hM], hy0⟩
  rcases hR with hxs | hR
  · have hx : x = -s3 := by linarith
    have hy : y = s3 := by
      rcases hI with hy | hM
      · exact hy
      · rw [hx] at hM
        have hneg : (-s3) ^ 2 = 3 := by nlinarith [s3_sq]
        rw [hneg] at hM
        linarith
    exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))
  rcases hR with hys | hL
  · have hy : y = -s3 := by linarith
    have hM : x ^ 2 * y + 2 * x - y = 0 :=
      hI.resolve_left (by intro h; linarith [s3_pos])
    have hfactor : (x - s3) * (x + s3 / 3) = 0 := by
      rw [hy] at hM
      have hidf :
          -s3 * ((x - s3) * (x + s3 / 3)) =
            x ^ 2 * (-s3) + 2 * x - (-s3) := by
        ring_nf
        rw [s3_sq, s3_pow3]
        ring
      have hz : -s3 * ((x - s3) * (x + s3 / 3)) = 0 := by
        rw [hidf, hM]
      exact (mul_eq_zero.mp hz).resolve_left (by nlinarith [s3_pos])
    rcases mul_eq_zero.mp hfactor with hx | hx
    · exact Or.inr (Or.inl ⟨by linarith, hy⟩)
    · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨by linarith, hy⟩)))
  · rcases hI with hy | hM
    · have hx : x = -s3 := by
        simp [seamLminus, hy] at hL
        nlinarith [s3_sq]
      exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))
    · have hres :
          y * (-(s3 / 3) * (x + s3) * (x ^ 2 + 1)) = 0 := by
        have hcomb :
            (-2 * x) * seamLminus x y +
              (1 - s3 * x / 3) * (x ^ 2 * y + 2 * x - y) = 0 := by
          rw [hL, hM]
          ring
        calc
          y * (-(s3 / 3) * (x + s3) * (x ^ 2 + 1)) =
              (-2 * x) * seamLminus x y +
                (1 - s3 * x / 3) * (x ^ 2 * y + 2 * x - y) := by
            simp [seamLminus]
            ring_nf
            rw [s3_sq]
            ring
          _ = 0 := hcomb
      rcases mul_eq_zero.mp hres with hy0 | hprod
      · simp [seamLminus, hy0] at hL hM
        nlinarith [s3_pos]
      · have hx : x = -s3 := by
          rcases mul_eq_zero.mp hprod with hleft | hpos
          · rcases mul_eq_zero.mp hleft with hs | hx
            · exact (ne_of_gt s3_pos (by nlinarith [hs] : s3 = 0)).elim
            · linarith
          · nlinarith [sq_nonneg x]
        have hy : y = s3 := by
          simp [seamLminus, hx] at hL
          nlinarith [s3_sq]
        exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))

set_option maxHeartbeats 1000000 in
private theorem seamP_C3_zero_cases {x y : ℝ}
    (h : seamP_C3 (seamCayley x) (seamCayley y) = 0) :
    FirstSeamExceptional x y := by
  have hid := seamP_C3_pullback x y
  rw [h, mul_zero] at hid
  have hre := congrArg Complex.re hid
  have him := congrArg Complex.im hid
  have hRfull :
      2 * s3 * (x + s3) * (x - y) * (y - s3) * seamLplus x y = 0 :=
    hre.symm
  have hIfull : -(6 * (x + y) * seamLminus x y ^ 2) = 0 :=
    him.symm
  have hR :
      x + s3 = 0 ∨ x - y = 0 ∨ y - s3 = 0 ∨ seamLplus x y = 0 := by
    rcases mul_eq_zero.mp hRfull with hleft | hL
    · rcases mul_eq_zero.mp hleft with hleft | hy
      · rcases mul_eq_zero.mp hleft with hleft | hxy
        · rcases mul_eq_zero.mp hleft with hleft | hx
          · rcases mul_eq_zero.mp hleft with htwo | hs
            · norm_num at htwo
            · exact (ne_of_gt s3_pos hs).elim
          · exact Or.inl hx
        · exact Or.inr (Or.inl hxy)
      · exact Or.inr (Or.inr (Or.inl hy))
    · exact Or.inr (Or.inr (Or.inr hL))
  have hI : x + y = 0 ∨ seamLminus x y = 0 := by
    have hzero : 6 * (x + y) * seamLminus x y ^ 2 = 0 := by linarith
    rcases mul_eq_zero.mp hzero with hleft | hLsq
    · rcases mul_eq_zero.mp hleft with hsix | hsum
      · norm_num at hsix
      · exact Or.inl hsum
    · exact Or.inr (sq_eq_zero_iff.mp hLsq)
  rcases hR with hxs | hR
  · have hx : x = -s3 := by linarith
    have hy : y = s3 := by
      rcases hI with hsum | hL
      · linarith
      · simp [seamLminus, hx] at hL
        have hprod : s3 * (y - s3) = 0 := by nlinarith [s3_sq]
        exact (mul_eq_zero.mp hprod).resolve_left (ne_of_gt s3_pos) |> sub_eq_zero.mp
    exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))
  rcases hR with hxy | hR
  · have heq : x = y := by linarith
    rcases hI with hsum | hL
    · exact Or.inl ⟨by linarith, by linarith⟩
    · simp [seamLminus, heq] at hL
      nlinarith [sq_nonneg y]
  rcases hR with hys | hLplus
  · have hy : y = s3 := by linarith
    have hx : x = -s3 := by
      rcases hI with hsum | hL
      · linarith
      · simp [seamLminus, hy] at hL
        have hprod : s3 * (x + s3) = 0 := by nlinarith [s3_sq]
        have : x + s3 = 0 :=
          (mul_eq_zero.mp hprod).resolve_left (ne_of_gt s3_pos)
        linarith
    exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))
  · rcases hI with hsum | hLminus
    · have hy : y = -x := by linarith
      have hfactor : (x - s3) * (x + s3 / 3) = 0 := by
        have hz : -x ^ 2 + 2 * s3 * x / 3 + 1 = 0 := by
          convert hLplus using 1 <;> simp [seamLplus, hy] <;> ring
        have hidf :
            -((x - s3) * (x + s3 / 3)) =
              -x ^ 2 + 2 * s3 * x / 3 + 1 := by
          ring_nf
          rw [s3_sq]
          ring
        have : -((x - s3) * (x + s3 / 3)) = 0 := by rw [hidf, hz]
        linarith
      rcases mul_eq_zero.mp hfactor with hx | hx
      · exact Or.inr (Or.inl ⟨by linarith, by linarith⟩)
      · exact Or.inr (Or.inr (Or.inr
          (Or.inr (Or.inl ⟨by linarith, by linarith⟩))))
    · have hxy : x = y := by
        have hdiff : 2 * s3 * (x - y) / 3 = 0 := by
          simp [seamLplus, seamLminus] at hLplus hLminus
          linarith
        have hsne : s3 ≠ 0 := ne_of_gt s3_pos
        have hprod : s3 * (x - y) = 0 := by nlinarith [hdiff]
        exact sub_eq_zero.mp ((mul_eq_zero.mp hprod).resolve_left hsne)
      simp [seamLplus, hxy] at hLplus
      nlinarith [sq_nonneg y]

set_option maxHeartbeats 1000000 in
private theorem seamP_Cswap0_zero_cases {x y : ℝ}
    (h : seamP_Cswap0 (seamCayley x) (seamCayley y) = 0) :
    FirstSeamExceptional x y := by
  have hid := seamP_Cswap0_pullback x y
  rw [h, mul_zero] at hid
  have hre := congrArg Complex.re hid
  have him := congrArg Complex.im hid
  have hRfull :
      -(2 * s3 * x * (x - s3) * (y - s3) * seamLminus x y) = 0 :=
    hre.symm
  have hIfull :
      2 * (x + s3) ^ 2 * (x * y ^ 2 - x + 2 * y) = 0 :=
    him.symm
  have hR :
      x = 0 ∨ x - s3 = 0 ∨ y - s3 = 0 ∨ seamLminus x y = 0 := by
    have hz : 2 * s3 * x * (x - s3) * (y - s3) * seamLminus x y = 0 := by
      linarith
    rcases mul_eq_zero.mp hz with hleft | hL
    · rcases mul_eq_zero.mp hleft with hleft | hy
      · rcases mul_eq_zero.mp hleft with hleft | hxS
        · rcases mul_eq_zero.mp hleft with hleft | hx
          · rcases mul_eq_zero.mp hleft with htwo | hs
            · norm_num at htwo
            · exact (ne_of_gt s3_pos hs).elim
          · exact Or.inl hx
        · exact Or.inr (Or.inl hxS)
      · exact Or.inr (Or.inr (Or.inl hy))
    · exact Or.inr (Or.inr (Or.inr hL))
  have hI : x = -s3 ∨ x * y ^ 2 - x + 2 * y = 0 := by
    rcases mul_eq_zero.mp hIfull with hleft | hN
    · rcases mul_eq_zero.mp hleft with htwo | hsq
      · norm_num at htwo
      · left
        have : x + s3 = 0 := sq_eq_zero_iff.mp hsq
        linarith
    · exact Or.inr hN
  rcases hR with hx0 | hR
  · have hN : x * y ^ 2 - x + 2 * y = 0 :=
      hI.resolve_left (by intro hx; linarith [s3_pos])
    exact Or.inl ⟨hx0, by rw [hx0] at hN; linarith⟩
  rcases hR with hxs | hR
  · have hx : x = s3 := by linarith
    have hN : x * y ^ 2 - x + 2 * y = 0 :=
      hI.resolve_left (by intro h; linarith [s3_pos])
    have hfactor : (y + s3) * (y - s3 / 3) = 0 := by
      rw [hx] at hN
      have hidf :
          s3 * ((y + s3) * (y - s3 / 3)) =
            s3 * y ^ 2 - s3 + 2 * y := by
        ring_nf
        rw [s3_sq, s3_pow3]
        ring
      have hz : s3 * ((y + s3) * (y - s3 / 3)) = 0 := by rw [hidf, hN]
      exact (mul_eq_zero.mp hz).resolve_left (ne_of_gt s3_pos)
    rcases mul_eq_zero.mp hfactor with hy | hy
    · exact Or.inr (Or.inl ⟨hx, by linarith⟩)
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨hx, by linarith⟩))))
  rcases hR with hys | hL
  · have hy : y = s3 := by linarith
    have hx : x = -s3 := by
      rcases hI with hx | hN
      · exact hx
      · rw [hy] at hN
        rw [s3_sq] at hN
        linarith
    exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))
  · rcases hI with hx | hN
    · have hy : y = s3 := by
        simp [seamLminus, hx] at hL
        nlinarith [s3_sq]
      exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))
    · have hres :
          x * (s3 / 3 * (y - s3) * (y ^ 2 + 1)) = 0 := by
        have hcomb :
            (-2 * y) * seamLminus x y +
              (s3 * y / 3 + 1) * (x * y ^ 2 - x + 2 * y) = 0 := by
          rw [hL, hN]
          ring
        calc
          x * (s3 / 3 * (y - s3) * (y ^ 2 + 1)) =
              (-2 * y) * seamLminus x y +
                (s3 * y / 3 + 1) * (x * y ^ 2 - x + 2 * y) := by
            simp [seamLminus]
            ring_nf
            rw [s3_sq]
            ring
          _ = 0 := hcomb
      rcases mul_eq_zero.mp hres with hx0 | hprod
      · simp [seamLminus, hx0] at hL hN
        nlinarith [s3_pos]
      · have hy : y = s3 := by
          rcases mul_eq_zero.mp hprod with hleft | hpos
          · rcases mul_eq_zero.mp hleft with hs | hy
            · exact (ne_of_gt s3_pos (by nlinarith [hs] : s3 = 0)).elim
            · linarith
          · nlinarith [sq_nonneg y]
        have hx : x = -s3 := by
          simp [seamLminus, hy] at hL
          nlinarith [s3_sq]
        exact Or.inr (Or.inr (Or.inl ⟨hx, hy⟩))

/-- Exact algebraic reduction of failure of the first displayed seam corner:
all eleven possible vanishing factors land in the same six-point set. -/
private theorem firstSeam_witness_zero_cases {x y : ℝ}
    (hzero : leadingFiniteCornerWitnessProduct
      (firstSeamChart standardOmega (seamCayley x) (seamCayley y)) = 0) :
    FirstSeamExceptional x y := by
  have hxnorm := seamCayley_normSq x
  have hynorm := seamCayley_normSq y
  simp only [leadingFiniteCornerWitnessProduct, mul_eq_zero] at hzero
  rcases hzero with hE | hB | hC | hB0 | hB3 | hBs0 | hBs3 |
      hC0 | hC3 | hCs0 | hCs3
  · exact firstSeam_detE_zero_cases hE
  · exact firstSeam_detB_zero_cases hB
  · exact firstSeam_detC_zero_cases hC
  · have hid := firstSeam_B0_formula hxnorm hynorm
    have hp3 : 3 * seamP_B0 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hB0] using hid.symm
    have hp : seamP_B0 (seamCayley x) (seamCayley y) = 0 :=
      (mul_eq_zero.mp hp3).resolve_left (by norm_num)
    exact seamP_B0_zero_cases hp
  · have hid := firstSeam_B3_formula hxnorm hynorm
    have hp : seamP_B3 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hB3] using hid.symm
    exact seamP_B3_zero_cases hp
  · have hid := firstSeam_Bswap0_formula hxnorm hynorm
    have hp : seamP_Bswap0 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hBs0] using hid.symm
    exact seamP_Bswap0_zero_cases hp
  · have hid := firstSeam_Bswap3_formula hxnorm hynorm
    have hp : seamP_B3 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hBs3] using hid.symm
    exact seamP_B3_zero_cases hp
  · have hid := firstSeam_C0_formula hxnorm hynorm
    have hp : seamP_C0 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hC0] using hid.symm
    exact seamP_C0_zero_cases hp
  · have hid := firstSeam_C3_formula hxnorm hynorm
    have hp : seamP_C3 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hC3] using hid.symm
    exact seamP_C3_zero_cases hp
  · have hid := firstSeam_Cswap0_formula hxnorm hynorm
    have hp : seamP_Cswap0 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hCs0] using hid.symm
    exact seamP_Cswap0_zero_cases hp
  · have hid := firstSeam_Cswap3_formula hxnorm hynorm
    have hp : seamP_C3 (seamCayley x) (seamCayley y) = 0 := by
      simpa [hCs3] using hid.symm
    exact seamP_C3_zero_cases hp

/-- Normalize one concrete seam corner exactly and close each of the eleven
paper witness factors using only the cubic relation for `standardOmega`.
The six named lemmas below are the certificate table; this tactic contains
their shared arithmetic, not an additional mathematical assumption. -/
macro "close_standard_seam_corner" h:term : tactic => `(tactic| exact (by
  have hzero := $h
  have homega := standardOmega_isPrimitiveCubicPhase
  have hstar : star standardOmega = standardOmega ^ 2 :=
    primitiveCubicPhase_star homega
  have hstarSq : star (standardOmega ^ 2) = standardOmega := by
    rw [star_pow, hstar]
    calc
      (standardOmega ^ 2) ^ 2 = standardOmega * standardOmega ^ 3 := by ring
      _ = standardOmega := by rw [primitiveCubicPhase_cube homega, mul_one]
  have hcube := primitiveCubicPhase_cube homega
  have hpow4 : standardOmega ^ 4 = standardOmega := by
    calc
      standardOmega ^ 4 = standardOmega * standardOmega ^ 3 := by ring
      _ = standardOmega := by rw [hcube, mul_one]
  have hperiod (n : ℕ) : standardOmega ^ (n + 3) = standardOmega ^ n := by
    rw [pow_add, hcube, mul_one]
  have hp5 : standardOmega ^ 5 = standardOmega ^ 2 := by
    simpa using hperiod 2
  have hp6 : standardOmega ^ 6 = 1 := by simpa [hcube] using hperiod 3
  have hp7 : standardOmega ^ 7 = standardOmega := by
    simpa [hpow4] using hperiod 4
  have hp8 : standardOmega ^ 8 = standardOmega ^ 2 := by
    simpa [hp5] using hperiod 5
  have hp9 : standardOmega ^ 9 = 1 := by simpa [hp6] using hperiod 6
  have hp10 : standardOmega ^ 10 = standardOmega := by
    simpa [hp7] using hperiod 7
  have hp11 : standardOmega ^ 11 = standardOmega ^ 2 := by
    simpa [hp8] using hperiod 8
  have hp12 : standardOmega ^ 12 = 1 := by simpa [hp9] using hperiod 9
  have hp13 : standardOmega ^ 13 = standardOmega := by
    simpa [hp10] using hperiod 10
  have hp14 : standardOmega ^ 14 = standardOmega ^ 2 := by
    simpa [hp11] using hperiod 11
  have hp15 : standardOmega ^ 15 = 1 := by simpa [hp12] using hperiod 12
  have hp16 : standardOmega ^ 16 = standardOmega := by
    simpa [hp13] using hperiod 13
  have hp17 : standardOmega ^ 17 = standardOmega ^ 2 := by
    simpa [hp14] using hperiod 14
  have hp18 : standardOmega ^ 18 = 1 := by simpa [hp15] using hperiod 15
  have hsum : 1 + standardOmega + standardOmega ^ 2 = 0 := by
    linear_combination homega.2
  have hsq : standardOmega ^ 2 = -1 - standardOmega := by
    linear_combination hsum
  have hstarEnd :
      (starRingEnd ℂ) standardOmega = standardOmega ^ 2 := hstar
  simp only [leadingFiniteCornerWitnessProduct, mul_eq_zero] at hzero
  rcases hzero with h | h | h | h | h | h | h | h | h | h | h
  all_goals
    norm_num [affineFourierMatrix, dephase, dephaseRowFactor,
      dephaseColumnFactor, phaseTransform, reindexMatrix, seamRows012,
      seamColumns025,
      seamRows013_order.1, seamRows013_order.2.1,
      seamRows013_order.2.2.1, seamRows013_order.2.2.2.1,
      seamRows013_order.2.2.2.2.1, seamRows013_order.2.2.2.2.2,
      seamRows025_order.1, seamRows025_order.2.1,
      seamRows025_order.2.2.1, seamRows025_order.2.2.2.1,
      seamRows025_order.2.2.2.2.1, seamRows025_order.2.2.2.2.2,
      seamColumns024_order.1, seamColumns024_order.2.1,
      seamColumns024_order.2.2.1, seamColumns024_order.2.2.2.1,
      seamColumns024_order.2.2.2.2.1, seamColumns024_order.2.2.2.2.2,
      rowEndpoint0, rowEndpoint3, rowFibreEndpoint0, rowFibreEndpoint3,
      swapNoninitialRows, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Fin.sum_univ_three, Matrix.toBlocks₁₁, Matrix.toBlocks₁₂,
      Matrix.toBlocks₂₁, seamCayley, hstar, hstarSq, hcube, hsum,
      Matrix.det_fin_three, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.cons_val_two] at h
    try simp_rw [hstarEnd] at h
    try simp only [hpow4, hp5, hp6, hp7, hp8, hp9, hp10, hp11, hp12,
      hp13, hp14, hp15, hp16, hp17, hp18, hsq] at h
    try ring_nf at h
    try simp only [hcube, hpow4, hp5, hp6, hp7, hp8, hp9, hp10, hp11,
      hp12, hp13, hp14, hp15, hp16, hp17, hp18, hsq] at h
    try ring_nf at h
    try simp only [hcube, hpow4, hp5, hp6, hp7, hp8, hp9, hp10, hp11,
      hp12, hp13, hp14, hp15, hp16, hp17, hp18, hsq] at h
    first
      | (rcases h with h | h <;>
          first
            | have him := congrArg Complex.im h
              (simp [standardOmega, Complex.mul_re, Complex.mul_im,
                Complex.conj_re, Complex.conj_im] at him <;>
                nlinarith [Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 3)])
            | norm_num at h)
      | have him := congrArg Complex.im h
        (simp [standardOmega, Complex.mul_re, Complex.mul_im,
          Complex.conj_re, Complex.conj_im] at him <;>
          nlinarith [Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 3)])
      | norm_num at h))

/-! The six rows of the exceptional-point certificate table. -/

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem exceptional00_corner21 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (2 : I3) (1 : I2)
        (affineFourierMatrix standardOmega 1 1)) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows025 seamColumns025
      (affineFourierMatrix standardOmega 1 1))) = 0 at h
  close_standard_seam_corner h

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem exceptional_s_neg_s_corner11 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (1 : I3) (1 : I2)
        (affineFourierMatrix standardOmega standardOmega
          (standardOmega ^ 2))) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows013 seamColumns025
      (affineFourierMatrix standardOmega standardOmega
        (standardOmega ^ 2)))) = 0 at h
  close_standard_seam_corner h

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem exceptional_neg_s_s_corner01 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (0 : I3) (1 : I2)
        (affineFourierMatrix standardOmega (standardOmega ^ 2)
          standardOmega)) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows012 seamColumns025
      (affineFourierMatrix standardOmega (standardOmega ^ 2)
        standardOmega))) = 0 at h
  close_standard_seam_corner h

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem exceptional_neg_third_s_neg_s_corner10 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (1 : I3) (0 : I2)
        (affineFourierMatrix standardOmega (-standardOmega)
          (standardOmega ^ 2))) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows013 seamColumns024
      (affineFourierMatrix standardOmega (-standardOmega)
        (standardOmega ^ 2)))) = 0 at h
  close_standard_seam_corner h

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem exceptional_neg_third_s_third_s_corner10 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (1 : I3) (0 : I2)
        (affineFourierMatrix standardOmega (-standardOmega)
          (-(standardOmega ^ 2)))) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows013 seamColumns024
      (affineFourierMatrix standardOmega (-standardOmega)
        (-(standardOmega ^ 2))))) = 0 at h
  close_standard_seam_corner h

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem exceptional_s_third_s_corner10 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (1 : I3) (0 : I2)
        (affineFourierMatrix standardOmega standardOmega
          (-(standardOmega ^ 2)))) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows013 seamColumns024
      (affineFourierMatrix standardOmega standardOmega
        (-(standardOmega ^ 2))))) = 0 at h
  close_standard_seam_corner h

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem boundary_neg_one_neg_omega_sq_corner10 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (1 : I3) (0 : I2)
        (affineFourierMatrix standardOmega (-1)
          (-(standardOmega ^ 2)))) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows013 seamColumns024
      (affineFourierMatrix standardOmega (-1)
        (-(standardOmega ^ 2))))) = 0 at h
  close_standard_seam_corner h

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 100000 in
private theorem boundary_neg_omega_neg_one_corner10 :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (1 : I3) (0 : I2)
        (affineFourierMatrix standardOmega (-standardOmega) (-1))) ≠ 0 := by
  intro h
  change leadingFiniteCornerWitnessProduct
    (dephase (reindexMatrix seamRows013 seamColumns024
      (affineFourierMatrix standardOmega (-standardOmega) (-1)))) = 0 at h
  close_standard_seam_corner h

/-- Away from the projective point `-1`, the first corner either works or
its exact zero classification selects one row of the six-point table. -/
private theorem standard_cayley_six_corner_certificate (x y : ℝ) :
    ∃ r : I3, ∃ c : I2,
      leadingFiniteCornerWitnessProduct
        (seamCornerChart r c
          (affineFourierMatrix standardOmega
            (seamCayley x) (seamCayley y))) ≠ 0 := by
  by_cases hfirst : leadingFiniteCornerWitnessProduct
      (firstSeamChart standardOmega (seamCayley x) (seamCayley y)) ≠ 0
  · refine ⟨0, 0, ?_⟩
    rw [seamCornerChart_zero_zero_eq standardOmega_isPrimitiveCubicPhase
      (seamCayley_normSq x) (seamCayley_normSq y)]
    exact hfirst
  · have hexceptional := firstSeam_witness_zero_cases
      (not_ne_iff.mp hfirst)
    rcases hexceptional with h00 | hsns | hnss | hns3ns | hns3s3 | hss3
    · rcases h00 with ⟨rfl, rfl⟩
      refine ⟨2, 1, ?_⟩
      simpa [seamCayley_zero] using exceptional00_corner21
    · rcases hsns with ⟨rfl, rfl⟩
      refine ⟨1, 1, ?_⟩
      simpa [seamCayley_s3, seamCayley_neg_s3] using
        exceptional_s_neg_s_corner11
    · rcases hnss with ⟨rfl, rfl⟩
      refine ⟨0, 1, ?_⟩
      simpa [seamCayley_s3, seamCayley_neg_s3] using
        exceptional_neg_s_s_corner01
    · rcases hns3ns with ⟨rfl, rfl⟩
      refine ⟨1, 0, ?_⟩
      simpa [seamCayley_neg_third_s3, seamCayley_neg_s3] using
        exceptional_neg_third_s_neg_s_corner10
    · rcases hns3s3 with ⟨rfl, rfl⟩
      refine ⟨1, 0, ?_⟩
      simpa [seamCayley_neg_third_s3, seamCayley_third_s3] using
        exceptional_neg_third_s_third_s_corner10
    · rcases hss3 with ⟨rfl, rfl⟩
      refine ⟨1, 0, ?_⟩
      simpa [seamCayley_s3, seamCayley_third_s3] using
        exceptional_s_third_s_corner10

private theorem standard_nonboundary_six_corner_certificate
    {z₁ z₂ : ℂ} (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) (hz₁m : z₁ ≠ -1)
    (hz₂m : z₂ ≠ -1) :
    ∃ r : I3, ∃ c : I2,
      leadingFiniteCornerWitnessProduct
        (seamCornerChart r c
          (affineFourierMatrix standardOmega z₁ z₂)) ≠ 0 := by
  rcases exists_seamCayley_of_normSq_one hz₁ hz₁m with ⟨x, rfl⟩
  rcases exists_seamCayley_of_normSq_one hz₂ hz₂m with ⟨y, rfl⟩
  exact standard_cayley_six_corner_certificate x y

/-! A structural symmetry used only for the two projective boundary lines. -/

private def swapBlockNoninitialRows (H : Mat6) : Mat6 :=
  fun i j ↦ H (Sum.map swapNoninitialIndex swapNoninitialIndex i) j

private def swapNoninitialColumns (X : Mat3) : Mat3 :=
  fun i j ↦ X i (swapNoninitialIndex j)

private theorem toBlocks₁₁_swapBlockNoninitialRows (H : Mat6) :
    Matrix.toBlocks₁₁ (swapBlockNoninitialRows H) =
      swapNoninitialRows (Matrix.toBlocks₁₁ H) := by
  rfl

private theorem toBlocks₁₂_swapBlockNoninitialRows (H : Mat6) :
    Matrix.toBlocks₁₂ (swapBlockNoninitialRows H) =
      swapNoninitialRows (Matrix.toBlocks₁₂ H) := by
  rfl

private theorem toBlocks₂₁_swapBlockNoninitialRows (H : Mat6) :
    Matrix.toBlocks₂₁ (swapBlockNoninitialRows H) =
      swapNoninitialRows (Matrix.toBlocks₂₁ H) := by
  rfl

private theorem swapNoninitialRows_transpose (X : Mat3) :
    (swapNoninitialRows X).transpose =
      swapNoninitialColumns X.transpose := by
  rfl

private theorem swapNoninitialRows_swapNoninitialColumns (X : Mat3) :
    swapNoninitialRows (swapNoninitialColumns X) =
      swapNoninitialColumns (swapNoninitialRows X) := by
  rfl

private theorem swapNoninitialColumns_rowGram (X : Mat3) :
    swapNoninitialColumns X *
        Matrix.conjTranspose (swapNoninitialColumns X) =
      X * Matrix.conjTranspose X := by
  ext i j
  simp [swapNoninitialColumns, Matrix.mul_apply,
    Matrix.conjTranspose_apply, Fin.sum_univ_three]
  ring

private theorem rowEndpoint0_swapNoninitialColumns (X : Mat3) :
    rowEndpoint0 (swapNoninitialColumns X) = rowEndpoint0 X := by
  simp [rowEndpoint0, swapNoninitialColumns_rowGram]

private theorem rowEndpoint3_swapNoninitialColumns (X : Mat3) :
    rowEndpoint3 (swapNoninitialColumns X) = rowEndpoint3 X := by
  simp [rowEndpoint3, swapNoninitialColumns_rowGram]

private theorem leadingCertificate_swapBlockNoninitialRows {H : Mat6}
    (h : LeadingFiniteCornerCertificate H) :
    LeadingFiniteCornerCertificate (swapBlockNoninitialRows H) := by
  refine {
    detE := ?_, detB := ?_, detC := ?_,
    B_endpoint0 := ?_, B_endpoint3 := ?_,
    B_swapped_endpoint0 := ?_, B_swapped_endpoint3 := ?_,
    C_endpoint0 := ?_, C_endpoint3 := ?_,
    C_swapped_endpoint0 := ?_, C_swapped_endpoint3 := ?_ }
  · rw [toBlocks₁₁_swapBlockNoninitialRows]
    exact swapNoninitialRows_det_ne_zero h.detE
  · rw [toBlocks₁₂_swapBlockNoninitialRows]
    exact swapNoninitialRows_det_ne_zero h.detB
  · rw [toBlocks₂₁_swapBlockNoninitialRows]
    exact swapNoninitialRows_det_ne_zero h.detC
  · rw [toBlocks₁₂_swapBlockNoninitialRows]
    exact h.B_swapped_endpoint0
  · rw [toBlocks₁₂_swapBlockNoninitialRows]
    exact h.B_swapped_endpoint3
  · rw [toBlocks₁₂_swapBlockNoninitialRows]
    simpa [swapNoninitialRows_involutive] using h.B_endpoint0
  · rw [toBlocks₁₂_swapBlockNoninitialRows]
    simpa [swapNoninitialRows_involutive] using h.B_endpoint3
  · rw [toBlocks₂₁_swapBlockNoninitialRows]
    simpa [swapNoninitialRows_transpose,
      rowEndpoint0_swapNoninitialColumns] using
      h.C_endpoint0
  · rw [toBlocks₂₁_swapBlockNoninitialRows]
    simpa [swapNoninitialRows_transpose,
      rowEndpoint3_swapNoninitialColumns] using
      h.C_endpoint3
  · rw [toBlocks₂₁_swapBlockNoninitialRows]
    simpa [swapNoninitialRows_transpose,
      swapNoninitialRows_swapNoninitialColumns,
      rowEndpoint0_swapNoninitialColumns] using h.C_swapped_endpoint0
  · rw [toBlocks₂₁_swapBlockNoninitialRows]
    simpa [swapNoninitialRows_transpose,
      swapNoninitialRows_swapNoninitialColumns,
      rowEndpoint3_swapNoninitialColumns] using h.C_swapped_endpoint3

private theorem seamCorner20_eq_swap_first {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1) (hz₂ : Complex.normSq z₂ = 1) :
    seamCornerChart (2 : I3) (0 : I2)
        (affineFourierMatrix standardOmega z₁ z₂) =
      swapBlockNoninitialRows
        (firstSeamChart standardOmega
          (standardOmega ^ 2 * z₁) (standardOmega * z₂)) := by
  change dephase (reindexMatrix seamRows025 seamColumns024
      (affineFourierMatrix standardOmega z₁ z₂)) =
    swapBlockNoninitialRows
      (firstSeamChart standardOmega
        (standardOmega ^ 2 * z₁) (standardOmega * z₂))
  rcases seamRows025_order with ⟨hr0, hr1, hr2, hr3, hr4, hr5⟩
  rcases seamColumns024_order with ⟨hc0, hc1, hc2, hc3, hc4, hc5⟩
  have homega := standardOmega_isPrimitiveCubicPhase
  have hstarOmega : star standardOmega = standardOmega ^ 2 :=
    primitiveCubicPhase_star homega
  have hstarOmegaSq : star (standardOmega ^ 2) = standardOmega := by
    rw [star_pow, hstarOmega]
    calc
      (standardOmega ^ 2) ^ 2 = standardOmega * standardOmega ^ 3 := by ring
      _ = standardOmega := by rw [primitiveCubicPhase_cube homega, mul_one]
  have hpow4 : standardOmega ^ 4 = standardOmega := by
    calc
      standardOmega ^ 4 = standardOmega * standardOmega ^ 3 := by ring
      _ = standardOmega := by rw [primitiveCubicPhase_cube homega, mul_one]
  have hstarZ₁ : star z₁ * z₁ = 1 :=
    star_mul_self_of_normSq_one hz₁
  have hstarZ₂ : star z₂ * z₂ = 1 :=
    star_mul_self_of_normSq_one hz₂
  ext i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [seamCornerChart, dephase, phaseTransform, dephaseRowFactor,
      dephaseColumnFactor, reindexMatrix, hr0, hr1, hr2, hr3, hr4, hr5,
      hc0, hc1, hc2, hc3, hc4, hc5, affineFourierMatrix,
      swapBlockNoninitialRows, firstSeamChart, hstarOmega,
      hstarOmegaSq] <;>
    ring_nf <;>
    simp [hstarZ₁, hstarZ₂, hpow4, primitiveCubicPhase_cube homega]

private theorem corner20_witness_of_first_transformed
    {z₁ z₂ : ℂ} (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hfirst : leadingFiniteCornerWitnessProduct
      (firstSeamChart standardOmega
        (standardOmega ^ 2 * z₁) (standardOmega * z₂)) ≠ 0) :
    leadingFiniteCornerWitnessProduct
      (seamCornerChart (2 : I3) (0 : I2)
        (affineFourierMatrix standardOmega z₁ z₂)) ≠ 0 := by
  have hcertificate : LeadingFiniteCornerCertificate
      (firstSeamChart standardOmega
        (standardOmega ^ 2 * z₁) (standardOmega * z₂)) :=
    leadingFiniteCornerCertificate_iff_witnessProduct_ne_zero.2 hfirst
  rw [seamCorner20_eq_swap_first hz₁ hz₂]
  exact leadingFiniteCornerCertificate_iff_witnessProduct_ne_zero.1
    (leadingCertificate_swapBlockNoninitialRows hcertificate)

private theorem transformed_first_nonzero_of_z1_neg_one
    {z₂ : ℂ} (hz₂ : Complex.normSq z₂ = 1)
    (hspecial : z₂ ≠ -(standardOmega ^ 2)) :
    leadingFiniteCornerWitnessProduct
      (firstSeamChart standardOmega
        (standardOmega ^ 2 * (-1)) (standardOmega * z₂)) ≠ 0 := by
  have homega := standardOmega_isPrimitiveCubicPhase
  have hmul : standardOmega ^ 2 * standardOmega = 1 := by
    calc
      standardOmega ^ 2 * standardOmega = standardOmega ^ 3 := by ring
      _ = 1 := primitiveCubicPhase_cube homega
  have ht₂norm : Complex.normSq (standardOmega * z₂) = 1 := by
    rw [Complex.normSq_mul, homega.1, hz₂]
    norm_num
  have ht₂m : standardOmega * z₂ ≠ -1 := by
    intro ht
    apply hspecial
    calc
      z₂ = 1 * z₂ := by ring
      _ = standardOmega ^ 2 * (standardOmega * z₂) := by rw [← mul_assoc, hmul]
      _ = -(standardOmega ^ 2) := by rw [ht]; ring
  rcases exists_seamCayley_of_normSq_one ht₂norm ht₂m with ⟨y, hy⟩
  rw [hy]
  intro hzero
  have hzero' : leadingFiniteCornerWitnessProduct
      (firstSeamChart standardOmega
        (seamCayley (s3 / 3)) (seamCayley y)) = 0 := by
    simpa [seamCayley_third_s3] using hzero
  have hexceptional := firstSeam_witness_zero_cases hzero'
  rcases hexceptional with h00 | hsns | hnss | hns3ns | hns3s3 | hss3
  · rcases h00 with ⟨hx, _⟩; nlinarith [s3_pos]
  · rcases hsns with ⟨hx, _⟩; nlinarith [s3_pos]
  · rcases hnss with ⟨hx, _⟩; nlinarith [s3_pos]
  · rcases hns3ns with ⟨hx, _⟩; nlinarith [s3_pos]
  · rcases hns3s3 with ⟨hx, _⟩; nlinarith [s3_pos]
  · rcases hss3 with ⟨hx, _⟩; nlinarith [s3_pos]

private theorem transformed_first_nonzero_of_z2_neg_one
    {z₁ : ℂ} (hz₁ : Complex.normSq z₁ = 1)
    (hspecial : z₁ ≠ -standardOmega) :
    leadingFiniteCornerWitnessProduct
      (firstSeamChart standardOmega
        (standardOmega ^ 2 * z₁) (standardOmega * (-1))) ≠ 0 := by
  have homega := standardOmega_isPrimitiveCubicPhase
  have hmul : standardOmega * standardOmega ^ 2 = 1 := by
    calc
      standardOmega * standardOmega ^ 2 = standardOmega ^ 3 := by ring
      _ = 1 := primitiveCubicPhase_cube homega
  have ht₁norm : Complex.normSq (standardOmega ^ 2 * z₁) = 1 := by
    rw [Complex.normSq_mul, primitiveCubicPhase_sq_norm homega, hz₁]
    norm_num
  have ht₁m : standardOmega ^ 2 * z₁ ≠ -1 := by
    intro ht
    apply hspecial
    calc
      z₁ = 1 * z₁ := by ring
      _ = standardOmega * (standardOmega ^ 2 * z₁) := by rw [← mul_assoc, hmul]
      _ = -standardOmega := by rw [ht]; ring
  rcases exists_seamCayley_of_normSq_one ht₁norm ht₁m with ⟨x, hx⟩
  rw [hx]
  intro hzero
  have hzero' : leadingFiniteCornerWitnessProduct
      (firstSeamChart standardOmega
        (seamCayley x) (seamCayley (-s3 / 3))) = 0 := by
    simpa [seamCayley_neg_third_s3] using hzero
  have hexceptional := firstSeam_witness_zero_cases hzero'
  rcases hexceptional with h00 | hsns | hnss | hns3ns | hns3s3 | hss3
  · rcases h00 with ⟨_, hy⟩; nlinarith [s3_pos]
  · rcases hsns with ⟨_, hy⟩; nlinarith [s3_pos]
  · rcases hnss with ⟨_, hy⟩; nlinarith [s3_pos]
  · rcases hns3ns with ⟨_, hy⟩; nlinarith [s3_pos]
  · rcases hns3s3 with ⟨_, hy⟩; nlinarith [s3_pos]
  · rcases hss3 with ⟨_, hy⟩; nlinarith [s3_pos]

private theorem standard_z1_neg_one_six_corner_certificate
    {z₂ : ℂ} (hz₂ : Complex.normSq z₂ = 1) :
    ∃ r : I3, ∃ c : I2,
      leadingFiniteCornerWitnessProduct
        (seamCornerChart r c
          (affineFourierMatrix standardOmega (-1) z₂)) ≠ 0 := by
  by_cases hspecial : z₂ = -(standardOmega ^ 2)
  · subst z₂
    exact ⟨1, 0, boundary_neg_one_neg_omega_sq_corner10⟩
  · refine ⟨2, 0, corner20_witness_of_first_transformed
      (by norm_num) hz₂ ?_⟩
    exact transformed_first_nonzero_of_z1_neg_one hz₂ hspecial

private theorem standard_z2_neg_one_six_corner_certificate
    {z₁ : ℂ} (hz₁ : Complex.normSq z₁ = 1) :
    ∃ r : I3, ∃ c : I2,
      leadingFiniteCornerWitnessProduct
        (seamCornerChart r c
          (affineFourierMatrix standardOmega z₁ (-1))) ≠ 0 := by
  by_cases hspecial : z₁ = -standardOmega
  · subst z₁
    exact ⟨1, 0, boundary_neg_omega_neg_one_corner10⟩
  · refine ⟨2, 0, corner20_witness_of_first_transformed
      hz₁ (by norm_num) ?_⟩
    exact transformed_first_nonzero_of_z2_neg_one hz₁ hspecial

private theorem standard_affine_fourier_six_corner_certificate
    {z₁ z₂ : ℂ} (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    ∃ r : I3, ∃ c : I2,
      leadingFiniteCornerWitnessProduct
        (seamCornerChart r c
          (affineFourierMatrix standardOmega z₁ z₂)) ≠ 0 := by
  by_cases hz₁m : z₁ = -1
  · subst z₁
    exact standard_z1_neg_one_six_corner_certificate hz₂
  · by_cases hz₂m : z₂ = -1
    · subst z₂
      exact standard_z2_neg_one_six_corner_certificate hz₁
    · exact standard_nonboundary_six_corner_certificate hz₁ hz₂ hz₁m hz₂m

/-- The paper's six-corner no-common-failure statement for its fixed standard
primitive cubic phase.  This is the public audit endpoint for the exact
common-zero elimination. -/
theorem standard_affine_fourier_six_corner_certificate_proved
    {z₁ z₂ : ℂ} (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    ∃ r : I3, ∃ c : I2,
      leadingFiniteCornerWitnessProduct
        (seamCornerChart r c
          (affineFourierMatrix standardOmega z₁ z₂)) ≠ 0 :=
  standard_affine_fourier_six_corner_certificate hz₁ hz₂

/-! Transposition swaps the two intrinsic fibre problems.  These lemmas let
the paper treat the transposed affine-Fourier seam structurally instead of
repeating the six-corner polynomial calculation. -/

private theorem transposeGram_involutive (G : Mat3) :
    transposeGram (transposeGram G) = G := by
  rfl

private theorem transpose_columnGram (X : Mat3) :
    Matrix.conjTranspose X.transpose * X.transpose =
      transposeGram (X * Matrix.conjTranspose X) := by
  ext i j
  simp [transposeGram, Matrix.mul_apply, Matrix.conjTranspose_apply]
  apply Finset.sum_congr rfl
  intro k hk
  ring

private theorem transpose_mem_normalizedColumnGramFibre
    {G X : Mat3} (hX : X ∈ normalizedRowGramFibre (transposeGram G)) :
    X.transpose ∈ normalizedColumnGramFibre G := by
  refine ⟨?_, ?_, ?_⟩
  · intro i j
    exact hX.1 j i
  · intro i
    exact hX.2.1 i
  · rw [transpose_columnGram, hX.2.2, transposeGram_involutive]

private theorem finite_row_transpose_of_finite_column {G : Mat3}
    (hfin : (normalizedColumnGramFibre G).Finite) :
    (normalizedRowGramFibre (transposeGram G)).Finite := by
  by_contra hinf
  have hinfinite :
      (normalizedRowGramFibre (transposeGram G)).Infinite := hinf
  have himage := hinfinite.image
    (fun _ _ _ _ h ↦ transpose_injective h)
  have hsubset : (Matrix.transpose ''
      normalizedRowGramFibre (transposeGram G)) ⊆
      normalizedColumnGramFibre G := by
    rintro Y ⟨X, hX, rfl⟩
    exact transpose_mem_normalizedColumnGramFibre hX
  exact himage (hfin.subset hsubset)

private theorem finite_column_transpose_of_finite_row {G : Mat3}
    (hfin : (normalizedRowGramFibre G).Finite) :
    (normalizedColumnGramFibre (transposeGram G)).Finite := by
  by_contra hinf
  have hinf' := infinite_column_fibre_transpose hinf
  rw [transposeGram_involutive] at hinf'
  exact hinf' hfin

private theorem toBlocks₁₁_transpose (H : Mat6) :
    Matrix.toBlocks₁₁ H.transpose = (Matrix.toBlocks₁₁ H).transpose := by
  rfl

private theorem toBlocks₁₂_transpose (H : Mat6) :
    Matrix.toBlocks₁₂ H.transpose = (Matrix.toBlocks₂₁ H).transpose := by
  rfl

private theorem toBlocks₂₁_transpose (H : Mat6) :
    Matrix.toBlocks₂₁ H.transpose = (Matrix.toBlocks₁₂ H).transpose := by
  rfl

private theorem transpose_hasFiniteCorner_of_leading {H : Mat6}
    (hH : IsHadamard H) (h : LeadingFiniteCornerCertificate H) :
    HasFiniteCorner H.transpose := by
  apply finite_topLeft_intrinsic_fibres_give_finiteCorner
    (transpose_isHadamard hH)
  · rw [toBlocks₁₁_transpose]
    exact transpose_det_ne_zero h.detE
  · rw [toBlocks₁₂_transpose]
    exact transpose_det_ne_zero h.detC
  · rw [toBlocks₂₁_transpose]
    exact transpose_det_ne_zero h.detB
  · rw [toBlocks₁₂_transpose, transpose_rowGram]
    exact finite_row_transpose_of_finite_column
      (normalizedColumnGramFibre_finite_of_transpose_endpoints
        h.C_endpoint0 h.C_endpoint3
        h.C_swapped_endpoint0 h.C_swapped_endpoint3)
  · rw [toBlocks₂₁_transpose, transpose_columnGram]
    exact finite_column_transpose_of_finite_row
      (normalizedRowGramFibre_finite_of_matrix_endpoints
        h.B_endpoint0 h.B_endpoint3
        h.B_swapped_endpoint0 h.B_swapped_endpoint3)

private theorem equivalent_transpose {H K : Mat6}
    (hHK : Equivalent H K) : Equivalent H.transpose K.transpose := by
  rcases hHK with ⟨σ, τ, r, c, hr, hc, hpres⟩
  refine ⟨τ, σ, c, r, hc, hr, ?_⟩
  intro i j
  simp only [Matrix.transpose_apply]
  rw [hpres]
  ring

private theorem primitiveCubicPhase_eq_standard_or_sq
    {omega : ℂ} (homega : IsPrimitiveCubicPhase omega) :
    omega = standardOmega ∨ omega = standardOmega ^ 2 := by
  have hstandard := standardOmega_isPrimitiveCubicPhase
  have hsum : standardOmega + standardOmega ^ 2 = -1 := by
    linear_combination hstandard.2
  have hcube : standardOmega ^ 3 = 1 :=
    primitiveCubicPhase_cube hstandard
  have hfactor :
      (omega - standardOmega) * (omega - standardOmega ^ 2) = 0 := by
    calc
      (omega - standardOmega) * (omega - standardOmega ^ 2) =
          omega ^ 2 - (standardOmega + standardOmega ^ 2) * omega +
            standardOmega ^ 3 := by ring
      _ = omega ^ 2 + omega + 1 := by rw [hsum, hcube]; ring
      _ = 0 := homega.2
  rcases mul_eq_zero.mp hfactor with h | h
  · exact Or.inl (sub_eq_zero.mp h)
  · exact Or.inr (sub_eq_zero.mp h)

private def omegaSquaredRowPermutation : Equiv.Perm I6 :=
  (Equiv.swap (Sum.inl 2) (Sum.inr 1)).trans
    (Equiv.swap (Sum.inr 0) (Sum.inr 2))

private theorem omegaSquaredRowPermutation_order :
    omegaSquaredRowPermutation (Sum.inl 0) = Sum.inl 0 ∧
    omegaSquaredRowPermutation (Sum.inl 1) = Sum.inl 1 ∧
    omegaSquaredRowPermutation (Sum.inl 2) = Sum.inr 1 ∧
    omegaSquaredRowPermutation (Sum.inr 0) = Sum.inr 2 ∧
    omegaSquaredRowPermutation (Sum.inr 1) = Sum.inl 2 ∧
    omegaSquaredRowPermutation (Sum.inr 2) = Sum.inr 0 := by
  decide

private theorem reindex_standardOmega_eq_squaredOmega (z₁ z₂ : ℂ) :
    reindexMatrix omegaSquaredRowPermutation (Equiv.refl I6)
        (affineFourierMatrix standardOmega z₁ z₂) =
      affineFourierMatrix (standardOmega ^ 2) z₁ z₂ := by
  rcases omegaSquaredRowPermutation_order with
    ⟨h0, h1, h2, h3, h4, h5⟩
  have homega := standardOmega_isPrimitiveCubicPhase
  have hcube : standardOmega ^ 3 = 1 :=
    primitiveCubicPhase_cube homega
  have hpow4 : standardOmega ^ 4 = standardOmega := by
    calc
      standardOmega ^ 4 = standardOmega * standardOmega ^ 3 := by ring
      _ = standardOmega := by rw [hcube, mul_one]
  ext i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [reindexMatrix, h0, h1, h2, h3, h4, h5,
      affineFourierMatrix, hcube, hpow4] <;>
    ring_nf <;> simp [hpow4]

private theorem standard_affine_fourier_mem_finiteCornerAtlas
    {z₁ z₂ : ℂ} (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    InFiniteCornerAtlas (affineFourierMatrix standardOmega z₁ z₂) := by
  rcases standard_affine_fourier_six_corner_certificate hz₁ hz₂ with
    ⟨r, c, hproduct⟩
  have hfourier := affineFourierMatrix_isHadamard
    standardOmega_isPrimitiveCubicPhase hz₁ hz₂
  have hleading : LeadingFiniteCornerCertificate
      (seamCornerChart r c
        (affineFourierMatrix standardOmega z₁ z₂)) :=
    leadingFiniteCornerCertificate_iff_witnessProduct_ne_zero.2 hproduct
  have heq : Equivalent (affineFourierMatrix standardOmega z₁ z₂)
      (seamCornerChart r c
        (affineFourierMatrix standardOmega z₁ z₂)) :=
    equivalent_seamCornerChart hfourier.1 r c
  have hcorner := (equivalent_isHadamard_iff heq).1 hfourier
  exact inFiniteCornerAtlas_of_equivalent heq
    (finiteCorner_mem_finiteCornerAtlas
      (leadingFiniteCornerCertificate_hasFiniteCorner hcorner hleading))

private theorem standard_transposed_affine_fourier_mem_finiteCornerAtlas
    {z₁ z₂ : ℂ} (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    InFiniteCornerAtlas
      (affineFourierMatrix standardOmega z₁ z₂).transpose := by
  rcases standard_affine_fourier_six_corner_certificate hz₁ hz₂ with
    ⟨r, c, hproduct⟩
  have hfourier := affineFourierMatrix_isHadamard
    standardOmega_isPrimitiveCubicPhase hz₁ hz₂
  have hleading : LeadingFiniteCornerCertificate
      (seamCornerChart r c
        (affineFourierMatrix standardOmega z₁ z₂)) :=
    leadingFiniteCornerCertificate_iff_witnessProduct_ne_zero.2 hproduct
  have heq : Equivalent (affineFourierMatrix standardOmega z₁ z₂)
      (seamCornerChart r c
        (affineFourierMatrix standardOmega z₁ z₂)) :=
    equivalent_seamCornerChart hfourier.1 r c
  have hcorner := (equivalent_isHadamard_iff heq).1 hfourier
  exact inFiniteCornerAtlas_of_equivalent (equivalent_transpose heq)
    (finiteCorner_mem_finiteCornerAtlas
      (transpose_hasFiniteCorner_of_leading hcorner hleading))

theorem affineFourierMatrix_mem_finiteCornerAtlas
    {omega z₁ z₂ : ℂ} (homega : IsPrimitiveCubicPhase omega)
    (hz₁ : Complex.normSq z₁ = 1) (hz₂ : Complex.normSq z₂ = 1) :
    InFiniteCornerAtlas (affineFourierMatrix omega z₁ z₂) := by
  rcases primitiveCubicPhase_eq_standard_or_sq homega with h | h
  · subst omega
    exact standard_affine_fourier_mem_finiteCornerAtlas hz₁ hz₂
  · subst omega
    have heq0 := equivalent_reindexMatrix omegaSquaredRowPermutation
      (Equiv.refl I6) (affineFourierMatrix standardOmega z₁ z₂)
    have heq : Equivalent (affineFourierMatrix standardOmega z₁ z₂)
        (affineFourierMatrix (standardOmega ^ 2) z₁ z₂) := by
      simpa [reindex_standardOmega_eq_squaredOmega] using heq0
    exact inFiniteCornerAtlas_of_equivalent (equivalent_symm heq)
      (standard_affine_fourier_mem_finiteCornerAtlas hz₁ hz₂)

theorem transposedAffineFourierMatrix_mem_finiteCornerAtlas
    {omega z₁ z₂ : ℂ} (homega : IsPrimitiveCubicPhase omega)
    (hz₁ : Complex.normSq z₁ = 1) (hz₂ : Complex.normSq z₂ = 1) :
    InFiniteCornerAtlas (affineFourierMatrix omega z₁ z₂).transpose := by
  rcases primitiveCubicPhase_eq_standard_or_sq homega with h | h
  · subst omega
    exact standard_transposed_affine_fourier_mem_finiteCornerAtlas hz₁ hz₂
  · subst omega
    have heq0 := equivalent_reindexMatrix omegaSquaredRowPermutation
      (Equiv.refl I6) (affineFourierMatrix standardOmega z₁ z₂)
    have heq : Equivalent (affineFourierMatrix standardOmega z₁ z₂)
        (affineFourierMatrix (standardOmega ^ 2) z₁ z₂) := by
      simpa [reindex_standardOmega_eq_squaredOmega] using heq0
    exact inFiniteCornerAtlas_of_equivalent
      (equivalent_symm (equivalent_transpose heq))
      (standard_transposed_affine_fourier_mem_finiteCornerAtlas hz₁ hz₂)

/-- Unconditional affine-Fourier seam inclusion, replacing the former
`FourierSeamFiniteCornerCertificate` argument in the classification chain. -/
theorem affineFourierSeam_mem_finiteCornerAtlas_proved
    {H : Mat6} (hH : IsAffineFourierSeam H) :
    InFiniteCornerAtlas H := by
  rcases hH with ⟨omega, z₁, z₂, homega, hz₁, hz₂, hpres⟩
  rcases hpres with hpres | hpres
  · exact inFiniteCornerAtlas_of_equivalent hpres
      (affineFourierMatrix_mem_finiteCornerAtlas homega hz₁ hz₂)
  · exact inFiniteCornerAtlas_of_equivalent hpres
      (transposedAffineFourierMatrix_mem_finiteCornerAtlas homega hz₁ hz₂)

end

end Hadamard6
