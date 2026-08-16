import Hadamard6.InfiniteFibreTrichotomy
import Mathlib.Analysis.Complex.Basic
import Mathlib.Tactic.FinCases

/-!
# Symmetries of a normalized row-Gram fibre

The quotient calculation is stated after the sums of the two noninitial rows
have been phased to nonnegative real numbers.  This file proves that this is a
genuine normalization, rather than an additional hypothesis.
-/

namespace Hadamard6

def rowPhaseFactor (u v : ℂ) (i : I3) : ℂ :=
  if i = 0 then 1 else if i = 1 then u else v

def phaseNoninitialRows (u v : ℂ) (X : Mat3) : Mat3 :=
  fun i j ↦ rowPhaseFactor u v i * X i j

def phaseRowGram (u v : ℂ) (G : Mat3) : Mat3 :=
  fun i j ↦ rowPhaseFactor u v i * G i j * star (rowPhaseFactor u v j)

@[simp] theorem rowPhaseFactor_zero (u v : ℂ) :
    rowPhaseFactor u v 0 = 1 := by simp [rowPhaseFactor]

@[simp] theorem rowPhaseFactor_one (u v : ℂ) :
    rowPhaseFactor u v 1 = u := by simp [rowPhaseFactor]

@[simp] theorem rowPhaseFactor_two (u v : ℂ) :
    rowPhaseFactor u v 2 = v := by simp [rowPhaseFactor]

theorem rowPhaseFactor_unit {u v : ℂ}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1) (i : I3) :
    Complex.normSq (rowPhaseFactor u v i) = 1 := by
  fin_cases i <;> simp [hu, hv]

theorem phaseNoninitialRows_entrywiseUnit {u v : ℂ} {X : Mat3}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1)
    (hX : EntrywiseUnit X) :
    EntrywiseUnit (phaseNoninitialRows u v X) := by
  intro i j
  rw [show phaseNoninitialRows u v X i j =
    rowPhaseFactor u v i * X i j by rfl, Complex.normSq_mul,
    rowPhaseFactor_unit hu hv i, hX i j]
  norm_num

theorem phaseNoninitialRows_firstRow (u v : ℂ) {X : Mat3}
    (hX : ∀ j, X 0 j = 1) :
    ∀ j, phaseNoninitialRows u v X 0 j = 1 := by
  intro j
  simp [phaseNoninitialRows, hX]

theorem phaseNoninitialRows_rowGram (u v : ℂ) (X : Mat3) :
    phaseNoninitialRows u v X *
        Matrix.conjTranspose (phaseNoninitialRows u v X) =
      phaseRowGram u v (X * Matrix.conjTranspose X) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Matrix.conjTranspose_apply,
      phaseNoninitialRows, phaseRowGram, Fin.sum_univ_three, star_mul] <;>
    ring

theorem phaseNoninitialRows_mem {u v : ℂ} {G X : Mat3}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1)
    (hX : X ∈ normalizedRowGramFibre G) :
    phaseNoninitialRows u v X ∈
      normalizedRowGramFibre (phaseRowGram u v G) := by
  refine ⟨phaseNoninitialRows_entrywiseUnit hu hv hX.1,
    phaseNoninitialRows_firstRow u v hX.2.1, ?_⟩
  rw [phaseNoninitialRows_rowGram, hX.2.2]

theorem phaseNoninitialRows_det_ne_zero {u v : ℂ} {X : Mat3}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1)
    (hdet : X.det ≠ 0) :
    (phaseNoninitialRows u v X).det ≠ 0 := by
  have hu0 : u ≠ 0 := by
    intro h
    rw [h] at hu
    norm_num at hu
  have hv0 : v ≠ 0 := by
    intro h
    rw [h] at hv
    norm_num at hv
  rw [Matrix.det_fin_three]
  simp only [phaseNoninitialRows]
  simp only [rowPhaseFactor_zero, rowPhaseFactor_one, rowPhaseFactor_two]
  intro h
  apply hdet
  rw [Matrix.det_fin_three]
  apply mul_left_cancel₀ (mul_ne_zero hu0 hv0)
  linear_combination h

theorem phaseNoninitialRows_isHadamard3_iff {u v : ℂ} {X : Mat3}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1) :
    IsHadamard3 (phaseNoninitialRows u v X) ↔ IsHadamard3 X := by
  have hsu : (starRingEnd ℂ) u * u = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, hu]
    norm_num
  have hsv : (starRingEnd ℂ) v * v = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, hv]
    norm_num
  have hus : u * (starRingEnd ℂ) u = 1 := by rw [mul_comm, hsu]
  have hvs : v * (starRingEnd ℂ) v = 1 := by rw [mul_comm, hsv]
  have hsu_mul (a : ℂ) : (starRingEnd ℂ) u * (u * a) = a := by
    rw [← mul_assoc, hsu, one_mul]
  have hsv_mul (a : ℂ) : (starRingEnd ℂ) v * (v * a) = a := by
    rw [← mul_assoc, hsv, one_mul]
  have hu_mul_star (a : ℂ) : u * a * (starRingEnd ℂ) u = a := by
    calc
      _ = (u * (starRingEnd ℂ) u) * a := by ac_rfl
      _ = a := by rw [hus, one_mul]
  have hv_mul_star (a : ℂ) : v * a * (starRingEnd ℂ) v = a := by
    calc
      _ = (v * (starRingEnd ℂ) v) * a := by ac_rfl
      _ = a := by rw [hvs, one_mul]
  have hstar_u_mul (a : ℂ) : (starRingEnd ℂ) u * a * u = a := by
    calc
      _ = ((starRingEnd ℂ) u * u) * a := by ac_rfl
      _ = a := by rw [hsu, one_mul]
  have hstar_v_mul (a : ℂ) : (starRingEnd ℂ) v * a * v = a := by
    calc
      _ = ((starRingEnd ℂ) v * v) * a := by ac_rfl
      _ = a := by rw [hsv, one_mul]
  constructor
  · intro h
    let u' := (starRingEnd ℂ) u
    let v' := (starRingEnd ℂ) v
    have hu' : Complex.normSq u' = 1 := by simp [u', hu]
    have hv' : Complex.normSq v' = 1 := by simp [v', hv]
    have hback : phaseNoninitialRows u' v'
        (phaseNoninitialRows u v X) = X := by
      ext i j
      fin_cases i <;> simp [phaseNoninitialRows, u', v',
        hsu_mul, hsv_mul]
    rw [← hback]
    refine ⟨phaseNoninitialRows_entrywiseUnit hu' hv' h.1, ?_⟩
    rw [phaseNoninitialRows_rowGram, h.2]
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [phaseRowGram, u', v', hstar_u_mul, hstar_v_mul]
  · intro h
    refine ⟨phaseNoninitialRows_entrywiseUnit hu hv h.1, ?_⟩
    rw [phaseNoninitialRows_rowGram, h.2]
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [phaseRowGram, hu_mul_star, hv_mul_star]

theorem rowTau_phaseNoninitialRows {u v : ℂ} {X : Mat3}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1) :
    rowTau (phaseNoninitialRows u v X) = rowTau X := by
  have hsu : star u * u = 1 := by
    rw [← starRingEnd_apply, ← Complex.normSq_eq_conj_mul_self, hu]
    norm_num
  have hsv : star v * v = 1 := by
    rw [← starRingEnd_apply, ← Complex.normSq_eq_conj_mul_self, hv]
    norm_num
  rw [rowTau, phaseNoninitialRows_rowGram]
  simp only [phaseRowGram, rowPhaseFactor_zero, rowPhaseFactor_one,
    rowPhaseFactor_two, star_one, mul_one, one_mul]
  calc
    _ = (star u * u) * (star v * v) * rowTau X := by
      simp only [rowTau]
      ring
    _ = rowTau X := by rw [hsu, hsv]; simp

/-- Some noninitial row contains two entries which are negatives of one
another.  This formulation is invariant under row phasing and row exchange. -/
def HasOppositePairInNoninitialRow (X : Mat3) : Prop :=
  ∃ i : I3, i ≠ 0 ∧ ∃ j k : I3, j ≠ k ∧ X i k = -X i j

theorem oppositePairSecondRow_implies_invariant {X : Mat3}
    (h : HasOppositePairSecondRow X) :
    HasOppositePairInNoninitialRow X := by
  rcases h with ⟨z, hz, hrow⟩ | ⟨z, hz, hrow⟩ | ⟨z, hz, hrow⟩
  · refine ⟨1, by decide, 1, 2, by decide, ?_⟩
    simp_all [rowTriple]
  · refine ⟨1, by decide, 0, 2, by decide, ?_⟩
    simp_all [rowTriple]
  · refine ⟨1, by decide, 0, 1, by decide, ?_⟩
    simp_all [rowTriple]

theorem oppositePair_phaseNoninitialRows_iff {u v : ℂ} {X : Mat3}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1) :
    HasOppositePairInNoninitialRow (phaseNoninitialRows u v X) ↔
      HasOppositePairInNoninitialRow X := by
  have hu0 : u ≠ 0 := by
    intro h
    rw [h] at hu
    norm_num at hu
  have hv0 : v ≠ 0 := by
    intro h
    rw [h] at hv
    norm_num at hv
  constructor
  · rintro ⟨i, hi, j, k, hjk, h⟩
    refine ⟨i, hi, j, k, hjk, ?_⟩
    fin_cases i
    · exact (hi rfl).elim
    · apply mul_left_cancel₀ hu0
      simpa [phaseNoninitialRows, mul_neg] using h
    · apply mul_left_cancel₀ hv0
      simpa [phaseNoninitialRows, mul_neg] using h
  · rintro ⟨i, hi, j, k, hjk, h⟩
    refine ⟨i, hi, j, k, hjk, ?_⟩
    simp only [phaseNoninitialRows]
    rw [h]
    ring

def phaseTriple (u : ℂ) (t : ℂ × ℂ × ℂ) : ℂ × ℂ × ℂ :=
  (u * t.1, u * t.2.1, u * t.2.2)

theorem rowTriple_phaseNoninitialRows_one (u v : ℂ) (X : Mat3) :
    rowTriple (phaseNoninitialRows u v X) 1 =
      phaseTriple u (rowTriple X 1) := by
  simp [rowTriple, phaseTriple, phaseNoninitialRows]

theorem phaseTriple_injective {u : ℂ} (hu : u ≠ 0) :
    Function.Injective (phaseTriple u) := by
  rintro ⟨x₁, x₂, x₃⟩ ⟨y₁, y₂, y₃⟩ h
  simp only [phaseTriple, Prod.mk.injEq] at h ⊢
  exact ⟨mul_left_cancel₀ hu h.1,
    mul_left_cancel₀ hu h.2.1, mul_left_cancel₀ hu h.2.2⟩

theorem infinite_second_rows_phaseNoninitialRows
    {u v : ℂ} {G : Mat3}
    (hu : Complex.normSq u = 1) (hv : Complex.normSq v = 1)
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite) :
    ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre (phaseRowGram u v G)).Infinite := by
  have hu0 : u ≠ 0 := by
    intro h
    rw [h] at hu
    norm_num at hu
  have himage := hinf.image (fun _ _ _ _ h ↦ phaseTriple_injective hu0 h)
  apply himage.mono
  rintro t ⟨r, ⟨X, hX, hr⟩, ht⟩
  subst r
  subst t
  exact ⟨phaseNoninitialRows u v X,
    phaseNoninitialRows_mem hu hv hX,
    rowTriple_phaseNoninitialRows_one u v X⟩

/-- The phase which rotates a complex number onto the nonnegative real axis. -/
noncomputable def nonnegativePhase (z : ℂ) : ℂ :=
  if z = 0 then 1 else star z / (‖z‖ : ℂ)

theorem nonnegativePhase_unit (z : ℂ) :
    Complex.normSq (nonnegativePhase z) = 1 := by
  by_cases hz : z = 0
  · simp [nonnegativePhase, hz]
  · have hn : ‖z‖ ≠ 0 := norm_ne_zero_iff.mpr hz
    rw [nonnegativePhase, if_neg hz, Complex.normSq_div,
      Complex.normSq_eq_norm_sq, Complex.normSq_eq_norm_sq]
    rw [norm_star, Complex.norm_real, Real.norm_eq_abs,
      abs_of_nonneg (norm_nonneg z)]
    field_simp [hn]

theorem nonnegativePhase_mul (z : ℂ) :
    nonnegativePhase z * z = (‖z‖ : ℂ) := by
  by_cases hz : z = 0
  · simp [nonnegativePhase, hz]
  · have hn : ‖z‖ ≠ 0 := norm_ne_zero_iff.mpr hz
    rw [nonnegativePhase, if_neg hz]
    calc
      star z / (‖z‖ : ℂ) * z =
          ((Complex.normSq z : ℂ) / (‖z‖ : ℂ)) := by
        rw [div_mul_eq_mul_div, ← starRingEnd_apply,
          ← Complex.normSq_eq_conj_mul_self]
      _ = (‖z‖ : ℂ) := by
        have hnC : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast hn
        rw [Complex.normSq_eq_norm_sq]
        field_simp [hnC]
        norm_cast

theorem norm_sum_three_le_three {x₁ x₂ x₃ : ℂ}
    (h₁ : Complex.normSq x₁ = 1)
    (h₂ : Complex.normSq x₂ = 1)
    (h₃ : Complex.normSq x₃ = 1) :
    ‖x₁ + x₂ + x₃‖ ≤ 3 := by
  have hn₁ : ‖x₁‖ = 1 := by
    have hs : ‖x₁‖ ^ 2 = 1 := by rw [Complex.sq_norm, h₁]
    nlinarith [norm_nonneg x₁]
  have hn₂ : ‖x₂‖ = 1 := by
    have hs : ‖x₂‖ ^ 2 = 1 := by rw [Complex.sq_norm, h₂]
    nlinarith [norm_nonneg x₂]
  have hn₃ : ‖x₃‖ = 1 := by
    have hs : ‖x₃‖ ^ 2 = 1 := by rw [Complex.sq_norm, h₃]
    nlinarith [norm_nonneg x₃]
  calc
    ‖x₁ + x₂ + x₃‖ ≤ ‖x₁ + x₂‖ + ‖x₃‖ := norm_add_le _ _
    _ ≤ (‖x₁‖ + ‖x₂‖) + ‖x₃‖ := by gcongr; exact norm_add_le _ _
    _ = 3 := by rw [hn₁, hn₂, hn₃]; norm_num

/-- The infinite-second-row trichotomy with no phasing hypotheses on the
fixed Gram matrix. -/
theorem infinite_second_row_trichotomy
    {G : Mat3}
    (hinf : ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre G).Infinite)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedRowGramFibre G)
    (hdet₀ : X₀.det ≠ 0) :
    IsHadamard3 X₀ ∨ (rowTau X₀).re < 0 ∨
      HasOppositePairInNoninitialRow X₀ := by
  let u := nonnegativePhase (G 1 0)
  let v := nonnegativePhase (G 2 0)
  let s : ℝ := ‖G 1 0‖
  let t : ℝ := ‖G 2 0‖
  have hu : Complex.normSq u = 1 := nonnegativePhase_unit _
  have hv : Complex.normSq v = 1 := nonnegativePhase_unit _
  have hs0 : 0 ≤ s := norm_nonneg _
  have ht0 : 0 ≤ t := norm_nonneg _
  have hrow₁ := rowTriple_mem_phaseTriplesAtSum hX₀ 1
  have hrow₂ := rowTriple_mem_phaseTriplesAtSum hX₀ 2
  have hs3 : s ≤ 3 := by
    dsimp [s]
    rw [← hrow₁.2.2.2]
    exact norm_sum_three_le_three hrow₁.1 hrow₁.2.1 hrow₁.2.2.1
  have ht3 : t ≤ 3 := by
    dsimp [t]
    rw [← hrow₂.2.2.2]
    exact norm_sum_three_le_three hrow₂.1 hrow₂.2.1 hrow₂.2.2.1
  have hS : phaseRowGram u v G 1 0 = (s : ℂ) := by
    simp [phaseRowGram, u, s, nonnegativePhase_mul]
  have hT : phaseRowGram u v G 2 0 = (t : ℂ) := by
    simp [phaseRowGram, v, t, nonnegativePhase_mul]
  have hinf' := infinite_second_rows_phaseNoninitialRows hu hv hinf
  have hX₀' := phaseNoninitialRows_mem hu hv hX₀
  have hdet₀' := phaseNoninitialRows_det_ne_zero hu hv hdet₀
  rcases canonical_infinite_fibre_trichotomy hs0 hs3 ht0 ht3
      hS hT hinf' hX₀' hdet₀' with hH | hneg | hopp
  · left
    exact (phaseNoninitialRows_isHadamard3_iff hu hv).mp hH
  · right; left
    rw [rowTau_phaseNoninitialRows hu hv] at hneg
    exact hneg
  · right; right
    apply (oppositePair_phaseNoninitialRows_iff hu hv).mp
    exact oppositePairSecondRow_implies_invariant hopp

def swapNoninitialIndex : I3 ≃ I3 := Equiv.swap 1 2

def swapNoninitialRows (X : Mat3) : Mat3 :=
  fun i j ↦ X (swapNoninitialIndex i) j

def swapRowGram (G : Mat3) : Mat3 :=
  fun i j ↦ G (swapNoninitialIndex i) (swapNoninitialIndex j)

@[simp] theorem swapNoninitialIndex_zero : swapNoninitialIndex 0 = 0 := by
  decide

@[simp] theorem swapNoninitialIndex_one : swapNoninitialIndex 1 = 2 := by
  decide

@[simp] theorem swapNoninitialIndex_two : swapNoninitialIndex 2 = 1 := by
  decide

theorem swapNoninitialIndex_involutive (i : I3) :
    swapNoninitialIndex (swapNoninitialIndex i) = i := by
  fin_cases i <;> simp

theorem swapNoninitialRows_involutive (X : Mat3) :
    swapNoninitialRows (swapNoninitialRows X) = X := by
  ext i j
  simp [swapNoninitialRows, swapNoninitialIndex_involutive]

theorem swapNoninitialRows_rowGram (X : Mat3) :
    swapNoninitialRows X * Matrix.conjTranspose (swapNoninitialRows X) =
      swapRowGram (X * Matrix.conjTranspose X) := by
  ext i j
  simp [swapNoninitialRows, swapRowGram, Matrix.mul_apply,
    Matrix.conjTranspose_apply]

theorem swapNoninitialRows_mem {G X : Mat3}
    (hX : X ∈ normalizedRowGramFibre G) :
    swapNoninitialRows X ∈ normalizedRowGramFibre (swapRowGram G) := by
  refine ⟨?_, ?_, ?_⟩
  · intro i j
    exact hX.1 (swapNoninitialIndex i) j
  · intro j
    simpa [swapNoninitialRows] using hX.2.1 j
  · rw [swapNoninitialRows_rowGram, hX.2.2]

theorem swapNoninitialRows_det_ne_zero {X : Mat3} (hdet : X.det ≠ 0) :
    (swapNoninitialRows X).det ≠ 0 := by
  rw [Matrix.det_fin_three]
  simp only [swapNoninitialRows, swapNoninitialIndex_zero,
    swapNoninitialIndex_one, swapNoninitialIndex_two]
  intro h
  apply hdet
  rw [Matrix.det_fin_three]
  linear_combination -h

theorem swapNoninitialRows_isHadamard3_iff {X : Mat3} :
    IsHadamard3 (swapNoninitialRows X) ↔ IsHadamard3 X := by
  constructor
  · intro h
    rw [← swapNoninitialRows_involutive X]
    refine ⟨?_, ?_⟩
    · intro i j
      exact h.1 (swapNoninitialIndex i) j
    · rw [swapNoninitialRows_rowGram, h.2]
      ext i j
      fin_cases i <;> fin_cases j <;> simp [swapRowGram]
  · intro h
    refine ⟨?_, ?_⟩
    · intro i j
      exact h.1 (swapNoninitialIndex i) j
    · rw [swapNoninitialRows_rowGram, h.2]
      ext i j
      fin_cases i <;> fin_cases j <;> simp [swapRowGram]

theorem rowTau_swapNoninitialRows_re (X : Mat3) :
    (rowTau (swapNoninitialRows X)).re = (rowTau X).re := by
  have hherm := Matrix.isHermitian_mul_conjTranspose_self X
  have h02 := hherm.apply (0 : I3) (2 : I3)
  have h21 := hherm.apply (2 : I3) (1 : I3)
  have h10 := hherm.apply (1 : I3) (0 : I3)
  rw [rowTau, swapNoninitialRows_rowGram]
  simp only [swapRowGram, swapNoninitialIndex_zero,
    swapNoninitialIndex_one, swapNoninitialIndex_two]
  rw [← h02, ← h21, ← h10]
  simp only [← star_mul]
  simp [rowTau]
  ring

theorem oppositePair_swapNoninitialRows_iff {X : Mat3} :
    HasOppositePairInNoninitialRow (swapNoninitialRows X) ↔
      HasOppositePairInNoninitialRow X := by
  constructor
  · rintro ⟨i, hi, j, k, hjk, h⟩
    refine ⟨swapNoninitialIndex i, ?_, j, k, hjk, h⟩
    intro hz
    have : i = 0 := by
      rw [← swapNoninitialIndex_involutive i, hz]
      simp
    exact hi this
  · rintro ⟨i, hi, j, k, hjk, h⟩
    refine ⟨swapNoninitialIndex i, ?_, j, k, hjk, ?_⟩
    · intro hz
      have : i = 0 := by
        rw [← swapNoninitialIndex_involutive i, hz]
        simp
      exact hi this
    · simpa [swapNoninitialRows, swapNoninitialIndex_involutive] using h

theorem rowTriple_swapNoninitialRows_one (X : Mat3) :
    rowTriple (swapNoninitialRows X) 1 = rowTriple X 2 := by
  simp [rowTriple, swapNoninitialRows]

theorem infinite_third_rows_swap_to_second {G : Mat3}
    (hinf : ((fun X ↦ rowTriple X 2) ''
      normalizedRowGramFibre G).Infinite) :
    ((fun X ↦ rowTriple X 1) ''
      normalizedRowGramFibre (swapRowGram G)).Infinite := by
  apply hinf.mono
  rintro t ⟨X, hX, rfl⟩
  exact ⟨swapNoninitialRows X, swapNoninitialRows_mem hX,
    rowTriple_swapNoninitialRows_one X⟩

/-- An infinite normalized row-Gram fibre has the trichotomy, regardless of
which noninitial row carries the infinitude. -/
theorem infinite_row_fibre_trichotomy
    {G : Mat3} (hinf : (normalizedRowGramFibre G).Infinite)
    {X₀ : Mat3} (hX₀ : X₀ ∈ normalizedRowGramFibre G)
    (hdet₀ : X₀.det ≠ 0) :
    IsHadamard3 X₀ ∨ (rowTau X₀).re < 0 ∨
      HasOppositePairInNoninitialRow X₀ := by
  rcases infinite_fibre_row_alternative hinf with hsecond | hthird
  · exact infinite_second_row_trichotomy hsecond hX₀ hdet₀
  · have hsecond' := infinite_third_rows_swap_to_second hthird
    have hX₀' := swapNoninitialRows_mem hX₀
    have hdet₀' := swapNoninitialRows_det_ne_zero hdet₀
    rcases infinite_second_row_trichotomy hsecond' hX₀' hdet₀' with
      hH | hneg | hopp
    · left
      exact swapNoninitialRows_isHadamard3_iff.mp hH
    · right; left
      rw [rowTau_swapNoninitialRows_re] at hneg
      exact hneg
    · right; right
      exact oppositePair_swapNoninitialRows_iff.mp hopp

end Hadamard6
