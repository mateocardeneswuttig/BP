import Hadamard6.HadamardThreeFourier
import Hadamard6.FourierCoreFromNormalization

/-!
# Simultaneous normalization of three Hadamard blocks

The phase operation below dephases the upper-left block while independently
fixing the first row of the upper-right block and the first column of the
lower-left block.  These are exactly the degrees of freedom available from
block-preserving row and column phases.
-/

namespace Hadamard6

noncomputable def topPhase (H : Mat6) (i : I3) : ℂ :=
  star (H (Sum.inl i) (Sum.inl 0))

noncomputable def leftPhase (H : Mat6) (j : I3) : ℂ :=
  star (H (Sum.inl 0) (Sum.inl j)) * H (Sum.inl 0) (Sum.inl 0)

noncomputable def rightPhase (H : Mat6) (j : I3) : ℂ :=
  star (topPhase H 0 * H (Sum.inl 0) (Sum.inr j))

noncomputable def bottomPhase (H : Mat6) (i : I3) : ℂ :=
  star (H (Sum.inr i) (Sum.inl 0) * leftPhase H 0)

noncomputable def simultaneousRowPhase (H : Mat6) : I6 → ℂ :=
  Sum.elim (topPhase H) (bottomPhase H)

noncomputable def simultaneousColumnPhase (H : Mat6) : I6 → ℂ :=
  Sum.elim (leftPhase H) (rightPhase H)

noncomputable def simultaneousDephase (H : Mat6) : Mat6 :=
  phaseTransform (simultaneousRowPhase H) (simultaneousColumnPhase H) H

theorem topPhase_unit {H : Mat6} (hH : EntrywiseUnit H) (i : I3) :
    Complex.normSq (topPhase H i) = 1 := by
  simpa [topPhase, Complex.normSq_conj] using hH (Sum.inl i) (Sum.inl 0)

theorem leftPhase_unit {H : Mat6} (hH : EntrywiseUnit H) (j : I3) :
    Complex.normSq (leftPhase H j) = 1 := by
  simp [leftPhase, Complex.normSq_mul, Complex.normSq_conj,
    hH (Sum.inl 0) (Sum.inl j), hH (Sum.inl 0) (Sum.inl 0)]

theorem rightPhase_unit {H : Mat6} (hH : EntrywiseUnit H) (j : I3) :
    Complex.normSq (rightPhase H j) = 1 := by
  simp [rightPhase, Complex.normSq_conj, Complex.normSq_mul,
    topPhase_unit hH 0, hH (Sum.inl 0) (Sum.inr j)]

theorem bottomPhase_unit {H : Mat6} (hH : EntrywiseUnit H) (i : I3) :
    Complex.normSq (bottomPhase H i) = 1 := by
  simp [bottomPhase, Complex.normSq_conj, Complex.normSq_mul,
    hH (Sum.inr i) (Sum.inl 0), leftPhase_unit hH 0]

theorem simultaneousRowPhase_unit {H : Mat6} (hH : EntrywiseUnit H) :
    ∀ i, Complex.normSq (simultaneousRowPhase H i) = 1 := by
  intro i
  rcases i with i | i
  · exact topPhase_unit hH i
  · exact bottomPhase_unit hH i

theorem simultaneousColumnPhase_unit {H : Mat6} (hH : EntrywiseUnit H) :
    ∀ j, Complex.normSq (simultaneousColumnPhase H j) = 1 := by
  intro j
  rcases j with j | j
  · exact leftPhase_unit hH j
  · exact rightPhase_unit hH j

theorem simultaneousDephase_isHadamard {H : Mat6} (hH : IsHadamard H) :
    IsHadamard (simultaneousDephase H) :=
  phaseTransform_isHadamard
    (simultaneousRowPhase_unit hH.1)
    (simultaneousColumnPhase_unit hH.1) hH

theorem equivalent_simultaneousDephase {H : Mat6} (hH : EntrywiseUnit H) :
    Equivalent H (simultaneousDephase H) :=
  equivalent_phaseTransform
    (simultaneousRowPhase_unit hH)
    (simultaneousColumnPhase_unit hH)

theorem topLeft_simultaneousDephase (H : Mat6) :
    Matrix.toBlocks₁₁ (simultaneousDephase H) =
      dephase3 (Matrix.toBlocks₁₁ H) := by
  ext i j
  rfl

theorem topRight_simultaneousDephase_firstRow
    {H : Mat6} (hH : EntrywiseUnit H) :
    ∀ j, Matrix.toBlocks₁₂ (simultaneousDephase H) 0 j = 1 := by
  intro j
  change topPhase H 0 * H (Sum.inl 0) (Sum.inr j) *
    rightPhase H j = 1
  have hz : Complex.normSq
      (topPhase H 0 * H (Sum.inl 0) (Sum.inr j)) = 1 := by
    rw [Complex.normSq_mul, topPhase_unit hH 0,
      hH (Sum.inl 0) (Sum.inr j)]
    norm_num
  simpa [rightPhase, mul_comm] using star_mul_self_of_normSq_one hz

theorem bottomLeft_simultaneousDephase_firstColumn
    {H : Mat6} (hH : EntrywiseUnit H) :
    ∀ i, Matrix.toBlocks₂₁ (simultaneousDephase H) i 0 = 1 := by
  intro i
  change bottomPhase H i * H (Sum.inr i) (Sum.inl 0) *
    leftPhase H 0 = 1
  have hz : Complex.normSq
      (H (Sum.inr i) (Sum.inl 0) * leftPhase H 0) = 1 := by
    rw [Complex.normSq_mul, hH (Sum.inr i) (Sum.inl 0),
      leftPhase_unit hH 0]
    norm_num
  calc
    bottomPhase H i * H (Sum.inr i) (Sum.inl 0) * leftPhase H 0 =
        star (H (Sum.inr i) (Sum.inl 0) * leftPhase H 0) *
          (H (Sum.inr i) (Sum.inl 0) * leftPhase H 0) := by
            simp only [bottomPhase, star_mul]
            ring
    _ = 1 := star_mul_self_of_normSq_one hz

theorem simultaneousDephase_blocks_hadamard
    {H : Mat6} (hfour : AllFourBlocksHadamard H) :
    AllFourBlocksHadamard (simultaneousDephase H) := by
  rcases hfour with ⟨hA, hB, hC, hD⟩
  have hHu : EntrywiseUnit H := by
    intro i j
    rcases i with i | i <;> rcases j with j | j
    · exact hA.1 i j
    · exact hB.1 i j
    · exact hC.1 i j
    · exact hD.1 i j
  constructor
  · rw [topLeft_simultaneousDephase]
    exact dephase3_isHadamard3 hA
  constructor
  · change IsHadamard3 (biGauge (topPhase H) (rightPhase H)
      (Matrix.toBlocks₁₂ H))
    exact biGauge_isHadamard3
      (fun i ↦ topPhase_unit hHu i)
      (fun j ↦ rightPhase_unit hHu j) hB
  constructor
  · change IsHadamard3 (biGauge (bottomPhase H) (leftPhase H)
      (Matrix.toBlocks₂₁ H))
    exact biGauge_isHadamard3
      (fun i ↦ bottomPhase_unit hHu i)
      (fun j ↦ leftPhase_unit hHu j) hC
  · change IsHadamard3 (biGauge (bottomPhase H) (rightPhase H)
      (Matrix.toBlocks₂₂ H))
    apply biGauge_isHadamard3
    · intro i
      exact bottomPhase_unit hHu i
    · intro j
      exact rightPhase_unit hHu j
    · exact hD

def threeOrientationNormalForm
    (ω₀ p q ω₁ r s ω₂ : ℂ) (D : Mat3) : Mat6 :=
  Matrix.fromBlocks (fourier3 ω₀)
    (rowGauge (fourierParameters p q) (fourier3 ω₁))
    (columnGauge (fourierParameters r s) (fourier3 ω₂)) D

/-- The direct output of simultaneous dephasing, before the two independent
orientation swaps identify all three Fourier roots. -/
structure ThreeOrientationNormalization (H : Mat6) where
  K : Mat6
  hK : IsHadamard K
  equivalent : Equivalent H K
  ω₀ : ℂ
  p : ℂ
  q : ℂ
  ω₁ : ℂ
  r : ℂ
  s : ℂ
  ω₂ : ℂ
  D : Mat3
  ω₀_unit : Complex.normSq ω₀ = 1
  ω₀_quadratic : ω₀ ^ 2 + ω₀ + 1 = 0
  p_unit : Complex.normSq p = 1
  q_unit : Complex.normSq q = 1
  ω₁_unit : Complex.normSq ω₁ = 1
  ω₁_quadratic : ω₁ ^ 2 + ω₁ + 1 = 0
  r_unit : Complex.normSq r = 1
  s_unit : Complex.normSq s = 1
  ω₂_unit : Complex.normSq ω₂ = 1
  ω₂_quadratic : ω₂ ^ 2 + ω₂ + 1 = 0
  topRight_hadamard : IsHadamard3
    (rowGauge (fourierParameters p q) (fourier3 ω₁))
  normalForm : K = threeOrientationNormalForm ω₀ p q ω₁ r s ω₂ D

theorem threeOrientationNormalization
    (H : Mat6) (hH : IsHadamard H) (hfour : AllFourBlocksHadamard H) :
    Nonempty (ThreeOrientationNormalization H) := by
  let K := simultaneousDephase H
  have hK : IsHadamard K := simultaneousDephase_isHadamard hH
  have heq : Equivalent H K := equivalent_simultaneousDephase hH.1
  have hKfour : AllFourBlocksHadamard K :=
    simultaneousDephase_blocks_hadamard hfour
  rcases dephased_hadamard3_eq_fourier hKfour.1
      (by
        rw [topLeft_simultaneousDephase]
        exact dephase3_isDephased hfour.1.1) with
    ⟨ω₀, hω₀u, hω₀, hA⟩
  rcases hadamard3_firstRow_eq_rowGauge_fourier hKfour.2.1
      (topRight_simultaneousDephase_firstRow hH.1) with
    ⟨p, q, ω₁, hpu, hqu, hω₁u, hω₁, hB⟩
  rcases hadamard3_firstColumn_eq_columnGauge_fourier hKfour.2.2.1
      (bottomLeft_simultaneousDephase_firstColumn hH.1) with
    ⟨r, s, ω₂, hru, hsu, hω₂u, hω₂, hC⟩
  refine ⟨{
    K := K
    hK := hK
    equivalent := heq
    ω₀ := ω₀
    p := p
    q := q
    ω₁ := ω₁
    r := r
    s := s
    ω₂ := ω₂
    D := Matrix.toBlocks₂₂ K
    ω₀_unit := hω₀u
    ω₀_quadratic := hω₀
    p_unit := hpu
    q_unit := hqu
    ω₁_unit := hω₁u
    ω₁_quadratic := hω₁
    r_unit := hru
    s_unit := hsu
    ω₂_unit := hω₂u
    ω₂_quadratic := hω₂
    topRight_hadamard := hB ▸ hKfour.2.1
    normalForm := ?_ }⟩
  rw [threeOrientationNormalForm, ← hA, ← hB, ← hC]
  exact (Matrix.fromBlocks_toBlocks K).symm

def swapFourierOrientation : Equiv.Perm I3 := Equiv.swap 1 2

theorem fourier3_square_swap_columns
    {ω : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    (fun i j ↦ fourier3 (ω ^ 2) i (swapFourierOrientation j)) =
      fourier3 ω := by
  have hω3 := cubic_of_quadratic hω
  unfold IsCubicRoot at hω3
  have hω4 : ω ^ 4 = ω := by
    calc
      ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [hω3, mul_one]
  have hω8 : ω ^ 8 = ω ^ 2 := by
    calc
      ω ^ 8 = ω ^ 2 * (ω ^ 3) ^ 2 := by ring
      _ = ω ^ 2 := by rw [hω3]; norm_num
  have hs0 : swapFourierOrientation 0 = 0 := by decide
  have hs1 : swapFourierOrientation 1 = 2 := by decide
  have hs2 : swapFourierOrientation 2 = 1 := by decide
  have hsq2 : (ω ^ 2) ^ 2 = ω := by
    rw [← pow_mul]
    norm_num
    exact hω4
  have hsq4 : (ω ^ 2) ^ 4 = ω ^ 2 := by
    rw [← pow_mul]
    norm_num
    exact hω8
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [fourier3, hs0, hs1, hs2, hsq2, hsq4, hω4]

theorem fourier3_square_swap_rows
    {ω : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    (fun i j ↦ fourier3 (ω ^ 2) (swapFourierOrientation i) j) =
      fourier3 ω := by
  have hc := fourier3_square_swap_columns hω
  ext i j
  calc
    fourier3 (ω ^ 2) (swapFourierOrientation i) j =
        fourier3 (ω ^ 2) j (swapFourierOrientation i) := by
          simp [fourier3, mul_comm]
    _ = fourier3 ω j i := congrArg (fun M : Mat3 ↦ M j i) hc
    _ = fourier3 ω i j := by simp [fourier3, mul_comm]

def permuteMatrix (σ τ : Equiv.Perm I6) (H : Mat6) : Mat6 :=
  fun i j ↦ H (σ i) (τ j)

theorem permuteMatrix_isHadamard
    {σ τ : Equiv.Perm I6} {H : Mat6} (hH : IsHadamard H) :
    IsHadamard (permuteMatrix σ τ H) := by
  constructor
  · intro i j
    exact hH.1 (σ i) (τ j)
  · ext i j
    change (∑ k, H (σ i) (τ k) * star (H (σ j) (τ k))) = _
    rw [τ.sum_comp Finset.univ (fun k ↦
      H (σ i) k * star (H (σ j) k)) (by simp)]
    have hentry := congrArg (fun M : Mat6 ↦ M (σ i) (σ j)) hH.2
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply] at hentry ⊢
    by_cases hij : i = j
    · subst j
      simpa using hentry
    · have hsij : σ i ≠ σ j := fun h ↦ hij (σ.injective h)
      simpa [hij, hsij] using hentry

theorem equivalent_permuteMatrix (σ τ : Equiv.Perm I6) (H : Mat6) :
    Equivalent H (permuteMatrix σ τ H) := by
  exact ⟨σ, τ, (fun _ ↦ 1), (fun _ ↦ 1),
    (by intro i; norm_num), (by intro j; norm_num), by simp [permuteMatrix]⟩

def permuteColumns3 (κ : Equiv.Perm I3) (X : Mat3) : Mat3 :=
  fun i j ↦ X i (κ j)

theorem permuteColumns3_isHadamard
    {κ : Equiv.Perm I3} {X : Mat3} (hX : IsHadamard3 X) :
    IsHadamard3 (permuteColumns3 κ X) := by
  constructor
  · intro i j
    exact hX.1 i (κ j)
  · ext i j
    change (∑ k, X i (κ k) * star (X j (κ k))) = _
    rw [κ.sum_comp Finset.univ (fun k ↦ X i k * star (X j k)) (by simp)]
    exact congrArg (fun M : Mat3 ↦ M i j) hX.2

def liftBottomPermutation (ρ : Equiv.Perm I3) : Equiv.Perm I6 :=
  Equiv.sumCongr (Equiv.refl I3) ρ

def liftRightPermutation (κ : Equiv.Perm I3) : Equiv.Perm I6 :=
  Equiv.sumCongr (Equiv.refl I3) κ

theorem orient_three_blocks
    {H : Mat6} (n : ThreeOrientationNormalization H)
    (ρ κ : Equiv.Perm I3)
    (hBorient : permuteColumns3 κ
        (rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₁)) =
      rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₀))
    (hCorient :
      (fun i j ↦ columnGauge (fourierParameters n.r n.s)
        (fourier3 n.ω₂) (ρ i) j) =
      columnGauge (fourierParameters n.r n.s) (fourier3 n.ω₀)) :
    Nonempty (FourierThreeBlockNormalization H) := by
  let σ := liftBottomPermutation ρ
  let τ := liftRightPermutation κ
  let L := permuteMatrix σ τ n.K
  have hL : IsHadamard L := permuteMatrix_isHadamard n.hK
  have heq : Equivalent H L :=
    equivalent_trans n.equivalent (equivalent_permuteMatrix σ τ n.K)
  have h11 : Matrix.toBlocks₁₁ L = fourier3 n.ω₀ := by
    ext i j
    change n.K (Sum.inl i) (Sum.inl j) = _
    rw [n.normalForm]
    rfl
  have h12 : Matrix.toBlocks₁₂ L =
      rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₀) := by
    ext i j
    have hij := congrArg (fun M : Mat3 ↦ M i j) hBorient
    change n.K (Sum.inl i) (Sum.inr (κ j)) = _
    rw [n.normalForm]
    exact hij
  have h21 : Matrix.toBlocks₂₁ L =
      columnGauge (fourierParameters n.r n.s) (fourier3 n.ω₀) := by
    ext i j
    have hij := congrArg (fun M : Mat3 ↦ M i j) hCorient
    change n.K (Sum.inr (ρ i)) (Sum.inl j) = _
    rw [n.normalForm]
    exact hij
  have hBhad : IsHadamard3
      (rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₀)) := by
    have hp := permuteColumns3_isHadamard
      (κ := κ) n.topRight_hadamard
    rwa [hBorient] at hp
  refine ⟨{
    K := L
    hK := hL
    equivalent := heq
    ω := n.ω₀
    p := n.p
    q := n.q
    r := n.r
    s := n.s
    D := Matrix.toBlocks₂₂ L
    omega_unit := n.ω₀_unit
    omega_quadratic := n.ω₀_quadratic
    p_unit := n.p_unit
    q_unit := n.q_unit
    r_unit := n.r_unit
    s_unit := n.s_unit
    topRight_hadamard := hBhad
    firstThreeBlocks := ?_ }⟩
  rw [← Matrix.fromBlocks_toBlocks L, h11, h12, h21]
  rfl

/-- The simultaneous normalization theorem: if all four `3 x 3` blocks are
Hadamard, a single order-six equivalence puts the first three into the common
Fourier normal form.  No classification theorem is used. -/
theorem simultaneous_threeBlockFourierNormalization :
    FourierThreeBlockNormalizationReduction := by
  intro H hH hfour
  rcases threeOrientationNormalization H hH hfour with ⟨n⟩
  have hBsame (h : n.ω₁ = n.ω₀) :
      permuteColumns3 (Equiv.refl I3)
          (rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₁)) =
        rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₀) := by
    ext i j
    simp [permuteColumns3, h]
  have hBsquare (h : n.ω₁ = n.ω₀ ^ 2) :
      permuteColumns3 swapFourierOrientation
          (rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₁)) =
        rowGauge (fourierParameters n.p n.q) (fourier3 n.ω₀) := by
    ext i j
    have hf := congrArg (fun M : Mat3 ↦ M i j)
      (fourier3_square_swap_columns n.ω₀_quadratic)
    simp only [permuteColumns3, rowGauge]
    rw [h]
    exact congrArg (fun z : ℂ ↦ fourierParameters n.p n.q i * z) hf
  have hCsame (h : n.ω₂ = n.ω₀) :
      (fun i j ↦ columnGauge (fourierParameters n.r n.s)
          (fourier3 n.ω₂) ((Equiv.refl I3) i) j) =
        columnGauge (fourierParameters n.r n.s) (fourier3 n.ω₀) := by
    ext i j
    simp [h]
  have hCsquare (h : n.ω₂ = n.ω₀ ^ 2) :
      (fun i j ↦ columnGauge (fourierParameters n.r n.s)
          (fourier3 n.ω₂) (swapFourierOrientation i) j) =
        columnGauge (fourierParameters n.r n.s) (fourier3 n.ω₀) := by
    ext i j
    have hf := congrArg (fun M : Mat3 ↦ M i j)
      (fourier3_square_swap_rows n.ω₀_quadratic)
    simp only [columnGauge, rowGauge, Matrix.transpose_apply]
    rw [h]
    exact congrArg (fun z : ℂ ↦ fourierParameters n.r n.s j * z) hf
  rcases quadratic_root_relative n.ω₀_quadratic n.ω₁_quadratic with
    h₁ | h₁ <;>
  rcases quadratic_root_relative n.ω₀_quadratic n.ω₂_quadratic with
    h₂ | h₂
  · exact orient_three_blocks n (Equiv.refl I3) (Equiv.refl I3)
      (hBsame h₁) (hCsame h₂)
  · exact orient_three_blocks n swapFourierOrientation (Equiv.refl I3)
      (hBsame h₁) (hCsquare h₂)
  · exact orient_three_blocks n (Equiv.refl I3) swapFourierOrientation
      (hBsquare h₁) (hCsame h₂)
  · exact orient_three_blocks n swapFourierOrientation swapFourierOrientation
      (hBsquare h₁) (hCsquare h₂)

end Hadamard6
