import Hadamard6.HadamardQuotient

/-!
# Paper-facing classification theorem

This is the audit entry point for the manuscript's proof:

1. failure of the 400-corner search forces the intrinsic Karlsson locus or
   the Tao orbit;
2. the Karlsson and Tao propositions give finite corners on those loci;
3. contradiction proves the universal finite-corner theorem;
4. completeness and soundness give the retained-output equality, first on
   matrices and then on equivalence classes.

The public theorem has two explicit literature-facing arguments:

* `PublishedCubicRootCriterion`, item (2) of the paper's published structural
  proposition, stated with the intrinsic Karlsson predicate;
* `IntrinsicKarlssonSeamIdentification`, the exact residual consequence of
  item (1) still needed after Lean's internal derivation of the `H₂`
  normalization and Karlsson coordinates.

Thus the second argument is not a third structural hypothesis silently added
to the paper.  It is the unformalized remainder of the paper's first
published input.  The argument names make this boundary visible: theorem
parameters are not discharged merely because `#print axioms` reports no
project axioms.

Lean derives the intrinsic `H₂` normalization, raw coordinates, canonical
orientation, four exceptional cores, reciprocal-orientation reduction, and
finite-corner certificates internally. Both inputs remain visible theorem
arguments; atlas membership and class equality are consequences of witness
existence, not definitions used to obtain it.
-/

namespace Hadamard6

/-- Constructive routing lemma underlying the paper's failed-search
proposition.  Only the cubic-root row-and-column criterion is external at
this stage; Karlsson finite-corner coverage is not used here. -/
private theorem paper_corner_search_routing
    (hcubic : PublishedCubicRootCriterion)
    {H : Mat6} (hH : IsHadamard H) :
    HasFiniteCorner H ∨ IsKarlssonConcrete H ∨ IsTaoOrbit H := by
  rcases conditional_classification_of_published_inputs
      IsTaoOrbit IsKarlssonConcrete (concretePublishedInputs hcubic) H hH with
      (hKarlsson | hTao) | hfinite
  · exact Or.inr (Or.inl hKarlsson)
  · exact Or.inr (Or.inr hTao)
  · exact Or.inl (inFiniteCornerAtlas_hasFiniteCorner hfinite)

/-- Paper Proposition "failure of the corner search forces Karlsson or
Tao", in the same implication form as the manuscript. -/
theorem paper_failed_corner_search_forces_karlsson_or_tao
    (hcubic : PublishedCubicRootCriterion)
    {H : Mat6} (hH : IsHadamard H)
    (hfailed : ¬ HasFiniteCorner H) :
    IsKarlssonConcrete H ∨ IsTaoOrbit H := by
  rcases paper_corner_search_routing hcubic hH with
      hfinite | hKarlsson | hTao
  · exact False.elim (hfailed hfinite)
  · exact Or.inl hKarlsson
  · exact Or.inr hTao

/-- Paper Proposition "finite-corner witnesses for the Karlsson locus".  The
argument is internal except for identifying the explicit residual cores with
the affine-Fourier seams. -/
theorem paper_karlsson_has_finite_corner
    (hkarlsson : IntrinsicKarlssonSeamIdentification)
    {H : Mat6} (hKarlsson : IsKarlssonConcrete H) : HasFiniteCorner H :=
  inFiniteCornerAtlas_hasFiniteCorner
    (hasHadamardTwoByTwo_mem_finiteCornerAtlas
      (karlssonRawOrSeamCoverage_of_intrinsic_seam hkarlsson)
      hKarlsson.1 hKarlsson.2)

/-- Paper Proposition "a finite-corner witness for Tao"; no external input. -/
theorem paper_tao_has_finite_corner
    {H : Mat6} (hTao : IsTaoOrbit H) : HasFiniteCorner H :=
  inFiniteCornerAtlas_hasFiniteCorner
    (isTaoOrbit_mem_finiteCornerAtlas hTao)

/-- Main theorem: the manuscript's contradiction argument verbatim at the
predicate level. -/
theorem paper_finite_corner_theorem
    (hcubic : PublishedCubicRootCriterion)
    (hkarlsson : IntrinsicKarlssonSeamIdentification)
    {H : Mat6} (hH : IsHadamard H) : HasFiniteCorner H := by
  by_contra hfailed
  rcases paper_failed_corner_search_forces_karlsson_or_tao
      hcubic hH hfailed with hKarlsson | hTao
  · exact hfailed (paper_karlsson_has_finite_corner hkarlsson hKarlsson)
  · exact hfailed (paper_tao_has_finite_corner hTao)

/-- Nonexceptional recovery by our completed output.  The manuscript's
separate comparison with Construction 3.1 is not formalized here. -/
theorem paper_nonexceptional_completed_dilation_recovery
    (hcubic : PublishedCubicRootCriterion)
    {H : Mat6} (hH : IsHadamard H)
    (hnotKarlsson : ¬ IsKarlssonConcrete H)
    (hnotTao : ¬ IsTaoOrbit H) : InFiniteCornerAtlas H := by
  rcases paper_corner_search_routing hcubic hH with
      hfinite | hKarlsson | hTao
  · exact finiteCorner_mem_finiteCornerAtlas hfinite
  · exact False.elim (hnotKarlsson hKarlsson)
  · exact False.elim (hnotTao hTao)

/-- Algorithmic consequence: every Hadamard class occurs in the total
retained finite-corner output. -/
theorem paper_finite_corner_completeness
    (hcubic : PublishedCubicRootCriterion)
    (hkarlsson : IntrinsicKarlssonSeamIdentification)
    {H : Mat6} (hH : IsHadamard H) :
    InFiniteCornerAtlas H :=
  finiteCorner_mem_finiteCornerAtlas
    (paper_finite_corner_theorem hcubic hkarlsson hH)

/-- Soundness is unconditional: every retained output is Hadamard. -/
theorem paper_finite_corner_soundness {H : Mat6}
    (hH : InFiniteCornerAtlas H) : IsHadamard H :=
  inFiniteCornerAtlas_isHadamard hH

/-- Two-sided class equality, stated only after witness existence. -/
theorem paper_total_output_corollary
    (hcubic : PublishedCubicRootCriterion)
    (hkarlsson : IntrinsicKarlssonSeamIdentification)
    (H : Mat6) :
    IsHadamard H ↔ InFiniteCornerAtlas H := by
  constructor
  · exact paper_finite_corner_completeness hcubic hkarlsson
  · exact paper_finite_corner_soundness

/-- Equivalence-class form of the classification corollary.  The quotient
already contains only Hadamard matrices, so equality with `Set.univ` is
precisely the paper's `H_6 = A_6^fc`. -/
theorem paper_classification_corollary
    (hcubic : PublishedCubicRootCriterion)
    (hkarlsson : IntrinsicKarlssonSeamIdentification) :
    FiniteCornerAtlasClasses = Set.univ := by
  apply Set.eq_univ_of_forall
  intro q
  induction q using Quotient.inductionOn with
  | _ H =>
      change InFiniteCornerAtlas H.1
      exact paper_finite_corner_completeness hcubic hkarlsson H.2

#print axioms paper_failed_corner_search_forces_karlsson_or_tao
#print axioms paper_karlsson_has_finite_corner
#print axioms paper_tao_has_finite_corner
#print axioms paper_finite_corner_theorem
#print axioms paper_nonexceptional_completed_dilation_recovery
#print axioms paper_finite_corner_completeness
#print axioms paper_finite_corner_soundness
#print axioms paper_total_output_corollary
#print axioms paper_classification_corollary

end Hadamard6
