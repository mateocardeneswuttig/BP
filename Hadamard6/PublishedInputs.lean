import Hadamard6.Strata

/-!
# Published inputs

This generic structure is internal routing plumbing.  Its conjunction keeps
the two exceptional-sector implications together while the block proof is
developed abstractly.  At the public endpoint `ConcreteClassification.lean`
instantiates the first clause definitionally from the intrinsic `H₂`
predicate, so only the cubic-root row-and-column criterion remains an
external argument at this routing stage.

Finite-output exactness is unnecessary because the total finite-corner atlas
is defined directly from `Retained`.  The historical notation `G_6^(4)` is
not reassigned.  The retained-completion Gram identity is proved internally
in `BlockCompletion.lean`; neither fact appears as a field here.
-/

namespace Hadamard6

/-- The union of the two previously classified exceptional sectors.  This is
not a single equivalence orbit: the Tao part is one orbit, whereas the
Karlsson part contains a continuous family of orbits. -/
def InKnownExceptionalSector
    (IsTao IsKarlsson : Mat6 → Prop) (H : Mat6) : Prop :=
  IsKarlsson H ∨ IsTao H

structure PublishedInputs (IsTao IsKarlsson : Mat6 → Prop) where
  karlssonTao_classification :
    (∀ H, IsHadamard H → HasHadamardTwoByTwo H → IsKarlsson H) ∧
    (∀ H K, IsHadamard H → IsHadamard K → Equivalent H K →
      HasNoninitialCubicRootRowAndColumn K →
        InKnownExceptionalSector IsTao IsKarlsson H)

/-- First clause of the single published classification input. -/
theorem PublishedInputs.twoByTwo_mem_karlsson
    {IsTao IsKarlsson : Mat6 → Prop}
    (pub : PublishedInputs IsTao IsKarlsson) :
    ∀ H, IsHadamard H → HasHadamardTwoByTwo H → IsKarlsson H :=
  pub.karlssonTao_classification.1

/-- Second clause of the single published classification input. It is stated
invariantly: the cubic-root row and column may occur in an equivalent
dephased representative. -/
theorem PublishedInputs.cubicRoot_mem_knownExceptionalSector
    {IsTao IsKarlsson : Mat6 → Prop}
    (pub : PublishedInputs IsTao IsKarlsson) :
    ∀ H K, IsHadamard H → IsHadamard K → Equivalent H K →
      HasNoninitialCubicRootRowAndColumn K →
        InKnownExceptionalSector IsTao IsKarlsson H :=
  pub.karlssonTao_classification.2

end Hadamard6
