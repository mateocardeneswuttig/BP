import Hadamard6.Classification
import Hadamard6.EquivalentStrata
import Hadamard6.PublishedConsequences
import Hadamard6.TaoAtlas
import Hadamard6.KarlssonContainment
import Hadamard6.H2KarlssonParametrization

/-!
# Concrete finite-corner endpoint for order six

This file replaces the opaque Karlsson and Tao parameters at the public
classification endpoint.  The Karlsson sector is represented intrinsically
by the `2 x 2` Hadamard condition, while the Tao sector is the explicit orbit
defined in `TaoOrbit.lean`.

The primary target is the substantive witness statement

`IsHadamard H → HasFiniteCorner H`.

Equality with the total output predicate is only a corollary.

Its remaining mathematical inputs are displayed as fields of
`PaperClassificationInputs`; none is hidden as an axiom or an opaque family
name.
-/

namespace Hadamard6

/-- The intrinsic Karlsson sector on raw matrices.  Including Hadamardness in
the definition makes sector soundness immediate and avoids assigning the
Karlsson name to arbitrary non-Hadamard matrices containing an accidental
`2 x 2` Hadamard submatrix. -/
def IsKarlssonConcrete (H : Mat6) : Prop :=
  IsHadamard H ∧ HasHadamardTwoByTwo H

theorem isKarlssonConcrete_isHadamard {H : Mat6}
    (hH : IsKarlssonConcrete H) : IsHadamard H :=
  hH.1

theorem isKarlssonConcrete_hasHadamardTwoByTwo {H : Mat6}
    (hH : IsKarlssonConcrete H) : HasHadamardTwoByTwo H :=
  hH.2

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
  karlssonTao_classification := ⟨
    (by
      intro H hH htwo
      exact ⟨hH, htwo⟩),
    (by
      intro H K hH hK hHK hroots
      rcases hcubic K hK hroots with hTao | hKarlsson
      · exact Or.inr (isTaoOrbit_of_equivalent hHK hTao)
      · exact Or.inl
          ((equivalent_isKarlssonConcrete_iff hHK).2 hKarlsson))⟩

/-- The exact remaining closure obligations for the total-output atlas.

* `publishedCubicRootCriterion` closes the historical cubic-root branch;
* `publishedKarlssonSeamIdentification` is the precise residual part of
  Karlsson's published parametrization: the explicit degenerate-core
  branches are affine-Fourier seams. Intrinsic normalization, canonical raw
  coordinates, the regular chart, reciprocal orientation, and the seam
  finite-corner certificate are proved internally.

The Tao containment is no longer a field: `TaoAtlas.lean` proves it
internally from the explicit leading corner.
-/
structure PaperClassificationInputs where
  publishedCubicRootCriterion : PublishedCubicRootCriterion
  publishedKarlssonSeamIdentification : IntrinsicKarlssonSeamIdentification

/-- The older output-membership formulation.  It is retained for dependency
compatibility; the public theorem below strengthens it to the actual
finite-corner witness asserted in the paper. -/
theorem hadamard_mem_finiteCornerAtlas_of_paperClassificationInputs
    (inputs : PaperClassificationInputs) {H : Mat6} (hH : IsHadamard H) :
    InFiniteCornerAtlas H := by
  have hclassified :=
    conditional_classification_of_published_inputs
      IsTaoOrbit IsKarlssonConcrete
      (concretePublishedInputs inputs.publishedCubicRootCriterion) H hH
  rcases hclassified with (hKarlsson | hTao) | hG
  · exact hasHadamardTwoByTwo_mem_finiteCornerAtlas
      (karlssonRawOrSeamCoverage_of_intrinsic_seam
        inputs.publishedKarlssonSeamIdentification) hH
      (isKarlssonConcrete_hasHadamardTwoByTwo hKarlsson)
  · exact isTaoOrbit_mem_finiteCornerAtlas hTao
  · exact hG

/-- **Universal finite-corner theorem at the current formal boundary.**
For every Hadamard matrix, the proof constructs a normalized retained
presentation whose corner has nonempty finite invertible horizontal and
vertical candidate fibres.  The two assumptions are visible in
`PaperClassificationInputs`; this theorem does not turn their packaging into
an unconditional result. -/
theorem every_hadamard_has_finite_corner_of_paperClassificationInputs
    (inputs : PaperClassificationInputs) {H : Mat6} (hH : IsHadamard H) :
    HasFiniteCorner H :=
  inFiniteCornerAtlas_hasFiniteCorner
    (hadamard_mem_finiteCornerAtlas_of_paperClassificationInputs inputs hH)

/-- Equality with the total finite-corner output is a corollary of the
universal witness theorem plus internal soundness. -/
theorem hadamard_iff_inFiniteCornerAtlas_of_paperClassificationInputs
    (inputs : PaperClassificationInputs) (H : Mat6) :
    IsHadamard H ↔ InFiniteCornerAtlas H := by
  constructor
  · intro hH
    exact finiteCorner_mem_finiteCornerAtlas
      (every_hadamard_has_finite_corner_of_paperClassificationInputs inputs hH)
  · exact inFiniteCornerAtlas_isHadamard

end Hadamard6
