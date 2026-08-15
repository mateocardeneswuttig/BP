import Hadamard6.CandidateFibre
import Hadamard6.PhaseEquivalence

/-!
# Gauge invariance of normalized Gram-fibre finiteness

Multiplying the rows of a normalized `3 x 3` matrix by phases (with the
first phase fixed to one) gives a bijection between the corresponding
normalized row-Gram fibres.  The column statement is its transpose.
-/

namespace Hadamard6

def rowGauge (p : I3 → ℂ) (X : Mat3) : Mat3 :=
  fun i j ↦ p i * X i j

def rowGaugeGram (p : I3 → ℂ) (G : Mat3) : Mat3 :=
  fun i j ↦ p i * G i j * star (p j)

theorem rowGauge_entrywiseUnit {p : I3 → ℂ} {X : Mat3}
    (hp : ∀ i, Complex.normSq (p i) = 1)
    (hX : EntrywiseUnit X) : EntrywiseUnit (rowGauge p X) := by
  intro i j
  simp [rowGauge, Complex.normSq_mul, hp i, hX i j]

theorem rowGauge_firstRow {p : I3 → ℂ} {X : Mat3}
    (hp0 : p 0 = 1) (hX0 : ∀ j, X 0 j = 1) :
    ∀ j, rowGauge p X 0 j = 1 := by
  intro j
  simp [rowGauge, hp0, hX0 j]

theorem rowGauge_rowGram {p : I3 → ℂ} {X G : Mat3}
    (hgram : X * Matrix.conjTranspose X = G) :
    rowGauge p X * Matrix.conjTranspose (rowGauge p X) =
      rowGaugeGram p G := by
  ext i j
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply, rowGauge,
    rowGaugeGram, star_mul]
  rw [← hgram]
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply]
  rw [Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro k hk
  ring

theorem rowGauge_mem {p : I3 → ℂ} {X G : Mat3}
    (hp : ∀ i, Complex.normSq (p i) = 1) (hp0 : p 0 = 1)
    (hX : X ∈ normalizedRowGramFibre G) :
    rowGauge p X ∈ normalizedRowGramFibre (rowGaugeGram p G) := by
  exact ⟨rowGauge_entrywiseUnit hp hX.1,
    rowGauge_firstRow hp0 hX.2.1,
    rowGauge_rowGram hX.2.2⟩

theorem rowGauge_star_cancel {p : I3 → ℂ} {X : Mat3}
    (hp : ∀ i, Complex.normSq (p i) = 1) :
    rowGauge p (rowGauge (fun i ↦ star (p i)) X) = X := by
  ext i j
  simp only [rowGauge]
  have hpi : p i * star (p i) = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one (hp i)
  calc
    p i * (star (p i) * X i j) =
        (p i * star (p i)) * X i j := by ring
    _ = X i j := by rw [hpi]; simp

theorem rowGaugeGram_star_cancel {p : I3 → ℂ} {G : Mat3}
    (hp : ∀ i, Complex.normSq (p i) = 1) :
    rowGaugeGram (fun i ↦ star (p i)) (rowGaugeGram p G) = G := by
  ext i j
  simp only [rowGaugeGram, star_star]
  have hi : star (p i) * p i = 1 :=
    star_mul_self_of_normSq_one (hp i)
  have hj : p j * star (p j) = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one (hp j)
  rw [show star (p i) * (p i * G i j * star (p j)) * p j =
      (star (p i) * p i) * G i j * (star (p j) * p j) by ring,
    hi]
  have hj' : star (p j) * p j = 1 :=
    star_mul_self_of_normSq_one (hp j)
  rw [hj']
  simp

theorem finite_rowGauge_fibre {p : I3 → ℂ} {G : Mat3}
    (hp : ∀ i, Complex.normSq (p i) = 1) (hp0 : p 0 = 1)
    (hfin : (normalizedRowGramFibre G).Finite) :
    (normalizedRowGramFibre (rowGaugeGram p G)).Finite := by
  apply (hfin.image (rowGauge p)).subset
  intro Y hY
  let q : I3 → ℂ := fun i ↦ star (p i)
  have hq : ∀ i, Complex.normSq (q i) = 1 := by
    intro i
    simp [q, Complex.star_def, Complex.normSq_conj, hp i]
  have hq0 : q 0 = 1 := by simp [q, hp0]
  let X := rowGauge q Y
  have hX : X ∈ normalizedRowGramFibre G := by
    have hm := rowGauge_mem hq hq0 hY
    rw [rowGaugeGram_star_cancel hp] at hm
    exact hm
  refine ⟨X, hX, ?_⟩
  simpa [X, q] using rowGauge_star_cancel (p := p) (X := Y) hp

def columnGauge (p : I3 → ℂ) (X : Mat3) : Mat3 :=
  (rowGauge p X.transpose).transpose

def columnGaugeGram (p : I3 → ℂ) (G : Mat3) : Mat3 :=
  (rowGaugeGram p G.transpose).transpose

theorem columnGauge_mem {p : I3 → ℂ} {X G : Mat3}
    (hp : ∀ j, Complex.normSq (p j) = 1) (hp0 : p 0 = 1)
    (hX : X ∈ normalizedColumnGramFibre G) :
    columnGauge p X ∈ normalizedColumnGramFibre (columnGaugeGram p G) := by
  refine ⟨?_, ?_, ?_⟩
  · intro i j
    simp [columnGauge, rowGauge, Complex.normSq_mul, hp j, hX.1 i j]
  · intro i
    simpa [columnGauge] using rowGauge_firstRow hp0 hX.2.1 i
  · ext i j
    have hg := congrArg (fun M : Mat3 ↦ M i j) hX.2.2
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply] at hg
    change
      (∑ k, star (p i * X k i) * (p j * X k j)) =
        p j * G i j * star (p i)
    calc
      (∑ k, star (p i * X k i) * (p j * X k j)) =
          star (p i) * (∑ k, star (X k i) * X k j) * p j := by
        simp only [star_mul]
        rw [Finset.mul_sum, Finset.sum_mul]
        apply Finset.sum_congr rfl
        intro k hk
        ring
      _ = p j * G i j * star (p i) := by rw [hg]; ring

theorem columnGauge_star_cancel {p : I3 → ℂ} {X : Mat3}
    (hp : ∀ j, Complex.normSq (p j) = 1) :
    columnGauge p (columnGauge (fun j ↦ star (p j)) X) = X := by
  ext i j
  simp only [columnGauge, rowGauge, Matrix.transpose_apply]
  have hpj : p j * star (p j) = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one (hp j)
  calc
    p j * (star (p j) * X i j) =
        (p j * star (p j)) * X i j := by ring
    _ = X i j := by rw [hpj]; simp

theorem columnGaugeGram_star_cancel {p : I3 → ℂ} {G : Mat3}
    (hp : ∀ j, Complex.normSq (p j) = 1) :
    columnGaugeGram (fun j ↦ star (p j)) (columnGaugeGram p G) = G := by
  ext i j
  simp only [columnGaugeGram, rowGaugeGram, Matrix.transpose_apply, star_star]
  have hi : star (p i) * p i = 1 :=
    star_mul_self_of_normSq_one (hp i)
  have hj : star (p j) * p j = 1 :=
    star_mul_self_of_normSq_one (hp j)
  calc
    star (p j) * (p j * G i j * star (p i)) * p i =
        (star (p j) * p j) * G i j * (star (p i) * p i) := by ring
    _ = G i j := by rw [hi, hj]; simp

theorem finite_columnGauge_fibre {p : I3 → ℂ} {G : Mat3}
    (hp : ∀ j, Complex.normSq (p j) = 1) (hp0 : p 0 = 1)
    (hfin : (normalizedColumnGramFibre G).Finite) :
    (normalizedColumnGramFibre (columnGaugeGram p G)).Finite := by
  apply (hfin.image (columnGauge p)).subset
  intro Y hY
  let q : I3 → ℂ := fun j ↦ star (p j)
  have hq : ∀ j, Complex.normSq (q j) = 1 := by
    intro j
    simp [q, Complex.normSq_conj, hp j]
  have hq0 : q 0 = 1 := by simp [q, hp0]
  let X := columnGauge q Y
  have hX : X ∈ normalizedColumnGramFibre G := by
    have hm := columnGauge_mem hq hq0 hY
    rw [columnGaugeGram_star_cancel hp] at hm
    exact hm
  refine ⟨X, hX, ?_⟩
  simpa [X, q] using columnGauge_star_cancel (p := p) (X := Y) hp

def biGauge (r c : I3 → ℂ) (X : Mat3) : Mat3 :=
  fun i j ↦ r i * X i j * c j

def relativePhase (p : I3 → ℂ) : I3 → ℂ :=
  fun i ↦ p i * star (p 0)

theorem biGauge_det {r c : I3 → ℂ} {X : Mat3} :
    (biGauge r c X).det =
      (r 0 * r 1 * r 2) * X.det * (c 0 * c 1 * c 2) := by
  rw [Matrix.det_fin_three, Matrix.det_fin_three]
  simp only [biGauge]
  ring

theorem biGauge_det_ne_zero {r c : I3 → ℂ} {X : Mat3}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1)
    (hdet : X.det ≠ 0) : (biGauge r c X).det ≠ 0 := by
  rw [biGauge_det]
  have hrnz : ∀ i, r i ≠ 0 := by
    intro i hzero
    have hu := hr i
    simp [hzero] at hu
  have hcnz : ∀ j, c j ≠ 0 := by
    intro j hzero
    have hu := hc j
    simp [hzero] at hu
  have hrprod : r 0 * r 1 * r 2 ≠ 0 :=
    mul_ne_zero (mul_ne_zero (hrnz 0) (hrnz 1)) (hrnz 2)
  have hcprod : c 0 * c 1 * c 2 ≠ 0 :=
    mul_ne_zero (mul_ne_zero (hcnz 0) (hcnz 1)) (hcnz 2)
  exact mul_ne_zero (mul_ne_zero hrprod hdet) hcprod

theorem relativePhase_unit {p : I3 → ℂ}
    (hp : ∀ i, Complex.normSq (p i) = 1) :
    ∀ i, Complex.normSq (relativePhase p i) = 1 := by
  intro i
  simp [relativePhase, Complex.normSq_mul, Complex.normSq_conj,
    hp i, hp 0]

theorem relativePhase_zero {p : I3 → ℂ}
    (hp : ∀ i, Complex.normSq (p i) = 1) :
    relativePhase p 0 = 1 := by
  simpa [relativePhase, mul_comm] using
    star_mul_self_of_normSq_one (hp 0)

theorem rowGaugeGram_relativePhase {p : I3 → ℂ} {G : Mat3}
    (hp : ∀ i, Complex.normSq (p i) = 1) :
    rowGaugeGram (relativePhase p) G = rowGaugeGram p G := by
  ext i j
  have hp0 : star (p 0) * p 0 = 1 :=
    star_mul_self_of_normSq_one (hp 0)
  simp only [rowGaugeGram, relativePhase, star_mul, star_star]
  rw [show (p i * star (p 0)) * G i j * (p 0 * star (p j)) =
      p i * G i j * star (p j) * (star (p 0) * p 0) by ring,
    hp0]
  ring

theorem columnGaugeGram_relativePhase {p : I3 → ℂ} {G : Mat3}
    (hp : ∀ j, Complex.normSq (p j) = 1) :
    columnGaugeGram (relativePhase p) G = columnGaugeGram p G := by
  ext i j
  have hp0 : star (p 0) * p 0 = 1 :=
    star_mul_self_of_normSq_one (hp 0)
  simp only [columnGaugeGram, rowGaugeGram, relativePhase,
    Matrix.transpose_apply, star_mul, star_star]
  rw [show (p j * star (p 0)) * G i j * (p 0 * star (p i)) =
      p j * G i j * star (p i) * (star (p 0) * p 0) by ring,
    hp0]
  ring

theorem biGauge_rowGram {r c : I3 → ℂ} {X : Mat3}
    (hc : ∀ j, Complex.normSq (c j) = 1) :
    biGauge r c X * Matrix.conjTranspose (biGauge r c X) =
      rowGaugeGram r (X * Matrix.conjTranspose X) := by
  ext i j
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply, biGauge,
    rowGaugeGram, star_mul]
  rw [Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro k hk
  have hck : c k * star (c k) = 1 := by
    simpa [mul_comm] using star_mul_self_of_normSq_one (hc k)
  rw [show (r i * X i k * c k) *
      (star (c k) * (star (X j k) * star (r j))) =
      r i * (X i k * star (X j k)) * star (r j) *
        (c k * star (c k)) by ring,
    hck]
  ring

theorem biGauge_columnGram {r c : I3 → ℂ} {X : Mat3}
    (hr : ∀ i, Complex.normSq (r i) = 1) :
    Matrix.conjTranspose (biGauge r c X) * biGauge r c X =
      columnGaugeGram c (Matrix.conjTranspose X * X) := by
  ext i j
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply, biGauge,
    columnGaugeGram, rowGaugeGram, Matrix.transpose_apply, star_mul]
  rw [Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro k hk
  have hrk : star (r k) * r k = 1 :=
    star_mul_self_of_normSq_one (hr k)
  rw [show (star (c i) * (star (X k i) * star (r k))) *
      (r k * X k j * c j) =
      c j * (star (X k i) * X k j) * star (c i) *
        (star (r k) * r k) by ring,
    hrk]
  ring

theorem finite_biGauge_rowGram_fibre {r c : I3 → ℂ} {X : Mat3}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1)
    (hfin : (normalizedRowGramFibre
      (X * Matrix.conjTranspose X)).Finite) :
    (normalizedRowGramFibre
      (biGauge r c X * Matrix.conjTranspose (biGauge r c X))).Finite := by
  rw [biGauge_rowGram hc, ← rowGaugeGram_relativePhase hr]
  exact finite_rowGauge_fibre (relativePhase_unit hr)
    (relativePhase_zero hr) hfin

theorem finite_biGauge_columnGram_fibre {r c : I3 → ℂ} {X : Mat3}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1)
    (hfin : (normalizedColumnGramFibre
      (Matrix.conjTranspose X * X)).Finite) :
    (normalizedColumnGramFibre
      (Matrix.conjTranspose (biGauge r c X) * biGauge r c X)).Finite := by
  rw [biGauge_columnGram hr, ← columnGaugeGram_relativePhase hc]
  exact finite_columnGauge_fibre (relativePhase_unit hc)
    (relativePhase_zero hc) hfin

end Hadamard6
