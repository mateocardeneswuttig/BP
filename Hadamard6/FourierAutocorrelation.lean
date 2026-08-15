import Hadamard6.FourierChartAssembly

/-!
# Three-point Fourier autocorrelation
-/

namespace Hadamard6

def dft₀ (z₀ z₁ z₂ : ℂ) : ℂ := z₀ + z₁ + z₂
def dft₁ (ω z₀ z₁ z₂ : ℂ) : ℂ := z₀ + ω * z₁ + ω ^ 2 * z₂
def dft₂ (ω z₀ z₁ z₂ : ℂ) : ℂ := z₀ + ω ^ 2 * z₁ + ω * z₂

def cyclicCorr (z₀ z₁ z₂ : ℂ) : ℂ :=
  star z₀ * z₁ + star z₁ * z₂ + star z₂ * z₀

theorem cubic_of_quadratic {ω : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    IsCubicRoot ω := by
  unfold IsCubicRoot
  have hfac : (ω - 1) * (ω ^ 2 + ω + 1) = ω ^ 3 - 1 := by ring
  rw [hω, mul_zero] at hfac
  exact sub_eq_zero.mp hfac.symm

theorem quadratic_ne_one {ω : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    ω ≠ 1 := by
  intro h
  rw [h] at hω
  norm_num at hω

theorem star_eq_square_of_quadratic_unit {ω : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0) :
    star ω = ω ^ 2 := by
  have hmul : star ω * ω = 1 := star_mul_self_of_normSq_one hωu
  have hcub : ω ^ 3 = 1 := cubic_of_quadratic hω
  calc
    star ω = star ω * ω ^ 3 := by rw [hcub, mul_one]
    _ = (star ω * ω) * ω ^ 2 := by ring
    _ = ω ^ 2 := by rw [hmul, one_mul]

theorem star_square_eq_of_quadratic_unit {ω : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0) :
    star (ω ^ 2) = ω := by
  rw [star_pow]
  rw [star_eq_square_of_quadratic_unit hωu hω]
  have hcub := cubic_of_quadratic hω
  unfold IsCubicRoot at hcub
  calc
    (ω ^ 2) ^ 2 = ω ^ 4 := by ring
    _ = ω * ω ^ 3 := by ring
    _ = ω := by rw [hcub, mul_one]

theorem dft₀_norm_expansion {z₀ z₁ z₂ : ℂ} :
    star (dft₀ z₀ z₁ z₂) * dft₀ z₀ z₁ z₂ =
      (star z₀ * z₀ + star z₁ * z₁ + star z₂ * z₂) +
      cyclicCorr z₀ z₁ z₂ + star (cyclicCorr z₀ z₁ z₂) := by
  simp only [dft₀, cyclicCorr, star_add, star_mul, star_star]
  ring

theorem dft₁_norm_expansion {ω z₀ z₁ z₂ : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0) :
    star (dft₁ ω z₀ z₁ z₂) * dft₁ ω z₀ z₁ z₂ =
      (star z₀ * z₀ + star z₁ * z₁ + star z₂ * z₂) +
      ω * cyclicCorr z₀ z₁ z₂ +
      ω ^ 2 * star (cyclicCorr z₀ z₁ z₂) := by
  have hs := star_eq_square_of_quadratic_unit hωu hω
  have hs2 := star_square_eq_of_quadratic_unit hωu hω
  have hcub := cubic_of_quadratic hω
  unfold IsCubicRoot at hcub
  have h4 : ω ^ 4 = ω := by
    calc
      ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hcub, mul_one]
  simp only [dft₁, cyclicCorr, star_add, star_mul, star_star]
  rw [hs, hs2]
  ring_nf
  rw [h4, hcub]
  ring_nf

theorem dft₂_norm_expansion {ω z₀ z₁ z₂ : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0) :
    star (dft₂ ω z₀ z₁ z₂) * dft₂ ω z₀ z₁ z₂ =
      (star z₀ * z₀ + star z₁ * z₁ + star z₂ * z₂) +
      ω ^ 2 * cyclicCorr z₀ z₁ z₂ +
      ω * star (cyclicCorr z₀ z₁ z₂) := by
  have hs := star_eq_square_of_quadratic_unit hωu hω
  have hs2 := star_square_eq_of_quadratic_unit hωu hω
  have hcub := cubic_of_quadratic hω
  unfold IsCubicRoot at hcub
  have h4 : ω ^ 4 = ω := by
    calc
      ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hcub, mul_one]
  simp only [dft₂, cyclicCorr, star_add, star_mul, star_star]
  rw [hs, hs2]
  ring_nf
  rw [h4, hcub]
  ring_nf

/-- If all three Fourier coefficients have the same modulus, the nonzero
cyclic autocorrelation vanishes. -/
theorem cyclicCorr_eq_zero_of_equal_dft_norms
    {ω z₀ z₁ z₂ : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (h01 : star (dft₀ z₀ z₁ z₂) * dft₀ z₀ z₁ z₂ =
      star (dft₁ ω z₀ z₁ z₂) * dft₁ ω z₀ z₁ z₂)
    (h02 : star (dft₀ z₀ z₁ z₂) * dft₀ z₀ z₁ z₂ =
      star (dft₂ ω z₀ z₁ z₂) * dft₂ ω z₀ z₁ z₂) :
    cyclicCorr z₀ z₁ z₂ = 0 := by
  let C := cyclicCorr z₀ z₁ z₂
  let S := star C
  have h1 := h01
  have h2 := h02
  rw [dft₀_norm_expansion,
    dft₁_norm_expansion hωu hω] at h1
  rw [dft₀_norm_expansion,
    dft₂_norm_expansion hωu hω] at h2
  change _ + C + S = _ + ω * C + ω ^ 2 * S at h1
  change _ + C + S = _ + ω ^ 2 * C + ω * S at h2
  have hdiff : (ω ^ 2 - ω) * (C - S) = 0 := by
    linear_combination h1 - h2
  have hωnz : ω ≠ 0 := by
    intro hz
    rw [hz] at hωu
    norm_num at hωu
  have hω2ne : ω ^ 2 - ω ≠ 0 := by
    rw [sub_ne_zero]
    intro heq
    have : ω * ω = ω * 1 := by simpa [pow_two] using heq
    exact quadratic_ne_one hω (mul_left_cancel₀ hωnz this)
  have hCS : C = S := sub_eq_zero.mp ((mul_eq_zero.mp hdiff).resolve_left hω2ne)
  rw [← hCS] at h1
  have hthree : (3 : ℂ) * C = 0 := by
    linear_combination h1 + C * hω
  have : C = 0 := by
    exact (mul_eq_zero.mp hthree).resolve_left (by norm_num)
  exact this

def cyclicConv₀ (α₀ α₁ α₂ A₀ A₁ A₂ : ℂ) : ℂ :=
  α₀ * A₀ + α₁ * A₂ + α₂ * A₁

def cyclicConv₁ (α₀ α₁ α₂ A₀ A₁ A₂ : ℂ) : ℂ :=
  α₀ * A₁ + α₁ * A₀ + α₂ * A₂

def cyclicConv₂ (α₀ α₁ α₂ A₀ A₁ A₂ : ℂ) : ℂ :=
  α₀ * A₂ + α₁ * A₁ + α₂ * A₀

theorem dft_cyclicConvolution₁
    {ω α₀ α₁ α₂ A₀ A₁ A₂ : ℂ}
    (hω : ω ^ 2 + ω + 1 = 0) :
    (α₀ + ω * α₁ + ω ^ 2 * α₂) *
        (A₀ + ω * A₁ + ω ^ 2 * A₂) =
      cyclicConv₀ α₀ α₁ α₂ A₀ A₁ A₂ +
        ω * cyclicConv₁ α₀ α₁ α₂ A₀ A₁ A₂ +
        ω ^ 2 * cyclicConv₂ α₀ α₁ α₂ A₀ A₁ A₂ := by
  have hcub := cubic_of_quadratic hω
  unfold IsCubicRoot at hcub
  simp only [cyclicConv₀, cyclicConv₁, cyclicConv₂]
  ring_nf
  have h4 : ω ^ 4 = ω := by
    calc
      ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hcub, mul_one]
  rw [h4, hcub]
  ring

theorem dft_cyclicConvolution₂
    {ω α₀ α₁ α₂ A₀ A₁ A₂ : ℂ}
    (hω : ω ^ 2 + ω + 1 = 0) :
    (α₀ + ω ^ 2 * α₁ + ω * α₂) *
        (A₀ + ω ^ 2 * A₁ + ω * A₂) =
      cyclicConv₀ α₀ α₁ α₂ A₀ A₁ A₂ +
        ω ^ 2 * cyclicConv₁ α₀ α₁ α₂ A₀ A₁ A₂ +
        ω * cyclicConv₂ α₀ α₁ α₂ A₀ A₁ A₂ := by
  have hcub := cubic_of_quadratic hω
  unfold IsCubicRoot at hcub
  simp only [cyclicConv₀, cyclicConv₁, cyclicConv₂]
  ring_nf
  have h4 : ω ^ 4 = ω := by
    calc
      ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hcub, mul_one]
  rw [h4, hcub]
  ring

theorem convolution_zero_gives_factor_equations
    {ω α₀ α₁ α₂ A₀ A₁ A₂ : ℂ}
    (hω : ω ^ 2 + ω + 1 = 0)
    (h₀ : cyclicConv₀ α₀ α₁ α₂ A₀ A₁ A₂ = 0)
    (h₁ : cyclicConv₁ α₀ α₁ α₂ A₀ A₁ A₂ = 0)
    (h₂ : cyclicConv₂ α₀ α₁ α₂ A₀ A₁ A₂ = 0) :
    ((α₀ + ω * α₁ + ω ^ 2 * α₂) *
        (A₀ + ω * A₁ + ω ^ 2 * A₂) = 0) ∧
      ((α₀ + ω ^ 2 * α₁ + ω * α₂) *
        (A₀ + ω ^ 2 * A₁ + ω * A₂) = 0) := by
  constructor
  · rw [dft_cyclicConvolution₁ hω, h₀, h₁, h₂]
    ring
  · rw [dft_cyclicConvolution₂ hω, h₀, h₁, h₂]
    ring

end Hadamard6
