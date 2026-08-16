import Hadamard6.FourierAutocorrelation

/-!
# Explicit coefficients in the Fourier-block calculation
-/

namespace Hadamard6

def vHat₀ (p q : ℂ) : ℂ := 1 + p + q
def vHat₁ (ω p q : ℂ) : ℂ := 1 + ω * p + ω ^ 2 * q
def vHat₂ (ω p q : ℂ) : ℂ := 1 + ω ^ 2 * p + ω * q

def seqA₀ (ω p q : ℂ) : ℂ :=
  vHat₀ p q * star (vHat₂ ω p q)
def seqA₁ (ω p q : ℂ) : ℂ :=
  vHat₁ ω p q * star (vHat₀ p q)
def seqA₂ (ω p q : ℂ) : ℂ :=
  vHat₂ ω p q * star (vHat₁ ω p q)

def Ahat₁ (ω p q : ℂ) : ℂ :=
  seqA₀ ω p q + ω * seqA₁ ω p q + ω ^ 2 * seqA₂ ω p q
def Ahat₂ (ω p q : ℂ) : ℂ :=
  seqA₀ ω p q + ω ^ 2 * seqA₁ ω p q + ω * seqA₂ ω p q

def alpha₀ (r : ℂ) : ℂ := star r
def alpha₁ (r s : ℂ) : ℂ := r * star s
def alpha₂ (s : ℂ) : ℂ := s

def alphaHat₁ (ω r s : ℂ) : ℂ :=
  alpha₀ r + ω * alpha₁ r s + ω ^ 2 * alpha₂ s
def alphaHat₂ (ω r s : ℂ) : ℂ :=
  alpha₀ r + ω ^ 2 * alpha₁ r s + ω * alpha₂ s

theorem alphaHat₁_formula (ω r s : ℂ) :
    alphaHat₁ ω r s = star r + ω * r * star s + ω ^ 2 * s := by
  simp [alphaHat₁, alpha₀, alpha₁, alpha₂]
  ring

theorem alphaHat₂_formula (ω r s : ℂ) :
    alphaHat₂ ω r s = star r + ω ^ 2 * r * star s + ω * s := by
  simp [alphaHat₂, alpha₀, alpha₁, alpha₂]
  ring

theorem Ahat₁_formula
    {ω p q : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hp : Complex.normSq p = 1) (hq : Complex.normSq q = 1) :
    Ahat₁ ω p q =
      3 * (q + ω * star p + ω ^ 2 * p * star q) := by
  have hsω := star_eq_square_of_quadratic_unit hωu hω
  have hsω2 := star_square_eq_of_quadratic_unit hωu hω
  have hp' := star_mul_self_of_normSq_one hp
  have hq' := star_mul_self_of_normSq_one hq
  have hp'' : p * star p = 1 := by simpa [mul_comm] using hp'
  have hq'' : q * star q = 1 := by simpa [mul_comm] using hq'
  have h3 := cubic_of_quadratic hω
  unfold IsCubicRoot at h3
  have h4 : ω ^ 4 = ω := by calc
    ω ^ 4 = ω * ω ^ 3 := by ring
    _ = ω := by rw [h3, mul_one]
  have h5 : ω ^ 5 = ω ^ 2 := by calc
    ω ^ 5 = ω ^ 2 * ω ^ 3 := by ring
    _ = ω ^ 2 := by rw [h3, mul_one]
  have h6 : ω ^ 6 = 1 := by calc
    ω ^ 6 = (ω ^ 3) ^ 2 := by ring
    _ = 1 := by rw [h3]; norm_num
  simp only [Ahat₁, seqA₀, seqA₁, seqA₂, vHat₀, vHat₁, vHat₂,
    star_add, star_mul, star_one]
  rw [hsω, hsω2]
  ring_nf
  rw [h3, h4, h5, h6]
  ring_nf
  linear_combination
    (1 + p * star p + p + star p * q + star q + star q * q) * hω

theorem Ahat₂_formula
    {ω p q : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hp : Complex.normSq p = 1) (hq : Complex.normSq q = 1) :
    Ahat₂ ω p q =
      3 * (p + ω * q * star p + ω ^ 2 * star q) := by
  have hsω := star_eq_square_of_quadratic_unit hωu hω
  have hsω2 := star_square_eq_of_quadratic_unit hωu hω
  have hp' := star_mul_self_of_normSq_one hp
  have hq' := star_mul_self_of_normSq_one hq
  have hp'' : p * star p = 1 := by simpa [mul_comm] using hp'
  have hq'' : q * star q = 1 := by simpa [mul_comm] using hq'
  have h3 := cubic_of_quadratic hω
  unfold IsCubicRoot at h3
  have h4 : ω ^ 4 = ω := by calc
    ω ^ 4 = ω * ω ^ 3 := by ring
    _ = ω := by rw [h3, mul_one]
  have h5 : ω ^ 5 = ω ^ 2 := by calc
    ω ^ 5 = ω ^ 2 * ω ^ 3 := by ring
    _ = ω ^ 2 := by rw [h3, mul_one]
  simp only [Ahat₂, seqA₀, seqA₁, seqA₂, vHat₀, vHat₁, vHat₂,
    star_add, star_mul, star_one]
  rw [hsω, hsω2]
  ring_nf
  rw [h3, h4, h5]
  ring_nf
  linear_combination
    (1 + p * star p + p * star q + star p + star q * q + q) * hω

end Hadamard6
