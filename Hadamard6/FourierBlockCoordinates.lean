import Hadamard6.FourierCoefficientFormulas

/-!
# Coordinates of the forced lower-right Fourier block
-/

namespace Hadamard6

def zCol₀ (ω p q r s : ℂ) : ℂ × ℂ × ℂ :=
  (vHat₀ p q, r * vHat₂ ω p q, s * vHat₁ ω p q)

def zCol₁ (ω p q r s : ℂ) : ℂ × ℂ × ℂ :=
  (vHat₁ ω p q, r * vHat₀ p q, s * vHat₂ ω p q)

def zCol₂ (ω p q r s : ℂ) : ℂ × ℂ × ℂ :=
  (vHat₂ ω p q, r * vHat₁ ω p q, s * vHat₀ p q)

def dftEntry₀ (z : ℂ × ℂ × ℂ) : ℂ := dft₀ z.1 z.2.1 z.2.2
def dftEntry₁ (ω : ℂ) (z : ℂ × ℂ × ℂ) : ℂ :=
  dft₁ ω z.1 z.2.1 z.2.2
def dftEntry₂ (ω : ℂ) (z : ℂ × ℂ × ℂ) : ℂ :=
  dft₂ ω z.1 z.2.1 z.2.2

noncomputable def fourierForcedD (ω p q r s : ℂ) : Mat3 := !![
  -(dftEntry₀ (zCol₀ ω p q r s)) / 3,
    -(dftEntry₀ (zCol₁ ω p q r s)) / 3,
    -(dftEntry₀ (zCol₂ ω p q r s)) / 3;
  -(dftEntry₁ ω (zCol₀ ω p q r s)) / 3,
    -(dftEntry₁ ω (zCol₁ ω p q r s)) / 3,
    -(dftEntry₁ ω (zCol₂ ω p q r s)) / 3;
  -(dftEntry₂ ω (zCol₀ ω p q r s)) / 3,
    -(dftEntry₂ ω (zCol₁ ω p q r s)) / 3,
    -(dftEntry₂ ω (zCol₂ ω p q r s)) / 3]

def forwardCorr (z₀ z₁ z₂ : ℂ) : ℂ :=
  z₀ * star z₁ + z₁ * star z₂ + z₂ * star z₀

theorem forwardCorr_eq_star_cyclicCorr (z₀ z₁ z₂ : ℂ) :
    forwardCorr z₀ z₁ z₂ = star (cyclicCorr z₀ z₁ z₂) := by
  simp [forwardCorr, cyclicCorr, star_add, star_mul]
  ring

theorem norm_dft_eq_nine_of_scaled_unit {z : ℂ}
    (h : Complex.normSq (-z / 3) = 1) :
    star z * z = 9 := by
  have hz : Complex.normSq z = 9 := by
    simp [div_eq_mul_inv, Complex.normSq_mul, Complex.normSq_neg,
      Complex.normSq_ofNat] at h
    norm_num at h ⊢
    nlinarith
  simpa [Complex.star_def, Complex.normSq_eq_conj_mul_self] using
    congrArg (fun x : ℝ ↦ (x : ℂ)) hz

theorem forwardCorr_zero_of_three_scaled_units
    {ω z₀ z₁ z₂ : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (h₀ : Complex.normSq (-(dft₀ z₀ z₁ z₂) / 3) = 1)
    (h₁ : Complex.normSq (-(dft₁ ω z₀ z₁ z₂) / 3) = 1)
    (h₂ : Complex.normSq (-(dft₂ ω z₀ z₁ z₂) / 3) = 1) :
    forwardCorr z₀ z₁ z₂ = 0 := by
  have hn₀ := norm_dft_eq_nine_of_scaled_unit h₀
  have hn₁ := norm_dft_eq_nine_of_scaled_unit h₁
  have hn₂ := norm_dft_eq_nine_of_scaled_unit h₂
  rw [forwardCorr_eq_star_cyclicCorr,
    cyclicCorr_eq_zero_of_equal_dft_norms hωu hω
      (hn₀.trans hn₁.symm) (hn₀.trans hn₂.symm)]
  simp

theorem fourierForcedD_forwardCorr_zero
    {ω p q r s : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hD : EntrywiseUnit (fourierForcedD ω p q r s)) :
    forwardCorr (zCol₀ ω p q r s).1
        (zCol₀ ω p q r s).2.1 (zCol₀ ω p q r s).2.2 = 0 ∧
      forwardCorr (zCol₁ ω p q r s).1
        (zCol₁ ω p q r s).2.1 (zCol₁ ω p q r s).2.2 = 0 ∧
      forwardCorr (zCol₂ ω p q r s).1
        (zCol₂ ω p q r s).2.1 (zCol₂ ω p q r s).2.2 = 0 := by
  constructor
  · apply forwardCorr_zero_of_three_scaled_units hωu hω
    · simpa [fourierForcedD, dftEntry₀] using hD 0 0
    · simpa [fourierForcedD, dftEntry₁] using hD 1 0
    · simpa [fourierForcedD, dftEntry₂] using hD 2 0
  constructor
  · apply forwardCorr_zero_of_three_scaled_units hωu hω
    · simpa [fourierForcedD, dftEntry₀] using hD 0 1
    · simpa [fourierForcedD, dftEntry₁] using hD 1 1
    · simpa [fourierForcedD, dftEntry₂] using hD 2 1
  · apply forwardCorr_zero_of_three_scaled_units hωu hω
    · simpa [fourierForcedD, dftEntry₀] using hD 0 2
    · simpa [fourierForcedD, dftEntry₁] using hD 1 2
    · simpa [fourierForcedD, dftEntry₂] using hD 2 2

theorem zCol₀_forwardCorr_eq_convolution (ω p q r s : ℂ) :
    forwardCorr (zCol₀ ω p q r s).1
        (zCol₀ ω p q r s).2.1 (zCol₀ ω p q r s).2.2 =
      cyclicConv₀ (alpha₀ r) (alpha₁ r s) (alpha₂ s)
        (seqA₀ ω p q) (seqA₁ ω p q) (seqA₂ ω p q) := by
  simp only [zCol₀, forwardCorr, alpha₀, alpha₁, alpha₂,
    seqA₀, seqA₁, seqA₂, cyclicConv₀, star_mul]
  ring

theorem zCol₁_forwardCorr_eq_convolution (ω p q r s : ℂ) :
    forwardCorr (zCol₁ ω p q r s).1
        (zCol₁ ω p q r s).2.1 (zCol₁ ω p q r s).2.2 =
      cyclicConv₁ (alpha₀ r) (alpha₁ r s) (alpha₂ s)
        (seqA₀ ω p q) (seqA₁ ω p q) (seqA₂ ω p q) := by
  simp only [zCol₁, forwardCorr, alpha₀, alpha₁, alpha₂,
    seqA₀, seqA₁, seqA₂, cyclicConv₁, star_mul]
  ring

theorem zCol₂_forwardCorr_eq_convolution (ω p q r s : ℂ) :
    forwardCorr (zCol₂ ω p q r s).1
        (zCol₂ ω p q r s).2.1 (zCol₂ ω p q r s).2.2 =
      cyclicConv₂ (alpha₀ r) (alpha₁ r s) (alpha₂ s)
        (seqA₀ ω p q) (seqA₁ ω p q) (seqA₂ ω p q) := by
  simp only [zCol₂, forwardCorr, alpha₀, alpha₁, alpha₂,
    seqA₀, seqA₁, seqA₂, cyclicConv₂, star_mul]
  ring

theorem fourierForcedD_factor_equations
    {ω p q r s : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hD : EntrywiseUnit (fourierForcedD ω p q r s)) :
    alphaHat₁ ω r s * Ahat₁ ω p q = 0 ∧
      alphaHat₂ ω r s * Ahat₂ ω p q = 0 := by
  rcases fourierForcedD_forwardCorr_zero hωu hω hD with
    ⟨h₀, h₁, h₂⟩
  rw [zCol₀_forwardCorr_eq_convolution] at h₀
  rw [zCol₁_forwardCorr_eq_convolution] at h₁
  rw [zCol₂_forwardCorr_eq_convolution] at h₂
  simpa [alphaHat₁, alphaHat₂, Ahat₁, Ahat₂] using
    convolution_zero_gives_factor_equations hω h₀ h₁ h₂

end Hadamard6
