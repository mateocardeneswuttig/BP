import Hadamard6.FiniteDilation
import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Cubic Gram invariants and complementary-block sign changes
-/

namespace Hadamard6

def rowTau (X : Mat3) : ℂ :=
  (X * Matrix.conjTranspose X) 0 1 *
  (X * Matrix.conjTranspose X) 1 2 *
  (X * Matrix.conjTranspose X) 2 0

def columnTau (X : Mat3) : ℂ :=
  (Matrix.conjTranspose X * X) 0 1 *
  (Matrix.conjTranspose X * X) 1 2 *
  (Matrix.conjTranspose X * X) 2 0

def gramTau (G : Mat3) : ℂ := G 0 1 * G 1 2 * G 2 0

def offDiagonalNormSum (G : Mat3) : ℂ :=
  star (G 0 1) * G 0 1 +
  star (G 1 2) * G 1 2 +
  star (G 2 0) * G 2 0

theorem rowGram_det_re_pos {X : Mat3} (hdet : X.det ≠ 0) :
    0 < (Matrix.det (X * Matrix.conjTranspose X)).re := by
  rw [Matrix.det_mul, Matrix.det_conjTranspose]
  have heq : (X.det * star X.det).re = Complex.normSq X.det := by
    simp [Complex.normSq_apply, Complex.star_def]
  rw [heq]
  exact Complex.normSq_pos.mpr hdet

theorem columnGram_det_re_pos {X : Mat3} (hdet : X.det ≠ 0) :
    0 < (Matrix.det (Matrix.conjTranspose X * X)).re := by
  rw [Matrix.det_mul, Matrix.det_conjTranspose]
  have heq : (star X.det * X.det).re = Complex.normSq X.det := by
    simp [Complex.normSq_apply, Complex.star_def]
  rw [heq]
  exact Complex.normSq_pos.mpr hdet

theorem rowGram_diagonal_three {X : Mat3} (hX : EntrywiseUnit X)
    (i : I3) : (X * Matrix.conjTranspose X) i i = 3 := by
  unfold EntrywiseUnit at hX
  fin_cases i <;>
    simp [Matrix.mul_apply, Matrix.conjTranspose_apply, Complex.mul_conj,
      hX]

theorem columnGram_diagonal_three {X : Mat3} (hX : EntrywiseUnit X)
    (i : I3) : (Matrix.conjTranspose X * X) i i = 3 := by
  unfold EntrywiseUnit at hX
  fin_cases i <;>
    simp [Matrix.mul_apply, Matrix.conjTranspose_apply,
      ← Complex.normSq_eq_conj_mul_self, hX]

theorem det_eq_of_hermitian_diagonal_three
    {G : Mat3} (hG : G.IsHermitian) (hdiag : ∀ i, G i i = 3) :
    Matrix.det G = 27 - 3 * offDiagonalNormSum G +
      gramTau G + star (gramTau G) := by
  have h10 := hG.apply (1 : I3) (0 : I3)
  have h21 := hG.apply (2 : I3) (1 : I3)
  have h02 := hG.apply (0 : I3) (2 : I3)
  rw [Matrix.det_fin_three, hdiag 0, hdiag 1, hdiag 2]
  rw [← h10, ← h21, ← h02]
  simp only [offDiagonalNormSum, gramTau, star_mul]
  ring

theorem trace_sq_eq_of_hermitian_diagonal_three
    {G : Mat3} (hG : G.IsHermitian) (hdiag : ∀ i, G i i = 3) :
    Matrix.trace (G * G) = 27 + 2 * offDiagonalNormSum G := by
  have h10 := hG.apply (1 : I3) (0 : I3)
  have h21 := hG.apply (2 : I3) (1 : I3)
  have h02 := hG.apply (0 : I3) (2 : I3)
  rw [Matrix.trace_fin_three]
  simp only [Matrix.mul_apply, Fin.sum_univ_three]
  rw [hdiag 0, hdiag 1, hdiag 2]
  rw [← h10, ← h21, ← h02]
  simp only [offDiagonalNormSum]
  ring

/-- Lemma 2.1 of the paper: for an entrywise-unimodular `3 x 3` matrix,
the row and column cubic Gram invariants have the same real part. -/
theorem rowTau_re_eq_columnTau_re {X : Mat3}
    (hX : EntrywiseUnit X) : (rowTau X).re = (columnTau X).re := by
  let G : Mat3 := X * Matrix.conjTranspose X
  let K : Mat3 := Matrix.conjTranspose X * X
  have hGherm : G.IsHermitian :=
    Matrix.isHermitian_mul_conjTranspose_self X
  have hKherm : K.IsHermitian :=
    Matrix.isHermitian_conjTranspose_mul_self X
  have hGdiag : ∀ i, G i i = 3 := by
    intro i
    exact rowGram_diagonal_three hX i
  have hKdiag : ∀ i, K i i = 3 := by
    intro i
    exact columnGram_diagonal_three hX i
  have htrace : Matrix.trace (G * G) = Matrix.trace (K * K) := by
    simpa [G, K, Matrix.mul_assoc] using
      (Matrix.trace_mul_comm X
        (Matrix.conjTranspose X * X * Matrix.conjTranspose X))
  have hdet : Matrix.det G = Matrix.det K := by
    simpa [G, K] using
      (Matrix.det_mul_comm X (Matrix.conjTranspose X))
  rw [trace_sq_eq_of_hermitian_diagonal_three hGherm hGdiag,
    trace_sq_eq_of_hermitian_diagonal_three hKherm hKdiag] at htrace
  have hnorm : offDiagonalNormSum G = offDiagonalNormSum K := by
    linear_combination (1 / 2 : ℂ) * htrace
  rw [det_eq_of_hermitian_diagonal_three hGherm hGdiag,
    det_eq_of_hermitian_diagonal_three hKherm hKdiag, hnorm] at hdet
  have htau : gramTau G + star (gramTau G) =
      gramTau K + star (gramTau K) := by
    linear_combination hdet
  have hre := congrArg Complex.re htau
  have hreal : (gramTau G).re = (gramTau K).re := by
    simp [Complex.star_def] at hre
    linarith
  simpa [rowTau, columnTau, gramTau, G, K] using hreal

theorem offDiagonal_neg_of_sum_sixI3
    {G K : Mat3} (h : G + K = sixI3)
    {i j : I3} (hij : i ≠ j) : K i j = -G i j := by
  have hijEntry := congrArg (fun M : Mat3 ↦ M i j) h
  simp [sixI3, hij] at hijEntry
  exact eq_neg_of_add_eq_zero_right hijEntry

theorem rowTau_complement {E B : Mat3}
    (h : E * Matrix.conjTranspose E +
      B * Matrix.conjTranspose B = sixI3) :
    rowTau E = -rowTau B := by
  have h01 := offDiagonal_neg_of_sum_sixI3 h
    (by decide : (0 : I3) ≠ 1)
  have h12 := offDiagonal_neg_of_sum_sixI3 h
    (by decide : (1 : I3) ≠ 2)
  have h20 := offDiagonal_neg_of_sum_sixI3 h
    (by decide : (2 : I3) ≠ 0)
  simp only [rowTau]
  rw [h01, h12, h20]
  ring

theorem columnTau_complement {B D : Mat3}
    (h : Matrix.conjTranspose B * B +
      Matrix.conjTranspose D * D = sixI3) :
    columnTau B = -columnTau D := by
  have h01 := offDiagonal_neg_of_sum_sixI3 h
    (by decide : (0 : I3) ≠ 1)
  have h12 := offDiagonal_neg_of_sum_sixI3 h
    (by decide : (1 : I3) ≠ 2)
  have h20 := offDiagonal_neg_of_sum_sixI3 h
    (by decide : (2 : I3) ≠ 0)
  simp only [columnTau]
  rw [h01, h12, h20]
  ring

theorem rowTau_re_complement {E B : Mat3}
    (h : E * Matrix.conjTranspose E +
      B * Matrix.conjTranspose B = sixI3) :
    (rowTau E).re = -(rowTau B).re := by
  simpa using congrArg Complex.re (rowTau_complement h)

theorem columnTau_re_complement {B D : Mat3}
    (h : Matrix.conjTranspose B * B +
      Matrix.conjTranspose D * D = sixI3) :
    (columnTau B).re = -(columnTau D).re := by
  simpa using congrArg Complex.re (columnTau_complement h)

end Hadamard6
