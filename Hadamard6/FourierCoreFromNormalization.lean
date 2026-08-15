import Hadamard6.FourierChartAssembly
import Hadamard6.FourierUnmixed
import Hadamard6.FourierForcedCompletion

/-!
# From simultaneous Fourier normalization to the complete chart

This file proves all of the cyclic-autocorrelation and unmixed-case data
required by `FourierChartCore`.  The only remaining input is the geometric
normalization statement that an all-Fourier-block Hadamard is equivalent to
the displayed simultaneous normal form.
-/

namespace Hadamard6

/-- The precise output required from simultaneous block-preserving Fourier
normalization.  In particular, it does not assume either factor equation or
any classification conclusion. -/
structure FourierNormalization (H : Mat6) where
  K : Mat6
  hK : IsHadamard K
  equivalent : Equivalent H K
  ω : ℂ
  p : ℂ
  q : ℂ
  r : ℂ
  s : ℂ
  omega_unit : Complex.normSq ω = 1
  omega_quadratic : ω ^ 2 + ω + 1 = 0
  p_unit : Complex.normSq p = 1
  q_unit : Complex.normSq q = 1
  r_unit : Complex.normSq r = 1
  s_unit : Complex.normSq s = 1
  normalForm :
    K = fourierNormalForm ω p q r s (fourierForcedD ω p q r s)

def FourierNormalizationReduction : Prop :=
  ∀ H, IsHadamard H → AllFourBlocksHadamard H →
    Nonempty (FourierNormalization H)

/-- The genuinely geometric part of simultaneous normalization: only the
first three blocks are put in Fourier form.  The fourth block is arbitrary
here and will be forced internally from the Hadamard equation. -/
structure FourierThreeBlockNormalization (H : Mat6) where
  K : Mat6
  hK : IsHadamard K
  equivalent : Equivalent H K
  ω : ℂ
  p : ℂ
  q : ℂ
  r : ℂ
  s : ℂ
  D : Mat3
  omega_unit : Complex.normSq ω = 1
  omega_quadratic : ω ^ 2 + ω + 1 = 0
  p_unit : Complex.normSq p = 1
  q_unit : Complex.normSq q = 1
  r_unit : Complex.normSq r = 1
  s_unit : Complex.normSq s = 1
  topRight_hadamard : IsHadamard3
    (rowGauge (fourierParameters p q) (fourier3 ω))
  firstThreeBlocks : K = fourierNormalForm ω p q r s D

def FourierThreeBlockNormalizationReduction : Prop :=
  ∀ H, IsHadamard H → AllFourBlocksHadamard H →
    Nonempty (FourierThreeBlockNormalization H)

noncomputable def FourierThreeBlockNormalization.toNormalization {H : Mat6}
    (n : FourierThreeBlockNormalization H) : FourierNormalization H :=
  { K := n.K
    hK := n.hK
    equivalent := n.equivalent
    ω := n.ω
    p := n.p
    q := n.q
    r := n.r
    s := n.s
    omega_unit := n.omega_unit
    omega_quadratic := n.omega_quadratic
    p_unit := n.p_unit
    q_unit := n.q_unit
    r_unit := n.r_unit
    s_unit := n.s_unit
    normalForm := first_three_blocks_force_full_normalForm n.hK
      n.firstThreeBlocks n.omega_unit n.omega_quadratic
      n.topRight_hadamard }

theorem fourierNormalizationReduction_of_threeBlocks
    (hthree : FourierThreeBlockNormalizationReduction) :
    FourierNormalizationReduction := by
  intro H hH hfour
  rcases hthree H hH hfour with ⟨n⟩
  exact ⟨n.toNormalization⟩

noncomputable def FourierNormalization.toCore {H : Mat6}
    (n : FourierNormalization H) : FourierChartCore H := by
  have hD : EntrywiseUnit (fourierForcedD n.ω n.p n.q n.r n.s) := by
    intro i j
    have h := n.hK.1 (Sum.inr i) (Sum.inr j)
    rw [n.normalForm] at h
    simpa [fourierNormalForm] using h
  have hfactors := fourierForcedD_factor_equations
    n.omega_unit n.omega_quadratic hD
  exact
    { K := n.K
      hK := n.hK
      equivalent := n.equivalent
      ω := n.ω
      p := n.p
      q := n.q
      r := n.r
      s := n.s
      D := fourierForcedD n.ω n.p n.q n.r n.s
      normalForm := n.normalForm
      ω_unit := n.omega_unit
      ω_cubic := cubic_of_quadratic n.omega_quadratic
      p_unit := n.p_unit
      q_unit := n.q_unit
      r_unit := n.r_unit
      s_unit := n.s_unit
      A₁ := Ahat₁ n.ω n.p n.q
      A₂ := Ahat₂ n.ω n.p n.q
      α₁ := alphaHat₁ n.ω n.r n.s
      α₂ := alphaHat₂ n.ω n.r n.s
      A₁_formula := Ahat₁_formula n.omega_unit n.omega_quadratic
        n.p_unit n.q_unit
      A₂_formula := Ahat₂_formula n.omega_unit n.omega_quadratic
        n.p_unit n.q_unit
      α₁_formula := alphaHat₁_formula n.ω n.r n.s
      α₂_formula := alphaHat₂_formula n.ω n.r n.s
      factor₁ := hfactors.1
      factor₂ := hfactors.2
      K_twoByTwo_of_A_zero := by
        intro hA₁ hA₂
        rw [n.normalForm]
        exact Ahat_both_zero_hasTwoByTwo n.omega_unit
          n.omega_quadratic n.p_unit n.q_unit hA₁ hA₂
      K_twoByTwo_of_α_zero := by
        intro hα₁ hα₂
        rw [n.normalForm]
        exact alphaHat_both_zero_hasTwoByTwo n.omega_unit
          n.omega_quadratic n.r_unit n.s_unit hα₁ hα₂ }

theorem fourierChartCoreReduction_of_normalization
    (hnorm : FourierNormalizationReduction) : FourierChartCoreReduction := by
  intro H hH hfour
  rcases hnorm H hH hfour with ⟨n⟩
  exact ⟨n.toCore⟩

theorem fourierChartReduction_of_normalization
    (hnorm : FourierNormalizationReduction) : FourierChartReduction :=
  fourierChartReduction_of_core
    (fourierChartCoreReduction_of_normalization hnorm)

theorem fourierChartReduction_of_threeBlockNormalization
    (hthree : FourierThreeBlockNormalizationReduction) :
    FourierChartReduction :=
  fourierChartReduction_of_normalization
    (fourierNormalizationReduction_of_threeBlocks hthree)

end Hadamard6
