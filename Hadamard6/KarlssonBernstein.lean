import Mathlib.Analysis.SpecialFunctions.Bernstein
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

/-!
# Exact Bernstein certificates for the Karlsson residual

The large interior certificate lives in `ℚ(√3)`.  We represent its coefficients
as rational pairs and implement dyadic de Casteljau subdivision using rational
arithmetic.  Consequently the finite certificate verdict can be reduced by the
Lean kernel; the external symbolic script is only a certificate generator.
-/

namespace Hadamard6

/-- The exact coefficient `a + b√3`, with `a,b ∈ ℚ`. -/
@[ext] structure QsqrtThree where
  a : ℚ
  b : ℚ
deriving DecidableEq, Repr

namespace QsqrtThree

instance instZeroQsqrtThree : Zero QsqrtThree := ⟨⟨0, 0⟩⟩
instance instAddQsqrtThree : Add QsqrtThree :=
  ⟨fun x y ↦ ⟨x.a + y.a, x.b + y.b⟩⟩

instance : AddCommMonoid QsqrtThree where
  add_assoc x y z := by
    apply QsqrtThree.ext
    · exact add_assoc x.a y.a z.a
    · exact add_assoc x.b y.b z.b
  zero_add x := by
    apply QsqrtThree.ext
    · exact zero_add x.a
    · exact zero_add x.b
  add_zero x := by
    apply QsqrtThree.ext
    · exact add_zero x.a
    · exact add_zero x.b
  add_comm x y := by
    apply QsqrtThree.ext
    · exact add_comm x.a y.a
    · exact add_comm x.b y.b
  nsmul := nsmulRec

def scale (r : ℚ) (x : QsqrtThree) : QsqrtThree :=
  ⟨r * x.a, r * x.b⟩

def half (x : QsqrtThree) : QsqrtThree := scale (1 / 2) x

noncomputable def eval (x : QsqrtThree) : ℝ :=
  (x.a : ℝ) + (x.b : ℝ) * Real.sqrt 3

/-- A deliberately simple sufficient positivity test.  Every terminal
coefficient in the Karlsson certificate has positive rational part and
nonnegative `√3` part. -/
def visiblyPositive (x : QsqrtThree) : Bool :=
  decide (0 < x.a ∧ 0 ≤ x.b)

theorem eval_pos_of_visiblyPositive {x : QsqrtThree}
    (hx : x.visiblyPositive = true) : 0 < x.eval := by
  simp only [visiblyPositive, decide_eq_true_eq] at hx
  have hsqrt : 0 ≤ Real.sqrt 3 := Real.sqrt_nonneg 3
  exact add_pos_of_pos_of_nonneg (by exact_mod_cast hx.1)
    (mul_nonneg (by exact_mod_cast hx.2) hsqrt)

end QsqrtThree

/-- A coefficient in `ℚ(√3)` with elementary rational positivity evidence. -/
structure PositiveQsqrtThree where
  value : QsqrtThree
  rationalPart_pos : 0 < value.a
  sqrtPart_nonneg : 0 ≤ value.b

namespace PositiveQsqrtThree

noncomputable def eval (x : PositiveQsqrtThree) : ℝ := x.value.eval

theorem eval_pos (x : PositiveQsqrtThree) : 0 < x.eval := by
  apply QsqrtThree.eval_pos_of_visiblyPositive
  simp [QsqrtThree.visiblyPositive, x.rationalPart_pos, x.sqrtPart_nonneg]

end PositiveQsqrtThree

abbrev BernsteinControlTable := List (List QsqrtThree)

def qsum (xs : List QsqrtThree) : QsqrtThree :=
  xs.foldl (· + ·) 0

private def transposeRectAux : Nat → BernsteinControlTable → BernsteinControlTable
  | 0, _ => []
  | n + 1, table =>
      table.map (fun row ↦ row.headD 0) ::
        transposeRectAux n (table.map (fun row ↦ row.tail))

/-- A transparent transpose specialized to the rectangular certificate
tables.  Unlike the library's optimized array implementation, this definition
also reduces directly in kernel proof terms. -/
def transposeRect (table : BernsteinControlTable) : BernsteinControlTable :=
  transposeRectAux (table.headD []).length table

/-- The left control polygon after subdivision at `1/2`, written in its
closed binomial form. -/
def splitCurveLeft (xs : List QsqrtThree) : List QsqrtThree :=
  (List.range xs.length).map fun i ↦
    qsum <| (List.range (i + 1)).map fun k ↦
      QsqrtThree.scale ((Nat.choose i k : ℚ) / (2 : ℚ) ^ i)
        (xs.getD k 0)

/-- The right control polygon after subdivision at `1/2`. -/
def splitCurveRight (xs : List QsqrtThree) : List QsqrtThree :=
  let n := xs.length - 1
  (List.range xs.length).map fun i ↦
    qsum <| (List.range (n - i + 1)).map fun k ↦
      QsqrtThree.scale
        ((Nat.choose (n - i) k : ℚ) / (2 : ℚ) ^ (n - i))
        (xs.getD (i + k) 0)

/-- Subdivide the first coordinate of a rectangular control table. -/
def splitTableXLeft (table : BernsteinControlTable) : BernsteinControlTable :=
  transposeRect ((transposeRect table).map splitCurveLeft)

def splitTableXRight (table : BernsteinControlTable) : BernsteinControlTable :=
  transposeRect ((transposeRect table).map splitCurveRight)

/-- Subdivide the second coordinate of a rectangular control table. -/
def splitTableYLeft (table : BernsteinControlTable) : BernsteinControlTable :=
  table.map splitCurveLeft

def splitTableYRight (table : BernsteinControlTable) : BernsteinControlTable :=
  table.map splitCurveRight

def quadrant00 (table : BernsteinControlTable) : BernsteinControlTable :=
  splitTableYLeft (splitTableXLeft table)

def quadrant01 (table : BernsteinControlTable) : BernsteinControlTable :=
  splitTableYRight (splitTableXLeft table)

def quadrant10 (table : BernsteinControlTable) : BernsteinControlTable :=
  splitTableYLeft (splitTableXRight table)

def quadrant11 (table : BernsteinControlTable) : BernsteinControlTable :=
  splitTableYRight (splitTableXRight table)

/-- Boolean terminal-box checker, reducible using exact rational arithmetic. -/
def allControlsVisiblyPositive (table : BernsteinControlTable) : Bool :=
  table.all fun row ↦ row.all QsqrtThree.visiblyPositive

/-- The ten-leaf subdivision pattern found by the exact atlas computation:
the off-diagonal root quadrants are terminal, while each diagonal quadrant is
subdivided once more. -/
def tenLeafCertificate (table : BernsteinControlTable) : Bool :=
  allControlsVisiblyPositive (quadrant01 table) &&
  allControlsVisiblyPositive (quadrant10 table) &&
  allControlsVisiblyPositive (quadrant00 (quadrant00 table)) &&
  allControlsVisiblyPositive (quadrant01 (quadrant00 table)) &&
  allControlsVisiblyPositive (quadrant10 (quadrant00 table)) &&
  allControlsVisiblyPositive (quadrant11 (quadrant00 table)) &&
  allControlsVisiblyPositive (quadrant00 (quadrant11 table)) &&
  allControlsVisiblyPositive (quadrant01 (quadrant11 table)) &&
  allControlsVisiblyPositive (quadrant10 (quadrant11 table)) &&
  allControlsVisiblyPositive (quadrant11 (quadrant11 table))

/-! ## Fixed-size, proof-producing certificate interface -/

abbrev BernsteinX := Fin 17
abbrev BernsteinY := Fin 9
abbrev FixedBernsteinTable := BernsteinX → BernsteinY → QsqrtThree
abbrev PositiveFixedBernsteinTable :=
  BernsteinX → BernsteinY → PositiveQsqrtThree

noncomputable def tensorBernstein
    (table : PositiveFixedBernsteinTable)
    (x y : Set.Icc (0 : ℝ) 1) : ℝ :=
  ∑ i : BernsteinX, ∑ j : BernsteinY,
    (table i j).eval * bernstein 16 i x * bernstein 8 j y

theorem tensorBernstein_pos (table : PositiveFixedBernsteinTable)
    (x y : Set.Icc (0 : ℝ) 1) : 0 < tensorBernstein table x y := by
  have hxsum : (∑ i : BernsteinX, bernstein 16 i x) = 1 :=
    bernstein.probability 16 x
  have hysum : (∑ j : BernsteinY, bernstein 8 j y) = 1 :=
    bernstein.probability 8 y
  have hxi : ∃ i : BernsteinX, 0 < bernstein 16 i x := by
    have hne : (∑ i : BernsteinX, bernstein 16 i x) ≠ 0 := by
      rw [hxsum]
      norm_num
    obtain ⟨i, _hi, hine⟩ := Finset.exists_ne_zero_of_sum_ne_zero hne
    exact ⟨i, lt_of_le_of_ne bernstein_nonneg (Ne.symm hine)⟩
  have hyj : ∃ j : BernsteinY, 0 < bernstein 8 j y := by
    have hne : (∑ j : BernsteinY, bernstein 8 j y) ≠ 0 := by
      rw [hysum]
      norm_num
    obtain ⟨j, _hj, hjne⟩ := Finset.exists_ne_zero_of_sum_ne_zero hne
    exact ⟨j, lt_of_le_of_ne bernstein_nonneg (Ne.symm hjne)⟩
  rcases hxi with ⟨i, hi⟩
  rcases hyj with ⟨j, hj⟩
  unfold tensorBernstein
  apply Finset.sum_pos'
  · intro k _hk
    exact Finset.sum_nonneg fun ell _hell ↦
      mul_nonneg
        (mul_nonneg (table k ell).eval_pos.le bernstein_nonneg)
        bernstein_nonneg
  · refine ⟨i, Finset.mem_univ i, ?_⟩
    apply Finset.sum_pos'
    · intro ell _hell
      exact mul_nonneg
        (mul_nonneg (table i ell).eval_pos.le bernstein_nonneg)
        bernstein_nonneg
    · exact ⟨j, Finset.mem_univ j,
        mul_pos (mul_pos (table i j).eval_pos hi) hj⟩

def fixedSplitXLeft (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fun i j ↦ ∑ k : BernsteinX,
    if k ≤ i then
      QsqrtThree.scale
        ((Nat.choose i.val k.val : ℚ) / (2 : ℚ) ^ i.val) (table k j)
    else 0

def fixedSplitXRight (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fun i j ↦ ∑ k : BernsteinX,
    if i ≤ k then
      QsqrtThree.scale
        ((Nat.choose (16 - i.val) (k.val - i.val) : ℚ) /
          (2 : ℚ) ^ (16 - i.val)) (table k j)
    else 0

def fixedSplitYLeft (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fun i j ↦ ∑ k : BernsteinY,
    if k ≤ j then
      QsqrtThree.scale
        ((Nat.choose j.val k.val : ℚ) / (2 : ℚ) ^ j.val) (table i k)
    else 0

def fixedSplitYRight (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fun i j ↦ ∑ k : BernsteinY,
    if j ≤ k then
      QsqrtThree.scale
        ((Nat.choose (8 - j.val) (k.val - j.val) : ℚ) /
          (2 : ℚ) ^ (8 - j.val)) (table i k)
    else 0

def fixedQuadrant00 (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fixedSplitYLeft (fixedSplitXLeft table)

def fixedQuadrant01 (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fixedSplitYRight (fixedSplitXLeft table)

def fixedQuadrant10 (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fixedSplitYLeft (fixedSplitXRight table)

def fixedQuadrant11 (table : FixedBernsteinTable) : FixedBernsteinTable :=
  fixedSplitYRight (fixedSplitXRight table)

def FixedControlsVisiblyPositive (table : FixedBernsteinTable) : Prop :=
  ∀ i j, QsqrtThree.visiblyPositive (table i j) = true

end Hadamard6
