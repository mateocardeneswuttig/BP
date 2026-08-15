import Hadamard6.ColumnFibreSymmetry
import Hadamard6.FibreNormIdentity
import Hadamard6.DephasedFiniteCorner

/-!
# Endpoint-coefficient criterion for finite row-Gram fibres

The fixed-corner certificate uses two oriented endpoint coefficients of the
Haagerup eliminant.  This file identifies them intrinsically from the Gram
matrix and proves the general implication needed by the Karlsson chart:
if both endpoint coefficients are nonzero in both noninitial-row
orientations, then the normalized row-Gram fibre is finite.
-/

namespace Hadamard6

/-- The conjugate of the constant endpoint coefficient, up to sign. -/
def rowFibreEndpoint0 (G : Mat3) : ℂ :=
  G 2 1 ^ 2 * star (G 2 0) -
    G 2 1 * star (G 1 0) * G 2 0 * star (G 2 0) +
    3 * G 2 1 * star (G 1 0) +
    star (G 1 0) ^ 2 * G 2 0

/-- The cubic endpoint coefficient, up to sign. -/
def rowFibreEndpoint3 (G : Mat3) : ℂ :=
  G 2 1 * star (G 2 1) * star (G 1 0) * star (G 2 0) -
    G 2 1 * star (G 2 0) ^ 2 -
    star (G 2 1) * star (G 1 0) ^ 2 -
    3 * star (G 1 0) * star (G 2 0)

theorem rowFibreEndpoint0_phaseRowGram
    {u v : ℂ} (hu : Complex.normSq u = 1)
    (hv : Complex.normSq v = 1) (G : Mat3) :
    rowFibreEndpoint0 (phaseRowGram u v G) =
      star u ^ 2 * v * rowFibreEndpoint0 G := by
  have hsu : star u * u = 1 := star_mul_self_of_normSq_one hu
  have hsv : star v * v = 1 := star_mul_self_of_normSq_one hv
  have hus : u * star u = 1 := by simpa [mul_comm] using hsu
  have hvs : v * star v = 1 := by simpa [mul_comm] using hsv
  simp only [rowFibreEndpoint0, phaseRowGram, rowPhaseFactor_zero,
    rowPhaseFactor_one, rowPhaseFactor_two, star_mul, star_star,
    star_one, mul_one]
  linear_combination
    (star u ^ 2 * v *
      (G 2 1 ^ 2 * star (G 2 0) -
        G 2 1 * star (G 1 0) * G 2 0 * star (G 2 0))) * hvs

theorem rowFibreEndpoint3_phaseRowGram
    {u v : ℂ} (hu : Complex.normSq u = 1)
    (hv : Complex.normSq v = 1) (G : Mat3) :
    rowFibreEndpoint3 (phaseRowGram u v G) =
      star u * star v * rowFibreEndpoint3 G := by
  have hsu : star u * u = 1 := star_mul_self_of_normSq_one hu
  have hsv : star v * v = 1 := star_mul_self_of_normSq_one hv
  have hus : u * star u = 1 := by simpa [mul_comm] using hsu
  have hvs : v * star v = 1 := by simpa [mul_comm] using hsv
  simp only [rowFibreEndpoint3, phaseRowGram, rowPhaseFactor_zero,
    rowPhaseFactor_one, rowPhaseFactor_two, star_mul, star_star,
    star_one, mul_one]
  linear_combination
    (star u * star v *
      ((u * star u) *
          (G 2 1 * star (G 2 1) * star (G 1 0) * star (G 2 0)) -
        G 2 1 * star (G 2 0) ^ 2)) * hvs +
    (star u * star v *
      (G 2 1 * star (G 2 1) * star (G 1 0) * star (G 2 0) -
        star (G 2 1) * star (G 1 0) ^ 2)) * hus

theorem rowFibreEndpoint0_eq_neg_star_specializedBeta0
    {G : Mat3} {s t : ℝ}
    (hS : G 1 0 = (s : ℂ)) (hT : G 2 0 = (t : ℂ)) :
    rowFibreEndpoint0 G =
      -star (specializedBeta0 s (t : ℂ) (G 2 1)) := by
  simp only [rowFibreEndpoint0, specializedBeta0, eliminantBeta0,
    hS, hT, star_neg, star_add, star_sub, star_mul, star_pow,
    star_star]
  simp [Complex.star_def]
  ring

theorem rowFibreEndpoint3_eq_neg_specializedBeta3
    {G : Mat3} {s t : ℝ}
    (hS : G 1 0 = (s : ℂ)) (hT : G 2 0 = (t : ℂ)) :
    rowFibreEndpoint3 G =
      -specializedBeta3 s (t : ℂ) (G 2 1) := by
  simp only [rowFibreEndpoint3, specializedBeta3, eliminantBeta3,
    hS, hT]
  simp [Complex.star_def]
  ring

private theorem second_rows_not_infinite_of_endpoints
    {G : Mat3}
    (h0 : rowFibreEndpoint0 G ≠ 0)
    (h3 : rowFibreEndpoint3 G ≠ 0) :
    ¬ ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite := by
  intro hinf
  let u := nonnegativePhase (G 1 0)
  let v := nonnegativePhase (G 2 0)
  let s : ℝ := ‖G 1 0‖
  let t : ℝ := ‖G 2 0‖
  have hu : Complex.normSq u = 1 := nonnegativePhase_unit _
  have hv : Complex.normSq v = 1 := nonnegativePhase_unit _
  have hS : phaseRowGram u v G 1 0 = (s : ℂ) := by
    simp [phaseRowGram, u, s, nonnegativePhase_mul]
  have hT : phaseRowGram u v G 2 0 = (t : ℂ) := by
    simp [phaseRowGram, v, t, nonnegativePhase_mul]
  have hinf' := infinite_second_rows_phaseNoninitialRows hu hv hinf
  have hidentity := clearedNormIdentity_of_infinite_second_rows hS hinf'
  rw [hT] at hidentity
  have hdrop := quotient_degree_drop hidentity
  have h0' : rowFibreEndpoint0 (phaseRowGram u v G) ≠ 0 := by
    rw [rowFibreEndpoint0_phaseRowGram hu hv]
    exact mul_ne_zero
      (mul_ne_zero
        (pow_ne_zero 2
          (star_ne_zero.mpr (ne_zero_of_normSq_eq_one hu)))
        (ne_zero_of_normSq_eq_one hv)) h0
  have h3' : rowFibreEndpoint3 (phaseRowGram u v G) ≠ 0 := by
    rw [rowFibreEndpoint3_phaseRowGram hu hv]
    exact mul_ne_zero
      (mul_ne_zero
        (star_ne_zero.mpr (ne_zero_of_normSq_eq_one hu))
        (star_ne_zero.mpr (ne_zero_of_normSq_eq_one hv))) h3
  rcases hdrop with hb0 | hb3
  · apply h0'
    rw [rowFibreEndpoint0_eq_neg_star_specializedBeta0 hS hT, hb0]
    simp
  · apply h3'
    rw [rowFibreEndpoint3_eq_neg_specializedBeta3 hS hT, hb3]
    simp

/-- Nonzero eliminant endpoints in both row orientations force a finite
normalized row-Gram fibre. -/
theorem normalizedRowGramFibre_finite_of_oriented_endpoints
    {G : Mat3}
    (h0 : rowFibreEndpoint0 G ≠ 0)
    (h3 : rowFibreEndpoint3 G ≠ 0)
    (h0swap : rowFibreEndpoint0 (swapRowGram G) ≠ 0)
    (h3swap : rowFibreEndpoint3 (swapRowGram G) ≠ 0) :
    (normalizedRowGramFibre G).Finite := by
  by_contra hinf
  rcases infinite_fibre_row_alternative hinf with hsecond | hthird
  · exact second_rows_not_infinite_of_endpoints h0 h3 hsecond
  · have hsecondSwap := infinite_third_rows_swap_to_second hthird
    exact second_rows_not_infinite_of_endpoints h0swap h3swap hsecondSwap

/-- Matrix-level form of the constant endpoint witness. -/
def rowEndpoint0 (X : Mat3) : ℂ :=
  rowFibreEndpoint0 (X * Matrix.conjTranspose X)

/-- Matrix-level form of the cubic endpoint witness. -/
def rowEndpoint3 (X : Mat3) : ℂ :=
  rowFibreEndpoint3 (X * Matrix.conjTranspose X)

theorem rowEndpoint0_eq_fibreData (X : Mat3)
    (hfirst : ∀ j, X 0 j = 1) :
    rowEndpoint0 X =
      let S := fibreS (X 1 0) (X 1 1) (X 1 2)
      let T := fibreT (X 2 0) (X 2 1) (X 2 2)
      let R := fibreR (X 1 0) (X 1 1) (X 1 2)
        (X 2 0) (X 2 1) (X 2 2)
      R ^ 2 * star T - R * star S * T * star T +
        3 * R * star S + star S ^ 2 * T := by
  simp only [rowEndpoint0, rowFibreEndpoint0, Matrix.mul_apply,
    Matrix.conjTranspose_apply, Fin.sum_univ_three, fibreS, fibreT,
    fibreR, hfirst, star_one, one_mul, mul_one]
  ring

theorem rowEndpoint3_eq_fibreData (X : Mat3)
    (hfirst : ∀ j, X 0 j = 1) :
    rowEndpoint3 X =
      let S := fibreS (X 1 0) (X 1 1) (X 1 2)
      let T := fibreT (X 2 0) (X 2 1) (X 2 2)
      let R := fibreR (X 1 0) (X 1 1) (X 1 2)
        (X 2 0) (X 2 1) (X 2 2)
      R * star R * star S * star T - R * star T ^ 2 -
        star R * star S ^ 2 - 3 * star S * star T := by
  simp only [rowEndpoint3, rowFibreEndpoint3, Matrix.mul_apply,
    Matrix.conjTranspose_apply, Fin.sum_univ_three, fibreS, fibreT,
    fibreR, hfirst, star_one, one_mul, mul_one]
  ring

theorem normalizedRowGramFibre_finite_of_matrix_endpoints
    {X : Mat3}
    (h0 : rowEndpoint0 X ≠ 0)
    (h3 : rowEndpoint3 X ≠ 0)
    (h0swap : rowEndpoint0 (swapNoninitialRows X) ≠ 0)
    (h3swap : rowEndpoint3 (swapNoninitialRows X) ≠ 0) :
    (normalizedRowGramFibre
      (X * Matrix.conjTranspose X)).Finite := by
  apply normalizedRowGramFibre_finite_of_oriented_endpoints h0 h3
  · simpa [rowEndpoint0, swapNoninitialRows_rowGram]
      using h0swap
  · simpa [rowEndpoint3, swapNoninitialRows_rowGram]
      using h3swap

/-- Column fibres use the same criterion after transposition. -/
theorem normalizedColumnGramFibre_finite_of_transpose_endpoints
    {X : Mat3}
    (h0 : rowEndpoint0 X.transpose ≠ 0)
    (h3 : rowEndpoint3 X.transpose ≠ 0)
    (h0swap : rowEndpoint0 (swapNoninitialRows X.transpose) ≠ 0)
    (h3swap : rowEndpoint3 (swapNoninitialRows X.transpose) ≠ 0) :
    (normalizedColumnGramFibre
      (Matrix.conjTranspose X * X)).Finite := by
  have hrow := normalizedRowGramFibre_finite_of_matrix_endpoints
    h0 h3 h0swap h3swap
  by_contra hinf
  have hinf' := infinite_column_fibre_transpose hinf
  exact hinf' (by simpa [transpose_rowGram] using hrow)

/-- The eleven matrix-level witnesses used by both the regular Karlsson chart
and each affine-Fourier seam corner: three determinants and two endpoint
factors in each of four side-block orientations. -/
structure LeadingFiniteCornerCertificate (H : Mat6) : Prop where
  detE : (Matrix.toBlocks₁₁ H).det ≠ 0
  detB : (Matrix.toBlocks₁₂ H).det ≠ 0
  detC : (Matrix.toBlocks₂₁ H).det ≠ 0
  B_endpoint0 : rowEndpoint0 (Matrix.toBlocks₁₂ H) ≠ 0
  B_endpoint3 : rowEndpoint3 (Matrix.toBlocks₁₂ H) ≠ 0
  B_swapped_endpoint0 :
    rowEndpoint0 (swapNoninitialRows (Matrix.toBlocks₁₂ H)) ≠ 0
  B_swapped_endpoint3 :
    rowEndpoint3 (swapNoninitialRows (Matrix.toBlocks₁₂ H)) ≠ 0
  C_endpoint0 : rowEndpoint0 (Matrix.toBlocks₂₁ H).transpose ≠ 0
  C_endpoint3 : rowEndpoint3 (Matrix.toBlocks₂₁ H).transpose ≠ 0
  C_swapped_endpoint0 :
    rowEndpoint0
      (swapNoninitialRows (Matrix.toBlocks₂₁ H).transpose) ≠ 0
  C_swapped_endpoint3 :
    rowEndpoint3
      (swapNoninitialRows (Matrix.toBlocks₂₁ H).transpose) ≠ 0

/-- The paper's corner witness `W`: the product of the three determinant
factors and the two endpoint factors in each of four orientations.  Grouping
the endpoint pairs recovers the four `leading_coefficient` products used by
the exact seam scripts, up to irrelevant signs. -/
def leadingFiniteCornerWitnessProduct (H : Mat6) : ℂ :=
  (Matrix.toBlocks₁₁ H).det *
    ((Matrix.toBlocks₁₂ H).det *
      ((Matrix.toBlocks₂₁ H).det *
        (rowEndpoint0 (Matrix.toBlocks₁₂ H) *
          (rowEndpoint3 (Matrix.toBlocks₁₂ H) *
            (rowEndpoint0
                (swapNoninitialRows (Matrix.toBlocks₁₂ H)) *
              (rowEndpoint3
                  (swapNoninitialRows (Matrix.toBlocks₁₂ H)) *
                (rowEndpoint0 (Matrix.toBlocks₂₁ H).transpose *
                  (rowEndpoint3 (Matrix.toBlocks₂₁ H).transpose *
                    (rowEndpoint0
                        (swapNoninitialRows
                          (Matrix.toBlocks₂₁ H).transpose) *
                      rowEndpoint3
                        (swapNoninitialRows
                          (Matrix.toBlocks₂₁ H).transpose))))))))))

/-- Nonvanishing of the single witness product is exactly the eleven-field
matrix certificate.  This is the formal bridge from the supplement's
common-zero calculation to the finite-fibre criterion. -/
theorem leadingFiniteCornerCertificate_iff_witnessProduct_ne_zero
    {H : Mat6} :
    LeadingFiniteCornerCertificate H ↔
      leadingFiniteCornerWitnessProduct H ≠ 0 := by
  constructor
  · intro h
    simp [leadingFiniteCornerWitnessProduct, h.detE, h.detB, h.detC,
      h.B_endpoint0, h.B_endpoint3, h.B_swapped_endpoint0,
      h.B_swapped_endpoint3, h.C_endpoint0, h.C_endpoint3,
      h.C_swapped_endpoint0, h.C_swapped_endpoint3]
  · intro h
    simp only [leadingFiniteCornerWitnessProduct, mul_ne_zero_iff] at h
    rcases h with ⟨hdetE, hdetB, hdetC, hB0, hB3, hBswap0,
      hBswap3, hC0, hC3, hCswap0, hCswap3⟩
    exact {
      detE := hdetE
      detB := hdetB
      detC := hdetC
      B_endpoint0 := hB0
      B_endpoint3 := hB3
      B_swapped_endpoint0 := hBswap0
      B_swapped_endpoint3 := hBswap3
      C_endpoint0 := hC0
      C_endpoint3 := hC3
      C_swapped_endpoint0 := hCswap0
      C_swapped_endpoint3 := hCswap3 }

/-- The eleven leading witnesses imply an actual finite corner, not merely
formal nonvanishing of auxiliary polynomials. -/
theorem leadingFiniteCornerCertificate_hasFiniteCorner
    {H : Mat6} (hH : IsHadamard H)
    (h : LeadingFiniteCornerCertificate H) : HasFiniteCorner H := by
  apply finite_topLeft_intrinsic_fibres_give_finiteCorner hH
  · exact h.detE
  · exact h.detB
  · exact h.detC
  · exact normalizedRowGramFibre_finite_of_matrix_endpoints
      h.B_endpoint0 h.B_endpoint3
      h.B_swapped_endpoint0 h.B_swapped_endpoint3
  · exact normalizedColumnGramFibre_finite_of_transpose_endpoints
      h.C_endpoint0 h.C_endpoint3
      h.C_swapped_endpoint0 h.C_swapped_endpoint3

end Hadamard6
