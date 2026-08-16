import Hadamard6.KarlssonResidualBase
import Hadamard6.KarlssonResidualCompactification
import Hadamard6.KarlssonResidualCayley
import Hadamard6.KarlssonResidualLeaf0000
import Hadamard6.KarlssonResidualLeaf0001
import Hadamard6.KarlssonResidualLeaf0010
import Hadamard6.KarlssonResidualLeaf0011
import Hadamard6.KarlssonResidualLeaf01
import Hadamard6.KarlssonResidualLeaf10
import Hadamard6.KarlssonResidualLeaf1100
import Hadamard6.KarlssonResidualLeaf1101
import Hadamard6.KarlssonResidualLeaf1110
import Hadamard6.KarlssonResidualLeaf1111

/-! Aggregate import of the generated Karlsson residual certificate.

The shared definitions and the ten Bernstein leaves are split into separate
modules so that no single Lean process has to elaborate all of them.  This
module exists so that consumers keep a single import. -/
