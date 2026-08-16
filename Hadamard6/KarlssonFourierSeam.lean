import Hadamard6.KarlssonMixedBlocks
import Hadamard6.TaoOrbit
import Hadamard6.BlockOppositePair

/-!
# The affine-Fourier seams in the Karlsson witness theorem

This file follows the exceptional-chart paragraph of the paper.  It defines
the displayed two-phase affine-Fourier matrix literally.  The six-corner
common-zero certificate is proved on top of this interface in
`FourierSeamCertificate.lean`; it is kept separate from the regular
mixed/mixed calculation.
-/

namespace Hadamard6

noncomputable section

/-- The paper's displayed affine-Fourier family `F₆⁽²⁾(z₁,z₂)`, with the
primitive cubic phase left explicit. -/
def affineFourierMatrix (omega z₁ z₂ : ℂ) : Mat6 :=
  Matrix.fromBlocks
    !![1, 1, 1;
       1, -1, z₁;
       1, 1, omega]
    !![1, 1, 1;
       -z₁, z₂, -z₂;
       omega, omega ^ 2, omega ^ 2]
    !![1, -1, omega * z₁;
       1, 1, omega ^ 2;
       1, -1, omega ^ 2 * z₁]
    !![-omega * z₁, omega ^ 2 * z₂, -(omega ^ 2 * z₂);
       omega ^ 2, omega, omega;
       -(omega ^ 2 * z₁), omega * z₂, -(omega * z₂)]

/-- Transposition preserves the order-six Hadamard property. -/
theorem transpose_isHadamard {H : Mat6} (hH : IsHadamard H) :
    IsHadamard H.transpose := by
  refine ⟨(fun i j ↦ hH.1 j i), ?_⟩
  have hcol := hadamard_column_gram hH
  ext i j
  have hij := congrArg (fun M : Mat6 ↦ M j i) hcol
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
    Matrix.transpose_apply, Matrix.smul_apply, Matrix.one_apply] at hij ⊢
  simpa [mul_comm, eq_comm] using hij

theorem transpose_isHadamard_iff {H : Mat6} :
    IsHadamard H.transpose ↔ IsHadamard H := by
  constructor
  · intro hHT
    simpa using transpose_isHadamard hHT
  · exact transpose_isHadamard

theorem affineFourierMatrix_entrywiseUnit
    {omega z₁ z₂ : ℂ} (homega : IsPrimitiveCubicPhase omega)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    EntrywiseUnit (affineFourierMatrix omega z₁ z₂) := by
  intro i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [affineFourierMatrix, Complex.normSq_mul, homega.1,
      primitiveCubicPhase_sq_norm homega, hz₁, hz₂]

theorem affineFourierMatrix_isHadamard
    {omega z₁ z₂ : ℂ} (homega : IsPrimitiveCubicPhase omega)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1) :
    IsHadamard (affineFourierMatrix omega z₁ z₂) := by
  refine ⟨affineFourierMatrix_entrywiseUnit homega hz₁ hz₂, ?_⟩
  have hstarOmega : (starRingEnd ℂ) omega = omega ^ 2 :=
    primitiveCubicPhase_star homega
  have hstarOmegaSq : (starRingEnd ℂ) (omega ^ 2) = omega := by
    rw [map_pow, hstarOmega]
    calc
      (omega ^ 2) ^ 2 = omega * omega ^ 3 := by ring
      _ = omega := by rw [primitiveCubicPhase_cube homega, mul_one]
  have hstarZ₁ : (starRingEnd ℂ) z₁ = 1 / z₁ := by
    exact (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hstarZ₂ : (starRingEnd ℂ) z₂ = 1 / z₂ := by
    exact (one_div_eq_star_of_normSq_eq_one hz₂).symm
  have hz₁0 : z₁ ≠ 0 := ne_zero_of_normSq_eq_one hz₁
  have hz₂0 : z₂ ≠ 0 := ne_zero_of_normSq_eq_one hz₂
  have homega0 : omega ≠ 0 := primitiveCubicPhase_ne_zero homega
  have hcube : omega ^ 3 = 1 := primitiveCubicPhase_cube homega
  have hpowFour : omega ^ 4 = omega := by
    calc
      omega ^ 4 = omega * omega ^ 3 := by ring
      _ = omega := by rw [hcube, mul_one]
  have hsum : 1 + omega + omega ^ 2 = 0 := by
    linear_combination homega.2
  have hsumTwo : 2 + omega * 2 + omega ^ 2 * 2 = 0 := by
    linear_combination 2 * hsum
  have hsumShifted : 2 + omega ^ 2 * 2 + omega ^ 4 * 2 = 0 := by
    rw [hpowFour]
    linear_combination 2 * hsum
  ext i j
  rcases i with i | i <;> rcases j with j | j <;>
    fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Matrix.conjTranspose_apply,
      affineFourierMatrix, Fin.sum_univ_three, hstarOmega,
      hstarOmegaSq, hstarZ₁, hstarZ₂] <;>
    field_simp [hz₁0, hz₂0, homega0] <;>
    norm_num <;>
    ring_nf <;>
    try simp only [hcube, hpowFour] <;>
    ring_nf
  all_goals exact hsumTwo

/-- The affine-Fourier seam lies in the intrinsic Karlsson sector: its
leading `2 x 2` submatrix is the standard Fourier matrix. -/
theorem affineFourierMatrix_hasHadamardTwoByTwo
    (omega z₁ z₂ : ℂ) :
    HasHadamardTwoByTwo (affineFourierMatrix omega z₁ z₂) := by
  let rows : I2 ↪ I6 := pairEmbedding (Sum.inl 0) (Sum.inl 1) (by simp)
  let cols : I2 ↪ I6 := pairEmbedding (Sum.inl 0) (Sum.inl 1) (by simp)
  refine ⟨rows, cols, ?_⟩
  have heq :
      (affineFourierMatrix omega z₁ z₂).submatrix rows cols =
        rowHadamard2 1 := by
    ext i j
    fin_cases i <;> fin_cases j <;> rfl
  rw [heq]
  exact rowHadamard2_isHadamard2 (by norm_num)

/-- The two Möbius-degenerate Karlsson seams: the affine-Fourier family and
its transpose, closed under ordinary Hadamard equivalence. -/
def IsAffineFourierSeam (H : Mat6) : Prop :=
  ∃ omega z₁ z₂ : ℂ,
    IsPrimitiveCubicPhase omega ∧
    Complex.normSq z₁ = 1 ∧
    Complex.normSq z₂ = 1 ∧
    (Equivalent H (affineFourierMatrix omega z₁ z₂) ∨
      Equivalent H (affineFourierMatrix omega z₁ z₂).transpose)

theorem isAffineFourierSeam_of_equivalent {H K : Mat6}
    (hHK : Equivalent H K) (hK : IsAffineFourierSeam K) :
    IsAffineFourierSeam H := by
  rcases hK with ⟨omega, z₁, z₂, homega, hz₁, hz₂, hpres⟩
  exact ⟨omega, z₁, z₂, homega, hz₁, hz₂,
    hpres.elim (fun h ↦ Or.inl (equivalent_trans hHK h))
      (fun h ↦ Or.inr (equivalent_trans hHK h))⟩

theorem equivalent_isAffineFourierSeam_iff {H K : Mat6}
    (hHK : Equivalent H K) :
    IsAffineFourierSeam H ↔ IsAffineFourierSeam K := by
  constructor
  · exact isAffineFourierSeam_of_equivalent (equivalent_symm hHK)
  · exact isAffineFourierSeam_of_equivalent hHK

theorem isAffineFourierSeam_isHadamard {H : Mat6}
    (hH : IsAffineFourierSeam H) : IsHadamard H := by
  rcases hH with ⟨omega, z₁, z₂, homega, hz₁, hz₂, hpres⟩
  have hfourier := affineFourierMatrix_isHadamard homega hz₁ hz₂
  rcases hpres with hpres | hpres
  · exact (equivalent_isHadamard_iff hpres).2 hfourier
  · exact (equivalent_isHadamard_iff hpres).2
      (transpose_isHadamard hfourier)

/-! The six positional corners in the supplement.  Each permutation maps the
new block order to the listed zero-based original indices. -/

def seamRows012 : Equiv.Perm I6 := Equiv.refl I6

def seamRows013 : Equiv.Perm I6 :=
  Equiv.swap (Sum.inl 2) (Sum.inr 0)

def seamRows025 : Equiv.Perm I6 :=
  (((Equiv.swap (Sum.inl 1) (Sum.inl 2)).trans
      (Equiv.swap (Sum.inl 1) (Sum.inr 2))).trans
      (Equiv.swap (Sum.inl 1) (Sum.inr 1))).trans
      (Equiv.swap (Sum.inl 1) (Sum.inr 0))

def seamColumns024 : Equiv.Perm I6 :=
  ((Equiv.swap (Sum.inl 1) (Sum.inl 2)).trans
      (Equiv.swap (Sum.inl 1) (Sum.inr 1))).trans
      (Equiv.swap (Sum.inl 1) (Sum.inr 0))

def seamColumns025 : Equiv.Perm I6 := seamRows025

theorem seamRows013_order :
    seamRows013 (Sum.inl 0) = Sum.inl 0 ∧
    seamRows013 (Sum.inl 1) = Sum.inl 1 ∧
    seamRows013 (Sum.inl 2) = Sum.inr 0 ∧
    seamRows013 (Sum.inr 0) = Sum.inl 2 ∧
    seamRows013 (Sum.inr 1) = Sum.inr 1 ∧
    seamRows013 (Sum.inr 2) = Sum.inr 2 := by
  decide

theorem seamRows025_order :
    seamRows025 (Sum.inl 0) = Sum.inl 0 ∧
    seamRows025 (Sum.inl 1) = Sum.inl 2 ∧
    seamRows025 (Sum.inl 2) = Sum.inr 2 ∧
    seamRows025 (Sum.inr 0) = Sum.inl 1 ∧
    seamRows025 (Sum.inr 1) = Sum.inr 0 ∧
    seamRows025 (Sum.inr 2) = Sum.inr 1 := by
  decide

theorem seamColumns024_order :
    seamColumns024 (Sum.inl 0) = Sum.inl 0 ∧
    seamColumns024 (Sum.inl 1) = Sum.inl 2 ∧
    seamColumns024 (Sum.inl 2) = Sum.inr 1 ∧
    seamColumns024 (Sum.inr 0) = Sum.inl 1 ∧
    seamColumns024 (Sum.inr 1) = Sum.inr 0 ∧
    seamColumns024 (Sum.inr 2) = Sum.inr 2 := by
  decide

def seamRowPermutation (r : I3) : Equiv.Perm I6 :=
  Fin.cases seamRows012
    (fun r' ↦ Fin.cases seamRows013 (fun _ ↦ seamRows025) r') r

def seamColumnPermutation (c : I2) : Equiv.Perm I6 :=
  Fin.cases seamColumns024 (fun _ ↦ seamColumns025) c

/-- Reindex one of the six listed corners to the leading position and apply
the paper's canonical cross-ratio dephasing. -/
noncomputable def seamCornerChart (r : I3) (c : I2) (H : Mat6) : Mat6 :=
  dephase (reindexMatrix (seamRowPermutation r)
    (seamColumnPermutation c) H)

theorem equivalent_seamCornerChart {H : Mat6}
    (hH : EntrywiseUnit H) (r : I3) (c : I2) :
    Equivalent H (seamCornerChart r c H) := by
  have hreindex := equivalent_reindexMatrix
    (seamRowPermutation r) (seamColumnPermutation c) H
  have hunit : EntrywiseUnit
      (reindexMatrix (seamRowPermutation r)
        (seamColumnPermutation c) H) := by
    intro i j
    exact hH _ _
  exact equivalent_trans hreindex (equivalent_dephase hunit)

end

end Hadamard6
