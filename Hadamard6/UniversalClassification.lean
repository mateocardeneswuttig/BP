import Hadamard6.PaperTheorem

/-!
# Legacy endpoint names

The paper-facing theorem chain lives in `PaperTheorem.lean`.  This file keeps
three older names for downstream compatibility; it contains no independent
classification proof and is not imported by the root module.
-/

namespace Hadamard6

@[deprecated paper_finite_corner_completeness (since := "2026-08-10")]
theorem paper_main_classification_completeness
    (hcubic : PublishedCubicRootCriterion)
    (hkarlsson : IntrinsicKarlssonSeamIdentification)
    {H : Mat6} (hH : IsHadamard H) : InFiniteCornerAtlas H :=
  paper_finite_corner_completeness hcubic hkarlsson hH

@[deprecated paper_total_output_corollary (since := "2026-08-10")]
theorem paper_main_classification
    (hcubic : PublishedCubicRootCriterion)
    (hkarlsson : IntrinsicKarlssonSeamIdentification)
    (H : Mat6) : IsHadamard H ↔ InFiniteCornerAtlas H :=
  paper_total_output_corollary hcubic hkarlsson H

@[deprecated paper_classification_corollary (since := "2026-08-10")]
theorem paper_main_class_equality
    (hcubic : PublishedCubicRootCriterion)
    (hkarlsson : IntrinsicKarlssonSeamIdentification) :
    FiniteCornerAtlasClasses = Set.univ :=
  paper_classification_corollary hcubic hkarlsson

end Hadamard6
