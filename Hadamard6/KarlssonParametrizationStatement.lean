import Hadamard6.KarlssonGlobalModel
import Hadamard6.KarlssonFourierSeam

/-!
# Exact statement of Karlsson coordinate coverage

This small interface separates the mathematical statement of the
division-free coordinate theorem from both its intrinsic derivation and the
new finite-corner certificates. Keeping the statement in its own module
prevents either proof layer from becoming an accidental theorem hypothesis.
-/

namespace Hadamard6

noncomputable section

/-- Canonically oriented raw Karlsson coordinates, excluding only the common
affine-Fourier point. -/
structure CanonicalKarlssonRawPresentation (H : Mat6) where
  t : ℝ
  p : ℂ
  z₁ : ℂ
  z₂ : ℂ
  z₃ : ℂ
  z₄ : ℂ
  t_pos : 0 < t
  p_unit : Complex.normSq p = 1
  p_im_nonneg : 0 ≤ p.im
  p_ne_neg_one : p ≠ -1
  not_common_fourier : ¬(t = 1 ∧ p = 1)
  z₁_unit : Complex.normSq z₁ = 1
  z₂_unit : Complex.normSq z₂ = 1
  z₃_unit : Complex.normSq z₃ = 1
  z₄_unit : Complex.normSq z₄ = 1
  equivalent_raw :
    Equivalent H (karlssonRawMatrix t p z₁ z₂ z₃ z₄)

/-- The raw-or-seam coverage statement consumed by the finite-corner
assembly.  It is derived internally from intrinsic `H₂` extraction plus the
residual seam identification. -/
def KarlssonRawOrSeamCoverage : Prop :=
  ∀ H : Mat6, IsHadamard H → HasHadamardTwoByTwo H →
    Nonempty (CanonicalKarlssonRawPresentation H) ∨ IsAffineFourierSeam H

end

end Hadamard6
