import Hadamard6.KarlssonWitnessResultants
import Hadamard6.KarlssonWitnessBounds
import Hadamard6.LeadingFibreCriterion
import Hadamard6.DephasedFiniteCorner

/-!
# Explicit mixed-corner blocks on the regular Karlsson chart

These definitions are the literal `3 x 3` blocks obtained from Karlsson's
division-free `2 x 2` block matrix after moving rows and columns
`{1,3,4}` to the front and dephasing.  They provide the matrix-level target
for the exact endpoint certificates.
-/

namespace Hadamard6

noncomputable section

def karlssonHalfAngleU (t : ℝ) : ℂ :=
  ((1 - t ^ 2) / (1 + t ^ 2) : ℝ)

def karlssonHalfAngleV (t : ℝ) : ℂ :=
  ((2 * t) / (1 + t ^ 2) : ℝ)

def karlssonF2 : Mat2 :=
  !![1, 1;
     1, -1]

def karlssonLambda (t : ℝ) (p : ℂ) : Mat2 :=
  !![karlssonHalfAngleU t, p * karlssonHalfAngleV t;
     karlssonHalfAngleV t / p, -karlssonHalfAngleU t]

def karlssonCoreA (t : ℝ) (p : ℂ) : Mat2 :=
  karlssonF2 *
    ((-(1 / 2 : ℂ)) • (1 : Mat2) +
      (Complex.I * (Real.sqrt 3 : ℂ) / 2) • karlssonLambda t p)

def karlssonCoreB (t : ℝ) (p : ℂ) : Mat2 :=
  -karlssonF2 - karlssonCoreA t p

def karlssonZRight (z : ℂ) : Mat2 :=
  !![1, 1;
     z, -z]

def karlssonZLeft (z : ℂ) : Mat2 :=
  !![1, z;
     1, -z]

def karlssonBlockProduct (zLeft : ℂ) (M : Mat2)
    (zRight : ℂ) : Mat2 :=
  (1 / 2 : ℂ) •
    (karlssonZLeft zLeft * M * karlssonZRight zRight)

/-- A horizontal mixed block before specializing the Karlsson core.  Keeping
this elementary block operation separate makes the subsequent endpoint
calculation an explicit audit trail: first evaluate the three Gram data
`S,T,R`, and only then substitute the Karlsson chart. -/
def mixedHorizontalBlock (M : Mat2) (zLeft zRight : ℂ) : Mat3 :=
  let N := karlssonBlockProduct zLeft M zRight
  !![1, 1, 1;
     zLeft, N 0 0, N 0 1;
     -zLeft, N 1 0, N 1 1]

def mixedLeadingBlock (M : Mat2) (zLeft zRight : ℂ) : Mat3 :=
  let N := karlssonBlockProduct zLeft M zRight
  !![1, 1, 1;
     1, N 0 0, N 0 1;
     1, N 1 0, N 1 1]

def mixedHorizontalS (M : Mat2) (zLeft : ℂ) : ℂ :=
  M 0 0 + zLeft * (1 + M 1 0)

def mixedHorizontalT (M : Mat2) (zLeft : ℂ) : ℂ :=
  M 0 0 - zLeft * (1 + M 1 0)

def mixedHorizontalR (M : Mat2) (zLeft : ℂ) : ℂ :=
  -1 + (1 / 2 : ℂ) *
    (star (M 0 0 + zLeft * M 1 0) * (M 0 0 - zLeft * M 1 0) +
      star (M 0 1 + zLeft * M 1 1) * (M 0 1 - zLeft * M 1 1))

def endpoint0FromData (S T R : ℂ) : ℂ :=
  R ^ 2 * star T - R * star S * T * star T +
    3 * R * star S + star S ^ 2 * T

def endpoint3FromData (S T R : ℂ) : ℂ :=
  R * star R * star S * star T - R * star T ^ 2 -
    star R * star S ^ 2 - 3 * star S * star T

/-- The horizontal side block of the fixed mixed/mixed corner. -/
def karlssonMixedB (t : ℝ) (p z₂ z₃ : ℂ) : Mat3 :=
  mixedHorizontalBlock (karlssonCoreB t p) z₃ z₂

/-- The vertical side block of the fixed mixed/mixed corner. -/
def karlssonMixedC (t : ℝ) (p z₁ z₄ : ℂ) : Mat3 :=
  let M := karlssonBlockProduct z₄ (karlssonCoreB t p) z₁
  !![1, z₁, -z₁;
     1, M 0 0, M 0 1;
     1, M 1 0, M 1 1]

/-- The leading block of the fixed mixed/mixed corner. -/
def karlssonMixedE (t : ℝ) (p z₁ z₃ : ℂ) : Mat3 :=
  mixedLeadingBlock (karlssonCoreA t p) z₃ z₁

/-- Transposing the vertical mixed block converts it to the same elementary
horizontal construction, with the Karlsson core transposed. -/
theorem karlssonMixedC_transpose (t : ℝ) (p z₁ z₄ : ℂ) :
    (karlssonMixedC t p z₁ z₄).transpose =
      mixedHorizontalBlock (karlssonCoreB t p).transpose z₁ z₄ := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [karlssonMixedC, mixedHorizontalBlock, karlssonBlockProduct,
      karlssonZLeft, karlssonZRight, Matrix.mul_apply, Matrix.vecMul,
      dotProduct, Fin.sum_univ_two] <;>
    ring

theorem mixedHorizontalBlock_det (M : Mat2) (zLeft zRight : ℂ) :
    (mixedHorizontalBlock M zLeft zRight).det =
      zLeft * zRight * (M.det + 2 * M 0 1) := by
  rw [Matrix.det_fin_three, Matrix.det_fin_two]
  simp [mixedHorizontalBlock, karlssonBlockProduct, karlssonZLeft,
    karlssonZRight, Matrix.mul_apply, Matrix.vecMul, dotProduct,
    Fin.sum_univ_two]
  ring

theorem mixedLeadingBlock_det (M : Mat2) (zLeft zRight : ℂ) :
    (mixedLeadingBlock M zLeft zRight).det =
      zLeft * zRight * (M.det - 2 * M 1 1) := by
  rw [Matrix.det_fin_three, Matrix.det_fin_two]
  simp [mixedLeadingBlock, karlssonBlockProduct, karlssonZLeft,
    karlssonZRight, Matrix.mul_apply, Matrix.vecMul, dotProduct,
    Fin.sum_univ_two]
  ring

theorem mixedHorizontalBlock_firstRow (M : Mat2) (zLeft zRight : ℂ) :
    ∀ j, mixedHorizontalBlock M zLeft zRight 0 j = 1 := by
  intro j
  fin_cases j <;> rfl

theorem fibreS_mixedHorizontalBlock (M : Mat2) (zLeft zRight : ℂ) :
    fibreS (mixedHorizontalBlock M zLeft zRight 1 0)
        (mixedHorizontalBlock M zLeft zRight 1 1)
        (mixedHorizontalBlock M zLeft zRight 1 2) =
      mixedHorizontalS M zLeft := by
  simp [mixedHorizontalBlock, karlssonBlockProduct, karlssonZLeft,
    karlssonZRight, mixedHorizontalS, fibreS, Matrix.mul_apply, Matrix.vecMul,
    dotProduct, Fin.sum_univ_two]
  ring

theorem fibreT_mixedHorizontalBlock (M : Mat2) (zLeft zRight : ℂ) :
    fibreT (mixedHorizontalBlock M zLeft zRight 2 0)
        (mixedHorizontalBlock M zLeft zRight 2 1)
        (mixedHorizontalBlock M zLeft zRight 2 2) =
      mixedHorizontalT M zLeft := by
  simp [mixedHorizontalBlock, karlssonBlockProduct, karlssonZLeft,
    karlssonZRight, mixedHorizontalT, fibreT, Matrix.mul_apply, Matrix.vecMul,
    dotProduct, Fin.sum_univ_two]
  ring

theorem fibreR_mixedHorizontalBlock (M : Mat2) (zLeft zRight : ℂ)
    (hzLeft : Complex.normSq zLeft = 1)
    (hzRight : Complex.normSq zRight = 1) :
    fibreR (mixedHorizontalBlock M zLeft zRight 1 0)
        (mixedHorizontalBlock M zLeft zRight 1 1)
        (mixedHorizontalBlock M zLeft zRight 1 2)
        (mixedHorizontalBlock M zLeft zRight 2 0)
        (mixedHorizontalBlock M zLeft zRight 2 1)
        (mixedHorizontalBlock M zLeft zRight 2 2) =
      mixedHorizontalR M zLeft := by
  have hzLeft' : star zLeft * zLeft = 1 :=
    star_mul_self_of_normSq_one hzLeft
  have hzRight' : star zRight * zRight = 1 :=
    star_mul_self_of_normSq_one hzRight
  have hzLeftRev : zLeft * star zLeft = 1 := by
    simpa [mul_comm] using hzLeft'
  have hzRightRev : zRight * star zRight = 1 := by
    simpa [mul_comm] using hzRight'
  have hzLeftEnd : (starRingEnd ℂ) zLeft * zLeft = 1 := by
    exact hzLeft'
  have hzRightEnd : (starRingEnd ℂ) zRight * zRight = 1 := by
    exact hzRight'
  simp [mixedHorizontalBlock, karlssonBlockProduct, karlssonZLeft,
    karlssonZRight, mixedHorizontalR, fibreR, Matrix.mul_apply, Matrix.vecMul,
    dotProduct, Fin.sum_univ_two,
    star_add, star_mul]
  ring_nf
  rw [hzLeftEnd]
  linear_combination
    ((-1 / 2 : ℂ) * (starRingEnd ℂ) (M 1 1) * M 1 1 +
      (1 / 2 : ℂ) * (starRingEnd ℂ) zLeft *
        (starRingEnd ℂ) (M 1 1) * M 0 1 -
      (1 / 2 : ℂ) * zLeft * (starRingEnd ℂ) (M 0 1) * M 1 1 +
      (1 / 2 : ℂ) * (starRingEnd ℂ) (M 0 1) * M 0 1) * hzRightEnd

theorem rowEndpoint0_mixedHorizontalBlock (M : Mat2) (zLeft zRight : ℂ)
    (hzLeft : Complex.normSq zLeft = 1)
    (hzRight : Complex.normSq zRight = 1) :
    rowEndpoint0 (mixedHorizontalBlock M zLeft zRight) =
      endpoint0FromData (mixedHorizontalS M zLeft)
        (mixedHorizontalT M zLeft) (mixedHorizontalR M zLeft) := by
  rw [rowEndpoint0_eq_fibreData _
    (mixedHorizontalBlock_firstRow M zLeft zRight)]
  rw [fibreS_mixedHorizontalBlock, fibreT_mixedHorizontalBlock,
    fibreR_mixedHorizontalBlock M zLeft zRight hzLeft hzRight]
  rfl

theorem rowEndpoint3_mixedHorizontalBlock (M : Mat2) (zLeft zRight : ℂ)
    (hzLeft : Complex.normSq zLeft = 1)
    (hzRight : Complex.normSq zRight = 1) :
    rowEndpoint3 (mixedHorizontalBlock M zLeft zRight) =
      endpoint3FromData (mixedHorizontalS M zLeft)
        (mixedHorizontalT M zLeft) (mixedHorizontalR M zLeft) := by
  rw [rowEndpoint3_eq_fibreData _
    (mixedHorizontalBlock_firstRow M zLeft zRight)]
  rw [fibreS_mixedHorizontalBlock, fibreT_mixedHorizontalBlock,
    fibreR_mixedHorizontalBlock M zLeft zRight hzLeft hzRight]
  rfl

theorem karlssonCoreB_apply_zero_zero (t : ℝ) (p : ℂ) :
    karlssonCoreB t p 0 0 =
      -(1 / 2 : ℂ) -
        (Complex.I * (Real.sqrt 3 : ℂ) / 2) *
          (karlssonHalfAngleU t + karlssonHalfAngleV t / p) := by
  simp [karlssonCoreB, karlssonCoreA, karlssonF2, karlssonLambda,
    Matrix.vecMul, dotProduct, Fin.sum_univ_two]
  ring

theorem karlssonCoreB_apply_zero_one (t : ℝ) (p : ℂ) :
    karlssonCoreB t p 0 1 =
      -(1 / 2 : ℂ) -
        (Complex.I * (Real.sqrt 3 : ℂ) / 2) *
          (p * karlssonHalfAngleV t - karlssonHalfAngleU t) := by
  simp [karlssonCoreB, karlssonCoreA, karlssonF2, karlssonLambda,
    Matrix.vecMul, dotProduct, Fin.sum_univ_two]
  ring

theorem karlssonCoreB_apply_one_zero (t : ℝ) (p : ℂ) :
    karlssonCoreB t p 1 0 =
      -(1 / 2 : ℂ) -
        (Complex.I * (Real.sqrt 3 : ℂ) / 2) *
          (karlssonHalfAngleU t - karlssonHalfAngleV t / p) := by
  simp [karlssonCoreB, karlssonCoreA, karlssonF2, karlssonLambda,
    Matrix.vecMul, dotProduct, Fin.sum_univ_two]
  ring

theorem karlssonCoreB_apply_one_one (t : ℝ) (p : ℂ) :
    karlssonCoreB t p 1 1 =
      (1 / 2 : ℂ) -
        (Complex.I * (Real.sqrt 3 : ℂ) / 2) *
          (p * karlssonHalfAngleV t + karlssonHalfAngleU t) := by
  simp [karlssonCoreB, karlssonCoreA, karlssonF2, karlssonLambda,
    Matrix.vecMul, dotProduct, Fin.sum_univ_two]
  ring

set_option maxHeartbeats 4000000 in
-- First elementary determinant factor in the paper's regular chart.
theorem karlssonCoreA_det_factor (t : ℝ) (p : ℂ) (hp0 : p ≠ 0) :
    (karlssonCoreA t p).det - 2 * karlssonCoreA t p 1 1 =
      -((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
        (karlssonHalfAngleU t + p * karlssonHalfAngleV t)) := by
  have htden : (1 + (t : ℂ) ^ 2) ≠ 0 := by
    exact_mod_cast (by positivity : (1 + t ^ 2 : ℝ) ≠ 0)
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  rw [Matrix.det_fin_two]
  simp [karlssonCoreA, karlssonF2, karlssonLambda,
    Matrix.vecMul, dotProduct, Fin.sum_univ_two]
  unfold karlssonHalfAngleU karlssonHalfAngleV
  norm_num
  field_simp [hp0, htden]
  ring_nf at hsqrt ⊢
  norm_num [Complex.I_sq, hsqrt]
  ring

set_option maxHeartbeats 4000000 in
-- Second elementary determinant factor in the paper's regular chart.
theorem karlssonCoreB_det_factor (t : ℝ) (p : ℂ) (hp0 : p ≠ 0) :
    (karlssonCoreB t p).det + 2 * karlssonCoreB t p 0 1 =
      -((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
        (p * karlssonHalfAngleV t - karlssonHalfAngleU t)) := by
  have htden : (1 + (t : ℂ) ^ 2) ≠ 0 := by
    exact_mod_cast (by positivity : (1 + t ^ 2 : ℝ) ≠ 0)
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  rw [Matrix.det_fin_two]
  rw [karlssonCoreB_apply_zero_zero, karlssonCoreB_apply_zero_one,
    karlssonCoreB_apply_one_zero, karlssonCoreB_apply_one_one]
  unfold karlssonHalfAngleU karlssonHalfAngleV
  norm_num
  field_simp [hp0, htden]
  ring_nf at hsqrt ⊢
  norm_num [Complex.I_sq, hsqrt]
  ring

set_option maxHeartbeats 4000000 in
-- Third elementary determinant factor in the paper's regular chart.
theorem karlssonCoreB_transpose_det_factor
    (t : ℝ) (p : ℂ) (hp0 : p ≠ 0) :
    2 * p * ((karlssonCoreB t p).det + 2 * karlssonCoreB t p 1 0) =
      -6 * (p + Complex.I / (Real.sqrt 3 : ℂ) *
        (p * karlssonHalfAngleU t - karlssonHalfAngleV t)) := by
  have htden : (1 + (t : ℂ) ^ 2) ≠ 0 := by
    exact_mod_cast (by positivity : (1 + t ^ 2 : ℝ) ≠ 0)
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) =
      3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt0 : (Real.sqrt 3 : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 3)))
  rw [Matrix.det_fin_two]
  rw [karlssonCoreB_apply_zero_zero, karlssonCoreB_apply_zero_one,
    karlssonCoreB_apply_one_zero, karlssonCoreB_apply_one_one]
  unfold karlssonHalfAngleU karlssonHalfAngleV
  norm_num
  field_simp [hp0, htden, hsqrt0]
  ring_nf at hsqrt hsqrt3 ⊢
  norm_num [Complex.I_sq, hsqrt, hsqrt3]
  ring

theorem karlssonMixedE_det_pullback
    (t : ℝ) (p z₁ z₃ : ℂ) (hp0 : p ≠ 0) :
    (karlssonMixedE t p z₁ z₃).det =
      -z₁ * z₃ *
        ((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
          (karlssonHalfAngleU t + p * karlssonHalfAngleV t)) := by
  rw [karlssonMixedE, mixedLeadingBlock_det,
    karlssonCoreA_det_factor t p hp0]
  ring

theorem karlssonMixedB_det_pullback
    (t : ℝ) (p z₂ z₃ : ℂ) (hp0 : p ≠ 0) :
    (karlssonMixedB t p z₂ z₃).det =
      -z₂ * z₃ *
        ((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
          (p * karlssonHalfAngleV t - karlssonHalfAngleU t)) := by
  rw [karlssonMixedB, mixedHorizontalBlock_det,
    karlssonCoreB_det_factor t p hp0]
  ring

theorem karlssonMixedC_det_pullback
    (t : ℝ) (p z₁ z₄ : ℂ) (hp0 : p ≠ 0) :
    2 * p * (karlssonMixedC t p z₁ z₄).det =
      (-6 : ℂ) * z₁ * z₄ *
        (p + Complex.I / (Real.sqrt 3 : ℂ) *
          (p * karlssonHalfAngleU t - karlssonHalfAngleV t)) := by
  rw [← Matrix.det_transpose, karlssonMixedC_transpose,
    mixedHorizontalBlock_det, Matrix.det_transpose]
  simp only [Matrix.transpose_apply]
  calc
    2 * p * (z₁ * z₄ *
        ((karlssonCoreB t p).det + 2 * karlssonCoreB t p 1 0)) =
        z₁ * z₄ * (2 * p *
          ((karlssonCoreB t p).det + 2 * karlssonCoreB t p 1 0)) := by ring
    _ = z₁ * z₄ *
        (-6 * (p + Complex.I / (Real.sqrt 3 : ℂ) *
          (p * karlssonHalfAngleU t - karlssonHalfAngleV t))) := by
      rw [karlssonCoreB_transpose_det_factor t p hp0]
    _ = (-6 : ℂ) * z₁ * z₄ *
        (p + Complex.I / (Real.sqrt 3 : ℂ) *
          (p * karlssonHalfAngleU t - karlssonHalfAngleV t)) := by ring

/-- The three determinant witnesses for the regular mixed/mixed corner. -/
theorem karlssonMixed_determinants_ne_zero
    {t : ℝ} {p z₁ z₂ z₃ z₄ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    (karlssonMixedE t p z₁ z₃).det ≠ 0 ∧
      (karlssonMixedB t p z₂ z₃).det ≠ 0 ∧
      (karlssonMixedC t p z₁ z₄).det ≠ 0 := by
  let q : CanonicalKarlssonParameters :=
    { u := (1 - t ^ 2) / (1 + t ^ 2)
      v := 2 * t / (1 + t ^ 2)
      p := p
      circle := by
        field_simp
        ring
      v_nonneg := by positivity
      p_unit := hp
      p_im_nonneg := hpIm }
  have hp0 : p ≠ 0 := ne_zero_of_normSq_eq_one hp
  have hEfactor := q.determinantPullback₁_ne_zero hz₁ hz₃
  have hBfactor := q.determinantPullback₂_ne_zero hz₂ hz₃
  have hCfactor := q.determinantPullback₃_ne_zero hz₁ hz₄
  change
    -z₁ * z₃ *
      ((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
        (karlssonHalfAngleU t + p * karlssonHalfAngleV t)) ≠ 0 at hEfactor
  change
    -z₂ * z₃ *
      ((3 : ℂ) + Complex.I * (Real.sqrt 3 : ℂ) *
        (p * karlssonHalfAngleV t - karlssonHalfAngleU t)) ≠ 0 at hBfactor
  change
    (-6 : ℂ) * z₁ * z₄ *
      (p + Complex.I / (Real.sqrt 3 : ℂ) *
        (p * karlssonHalfAngleU t - karlssonHalfAngleV t)) ≠ 0 at hCfactor
  refine ⟨?_, ?_, ?_⟩
  · rw [karlssonMixedE_det_pullback t p z₁ z₃ hp0]
    exact hEfactor
  · rw [karlssonMixedB_det_pullback t p z₂ z₃ hp0]
    exact hBfactor
  · intro hzero
    have hid := karlssonMixedC_det_pullback t p z₁ z₄ hp0
    rw [hzero, mul_zero] at hid
    exact hCfactor hid.symm

set_option maxHeartbeats 4000000 in
-- The final normalization expands the exact degree-six witness polynomial.
set_option maxRecDepth 10000 in
theorem karlssonMixedB_endpoint0_pullback
    (t : ℝ) (p z₂ z₃ : ℂ)
    (hp : Complex.normSq p = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    4 * p * z₃ * ((1 + t ^ 2 : ℝ) : ℂ) ^ 3 *
        rowEndpoint0 (karlssonMixedB t p z₂ z₃) =
      karlssonWitness4A (t : ℂ) p * z₃ ^ 2 +
        karlssonWitness4B (t : ℂ) p * z₃ +
        karlssonWitness4C (t : ℂ) p := by
  have hp0 : p ≠ 0 := ne_zero_of_normSq_eq_one hp
  have hz₂0 : z₂ ≠ 0 := ne_zero_of_normSq_eq_one hz₂
  have hz₃0 : z₃ ≠ 0 := ne_zero_of_normSq_eq_one hz₃
  have hsp : star p = 1 / p :=
    (one_div_eq_star_of_normSq_eq_one hp).symm
  have hsz₂ : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  have hsz₃ : star z₃ = 1 / z₃ :=
    (one_div_eq_star_of_normSq_eq_one hz₃).symm
  have htden : (1 + (t : ℂ) ^ 2) ≠ 0 := by
    exact_mod_cast (by positivity : (1 + t ^ 2 : ℝ) ≠ 0)
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) =
      3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  unfold karlssonMixedB
  rw [rowEndpoint0_mixedHorizontalBlock (karlssonCoreB t p) z₃ z₂ hz₃ hz₂]
  unfold endpoint0FromData mixedHorizontalS mixedHorizontalT mixedHorizontalR
  rw [karlssonCoreB_apply_zero_zero, karlssonCoreB_apply_zero_one,
    karlssonCoreB_apply_one_zero, karlssonCoreB_apply_one_one]
  unfold karlssonHalfAngleU karlssonHalfAngleV
  unfold karlssonWitness4A karlssonWitness4B karlssonWitness4C
  simp only [star_add, star_sub, star_mul, star_div₀, star_neg,
    star_one, hsp, hsz₃]
  norm_num [Complex.star_def]
  field_simp [hp0, hz₂0, hz₃0, htden]
  ring_nf at hsqrt hsqrt3 hsqrt4 ⊢
  norm_num [Complex.I_sq, hsqrt, hsqrt3, hsqrt4]
  ring

/-- The first hard Karlsson quadratic excludes vanishing of the first
oriented horizontal endpoint on the regular chart. -/
theorem karlssonMixedB_endpoint0_ne_zero
    {t : ℝ} {p z₂ z₃ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    rowEndpoint0 (karlssonMixedB t p z₂ z₃) ≠ 0 := by
  intro hzero
  have hid := karlssonMixedB_endpoint0_pullback t p z₂ z₃ hp hz₂ hz₃
  rw [hzero, mul_zero] at hid
  have hpoly :
      karlssonWitness4A (t : ℂ) p * z₃ ^ 2 +
        karlssonWitness4B (t : ℂ) p * z₃ +
        karlssonWitness4C (t : ℂ) p = 0 := by
    exact hid.symm
  exact (karlssonWitness4_has_no_unit_root
    ht hp hpIm hpNegOne hMPlus) ⟨z₃, hz₃, hpoly⟩

set_option maxHeartbeats 4000000 in
-- This identity reduces the companion endpoint to the repeated square in
-- the paper's list of eleven sufficient witness factors.
set_option maxRecDepth 10000 in
theorem karlssonMixedB_endpoint3_pullback
    (t : ℝ) (p z₂ z₃ : ℂ)
    (hp : Complex.normSq p = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    z₃ ^ 2 * rowEndpoint3 (karlssonMixedB t p z₂ z₃) =
      -3 * (p * karlssonHalfAngleV t - karlssonHalfAngleU t +
        Complex.I / (Real.sqrt 3 : ℂ)) ^ 2 := by
  have hp0 : p ≠ 0 := ne_zero_of_normSq_eq_one hp
  have hz₂0 : z₂ ≠ 0 := ne_zero_of_normSq_eq_one hz₂
  have hz₃0 : z₃ ≠ 0 := ne_zero_of_normSq_eq_one hz₃
  have hsp : star p = 1 / p :=
    (one_div_eq_star_of_normSq_eq_one hp).symm
  have hsz₂ : star z₂ = 1 / z₂ :=
    (one_div_eq_star_of_normSq_eq_one hz₂).symm
  have hsz₃ : star z₃ = 1 / z₃ :=
    (one_div_eq_star_of_normSq_eq_one hz₃).symm
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) =
      3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  have hsqrt0 : (Real.sqrt 3 : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 3)))
  have htden : (1 + (t : ℂ) ^ 2) ≠ 0 := by
    exact_mod_cast (by positivity : (1 + t ^ 2 : ℝ) ≠ 0)
  unfold karlssonMixedB
  rw [rowEndpoint3_mixedHorizontalBlock
    (karlssonCoreB t p) z₃ z₂ hz₃ hz₂]
  unfold endpoint3FromData mixedHorizontalS mixedHorizontalT mixedHorizontalR
  rw [karlssonCoreB_apply_zero_zero, karlssonCoreB_apply_zero_one,
    karlssonCoreB_apply_one_zero, karlssonCoreB_apply_one_one]
  unfold karlssonHalfAngleU karlssonHalfAngleV
  simp only [star_add, star_sub, star_mul, star_div₀, star_neg,
    star_one, hsp, hsz₃]
  norm_num [Complex.star_def]
  field_simp [hp0, hz₂0, hz₃0, hsqrt0, htden]
  ring_nf at hsqrt hsqrt3 hsqrt4 ⊢
  norm_num [Complex.I_sq, hsqrt, hsqrt3, hsqrt4]
  ring

/-- The repeated-square factor excludes vanishing of the companion endpoint
in the same horizontal orientation. -/
theorem karlssonMixedB_endpoint3_ne_zero
    {t : ℝ} {p z₂ z₃ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    rowEndpoint3 (karlssonMixedB t p z₂ z₃) ≠ 0 := by
  let q : CanonicalKarlssonParameters :=
    { u := (1 - t ^ 2) / (1 + t ^ 2)
      v := 2 * t / (1 + t ^ 2)
      p := p
      circle := by
        field_simp
        ring
      v_nonneg := by positivity
      p_unit := hp
      p_im_nonneg := hpIm }
  have hfactor := q.squareFactor₁_ne_zero
  change
    (-3 : ℂ) *
      (p * karlssonHalfAngleV t - karlssonHalfAngleU t +
        Complex.I / (Real.sqrt 3 : ℂ)) ^ 2 ≠ 0 at hfactor
  intro hzero
  have hid := karlssonMixedB_endpoint3_pullback t p z₂ z₃ hp hz₂ hz₃
  rw [hzero, mul_zero] at hid
  exact hfactor hid.symm

theorem swapNoninitialRows_mixedHorizontalBlock
    (M : Mat2) (zLeft zRight : ℂ) :
    swapNoninitialRows (mixedHorizontalBlock M zLeft zRight) =
      mixedHorizontalBlock M (-zLeft) zRight := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [swapNoninitialRows, mixedHorizontalBlock,
      karlssonBlockProduct, karlssonZLeft, karlssonZRight,
      Matrix.mul_apply, Matrix.vecMul, dotProduct, Fin.sum_univ_two]

theorem karlssonWitness6A_eq_neg_witness4A (t p : ℂ) :
    karlssonWitness6A t p = -karlssonWitness4A t p := by
  unfold karlssonWitness6A karlssonWitness4A
  ring

theorem karlssonWitness6B_eq_witness4B (t p : ℂ) :
    karlssonWitness6B t p = karlssonWitness4B t p := by
  unfold karlssonWitness6B karlssonWitness4B
  ring

theorem karlssonWitness6C_eq_neg_witness4C (t p : ℂ) :
    karlssonWitness6C t p = -karlssonWitness4C t p := by
  unfold karlssonWitness6C karlssonWitness4C
  ring

/-- The second horizontal hard quadratic is the first one after reversing
the two noninitial rows. -/
theorem karlssonMixedB_swapped_endpoint0_pullback
    (t : ℝ) (p z₂ z₃ : ℂ)
    (hp : Complex.normSq p = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    4 * p * z₃ * ((1 + t ^ 2 : ℝ) : ℂ) ^ 3 *
        rowEndpoint0 (swapNoninitialRows (karlssonMixedB t p z₂ z₃)) =
      karlssonWitness6A (t : ℂ) p * z₃ ^ 2 +
        karlssonWitness6B (t : ℂ) p * z₃ +
        karlssonWitness6C (t : ℂ) p := by
  have hzneg : Complex.normSq (-z₃) = 1 := by simpa using hz₃
  have hid := karlssonMixedB_endpoint0_pullback
    t p z₂ (-z₃) hp hz₂ hzneg
  rw [karlssonWitness6A_eq_neg_witness4A,
    karlssonWitness6B_eq_witness4B,
    karlssonWitness6C_eq_neg_witness4C]
  rw [karlssonMixedB, swapNoninitialRows_mixedHorizontalBlock,
    ← karlssonMixedB]
  linear_combination -hid

theorem karlssonMixedB_swapped_endpoint0_ne_zero
    {t : ℝ} {p z₂ z₃ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    rowEndpoint0 (swapNoninitialRows (karlssonMixedB t p z₂ z₃)) ≠ 0 := by
  intro hzero
  have hid := karlssonMixedB_swapped_endpoint0_pullback
    t p z₂ z₃ hp hz₂ hz₃
  rw [hzero, mul_zero] at hid
  have hpoly :
      karlssonWitness6A (t : ℂ) p * z₃ ^ 2 +
        karlssonWitness6B (t : ℂ) p * z₃ +
        karlssonWitness6C (t : ℂ) p = 0 := hid.symm
  exact (karlssonWitness6_has_no_unit_root
    ht hp hpIm hpNegOne hMPlus) ⟨z₃, hz₃, hpoly⟩

theorem karlssonMixedB_swapped_endpoint3_ne_zero
    {t : ℝ} {p z₂ z₃ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    rowEndpoint3 (swapNoninitialRows (karlssonMixedB t p z₂ z₃)) ≠ 0 := by
  have hzneg : Complex.normSq (-z₃) = 1 := by simpa using hz₃
  have hnonzero := karlssonMixedB_endpoint3_ne_zero
    ht hp hpIm hz₂ hzneg
  rw [karlssonMixedB, swapNoninitialRows_mixedHorizontalBlock,
    ← karlssonMixedB]
  exact hnonzero

/-- Both oriented endpoint pairs are now nonzero, so the complete normalized
horizontal candidate fibre through the regular Karlsson block is finite. -/
theorem karlssonMixedB_rowFibre_finite
    {t : ℝ} {p z₂ z₃ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1) :
    (normalizedRowGramFibre
      (karlssonMixedB t p z₂ z₃ *
        Matrix.conjTranspose (karlssonMixedB t p z₂ z₃))).Finite := by
  apply normalizedRowGramFibre_finite_of_matrix_endpoints
  · exact karlssonMixedB_endpoint0_ne_zero
      ht hp hpIm hpNegOne hMPlus hz₂ hz₃
  · exact karlssonMixedB_endpoint3_ne_zero ht hp hpIm hz₂ hz₃
  · exact karlssonMixedB_swapped_endpoint0_ne_zero
      ht hp hpIm hpNegOne hMPlus hz₂ hz₃
  · exact karlssonMixedB_swapped_endpoint3_ne_zero ht hp hpIm hz₂ hz₃

set_option maxHeartbeats 4000000 in
-- Exact pullback of the first vertical hard endpoint (the paper's `W₈`).
set_option maxRecDepth 10000 in
theorem karlssonMixedC_transpose_endpoint0_pullback
    (t : ℝ) (p z₁ z₄ : ℂ)
    (hp : Complex.normSq p = 1)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    4 * p ^ 2 * z₁ * ((1 + t ^ 2 : ℝ) : ℂ) ^ 3 *
        rowEndpoint0 (karlssonMixedC t p z₁ z₄).transpose =
      karlssonWitness8A (t : ℂ) p * z₁ ^ 2 +
        karlssonWitness8B (t : ℂ) p * z₁ +
        karlssonWitness8C (t : ℂ) p := by
  have hp0 : p ≠ 0 := ne_zero_of_normSq_eq_one hp
  have hz₁0 : z₁ ≠ 0 := ne_zero_of_normSq_eq_one hz₁
  have hz₄0 : z₄ ≠ 0 := ne_zero_of_normSq_eq_one hz₄
  have hsp : star p = 1 / p :=
    (one_div_eq_star_of_normSq_eq_one hp).symm
  have hsz₁ : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hsz₄ : star z₄ = 1 / z₄ :=
    (one_div_eq_star_of_normSq_eq_one hz₄).symm
  have htden : (1 + (t : ℂ) ^ 2) ≠ 0 := by
    exact_mod_cast (by positivity : (1 + t ^ 2 : ℝ) ≠ 0)
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) =
      3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  rw [karlssonMixedC_transpose]
  rw [rowEndpoint0_mixedHorizontalBlock
    (karlssonCoreB t p).transpose z₁ z₄ hz₁ hz₄]
  unfold endpoint0FromData mixedHorizontalS mixedHorizontalT mixedHorizontalR
  simp only [Matrix.transpose_apply]
  rw [karlssonCoreB_apply_zero_zero, karlssonCoreB_apply_zero_one,
    karlssonCoreB_apply_one_zero, karlssonCoreB_apply_one_one]
  unfold karlssonHalfAngleU karlssonHalfAngleV
  unfold karlssonWitness8A karlssonWitness8B karlssonWitness8C
  simp only [star_add, star_sub, star_mul, star_div₀, star_neg,
    star_one, hsp, hsz₁]
  norm_num [Complex.star_def]
  field_simp [hp0, hz₁0, hz₄0, htden]
  ring_nf at hsqrt hsqrt3 hsqrt4 ⊢
  norm_num [Complex.I_sq, hsqrt, hsqrt3, hsqrt4]
  ring

theorem karlssonMixedC_transpose_endpoint0_ne_zero
    {t : ℝ} {p z₁ z₄ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    rowEndpoint0 (karlssonMixedC t p z₁ z₄).transpose ≠ 0 := by
  intro hzero
  have hid := karlssonMixedC_transpose_endpoint0_pullback
    t p z₁ z₄ hp hz₁ hz₄
  rw [hzero, mul_zero] at hid
  have hpoly :
      karlssonWitness8A (t : ℂ) p * z₁ ^ 2 +
        karlssonWitness8B (t : ℂ) p * z₁ +
        karlssonWitness8C (t : ℂ) p = 0 := hid.symm
  exact (karlssonWitness8_has_no_unit_root
    ht hp hpIm hpNegOne hMPlus) ⟨z₁, hz₁, hpoly⟩

set_option maxHeartbeats 4000000 in
-- Exact pullback of the first vertical repeated-square endpoint (`W₉`).
set_option maxRecDepth 10000 in
theorem karlssonMixedC_transpose_endpoint3_pullback
    (t : ℝ) (p z₁ z₄ : ℂ)
    (hp : Complex.normSq p = 1)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    p ^ 2 * z₁ ^ 2 *
        rowEndpoint3 (karlssonMixedC t p z₁ z₄).transpose =
      -3 * (p * karlssonHalfAngleU t - karlssonHalfAngleV t +
        Complex.I * p / (Real.sqrt 3 : ℂ)) ^ 2 := by
  have hp0 : p ≠ 0 := ne_zero_of_normSq_eq_one hp
  have hz₁0 : z₁ ≠ 0 := ne_zero_of_normSq_eq_one hz₁
  have hz₄0 : z₄ ≠ 0 := ne_zero_of_normSq_eq_one hz₄
  have hsp : star p = 1 / p :=
    (one_div_eq_star_of_normSq_eq_one hp).symm
  have hsz₁ : star z₁ = 1 / z₁ :=
    (one_div_eq_star_of_normSq_eq_one hz₁).symm
  have hsz₄ : star z₄ = 1 / z₄ :=
    (one_div_eq_star_of_normSq_eq_one hz₄).symm
  have hsqrt : ((Real.sqrt 3 : ℂ) ^ 2) = 3 := by
    exact_mod_cast (Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 3))
  have hsqrt3 : ((Real.sqrt 3 : ℂ) ^ 3) =
      3 * (Real.sqrt 3 : ℂ) := by
    calc
      (Real.sqrt 3 : ℂ) ^ 3 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) := by ring
      _ = 3 * (Real.sqrt 3 : ℂ) := by rw [hsqrt]
  have hsqrt4 : ((Real.sqrt 3 : ℂ) ^ 4) = 9 := by
    calc
      (Real.sqrt 3 : ℂ) ^ 4 =
          (Real.sqrt 3 : ℂ) ^ 2 * (Real.sqrt 3 : ℂ) ^ 2 := by ring
      _ = 9 := by rw [hsqrt]; norm_num
  have hsqrt0 : (Real.sqrt 3 : ℂ) ≠ 0 := by
    exact_mod_cast (ne_of_gt (Real.sqrt_pos.2 (by norm_num : (0 : ℝ) < 3)))
  have htden : (1 + (t : ℂ) ^ 2) ≠ 0 := by
    exact_mod_cast (by positivity : (1 + t ^ 2 : ℝ) ≠ 0)
  rw [karlssonMixedC_transpose]
  rw [rowEndpoint3_mixedHorizontalBlock
    (karlssonCoreB t p).transpose z₁ z₄ hz₁ hz₄]
  unfold endpoint3FromData mixedHorizontalS mixedHorizontalT mixedHorizontalR
  simp only [Matrix.transpose_apply]
  rw [karlssonCoreB_apply_zero_zero, karlssonCoreB_apply_zero_one,
    karlssonCoreB_apply_one_zero, karlssonCoreB_apply_one_one]
  unfold karlssonHalfAngleU karlssonHalfAngleV
  simp only [star_add, star_sub, star_mul, star_div₀, star_neg,
    star_one, hsp, hsz₁]
  norm_num [Complex.star_def]
  field_simp [hp0, hz₁0, hz₄0, hsqrt0, htden]
  ring_nf at hsqrt hsqrt3 hsqrt4 ⊢
  norm_num [Complex.I_sq, hsqrt, hsqrt3, hsqrt4]
  ring

theorem karlssonMixedC_transpose_endpoint3_ne_zero
    {t : ℝ} {p z₁ z₄ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    rowEndpoint3 (karlssonMixedC t p z₁ z₄).transpose ≠ 0 := by
  let q : CanonicalKarlssonParameters :=
    { u := (1 - t ^ 2) / (1 + t ^ 2)
      v := 2 * t / (1 + t ^ 2)
      p := p
      circle := by
        field_simp
        ring
      v_nonneg := by positivity
      p_unit := hp
      p_im_nonneg := hpIm }
  have hfactor := q.squareFactor₂_ne_zero
  change
    (-3 : ℂ) *
      (p * karlssonHalfAngleU t - karlssonHalfAngleV t +
        Complex.I * p / (Real.sqrt 3 : ℂ)) ^ 2 ≠ 0 at hfactor
  intro hzero
  have hid := karlssonMixedC_transpose_endpoint3_pullback
    t p z₁ z₄ hp hz₁ hz₄
  rw [hzero, mul_zero] at hid
  exact hfactor hid.symm

theorem karlssonWitness10A_eq_neg_witness8A (t p : ℂ) :
    karlssonWitness10A t p = -karlssonWitness8A t p := by
  unfold karlssonWitness10A karlssonWitness8A
  ring

theorem karlssonWitness10B_eq_witness8B (t p : ℂ) :
    karlssonWitness10B t p = karlssonWitness8B t p := by
  unfold karlssonWitness10B karlssonWitness8B
  ring

theorem karlssonWitness10C_eq_neg_witness8C (t p : ℂ) :
    karlssonWitness10C t p = -karlssonWitness8C t p := by
  unfold karlssonWitness10C karlssonWitness8C
  ring

theorem karlssonMixedC_transpose_swapped_endpoint0_pullback
    (t : ℝ) (p z₁ z₄ : ℂ)
    (hp : Complex.normSq p = 1)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    4 * p ^ 2 * z₁ * ((1 + t ^ 2 : ℝ) : ℂ) ^ 3 *
        rowEndpoint0
          (swapNoninitialRows (karlssonMixedC t p z₁ z₄).transpose) =
      karlssonWitness10A (t : ℂ) p * z₁ ^ 2 +
        karlssonWitness10B (t : ℂ) p * z₁ +
        karlssonWitness10C (t : ℂ) p := by
  have hzneg : Complex.normSq (-z₁) = 1 := by simpa using hz₁
  have hid := karlssonMixedC_transpose_endpoint0_pullback
    t p (-z₁) z₄ hp hzneg hz₄
  rw [karlssonWitness10A_eq_neg_witness8A,
    karlssonWitness10B_eq_witness8B,
    karlssonWitness10C_eq_neg_witness8C]
  rw [karlssonMixedC_transpose, swapNoninitialRows_mixedHorizontalBlock,
    ← karlssonMixedC_transpose]
  linear_combination -hid

theorem karlssonMixedC_transpose_swapped_endpoint0_ne_zero
    {t : ℝ} {p z₁ z₄ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    rowEndpoint0
      (swapNoninitialRows (karlssonMixedC t p z₁ z₄).transpose) ≠ 0 := by
  intro hzero
  have hid := karlssonMixedC_transpose_swapped_endpoint0_pullback
    t p z₁ z₄ hp hz₁ hz₄
  rw [hzero, mul_zero] at hid
  have hpoly :
      karlssonWitness10A (t : ℂ) p * z₁ ^ 2 +
        karlssonWitness10B (t : ℂ) p * z₁ +
        karlssonWitness10C (t : ℂ) p = 0 := hid.symm
  exact (karlssonWitness10_has_no_unit_root
    ht hp hpIm hpNegOne hMPlus) ⟨z₁, hz₁, hpoly⟩

theorem karlssonMixedC_transpose_swapped_endpoint3_ne_zero
    {t : ℝ} {p z₁ z₄ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    rowEndpoint3
      (swapNoninitialRows (karlssonMixedC t p z₁ z₄).transpose) ≠ 0 := by
  have hzneg : Complex.normSq (-z₁) = 1 := by simpa using hz₁
  have hnonzero := karlssonMixedC_transpose_endpoint3_ne_zero
    ht hp hpIm hzneg hz₄
  rw [karlssonMixedC_transpose, swapNoninitialRows_mixedHorizontalBlock,
    ← karlssonMixedC_transpose]
  exact hnonzero

/-- Both oriented endpoint pairs are nonzero, so the complete normalized
vertical candidate fibre through the regular Karlsson block is finite. -/
theorem karlssonMixedC_columnFibre_finite
    {t : ℝ} {p z₁ z₄ : ℂ}
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    (normalizedColumnGramFibre
      (Matrix.conjTranspose (karlssonMixedC t p z₁ z₄) *
        karlssonMixedC t p z₁ z₄)).Finite := by
  apply normalizedColumnGramFibre_finite_of_transpose_endpoints
  · exact karlssonMixedC_transpose_endpoint0_ne_zero
      ht hp hpIm hpNegOne hMPlus hz₁ hz₄
  · exact karlssonMixedC_transpose_endpoint3_ne_zero ht hp hpIm hz₁ hz₄
  · exact karlssonMixedC_transpose_swapped_endpoint0_ne_zero
      ht hp hpIm hpNegOne hMPlus hz₁ hz₄
  · exact karlssonMixedC_transpose_swapped_endpoint3_ne_zero
      ht hp hpIm hz₁ hz₄

/-- The regular mixed/mixed Karlsson chart supplies the finite corner used by
the paper's classification argument.  The three block equalities make this a
matrix-level audit theorem: the published Karlsson parametrization only has to
put the chosen presentation into these explicit coordinates. -/
theorem regularKarlssonBlockPresentation_hasFiniteCorner
    {H : Mat6} {t : ℝ} {p z₁ z₂ z₃ z₄ : ℂ}
    (hH : IsHadamard H)
    (hE : Matrix.toBlocks₁₁ H = karlssonMixedE t p z₁ z₃)
    (hB : Matrix.toBlocks₁₂ H = karlssonMixedB t p z₂ z₃)
    (hC : Matrix.toBlocks₂₁ H = karlssonMixedC t p z₁ z₄)
    (ht : 0 < t) (hp : Complex.normSq p = 1)
    (hpIm : 0 ≤ p.im) (hpNegOne : p ≠ -1)
    (hMPlus : karlssonMPlus t p ≠ 0)
    (hz₁ : Complex.normSq z₁ = 1)
    (hz₂ : Complex.normSq z₂ = 1)
    (hz₃ : Complex.normSq z₃ = 1)
    (hz₄ : Complex.normSq z₄ = 1) :
    HasFiniteCorner H := by
  have hdets := karlssonMixed_determinants_ne_zero
    ht hp hpIm hz₁ hz₂ hz₃ hz₄
  apply finite_topLeft_intrinsic_fibres_give_finiteCorner hH
  · rw [hE]
    exact hdets.1
  · rw [hB]
    exact hdets.2.1
  · rw [hC]
    exact hdets.2.2
  · rw [hB]
    exact karlssonMixedB_rowFibre_finite
      ht hp hpIm hpNegOne hMPlus hz₂ hz₃
  · rw [hC]
    exact karlssonMixedC_columnFibre_finite
      ht hp hpIm hpNegOne hMPlus hz₁ hz₄

/-- Canonical parameters for the paper's nondegenerate Karlsson chart. -/
structure RegularKarlssonData where
  t : ℝ
  p : ℂ
  z₁ : ℂ
  z₂ : ℂ
  z₃ : ℂ
  z₄ : ℂ
  t_pos : 0 < t
  p_unit : Complex.normSq p = 1
  p_im_nonneg : 0 ≤ p.im
  p_ne_neg_one : p ≠ -1
  mPlus_ne_zero : karlssonMPlus t p ≠ 0
  z₁_unit : Complex.normSq z₁ = 1
  z₂_unit : Complex.normSq z₂ = 1
  z₃_unit : Complex.normSq z₃ = 1
  z₄_unit : Complex.normSq z₄ = 1

/-- A representative is in the regular Karlsson chart when its three blocks
at the paper's fixed mixed/mixed corner are literally the audited blocks. -/
def IsRegularKarlssonBlockPresentation (H : Mat6) : Prop :=
  ∃ q : RegularKarlssonData,
    Matrix.toBlocks₁₁ H =
      karlssonMixedE q.t q.p q.z₁ q.z₃ ∧
    Matrix.toBlocks₁₂ H =
      karlssonMixedB q.t q.p q.z₂ q.z₃ ∧
    Matrix.toBlocks₂₁ H =
      karlssonMixedC q.t q.p q.z₁ q.z₄

/-- Coordinate-free consequence of the regular-chart calculation: any
Hadamard representative in the explicit block chart has a finite corner. -/
theorem regularKarlssonPresentation_hasFiniteCorner
    {H : Mat6} (hH : IsHadamard H)
    (hreg : IsRegularKarlssonBlockPresentation H) :
    HasFiniteCorner H := by
  rcases hreg with ⟨q, hE, hB, hC⟩
  exact regularKarlssonBlockPresentation_hasFiniteCorner
    hH hE hB hC q.t_pos q.p_unit q.p_im_nonneg q.p_ne_neg_one
      q.mPlus_ne_zero q.z₁_unit q.z₂_unit q.z₃_unit q.z₄_unit

/-- The regular Karlsson chart is contained in the paper's intrinsic total
finite-dilation output. -/
theorem regularKarlssonPresentation_mem_finiteCornerAtlas
    {H : Mat6} (hH : IsHadamard H)
    (hreg : IsRegularKarlssonBlockPresentation H) :
    InFiniteCornerAtlas H := by
  rcases finiteCorner_hasRetainedOutput
      (regularKarlssonPresentation_hasFiniteCorner hH hreg) with
    ⟨q, B, C, hret, heq⟩
  exact mem_finiteCornerAtlas_of_retained hret heq

end

end Hadamard6
