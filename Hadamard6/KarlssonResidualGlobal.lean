import Hadamard6.KarlssonResidualCertificate

/-!
# Global positivity of the compact Karlsson residual

The ten dyadic boxes certified in `KarlssonResidualCertificate` cover the
entire unit square.  This file performs that elementary cover argument.
-/

namespace Hadamard6

theorem karlssonCompactResidual_pos_on_unitSquare
    (x y : Set.Icc (0 : ℝ) 1) :
    0 < karlssonCompactResidual x y := by
  by_cases hxHalf : (x : ℝ) ≤ 1 / 2
  · by_cases hyHalf : (y : ℝ) ≤ 1 / 2
    · by_cases hxQuarter : (x : ℝ) ≤ 1 / 4
      · by_cases hyQuarter : (y : ℝ) ≤ 1 / 4
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ), by constructor <;> nlinarith [x.2.1]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ), by constructor <;> nlinarith [y.2.1]⟩
          have h := karlssonLeaf0000_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ), by constructor <;> nlinarith [x.2.1]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ) - 1, by constructor <;> nlinarith [y.2.2]⟩
          have h := karlssonLeaf0001_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring
      · by_cases hyQuarter : (y : ℝ) ≤ 1 / 4
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ) - 1, by constructor <;> nlinarith [x.2.2]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ), by constructor <;> nlinarith [y.2.1]⟩
          have h := karlssonLeaf0010_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ) - 1, by constructor <;> nlinarith [x.2.2]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ) - 1, by constructor <;> nlinarith [y.2.2]⟩
          have h := karlssonLeaf0011_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring
    · let s : Set.Icc (0 : ℝ) 1 :=
        ⟨2 * (x : ℝ), by constructor <;> nlinarith [x.2.1]⟩
      let t : Set.Icc (0 : ℝ) 1 :=
        ⟨2 * (y : ℝ) - 1, by constructor <;> nlinarith [y.2.2]⟩
      have h := karlssonLeaf01_residual_pos s t
      convert h using 1
      all_goals dsimp [s, t]
      all_goals ring
  · by_cases hyHalf : (y : ℝ) ≤ 1 / 2
    · let s : Set.Icc (0 : ℝ) 1 :=
        ⟨2 * (x : ℝ) - 1, by constructor <;> nlinarith [x.2.2]⟩
      let t : Set.Icc (0 : ℝ) 1 :=
        ⟨2 * (y : ℝ), by constructor <;> nlinarith [y.2.1]⟩
      have h := karlssonLeaf10_residual_pos s t
      convert h using 1
      all_goals dsimp [s, t]
      all_goals ring
    · by_cases hxThreeQuarter : (x : ℝ) ≤ 3 / 4
      · by_cases hyThreeQuarter : (y : ℝ) ≤ 3 / 4
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ) - 2, by constructor <;> nlinarith [x.2.2]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ) - 2, by constructor <;> nlinarith [y.2.2]⟩
          have h := karlssonLeaf1100_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ) - 2, by constructor <;> nlinarith [x.2.2]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ) - 3, by constructor <;> nlinarith [y.2.2]⟩
          have h := karlssonLeaf1101_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring
      · by_cases hyThreeQuarter : (y : ℝ) ≤ 3 / 4
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ) - 3, by constructor <;> nlinarith [x.2.2]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ) - 2, by constructor <;> nlinarith [y.2.2]⟩
          have h := karlssonLeaf1110_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring
        · let s : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (x : ℝ) - 3, by constructor <;> nlinarith [x.2.2]⟩
          let t : Set.Icc (0 : ℝ) 1 :=
            ⟨4 * (y : ℝ) - 3, by constructor <;> nlinarith [y.2.2]⟩
          have h := karlssonLeaf1111_residual_pos s t
          convert h using 1
          all_goals dsimp [s, t]
          all_goals ring

/-- The original real residual is strictly positive on the full nonnegative
quadrant. -/
theorem karlssonPositiveRealResidual_pos {t rho : ℝ}
    (ht : 0 ≤ t) (hrho : 0 ≤ rho) :
    0 < karlssonPositiveRealResidual t rho := by
  have htden : 0 < 1 + t := by linarith
  have hrden : 0 < 1 + rho := by linarith
  let x : Set.Icc (0 : ℝ) 1 :=
    ⟨t / (1 + t), by
      constructor
      · exact div_nonneg ht htden.le
      · exact (div_le_one htden).2 (by linarith)⟩
  let y : Set.Icc (0 : ℝ) 1 :=
    ⟨rho / (1 + rho), by
      constructor
      · exact div_nonneg hrho hrden.le
      · exact (div_le_one hrden).2 (by linarith)⟩
  have hcompact := karlssonCompactResidual_pos_on_unitSquare x y
  rw [← karlssonResidual_compactification_identity t rho ht hrho]
  dsimp [x, y] at hcompact
  exact mul_pos (mul_pos (pow_pos htden 16) (pow_pos hrden 8)) hcompact

/-- The shared reciprocal-resultant residual is nonzero on the finite Cayley
chart of the canonical quadrant. -/
theorem karlssonSharedResidual_cayley_ne_zero {t rho : ℝ}
    (ht : 0 ≤ t) (hrho : 0 ≤ rho) :
    karlssonSharedResidual (t : ℂ)
      (((1 : ℂ) + Complex.I * (rho : ℂ)) /
        ((1 : ℂ) - Complex.I * (rho : ℂ))) ≠ 0 := by
  intro hzero
  have hid := karlssonResidual_cayley_identity t rho
  rw [hzero, mul_zero] at hid
  have hpositive := karlssonPositiveRealResidual_pos ht hrho
  have hcomplex : (karlssonPositiveRealResidual t rho : ℂ) ≠ 0 := by
    exact_mod_cast ne_of_gt hpositive
  exact hcomplex (neg_eq_zero.mp hid.symm)

#print axioms karlssonSharedResidual_cayley_ne_zero

end Hadamard6
