import Hadamard6.Classification
import Hadamard6.EquivalentStrata
import Hadamard6.TaoAtlas

/-!
# Concrete finite-corner endpoint for order six

This file replaces the opaque Karlsson and Tao parameters at the public
classification endpoint.  The Karlsson sector is represented intrinsically
by the `2 x 2` Hadamard condition, while the Tao sector is the explicit orbit
defined in `TaoOrbit.lean`.

This module only fixes the concrete sector predicates and converts the
published cubic criterion into the generic routing interface.  The
paper-facing witness and equality theorems live in `PaperTheorem.lean`, where
the two literature inputs remain separate theorem parameters.
-/

namespace Hadamard6

/-- The intrinsic Karlsson sector on raw matrices.  Including Hadamardness in
the definition makes sector soundness immediate and avoids assigning the
Karlsson name to arbitrary non-Hadamard matrices containing an accidental
`2 x 2` Hadamard submatrix. -/
def IsKarlssonConcrete (H : Mat6) : Prop :=
  IsHadamard H ∧ HasHadamardTwoByTwo H

/-- Intrinsic Karlsson membership is constant on equivalence classes. -/
theorem equivalent_isKarlssonConcrete_iff {H K : Mat6}
    (hHK : Equivalent H K) :
    IsKarlssonConcrete H ↔ IsKarlssonConcrete K := by
  simp only [IsKarlssonConcrete]
  exact and_congr (equivalent_isHadamard_iff hHK)
    (equivalent_hasHadamardTwoByTwo_iff hHK)

/-- The concrete Tao orbit and intrinsic Karlsson sector are disjoint. -/
theorem isTaoOrbit_not_isKarlssonConcrete {H : Mat6}
    (hTao : IsTaoOrbit H) : ¬ IsKarlssonConcrete H := by
  rcases hTao with ⟨omega, homega, heq⟩
  intro hKarlsson
  have htwoTao : HasHadamardTwoByTwo (taoMatrix omega) :=
    (equivalent_hasHadamardTwoByTwo_iff heq).1 hKarlsson.2
  exact taoMatrix_not_hasHadamardTwoByTwo homega htwoTao

/-- The paper's cubic-root row-and-column input, stated using the concrete
predicates of this library: a dephased Hadamard matrix with a noninitial
cubic row and column is in the Tao orbit or in the intrinsic Karlsson
sector.  Dephasing is already part of
`HasNoninitialCubicRootRowAndColumn`.

The paper identifies the intrinsic Karlsson sector with Karlsson's complete
three-parameter model by its first published structural input.  Lean uses
`IsKarlssonConcrete` for that intrinsic sector, rather than introducing an
opaque family predicate. -/
def PublishedCubicRootCriterion : Prop :=
  ∀ K, IsHadamard K → HasNoninitialCubicRootRowAndColumn K →
    IsTaoOrbit K ∨ IsKarlssonConcrete K

/-- Once the concrete cubic criterion is supplied, it gives a genuinely
concrete `PublishedInputs` value.  Its Karlsson clause is now definitional. -/
theorem concretePublishedInputs
    (hcubic : PublishedCubicRootCriterion) :
    PublishedInputs IsTaoOrbit IsKarlssonConcrete where
  twoByTwo_mem_karlsson := by
    intro H hH htwo
    exact ⟨hH, htwo⟩
  cubicRoot_mem_knownExceptionalSector := by
    intro H K hH hK hHK hroots
    rcases hcubic K hK hroots with hTao | hKarlsson
    · exact Or.inr (isTaoOrbit_of_equivalent hHK hTao)
    · exact Or.inl
        ((equivalent_isKarlssonConcrete_iff hHK).2 hKarlsson)

end Hadamard6
