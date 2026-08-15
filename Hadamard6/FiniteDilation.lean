import Hadamard6.Basic

/-!
# The intrinsic finite-corner atlas

Nothing in this file defines the last class by appealing to a family name in
the literature.  It is the equivalence closure of the retained outputs of the
algorithm described in the paper.
-/

namespace Hadamard6

def sixI3 : Mat3 := (6 : ℂ) • (1 : Mat3)

/-- Normalized horizontal candidates for a fixed corner `E`. -/
def horizontalCandidates (E : Mat3) : Set Mat3 :=
  {B | EntrywiseUnit B ∧
       (∀ j, B 0 j = 1) ∧
       E * Matrix.conjTranspose E + B * Matrix.conjTranspose B = sixI3}

/-- Normalized vertical candidates for a fixed corner `E`. -/
def verticalCandidates (E : Mat3) : Set Mat3 :=
  {C | EntrywiseUnit C ∧
       (∀ i, C i 0 = 1) ∧
       Matrix.conjTranspose E * E + Matrix.conjTranspose C * C = sixI3}

def invertibleHorizontalCandidates (E : Mat3) : Set Mat3 :=
  {B | B ∈ horizontalCandidates E ∧ IsUnit B.det}

def invertibleVerticalCandidates (E : Mat3) : Set Mat3 :=
  {C | C ∈ verticalCandidates E ∧ IsUnit C.det}

/-- Exactly the paper's finite-dilation-corner condition.  The seed `E`
need not be invertible: the forced-completion formula inverts `B`, not `E`.
The classification proof happens to construct witnesses with invertible
seeds, but that stronger property is not built into the public definition. -/
def IsFiniteDilationCorner (E : Mat3) : Prop :=
  (invertibleHorizontalCandidates E).Nonempty ∧
  (invertibleVerticalCandidates E).Nonempty ∧
  (invertibleHorizontalCandidates E).Finite ∧
  (invertibleVerticalCandidates E).Finite

/-- Orthogonality forces this lower-right block. -/
noncomputable def forcedD (E B C : Mat3) : Mat3 :=
  -C * Matrix.conjTranspose E * Matrix.conjTranspose (B⁻¹)

/-- A candidate triple is retained exactly when it passes the final
entrywise-modulus test. -/
def Retained (E B C : Mat3) : Prop :=
  IsFiniteDilationCorner E ∧
  B ∈ invertibleHorizontalCandidates E ∧
  C ∈ invertibleVerticalCandidates E ∧
  EntrywiseUnit (forcedD E B C)

noncomputable def completion (E B C : Mat3) : Mat6 :=
  Matrix.fromBlocks E B C (forcedD E B C)

/-- Membership in the total finite-corner atlas `A_6^fc`: the equivalence
closure of all retained finite-dilation completions over every four-phase
corner.

This is deliberately *not* called `G_6^(4)`.  That notation is reserved for
Szollosi's complete finite Construction 3.1 output after Tao and Karlsson are
separated. -/
def InFiniteCornerAtlas (H : Mat6) : Prop :=
  ∃ (p : CornerData) (B C : Mat3),
    Retained p.matrix B C ∧ Equivalent H (completion p.matrix B C)

theorem mem_finiteCornerAtlas_of_retained
    {H : Mat6} {p : CornerData} {B C : Mat3}
    (hret : Retained p.matrix B C)
    (heq : Equivalent H (completion p.matrix B C)) :
    InFiniteCornerAtlas H := by
  exact ⟨p, B, C, hret, heq⟩

theorem mem_finiteCornerAtlas_iff (H : Mat6) :
    InFiniteCornerAtlas H ↔
      ∃ (p : CornerData) (B C : Mat3),
        Retained p.matrix B C ∧ Equivalent H (completion p.matrix B C) := by
  rfl

/-- Membership in the total finite-dilation output is closed under replacing
the input matrix by an equivalent representative. -/
theorem inFiniteCornerAtlas_of_equivalent {H K : Mat6}
    (hHK : Equivalent H K) (hK : InFiniteCornerAtlas K) :
    InFiniteCornerAtlas H := by
  rcases hK with ⟨p, B, C, hret, hKC⟩
  exact ⟨p, B, C, hret, equivalent_trans hHK hKC⟩

theorem equivalent_inFiniteCornerAtlas_iff {H K : Mat6}
    (hHK : Equivalent H K) :
    InFiniteCornerAtlas H ↔ InFiniteCornerAtlas K := by
  constructor
  · exact inFiniteCornerAtlas_of_equivalent (equivalent_symm hHK)
  · exact inFiniteCornerAtlas_of_equivalent hHK

end Hadamard6
