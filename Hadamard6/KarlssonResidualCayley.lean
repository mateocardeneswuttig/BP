import Hadamard6.KarlssonResidualBase

/-! The generated Cayley-transform identity for the Karlsson residual. -/

namespace Hadamard6

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

theorem karlssonResidual_cayley_identity (t rho : ℝ) :
    karlssonCayleyDenominator (rho : ℂ) *
      karlssonSharedResidual (t : ℂ)
        (((1 : ℂ) + Complex.I * (rho : ℂ)) /
          ((1 : ℂ) - Complex.I * (rho : ℂ))) =
      -(karlssonPositiveRealResidual t rho : ℂ) := by
  have hden : (1 : ℂ) - Complex.I * (rho : ℂ) ≠ 0 := by
    intro h
    have hre := congrArg Complex.re h
    norm_num [Complex.mul_re] at hre
  unfold karlssonCayleyDenominator karlssonSharedResidual
  unfold karlssonSharedResidualRow0 karlssonSharedResidualRow1 karlssonSharedResidualRow2 karlssonSharedResidualRow3 karlssonSharedResidualRow4 karlssonSharedResidualRow5 karlssonSharedResidualRow6 karlssonSharedResidualRow7 karlssonSharedResidualRow8 karlssonSharedResidualRow9 karlssonSharedResidualRow10 karlssonSharedResidualRow11 karlssonSharedResidualRow12 karlssonSharedResidualRow13 karlssonSharedResidualRow14 karlssonSharedResidualRow15 karlssonSharedResidualRow16
  unfold karlssonPositiveRealResidual
  unfold karlssonPositiveRealResidualRow0 karlssonPositiveRealResidualRow1 karlssonPositiveRealResidualRow2 karlssonPositiveRealResidualRow3 karlssonPositiveRealResidualRow4 karlssonPositiveRealResidualRow5 karlssonPositiveRealResidualRow6 karlssonPositiveRealResidualRow7 karlssonPositiveRealResidualRow8 karlssonPositiveRealResidualRow9 karlssonPositiveRealResidualRow10 karlssonPositiveRealResidualRow11 karlssonPositiveRealResidualRow12 karlssonPositiveRealResidualRow13 karlssonPositiveRealResidualRow14 karlssonPositiveRealResidualRow15 karlssonPositiveRealResidualRow16
  push_cast
  field_simp [hden]
  ring_nf
  simp [Complex.I_pow_eq_pow_mod]
  ring_nf
  norm_num [Complex.I_sq, Complex.I_pow_three, Complex.I_pow_four]
  ring

end Hadamard6
