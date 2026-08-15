import Hadamard6.FiniteDilation
import Mathlib.Tactic.Module
import Mathlib.Tactic.NoncommRing

/-!
# Forced-completion block identities

These are the first nontrivial matrix-algebra steps of the completion lemma.
-/

namespace Hadamard6

theorem retained_completion_entrywiseUnit
    {p : CornerData} {B C : Mat3}
    (h : Retained p.matrix B C) :
    EntrywiseUnit (completion p.matrix B C) := by
  intro i j
  rcases i with i | i <;> rcases j with j | j
  · exact cornerData_entrywiseUnit p i j
  · exact h.2.1.1.1 i j
  · exact h.2.2.1.1.1 i j
  · exact h.2.2.2 i j

theorem Retained.horizontalGram {E B C : Mat3}
    (h : Retained E B C) :
    E * Matrix.conjTranspose E + B * Matrix.conjTranspose B = sixI3 :=
  h.2.1.1.2.2

theorem Retained.verticalGram {E B C : Mat3}
    (h : Retained E B C) :
    Matrix.conjTranspose E * E + Matrix.conjTranspose C * C = sixI3 :=
  h.2.2.1.1.2.2

theorem Retained.B_isUnit_det {E B C : Mat3}
    (h : Retained E B C) : IsUnit B.det :=
  h.2.1.2

theorem Retained.C_isUnit_det {E B C : Mat3}
    (h : Retained E B C) : IsUnit C.det :=
  h.2.2.1.2

theorem forcedD_conjTranspose (E B C : Mat3) :
    Matrix.conjTranspose (forcedD E B C) =
      -(B⁻¹ * E * Matrix.conjTranspose C) := by
  simp [forcedD, Matrix.mul_assoc]

/-- The forced block kills the upper-right row cross-term. -/
theorem forcedD_row_cross (E B C : Mat3) (hB : IsUnit B.det) :
    E * Matrix.conjTranspose C +
      B * Matrix.conjTranspose (forcedD E B C) = 0 := by
  rw [forcedD_conjTranspose]
  simp only [Matrix.mul_neg]
  rw [← Matrix.mul_assoc B (B⁻¹ * E) (Matrix.conjTranspose C)]
  rw [← Matrix.mul_assoc B B⁻¹ E, Matrix.mul_nonsing_inv B hB]
  simp

/-- The complete row Gram matrix expanded into its four `3 x 3` blocks. -/
theorem completion_rowGram_blocks (E B C : Mat3) :
    completion E B C * Matrix.conjTranspose (completion E B C) =
      Matrix.fromBlocks
        (E * Matrix.conjTranspose E + B * Matrix.conjTranspose B)
        (E * Matrix.conjTranspose C +
          B * Matrix.conjTranspose (forcedD E B C))
        (C * Matrix.conjTranspose E +
          forcedD E B C * Matrix.conjTranspose B)
        (C * Matrix.conjTranspose C +
          forcedD E B C * Matrix.conjTranspose (forcedD E B C)) := by
  rw [completion, Matrix.fromBlocks_conjTranspose,
    Matrix.fromBlocks_multiply]

theorem retained_completion_top_blocks {E B C : Mat3}
    (h : Retained E B C) :
    completion E B C * Matrix.conjTranspose (completion E B C) =
      Matrix.fromBlocks sixI3 0 0
        (C * Matrix.conjTranspose C +
          forcedD E B C * Matrix.conjTranspose (forcedD E B C)) := by
  rw [completion_rowGram_blocks, h.horizontalGram]
  rw [forcedD_row_cross E B C h.B_isUnit_det]
  have hlower :
      C * Matrix.conjTranspose E +
        forcedD E B C * Matrix.conjTranspose B = 0 := by
    have hstar := congrArg Matrix.conjTranspose
      (forcedD_row_cross E B C h.B_isUnit_det)
    simpa [Matrix.conjTranspose_add, Matrix.mul_assoc] using hstar
  rw [hlower]

set_option maxHeartbeats 800000 in
-- Noncommutative normalization of the block inverse identities is expensive.
/-- The bottom-right Gram block is forced as well.  This is the algebraic
unitary-completion argument that was formerly imported as a published input. -/
theorem Retained.bottomRowGram {E B C : Mat3}
    (h : Retained E B C) :
    C * Matrix.conjTranspose C +
        forcedD E B C * Matrix.conjTranspose (forcedD E B C) = sixI3 := by
  let Q : Mat3 :=
    (Matrix.conjTranspose B)⁻¹ * B⁻¹
  have hBstar : IsUnit (Matrix.conjTranspose B).det := by
    rw [Matrix.det_conjTranspose]
    exact h.B_isUnit_det.map (starRingEnd ℂ)
  have hCstar : IsUnit (Matrix.conjTranspose C).det := by
    rw [Matrix.det_conjTranspose]
    exact h.C_isUnit_det.map (starRingEnd ℂ)
  have hsix : sixI3 = (6 : Mat3) := by
    ext i j
    simp [sixI3, Matrix.one_apply, Matrix.ofNat_apply]
  have hBQ :
      (B * Matrix.conjTranspose B) * Q = 1 := by
    calc
      (B * Matrix.conjTranspose B) * Q =
          B * (Matrix.conjTranspose B *
            (Matrix.conjTranspose B)⁻¹) * B⁻¹ := by
              simp only [Q]
              noncomm_ring
      _ = 1 := by
        rw [Matrix.mul_nonsing_inv _ hBstar, Matrix.mul_one,
          Matrix.mul_nonsing_inv _ h.B_isUnit_det]
  have hBB :
      B * Matrix.conjTranspose B =
        sixI3 - E * Matrix.conjTranspose E := by
    calc
      B * Matrix.conjTranspose B =
          (E * Matrix.conjTranspose E + B * Matrix.conjTranspose B) -
            E * Matrix.conjTranspose E := by module
      _ = sixI3 - E * Matrix.conjTranspose E := by rw [h.horizontalGram]
  have hCC :
      Matrix.conjTranspose C * C =
        sixI3 - Matrix.conjTranspose E * E := by
    calc
      Matrix.conjTranspose C * C =
          (Matrix.conjTranspose E * E + Matrix.conjTranspose C * C) -
            Matrix.conjTranspose E * E := by module
      _ = sixI3 - Matrix.conjTranspose E * E := by rw [h.verticalGram]
  have hSQraw := congrArg (fun X : Mat3 ↦ X * Q) hBB
  have hSQ :
      1 = sixI3 * Q - (E * Matrix.conjTranspose E) * Q := by
    rw [hBQ] at hSQraw
    simpa [Matrix.sub_mul] using hSQraw
  have hAAQ :
      (E * Matrix.conjTranspose E) * Q = sixI3 * Q - 1 := by
    calc
      (E * Matrix.conjTranspose E) * Q =
          sixI3 * Q -
            (sixI3 * Q - (E * Matrix.conjTranspose E) * Q) := by
              module
      _ = sixI3 * Q - 1 := by rw [← hSQ]
  let M : Mat3 :=
    1 + Matrix.conjTranspose E * Q * E
  have hCM : (Matrix.conjTranspose C * C) * M = sixI3 := by
    rw [hCC]
    simp only [M]
    calc
      (sixI3 - Matrix.conjTranspose E * E) *
          (1 + Matrix.conjTranspose E * Q * E) =
        sixI3 - Matrix.conjTranspose E * E +
          sixI3 * (Matrix.conjTranspose E * Q * E) -
          Matrix.conjTranspose E *
            ((E * Matrix.conjTranspose E) * Q) * E := by
              noncomm_ring
      _ = sixI3 - Matrix.conjTranspose E * E +
          sixI3 * (Matrix.conjTranspose E * Q * E) -
          Matrix.conjTranspose E * (sixI3 * Q - 1) * E := by
            rw [hAAQ]
      _ = sixI3 := by
        rw [hsix]
        noncomm_ring
  have hCMC : C * M * Matrix.conjTranspose C = sixI3 := by
    calc
      C * M * Matrix.conjTranspose C =
          (Matrix.conjTranspose C)⁻¹ *
            ((Matrix.conjTranspose C * C) * M) *
              Matrix.conjTranspose C := by
                symm
                calc
                  (Matrix.conjTranspose C)⁻¹ *
                      ((Matrix.conjTranspose C * C) * M) *
                        Matrix.conjTranspose C =
                    ((Matrix.conjTranspose C)⁻¹ *
                      Matrix.conjTranspose C) * C * M *
                        Matrix.conjTranspose C := by noncomm_ring
                  _ = C * M * Matrix.conjTranspose C := by
                    rw [Matrix.nonsing_inv_mul _ hCstar, Matrix.one_mul]
      _ = (Matrix.conjTranspose C)⁻¹ * sixI3 *
          Matrix.conjTranspose C := by rw [hCM]
      _ = sixI3 := by
        rw [hsix]
        calc
          (Matrix.conjTranspose C)⁻¹ * (6 : Mat3) *
              Matrix.conjTranspose C =
            (6 : Mat3) * ((Matrix.conjTranspose C)⁻¹ *
              Matrix.conjTranspose C) := by noncomm_ring
          _ = (6 : Mat3) := by
            rw [Matrix.nonsing_inv_mul _ hCstar, Matrix.mul_one]
  rw [forcedD_conjTranspose]
  unfold forcedD
  simp only [Matrix.neg_mul, Matrix.mul_neg, neg_neg]
  rw [Matrix.conjTranspose_nonsing_inv]
  have hlast :
      C * Matrix.conjTranspose C +
          C * Matrix.conjTranspose E *
            (Matrix.conjTranspose B)⁻¹ *
              (B⁻¹ * E * Matrix.conjTranspose C) =
        C * M * Matrix.conjTranspose C := by
    simp only [M, Q]
    noncomm_ring
  exact hlast.trans hCMC

theorem retained_completion_rowGram
    {p : CornerData} {B C : Mat3}
    (h : Retained p.matrix B C) :
    completion p.matrix B C *
        Matrix.conjTranspose (completion p.matrix B C) =
      (6 : ℂ) • (1 : Mat6) := by
  rw [retained_completion_top_blocks h, h.bottomRowGram]
  ext i j
  rcases i with i | i <;> rcases j with j | j
  · simp [sixI3, Matrix.one_apply]
  · simp
  · simp
  · simp [sixI3, Matrix.one_apply]

end Hadamard6
