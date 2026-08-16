import Hadamard6.FourierBlockCoordinates
import Hadamard6.FiniteCornerFromBlocks

/-!
# Orthogonality forces the fourth Fourier block
-/

namespace Hadamard6

/-- The coordinate definition of the fourth block is exactly the compact
matrix product obtained from block orthogonality. -/
theorem fourierForcedD_eq_product
    {ω p q r s : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0) :
    fourierForcedD ω p q r s =
      -(3 : ℂ)⁻¹ •
        (columnGauge (fourierParameters r s) (fourier3 ω) *
          Matrix.conjTranspose (fourier3 ω) *
          rowGauge (fourierParameters p q) (fourier3 ω)) := by
  have hstarω := star_eq_square_of_quadratic_unit hωu hω
  have hω3 := cubic_of_quadratic hω
  unfold IsCubicRoot at hω3
  have hω4 : ω ^ 4 = ω := by
    calc ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hω3, mul_one]
  have hω5 : ω ^ 5 = ω ^ 2 := by
    calc ω ^ 5 = ω ^ 2 * ω ^ 3 := by ring
      _ = ω ^ 2 := by rw [hω3, mul_one]
  have hω6 : ω ^ 6 = 1 := by rw [show ω ^ 6 = (ω ^ 3) ^ 2 by ring, hω3]; norm_num
  have hω7 : ω ^ 7 = ω := by rw [show ω ^ 7 = ω * ω ^ 6 by ring, hω6, mul_one]
  have hω8 : ω ^ 8 = ω ^ 2 := by rw [show ω ^ 8 = ω ^ 2 * ω ^ 6 by ring, hω6, mul_one]
  have hω9 : ω ^ 9 = 1 := by rw [show ω ^ 9 = (ω ^ 3) ^ 3 by ring, hω3]; norm_num
  have hω10 : ω ^ 10 = ω := by rw [show ω ^ 10 = ω * ω ^ 9 by ring, hω9, mul_one]
  have hω11 : ω ^ 11 = ω ^ 2 := by rw [show ω ^ 11 = ω ^ 2 * ω ^ 9 by ring, hω9, mul_one]
  have hω12 : ω ^ 12 = 1 := by rw [show ω ^ 12 = (ω ^ 3) ^ 4 by ring, hω3]; norm_num
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [fourierForcedD, dftEntry₀, dftEntry₁, dftEntry₂,
      dft₀, dft₁, dft₂, zCol₀, zCol₁, zCol₂,
      vHat₀, vHat₁, vHat₂, Matrix.mul_apply,
      Matrix.conjTranspose_apply, Fin.sum_univ_three,
      fourier3, rowGauge, columnGauge, fourierParameters,
      hstarω, hω4] <;>
    ring_nf <;>
    simp [hω3, hω4, hω5, hω6, hω7, hω8, hω9, hω10,
      hω11, hω12] <;>
    ring

theorem isUnit_det_of_isHadamard3 {B : Mat3} (hB : IsHadamard3 B) :
    IsUnit B.det := by
  rw [isUnit_iff_ne_zero]
  intro hzero
  have hdet := congrArg Matrix.det hB.2
  rw [Matrix.det_mul, hzero, zero_mul] at hdet
  norm_num [Matrix.det_smul] at hdet

/-- Once the first three normalized blocks are known, the Hadamard
cross-equation uniquely identifies the fourth block with the explicit
coordinate formula. -/
theorem fourth_block_eq_fourierForcedD
    {K : Mat6} {ω p q r s : ℂ} {D : Mat3}
    (hK : IsHadamard K)
    (hform : K = fourierNormalForm ω p q r s D)
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hB : IsHadamard3
      (rowGauge (fourierParameters p q) (fourier3 ω))) :
    D = fourierForcedD ω p q r s := by
  let E := fourier3 ω
  let B := rowGauge (fourierParameters p q) (fourier3 ω)
  let C := columnGauge (fourierParameters r s) (fourier3 ω)
  have hcross : E * Matrix.conjTranspose C +
      B * Matrix.conjTranspose D = 0 := by
    have hc := hadamard_top_row_cross hK
    rw [hform] at hc
    simpa [fourierNormalForm, E, B, C] using hc
  have hforced : D = forcedD E B C :=
    eq_forcedD_of_row_cross (isUnit_det_of_isHadamard3 hB) hcross
  have hproduct : fourierForcedD ω p q r s =
      -(3 : ℂ)⁻¹ • (C * Matrix.conjTranspose E * B) := by
    simpa [E, B, C] using
      fourierForcedD_eq_product (p := p) (q := q) (r := r) (s := s)
        hωu hω
  rw [hforced]
  rw [hproduct]
  unfold forcedD
  have hBinvStar : Matrix.conjTranspose (B⁻¹) =
      (3 : ℂ)⁻¹ • B := by
    have hright : Matrix.conjTranspose B * ((3 : ℂ)⁻¹ • B) = 1 := by
      rw [Matrix.mul_smul, hadamard3_column_gram hB, smul_smul]
      norm_num
    have hinv : (Matrix.conjTranspose B)⁻¹ = (3 : ℂ)⁻¹ • B :=
      Matrix.inv_eq_right_inv hright
    simpa only [Matrix.conjTranspose_nonsing_inv] using hinv
  rw [hBinvStar]
  simp [Matrix.mul_assoc]

theorem first_three_blocks_force_full_normalForm
    {K : Mat6} {ω p q r s : ℂ} {D : Mat3}
    (hK : IsHadamard K)
    (hform : K = fourierNormalForm ω p q r s D)
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hB : IsHadamard3
      (rowGauge (fourierParameters p q) (fourier3 ω))) :
    K = fourierNormalForm ω p q r s (fourierForcedD ω p q r s) := by
  rw [hform, fourth_block_eq_fourierForcedD hK hform hωu hω hB]

end Hadamard6
