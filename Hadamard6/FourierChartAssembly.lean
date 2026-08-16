import Hadamard6.FourierNormalForm
import Hadamard6.EquivalentStrata

/-!
# Assembly of an explicit Fourier normal form into the abstract chart
-/

namespace Hadamard6

/-- The exact data still supplied by simultaneous Fourier normalization and
the cyclic-autocorrelation calculation.  All equivalence transport and the
mixed-case allocation are outside this structure and proved in Lean. -/
structure FourierChartCore (H : Mat6) where
  K : Mat6
  hK : IsHadamard K
  equivalent : Equivalent H K
  ω : ℂ
  p : ℂ
  q : ℂ
  r : ℂ
  s : ℂ
  D : Mat3
  normalForm : K = fourierNormalForm ω p q r s D
  ω_unit : Complex.normSq ω = 1
  ω_cubic : IsCubicRoot ω
  p_unit : Complex.normSq p = 1
  q_unit : Complex.normSq q = 1
  r_unit : Complex.normSq r = 1
  s_unit : Complex.normSq s = 1
  A₁ : ℂ
  A₂ : ℂ
  α₁ : ℂ
  α₂ : ℂ
  A₁_formula : A₁ = 3 * (q + ω * star p + ω ^ 2 * p * star q)
  A₂_formula : A₂ = 3 * (p + ω * q * star p + ω ^ 2 * star q)
  α₁_formula : α₁ = star r + ω * r * star s + ω ^ 2 * s
  α₂_formula : α₂ = star r + ω ^ 2 * r * star s + ω * s
  factor₁ : α₁ * A₁ = 0
  factor₂ : α₂ * A₂ = 0
  K_twoByTwo_of_A_zero : A₁ = 0 → A₂ = 0 → HasHadamardTwoByTwo K
  K_twoByTwo_of_α_zero : α₁ = 0 → α₂ = 0 → HasHadamardTwoByTwo K

def FourierChartCoreReduction : Prop :=
  ∀ H, IsHadamard H → AllFourBlocksHadamard H →
    Nonempty (FourierChartCore H)

def FourierChartCore.toChart {H : Mat6}
    (ch : FourierChartCore H) : FourierChart H where
  K := ch.K
  hK := ch.hK
  equivalent := ch.equivalent
  ω := ch.ω
  p := ch.p
  q := ch.q
  r := ch.r
  s := ch.s
  A₁ := ch.A₁
  A₂ := ch.A₂
  α₁ := ch.α₁
  α₂ := ch.α₂
  ω_unit := ch.ω_unit
  ω_cubic := ch.ω_cubic
  p_unit := ch.p_unit
  q_unit := ch.q_unit
  r_unit := ch.r_unit
  s_unit := ch.s_unit
  A₁_formula := ch.A₁_formula
  A₂_formula := ch.A₂_formula
  α₁_formula := ch.α₁_formula
  α₂_formula := ch.α₂_formula
  factor₁ := ch.factor₁
  factor₂ := ch.factor₂
  twoByTwo_of_A_zero := fun hA₁ hA₂ ↦
    hasHadamardTwoByTwo_of_equivalent ch.equivalent
      (ch.K_twoByTwo_of_A_zero hA₁ hA₂)
  twoByTwo_of_α_zero := fun hα₁ hα₂ ↦
    hasHadamardTwoByTwo_of_equivalent ch.equivalent
      (ch.K_twoByTwo_of_α_zero hα₁ hα₂)
  cubic_of_parameters := by
    intro hp hq hr hs
    rw [ch.normalForm]
    exact fourierNormalForm_hasCubicRowAndColumn
      ch.ω_cubic hp hq hr hs

theorem fourierChartReduction_of_core
    (hcore : FourierChartCoreReduction) : FourierChartReduction := by
  intro H hH hfour
  rcases hcore H hH hfour with ⟨ch⟩
  exact ⟨ch.toChart⟩

end Hadamard6
