import Hadamard6.KarlssonResidualBase

/-! The generated compactification identity for the Karlsson residual.

Isolated because its `field_simp`/`ring` normalisation of the full
bidegree-(16,8) residual dominates elaboration memory. -/

namespace Hadamard6

set_option linter.style.longLine false
set_option linter.style.setOption false
set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

theorem karlssonResidual_compactification_identity
    (t rho : ℝ) (ht : 0 ≤ t) (hrho : 0 ≤ rho) :
    (1 + t) ^ 16 * (1 + rho) ^ 8 *
      karlssonCompactResidual (t / (1 + t)) (rho / (1 + rho)) =
        karlssonPositiveRealResidual t rho := by
  have htden : 1 + t ≠ 0 := by positivity
  have hrden : 1 + rho ≠ 0 := by positivity
  unfold karlssonCompactResidual karlssonPositiveRealResidual
  unfold karlssonCompactResidualRow0 karlssonCompactResidualRow1 karlssonCompactResidualRow2 karlssonCompactResidualRow3 karlssonCompactResidualRow4 karlssonCompactResidualRow5 karlssonCompactResidualRow6 karlssonCompactResidualRow7 karlssonCompactResidualRow8 karlssonCompactResidualRow9 karlssonCompactResidualRow10 karlssonCompactResidualRow11 karlssonCompactResidualRow12 karlssonCompactResidualRow13 karlssonCompactResidualRow14 karlssonCompactResidualRow15 karlssonCompactResidualRow16 karlssonPositiveRealResidualRow0 karlssonPositiveRealResidualRow1 karlssonPositiveRealResidualRow2 karlssonPositiveRealResidualRow3 karlssonPositiveRealResidualRow4 karlssonPositiveRealResidualRow5 karlssonPositiveRealResidualRow6 karlssonPositiveRealResidualRow7 karlssonPositiveRealResidualRow8 karlssonPositiveRealResidualRow9 karlssonPositiveRealResidualRow10 karlssonPositiveRealResidualRow11 karlssonPositiveRealResidualRow12 karlssonPositiveRealResidualRow13 karlssonPositiveRealResidualRow14 karlssonPositiveRealResidualRow15 karlssonPositiveRealResidualRow16
  field_simp [htden, hrden]
  ring

end Hadamard6
