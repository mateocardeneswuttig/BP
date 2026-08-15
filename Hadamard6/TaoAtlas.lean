import Hadamard6.ColumnFibreSymmetry
import Hadamard6.FiniteCornerFromBlocks
import Hadamard6.TaoOrbit

/-!
# Tao inside the finite-dilation atlas

This file verifies the leading Tao corner used in the paper.  Finiteness of
its two physical side fibres is deduced from the kernel-checked infinite-fibre
trichotomy, after excluding its three alternatives by exact cubic-phase
arithmetic.
-/

namespace Hadamard6

/-- A fixed primitive cubic phase, used when a concrete witness rather than
an arbitrary primitive phase is required. -/
noncomputable def standardOmega : ℂ :=
  ⟨-(1 / 2 : ℝ), Real.sqrt 3 / 2⟩

theorem standardOmega_isPrimitiveCubicPhase :
    IsPrimitiveCubicPhase standardOmega := by
  have hsqrt : (Real.sqrt 3) ^ 2 = 3 :=
    Real.sq_sqrt (by norm_num)
  constructor
  · rw [Complex.normSq_apply]
    simp [standardOmega]
    nlinarith
  · apply Complex.ext <;>
      simp [standardOmega, pow_two, Complex.mul_re, Complex.mul_im] <;>
      nlinarith

def taoE (omega : ℂ) : Mat3 :=
  !![1, 1, 1;
     1, 1, omega;
     1, omega, 1]

def taoB (omega : ℂ) : Mat3 :=
  !![1, 1, 1;
     omega, omega ^ 2, omega ^ 2;
     omega ^ 2, omega ^ 2, omega]

def taoC (omega : ℂ) : Mat3 :=
  !![1, omega, omega ^ 2;
     1, omega ^ 2, omega ^ 2;
     1, omega ^ 2, omega]

@[simp] theorem taoMatrix_topLeft (omega : ℂ) :
    Matrix.toBlocks₁₁ (taoMatrix omega) = taoE omega := by
  rfl

@[simp] theorem taoMatrix_topRight (omega : ℂ) :
    Matrix.toBlocks₁₂ (taoMatrix omega) = taoB omega := by
  rfl

@[simp] theorem taoMatrix_bottomLeft (omega : ℂ) :
    Matrix.toBlocks₂₁ (taoMatrix omega) = taoC omega := by
  rfl

theorem taoC_transpose (omega : ℂ) :
    (taoC omega).transpose = taoB omega := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

theorem taoMatrix_isDephased (omega : ℂ) :
    IsDephased (taoMatrix omega) := by
  constructor <;> intro i
  · rcases i with i | i <;> fin_cases i <;> rfl
  · rcases i with i | i <;> fin_cases i <;> rfl

theorem primitiveCubicPhase_ne_one {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega ≠ 1 := by
  intro h
  have hpoly := homega.2
  rw [h] at hpoly
  norm_num at hpoly

theorem primitiveCubicPhase_sum_sq {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega + omega ^ 2 = -1 := by
  linear_combination homega.2

theorem primitiveCubicPhase_not_neg_self {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega ≠ -omega := by
  intro h
  have htwo : (2 : ℂ) * omega = 0 := by linear_combination h
  exact primitiveCubicPhase_ne_zero homega
    ((mul_eq_zero.mp htwo).resolve_left (by norm_num))

theorem primitiveCubicPhase_sq_not_neg_sq {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega ^ 2 ≠ -(omega ^ 2) := by
  intro h
  have htwo : (2 : ℂ) * omega ^ 2 = 0 := by linear_combination h
  have hsquare : omega ^ 2 = 0 :=
    (mul_eq_zero.mp htwo).resolve_left (by norm_num)
  exact (pow_ne_zero 2 (primitiveCubicPhase_ne_zero homega)) hsquare

theorem primitiveCubicPhase_not_neg_sq {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega ≠ -(omega ^ 2) := by
  intro h
  have hsum : omega + omega ^ 2 = 0 := by linear_combination h
  rw [primitiveCubicPhase_sum_sq homega] at hsum
  norm_num at hsum

theorem primitiveCubicPhase_sq_not_neg {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) : omega ^ 2 ≠ -omega := by
  intro h
  apply primitiveCubicPhase_not_neg_sq homega
  linear_combination h

theorem taoB_det {omega : ℂ} (homega : IsPrimitiveCubicPhase omega) :
    (taoB omega).det = 3 := by
  rw [Matrix.det_fin_three]
  simp [taoB]
  have hcube := primitiveCubicPhase_cube homega
  have hfour : omega ^ 4 = omega := by
    calc
      omega ^ 4 = omega * omega ^ 3 := by ring
      _ = omega := by rw [hcube]; ring
  linear_combination 2 * hcube - hfour - homega.2

theorem taoC_det {omega : ℂ} (homega : IsPrimitiveCubicPhase omega) :
    (taoC omega).det = 3 := by
  calc
    (taoC omega).det = (taoC omega).transpose.det :=
      (Matrix.det_transpose (taoC omega)).symm
    _ = (taoB omega).det := by rw [taoC_transpose]
    _ = 3 := taoB_det homega

theorem taoE_det (omega : ℂ) :
    (taoE omega).det = -(omega - 1) ^ 2 := by
  rw [Matrix.det_fin_three]
  simp [taoE]
  ring

theorem taoB_not_isHadamard3 {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    ¬ IsHadamard3 (taoB omega) := by
  intro hB
  have hentry := congrArg (fun M : Mat3 ↦ M 0 1) hB.2
  have hstar : (starRingEnd ℂ) omega = omega ^ 2 :=
    primitiveCubicPhase_star homega
  have hcube := primitiveCubicPhase_cube homega
  have hstarSq : (starRingEnd ℂ) (omega ^ 2) = omega := by
    rw [map_pow, hstar]
    calc
      (omega ^ 2) ^ 2 = omega * omega ^ 3 := by ring
      _ = omega := by rw [hcube]; ring
  simp [Matrix.mul_apply, Matrix.conjTranspose_apply, taoB,
    Fin.sum_univ_three, hstar, hstarSq] at hentry
  apply primitiveCubicPhase_ne_one homega
  linear_combination hentry - homega.2

theorem taoB_rowTau {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    rowTau (taoB omega) = 0 := by
  have hstar : (starRingEnd ℂ) omega = omega ^ 2 :=
    primitiveCubicPhase_star homega
  have hcube := primitiveCubicPhase_cube homega
  have hstarSq : (starRingEnd ℂ) (omega ^ 2) = omega := by
    rw [map_pow, hstar]
    calc
      (omega ^ 2) ^ 2 = omega * omega ^ 3 := by ring
      _ = omega := by rw [hcube]; ring
  have hfour : omega ^ 4 = omega := by
    calc
      omega ^ 4 = omega * omega ^ 3 := by ring
      _ = omega := by rw [hcube]; ring
  have hmiddle :
      (taoB omega * Matrix.conjTranspose (taoB omega)) 1 2 = 0 := by
    simp [Matrix.mul_apply, Matrix.conjTranspose_apply, taoB,
      Fin.sum_univ_three, hstar, hstarSq]
    linear_combination homega.2 + hcube + hfour
  rw [rowTau, hmiddle]
  ring

theorem taoB_noOppositePair {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    ¬ HasOppositePairInNoninitialRow (taoB omega) := by
  rintro ⟨i, hi, j, k, hjk, hopp⟩
  have hself := primitiveCubicPhase_not_neg_self homega
  have hsquare := primitiveCubicPhase_sq_not_neg_sq homega
  have hmix₁ := primitiveCubicPhase_not_neg_sq homega
  have hmix₂ := primitiveCubicPhase_sq_not_neg homega
  fin_cases i <;> fin_cases j <;> fin_cases k <;>
    simp [taoB, hself, hsquare, hmix₁, hmix₂] at hi hjk hopp

theorem tao_horizontalCandidates_finite {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    (horizontalCandidates (taoE omega)).Finite := by
  let G := sixI3 - taoE omega * Matrix.conjTranspose (taoE omega)
  have hH := taoMatrix_isHadamard homega
  have hdeph := taoMatrix_isDephased omega
  have hBmem : taoB omega ∈ normalizedRowGramFibre G := by
    rw [← horizontalCandidates_eq_fibre]
    simpa using topRight_mem_horizontalCandidates hH hdeph
  have hdet : (taoB omega).det ≠ 0 := by
    rw [taoB_det homega]
    norm_num
  rw [horizontalCandidates_eq_fibre]
  by_contra hinf
  rcases infinite_row_fibre_trichotomy hinf hBmem hdet with
    hfourier | hnegative | hopposite
  · exact taoB_not_isHadamard3 homega hfourier
  · rw [taoB_rowTau homega] at hnegative
    norm_num at hnegative
  · exact taoB_noOppositePair homega hopposite

theorem taoC_not_isHadamard3 {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    ¬ IsHadamard3 (taoC omega) := by
  intro hC
  have ht : IsHadamard3 (taoC omega).transpose :=
    (transpose_isHadamard3_iff).2 hC
  rw [taoC_transpose] at ht
  exact taoB_not_isHadamard3 homega ht

theorem taoC_columnTau_re {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    (columnTau (taoC omega)).re = 0 := by
  rw [← rowTau_transpose_re, taoC_transpose, taoB_rowTau homega]
  rfl

theorem taoC_noOppositePair {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    ¬ HasOppositePairInNoninitialColumn (taoC omega) := by
  rw [← oppositePair_transpose_iff, taoC_transpose]
  exact taoB_noOppositePair homega

theorem tao_verticalCandidates_finite {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    (verticalCandidates (taoE omega)).Finite := by
  let G := sixI3 - Matrix.conjTranspose (taoE omega) * taoE omega
  have hH := taoMatrix_isHadamard homega
  have hdeph := taoMatrix_isDephased omega
  have hCmem : taoC omega ∈ normalizedColumnGramFibre G := by
    rw [← verticalCandidates_eq_fibre]
    simpa using bottomLeft_mem_verticalCandidates hH hdeph
  have hdet : (taoC omega).det ≠ 0 := by
    rw [taoC_det homega]
    norm_num
  rw [verticalCandidates_eq_fibre]
  by_contra hinf
  rcases infinite_column_fibre_trichotomy hinf hCmem hdet with
    hfourier | hnegative | hopposite
  · exact taoC_not_isHadamard3 homega hfourier
  · rw [taoC_columnTau_re homega] at hnegative
    norm_num at hnegative
  · exact taoC_noOppositePair homega hopposite

/-- The standard Tao representative has the finite leading corner displayed
in the paper. -/
theorem taoMatrix_hasFiniteCorner {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    HasFiniteCorner (taoMatrix omega) := by
  apply finite_topLeft_fibres_give_finiteCorner
    (taoMatrix_isHadamard homega) (taoMatrix_isDephased omega)
  · rw [taoMatrix_topLeft, taoE_det]
    exact neg_ne_zero.mpr
      (pow_ne_zero 2 (sub_ne_zero.mpr (primitiveCubicPhase_ne_one homega)))
  · simp [taoB_det homega]
  · simp [taoC_det homega]
  · simpa using tao_horizontalCandidates_finite homega
  · simpa using tao_verticalCandidates_finite homega

theorem taoMatrix_mem_finiteCornerAtlas {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    InFiniteCornerAtlas (taoMatrix omega) := by
  rcases finiteCorner_hasRetainedOutput
      (taoMatrix_hasFiniteCorner homega) with ⟨p, B, C, hret, heq⟩
  exact mem_finiteCornerAtlas_of_retained hret heq

/-- The entire concrete Tao orbit lies in the total-output atlas. -/
theorem isTaoOrbit_mem_finiteCornerAtlas {H : Mat6} (hH : IsTaoOrbit H) :
    InFiniteCornerAtlas H := by
  rcases hH with ⟨omega, homega, heq⟩
  exact inFiniteCornerAtlas_of_equivalent heq
    (taoMatrix_mem_finiteCornerAtlas homega)

/-- A `2 x 2` Hadamard matrix has cross-product ratio `-1`. -/
theorem isHadamard2_cross_sum_zero {X : Mat2} (hX : IsHadamard2 X) :
    X 0 0 * X 1 1 + X 0 1 * X 1 0 = 0 := by
  have hentry :
      X 0 0 * (starRingEnd ℂ) (X 1 0) +
        X 0 1 * (starRingEnd ℂ) (X 1 1) = 0 := by
    have h := congrArg (fun M : Mat2 ↦ M 0 1) hX.2
    simpa [Matrix.mul_apply, Matrix.conjTranspose_apply] using h
  have h₀ : (starRingEnd ℂ) (X 1 0) * X 1 0 = 1 := by
    exact star_mul_self_of_normSq_one (hX.1 1 0)
  have h₁ : (starRingEnd ℂ) (X 1 1) * X 1 1 = 1 := by
    exact star_mul_self_of_normSq_one (hX.1 1 1)
  calc
    X 0 0 * X 1 1 + X 0 1 * X 1 0 =
        X 0 0 * ((starRingEnd ℂ) (X 1 0) * X 1 0) * X 1 1 +
          X 0 1 * ((starRingEnd ℂ) (X 1 1) * X 1 1) * X 1 0 := by
            rw [h₀, h₁]
            ring
    _ = (X 0 0 * (starRingEnd ℂ) (X 1 0) +
          X 0 1 * (starRingEnd ℂ) (X 1 1)) *
          (X 1 0 * X 1 1) := by ring
    _ = 0 := by rw [hentry, zero_mul]

theorem taoMatrix_entry_isCubicRoot {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) (i j : I6) :
    (taoMatrix omega i j) ^ 3 = 1 := by
  have hcube := primitiveCubicPhase_cube homega
  have hsix : omega ^ 6 = 1 := by
    calc
      omega ^ 6 = (omega ^ 3) ^ 2 := by ring
      _ = 1 := by rw [hcube]; norm_num
  have hsquarecube : (omega ^ 2) ^ 3 = 1 := by
    rw [← pow_mul]
    norm_num
    exact hsix
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [taoMatrix, hcube, hsquarecube]

theorem cubicRoots_sum_ne_zero {x y : ℂ}
    (hx : x ^ 3 = 1) (hy : y ^ 3 = 1) : x + y ≠ 0 := by
  intro hsum
  have hxy : x = -y := eq_neg_of_add_eq_zero_left hsum
  have hp := congrArg (fun z : ℂ ↦ z ^ 3) hxy
  rw [hx] at hp
  have hneg : (-y) ^ 3 = -(y ^ 3) := by ring
  rw [hneg, hy] at hp
  norm_num at hp

/-- Tao is not `H₂`-reducible.  The proof uses only the cross-product
identity above and the fact that every Tao entry is a cubic root of unity. -/
theorem taoMatrix_not_hasHadamardTwoByTwo {omega : ℂ}
    (homega : IsPrimitiveCubicPhase omega) :
    ¬ HasHadamardTwoByTwo (taoMatrix omega) := by
  rintro ⟨rows, cols, hsub⟩
  have hcross := isHadamard2_cross_sum_zero hsub
  simp only [Matrix.submatrix_apply] at hcross
  apply cubicRoots_sum_ne_zero
      (x := taoMatrix omega (rows 0) (cols 0) *
        taoMatrix omega (rows 1) (cols 1))
      (y := taoMatrix omega (rows 0) (cols 1) *
        taoMatrix omega (rows 1) (cols 0))
  · rw [mul_pow, taoMatrix_entry_isCubicRoot homega,
      taoMatrix_entry_isCubicRoot homega]
    norm_num
  · rw [mul_pow, taoMatrix_entry_isCubicRoot homega,
      taoMatrix_entry_isCubicRoot homega]
    norm_num
  · exact hcross

end Hadamard6
