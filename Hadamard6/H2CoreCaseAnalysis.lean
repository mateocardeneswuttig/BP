import Hadamard6.H2BlockNormalization
import Mathlib.Tactic

/-!
# Algebra for the intrinsic `H₂` core case split

This file begins the finite case analysis in Karlsson's order-six
`H₂`-normalization theorem.  The first ingredient is the exact form of the
elementary real-orthogonality lemma used to separate the generic phase
orientations.  It is proved here from real and imaginary coordinates, rather
than retained as a cited geometric assertion.
-/

namespace Hadamard6

/-- Two unit complex numbers whose real coordinate vectors are parallel are
equal or antipodal. -/
theorem unit_complex_eq_or_eq_neg_of_det_zero
    {z₁ z₂ : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hdet : z₁.re * z₂.im - z₁.im * z₂.re = 0) :
    z₂ = z₁ ∨ z₂ = -z₁ := by
  have hn₁ : z₁.re ^ 2 + z₁.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hz₁
  have hn₂ : z₂.re ^ 2 + z₂.im ^ 2 = 1 := by
    simpa [Complex.normSq_apply, pow_two] using hz₂
  let s : ℝ := z₁.re * z₂.re + z₁.im * z₂.im
  have hsSq : s ^ 2 = 1 := by
    dsimp [s]
    nlinarith [sq_nonneg (z₁.re * z₂.im - z₁.im * z₂.re)]
  have hs : s = 1 ∨ s = -1 := (sq_eq_one_iff).mp hsSq
  rcases hs with hs | hs
  · left
    apply Complex.ext
    · dsimp [s] at hs
      nlinarith [sq_nonneg (z₂.re - z₁.re),
        sq_nonneg (z₂.im - z₁.im)]
    · dsimp [s] at hs
      nlinarith [sq_nonneg (z₂.re - z₁.re),
        sq_nonneg (z₂.im - z₁.im)]
  · right
    apply Complex.ext
    · simp only [Complex.neg_re]
      dsimp [s] at hs
      nlinarith [sq_nonneg (z₂.re + z₁.re),
        sq_nonneg (z₂.im + z₁.im)]
    · simp only [Complex.neg_im]
      dsimp [s] at hs
      nlinarith [sq_nonneg (z₂.re + z₁.re),
        sq_nonneg (z₂.im + z₁.im)]

/-- Karlsson's elementary nondegeneracy lemma: if two unit phases are
neither equal nor antipodal, the only complex number whose products with
both phases have zero real part is zero. -/
theorem two_unit_real_mul_zero
    {z₁ z₂ w : ℂ}
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hne : z₂ ≠ z₁ ∧ z₂ ≠ -z₁)
    (h₁ : (z₁ * w).re = 0)
    (h₂ : (z₂ * w).re = 0) :
    w = 0 := by
  have hdet : z₁.re * z₂.im - z₁.im * z₂.re ≠ 0 := by
    intro hzero
    rcases unit_complex_eq_or_eq_neg_of_det_zero hz₁ hz₂ hzero with h | h
    · exact hne.1 h
    · exact hne.2 h
  have h₁' : z₁.re * w.re - z₁.im * w.im = 0 := by
    simpa [Complex.mul_re] using h₁
  have h₂' : z₂.re * w.re - z₂.im * w.im = 0 := by
    simpa [Complex.mul_re] using h₂
  have hreProd :
      (z₁.re * z₂.im - z₁.im * z₂.re) * w.re = 0 := by
    linear_combination z₂.im * h₁' - z₁.im * h₂'
  have himProd :
      (z₁.re * z₂.im - z₁.im * z₂.re) * w.im = 0 := by
    linear_combination z₂.re * h₁' - z₁.re * h₂'
  have hre : w.re = 0 := (mul_eq_zero.mp hreProd).resolve_left hdet
  have him : w.im = 0 := (mul_eq_zero.mp himProd).resolve_left hdet
  apply Complex.ext <;> simp [hre, him]

end Hadamard6
