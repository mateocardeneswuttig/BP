import Hadamard6.FiniteDilation
import Hadamard6.ExceptionalFibre
import Hadamard6.QuotientAllocation
import Mathlib.Tactic.Abel
import Mathlib.Tactic.FinCases

/-!
# Fixed-Gram candidate fibres

This is the matrix-level version of the candidate fibre used in the paper.
It also records two facts needed by the block-swap argument: horizontal
candidates are exactly one such fibre, and invertibility is constant on a
fixed row-Gram fibre once one invertible member exists.
-/

namespace Hadamard6

def normalizedRowGramFibre (G : Mat3) : Set Mat3 :=
  {X | EntrywiseUnit X ∧
       (∀ j, X 0 j = 1) ∧
       X * Matrix.conjTranspose X = G}

def normalizedColumnGramFibre (G : Mat3) : Set Mat3 :=
  {X | EntrywiseUnit X ∧
       (∀ i, X i 0 = 1) ∧
       Matrix.conjTranspose X * X = G}

def rowTriple (X : Mat3) (i : I3) : ℂ × ℂ × ℂ :=
  (X i 0, X i 1, X i 2)

/-- An infinite set of ordered triples has an infinite image in at least one
coordinate. -/
theorem infinite_triples_coordinate_alternative
    {Rows : Set (ℂ × ℂ × ℂ)} (hRows : Rows.Infinite) :
    (Prod.fst '' Rows).Infinite ∨
    ((fun t ↦ t.2.1) '' Rows).Infinite ∨
    ((fun t ↦ t.2.2) '' Rows).Infinite := by
  by_contra h
  push Not at h
  rcases h with ⟨h₁, h₂, h₃⟩
  have hall := h₁.prod (h₂.prod h₃)
  apply hRows
  apply hall.subset
  intro t ht
  exact ⟨⟨t, ht, rfl⟩, ⟨t, ht, rfl⟩, ⟨t, ht, rfl⟩⟩

theorem matrix_eq_of_normalized_rowTriples_eq {X Y : Mat3}
    (hX : ∀ j, X 0 j = 1) (hY : ∀ j, Y 0 j = 1)
    (h1 : rowTriple X 1 = rowTriple Y 1)
    (h2 : rowTriple X 2 = rowTriple Y 2) : X = Y := by
  ext i j
  fin_cases i <;> fin_cases j
  all_goals simp_all [rowTriple]

/-- An infinite normalized matrix fibre has infinitely many distinct second
rows or infinitely many distinct third rows. -/
theorem infinite_fibre_row_alternative {G : Mat3}
    (hinf : (normalizedRowGramFibre G).Infinite) :
    ((fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G).Infinite ∨
    ((fun X ↦ rowTriple X 2) '' normalizedRowGramFibre G).Infinite := by
  by_contra h
  push Not at h
  rcases h with ⟨h1, h2⟩
  have hproduct :
      (⋃ r1 ∈ ((fun X ↦ rowTriple X 1) '' normalizedRowGramFibre G),
        (fun r2 ↦ (r1, r2)) ''
          ((fun X ↦ rowTriple X 2) '' normalizedRowGramFibre G)).Finite := by
    exact h1.biUnion fun r1 _ ↦
      h2.image (fun r2 ↦ (r1, r2))
  have hpairs :
      ((fun X ↦ (rowTriple X 1, rowTriple X 2)) ''
        normalizedRowGramFibre G).Finite := by
    apply hproduct.subset
    rintro p ⟨X, hX, hp⟩
    rw [← hp]
    simp only [Set.mem_iUnion]
    exact ⟨rowTriple X 1, ⟨X, hX, rfl⟩,
      rowTriple X 2, ⟨X, hX, rfl⟩, rfl⟩
  apply hinf
  apply Set.Finite.of_finite_image hpairs
  rintro X hX Y hY hp
  exact matrix_eq_of_normalized_rowTriples_eq hX.2.1 hY.2.1
    (congrArg Prod.fst hp) (congrArg Prod.snd hp)

theorem rowTriple_mem_phaseTriplesAtSum {G X : Mat3}
    (hX : X ∈ normalizedRowGramFibre G) (i : I3) :
    rowTriple X i ∈ phaseTriplesAtSum (G i 0) := by
  refine ⟨hX.1 i 0, hX.1 i 1, hX.1 i 2, ?_⟩
  have hg := congrArg (fun M : Mat3 ↦ M i 0) hX.2.2
  simpa [rowTriple, Matrix.mul_apply, Matrix.conjTranspose_apply,
    Fin.sum_univ_three, hX.2.1] using hg

theorem eq_normalizedRows_of_mem {G X : Mat3}
    (hX : X ∈ normalizedRowGramFibre G) :
    X = normalizedRows (X 1 0) (X 1 1) (X 1 2)
      (X 2 0) (X 2 1) (X 2 2) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [normalizedRows, hX.2.1]

theorem horizontalCandidates_eq_fibre (E : Mat3) :
    horizontalCandidates E =
      normalizedRowGramFibre (sixI3 - E * Matrix.conjTranspose E) := by
  ext B
  constructor
  · rintro ⟨hunit, hrow, hgram⟩
    refine ⟨hunit, hrow, ?_⟩
    apply eq_sub_of_add_eq
    simpa [add_comm] using hgram
  · rintro ⟨hunit, hrow, hgram⟩
    refine ⟨hunit, hrow, ?_⟩
    rw [hgram]
    abel

theorem verticalCandidates_eq_fibre (E : Mat3) :
    verticalCandidates E =
      normalizedColumnGramFibre
        (sixI3 - Matrix.conjTranspose E * E) := by
  ext C
  constructor
  · rintro ⟨hunit, hcol, hgram⟩
    refine ⟨hunit, hcol, ?_⟩
    apply eq_sub_of_add_eq
    simpa [add_comm] using hgram
  · rintro ⟨hunit, hcol, hgram⟩
    refine ⟨hunit, hcol, ?_⟩
    rw [hgram]
    abel

theorem det_ne_zero_of_same_rowGram {X Y : Mat3}
    (hgram : X * Matrix.conjTranspose X =
      Y * Matrix.conjTranspose Y)
    (hX : X.det ≠ 0) : Y.det ≠ 0 := by
  intro hY
  have hd := congrArg Matrix.det hgram
  rw [Matrix.det_mul, Matrix.det_conjTranspose,
    Matrix.det_mul, Matrix.det_conjTranspose, hY] at hd
  simp only [zero_mul] at hd
  rcases mul_eq_zero.mp hd with hx | hx
  · exact hX hx
  · have : X.det = 0 := by
      simpa using congrArg star hx
    exact hX this

theorem isUnit_det_of_same_rowGram {X Y : Mat3}
    (hgram : X * Matrix.conjTranspose X =
      Y * Matrix.conjTranspose Y)
    (hX : IsUnit X.det) : IsUnit Y.det := by
  rw [isUnit_iff_ne_zero] at hX ⊢
  exact det_ne_zero_of_same_rowGram hgram hX

theorem det_ne_zero_of_same_columnGram {X Y : Mat3}
    (hgram : Matrix.conjTranspose X * X =
      Matrix.conjTranspose Y * Y)
    (hX : X.det ≠ 0) : Y.det ≠ 0 := by
  intro hY
  have hd := congrArg Matrix.det hgram
  rw [Matrix.det_mul, Matrix.det_conjTranspose,
    Matrix.det_mul, Matrix.det_conjTranspose, hY] at hd
  simp only [mul_zero] at hd
  rcases mul_eq_zero.mp hd with hx | hx
  · have : X.det = 0 := by
      simpa using congrArg star hx
    exact hX this
  · exact hX hx

theorem isUnit_det_of_same_columnGram {X Y : Mat3}
    (hgram : Matrix.conjTranspose X * X =
      Matrix.conjTranspose Y * Y)
    (hX : IsUnit X.det) : IsUnit Y.det := by
  rw [isUnit_iff_ne_zero] at hX ⊢
  exact det_ne_zero_of_same_columnGram hgram hX

theorem fibre_invertible_of_one
    {G : Mat3} {X : Mat3}
    (hXmem : X ∈ normalizedRowGramFibre G)
    (hXunit : IsUnit X.det) {Y : Mat3}
    (hYmem : Y ∈ normalizedRowGramFibre G) :
    IsUnit Y.det := by
  exact isUnit_det_of_same_rowGram
    (hXmem.2.2.trans hYmem.2.2.symm) hXunit

theorem horizontal_candidate_invertible_of_one
    {E X : Mat3} (hXmem : X ∈ horizontalCandidates E)
    (hXunit : IsUnit X.det) {Y : Mat3}
    (hYmem : Y ∈ horizontalCandidates E) :
    IsUnit Y.det := by
  rw [horizontalCandidates_eq_fibre] at hXmem hYmem
  exact fibre_invertible_of_one hXmem hXunit hYmem

theorem vertical_candidate_invertible_of_one
    {E X : Mat3} (hXmem : X ∈ verticalCandidates E)
    (hXunit : IsUnit X.det) {Y : Mat3}
    (hYmem : Y ∈ verticalCandidates E) :
    IsUnit Y.det := by
  rw [verticalCandidates_eq_fibre] at hXmem hYmem
  exact isUnit_det_of_same_columnGram
    (hXmem.2.2.trans hYmem.2.2.symm) hXunit

end Hadamard6
