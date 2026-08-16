import Hadamard6.Blocks
import Hadamard6.CubicRoots

/-!
# Phase equivalence and dephasing
-/

namespace Hadamard6

def phaseTransform (r c : I6 → ℂ) (H : Mat6) : Mat6 :=
  fun i j ↦ r i * H i j * c j

theorem phaseTransform_entrywiseUnit {r c : I6 → ℂ} {H : Mat6}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1)
    (hH : EntrywiseUnit H) :
    EntrywiseUnit (phaseTransform r c H) := by
  intro i j
  simp [phaseTransform, Complex.normSq_mul, hr i, hc j, hH i j]

theorem phaseTransform_rowGram {r c : I6 → ℂ} {H : Mat6}
    (hc : ∀ j, Complex.normSq (c j) = 1) :
    phaseTransform r c H * Matrix.conjTranspose (phaseTransform r c H) =
      fun i j ↦ r i * (H * Matrix.conjTranspose H) i j * star (r j) := by
  ext i j
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply, phaseTransform,
    star_mul]
  change
    (∑ k, (r i * H i k * c k) *
      (star (c k) * (star (H j k) * star (r j)))) =
      r i * (∑ k, H i k * star (H j k)) * star (r j)
  calc
    ∑ k, (r i * H i k * c k) *
        (star (c k) * (star (H j k) * star (r j))) =
      ∑ k, r i * (H i k * star (H j k)) * star (r j) := by
        apply Finset.sum_congr rfl
        intro k hk
        have hck : c k * star (c k) = 1 := by
          simpa [mul_comm] using star_mul_self_of_normSq_one (hc k)
        calc
          (r i * H i k * c k) *
              (star (c k) * (star (H j k) * star (r j))) =
            r i * H i k * (c k * star (c k)) *
              star (H j k) * star (r j) := by ring
          _ = r i * (H i k * star (H j k)) * star (r j) := by
            rw [hck]
            ring
    _ = r i * (∑ k, H i k * star (H j k)) * star (r j) := by
      rw [Finset.mul_sum, Finset.sum_mul]

theorem phaseTransform_isHadamard
    {r c : I6 → ℂ} {H : Mat6}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1)
    (hH : IsHadamard H) : IsHadamard (phaseTransform r c H) := by
  refine ⟨phaseTransform_entrywiseUnit hr hc hH.1, ?_⟩
  rw [phaseTransform_rowGram hc, hH.2]
  ext i j
  simp only [Matrix.smul_apply, Matrix.one_apply]
  by_cases hij : i = j
  · subst j
    have hri : r i * star (r i) = 1 := by
      simpa [mul_comm] using star_mul_self_of_normSq_one (hr i)
    simp only [if_pos, smul_eq_mul, mul_one]
    change r i * (6 : ℂ) * star (r i) = (6 : ℂ)
    calc
      r i * 6 * star (r i) = 6 * (r i * star (r i)) := by ring
      _ = 6 := by rw [hri]; norm_num
  · simp [hij]

theorem equivalent_phaseTransform
    {r c : I6 → ℂ} {H : Mat6}
    (hr : ∀ i, Complex.normSq (r i) = 1)
    (hc : ∀ j, Complex.normSq (c j) = 1) :
    Equivalent H (phaseTransform r c H) := by
  exact ⟨Equiv.refl I6, Equiv.refl I6, r, c, hr, hc,
    fun _ _ ↦ rfl⟩

theorem equivalent_refl' (H : Mat6) : Equivalent H H := by
  exact ⟨Equiv.refl I6, Equiv.refl I6, (fun _ ↦ 1), (fun _ ↦ 1),
    (by intro i; norm_num), (by intro j; norm_num), by simp⟩

/-- Simultaneously reindex the rows and columns of a matrix. -/
def reindexMatrix (σ τ : Equiv.Perm I6) (H : Mat6) : Mat6 :=
  fun i j ↦ H (σ i) (τ j)

theorem equivalent_reindexMatrix (σ τ : Equiv.Perm I6) (H : Mat6) :
    Equivalent H (reindexMatrix σ τ H) := by
  exact ⟨σ, τ, (fun _ ↦ 1), (fun _ ↦ 1),
    (by intro i; norm_num), (by intro j; norm_num),
    by simp [reindexMatrix]⟩

theorem reindexMatrix_isHadamard
    {σ τ : Equiv.Perm I6} {H : Mat6} (hH : IsHadamard H) :
    IsHadamard (reindexMatrix σ τ H) := by
  constructor
  · intro i j
    exact hH.1 (σ i) (τ j)
  · ext i j
    change (∑ k, H (σ i) (τ k) * star (H (σ j) (τ k))) = _
    rw [τ.sum_comp Finset.univ
      (fun k ↦ H (σ i) k * star (H (σ j) k)) (by simp)]
    have hentry := congrArg (fun M : Mat6 ↦ M (σ i) (σ j)) hH.2
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.smul_apply, Matrix.one_apply] at hentry ⊢
    by_cases hij : i = j
    · subst j
      simpa using hentry
    · have hsij : σ i ≠ σ j := fun h ↦ hij (σ.injective h)
      simpa [hij, hsij] using hentry

/-- The Hadamard property is transported forward by equivalence. -/
theorem isHadamard_of_equivalent {H K : Mat6}
    (hHK : Equivalent H K) (hH : IsHadamard H) : IsHadamard K := by
  rcases hHK with ⟨σ, τ, r, c, hr, hc, hHK⟩
  have hperm : IsHadamard (reindexMatrix σ τ H) :=
    reindexMatrix_isHadamard hH
  have hphase : K = phaseTransform r c (reindexMatrix σ τ H) := by
    ext i j
    simp [phaseTransform, reindexMatrix, hHK]
  rw [hphase]
  exact phaseTransform_isHadamard hr hc hperm

/-- Hadamardness is an invariant of the equivalence class. -/
theorem equivalent_isHadamard_iff {H K : Mat6}
    (hHK : Equivalent H K) : IsHadamard H ↔ IsHadamard K := by
  constructor
  · exact isHadamard_of_equivalent hHK
  · exact isHadamard_of_equivalent (equivalent_symm hHK)

theorem finiteCorner_of_equivalent {H K : Mat6}
    (hHK : Equivalent H K) (hK : HasFiniteCorner K) :
    HasFiniteCorner H := by
  rcases hK with ⟨p, B, C, D, hfinite, hB, hC, hD, hforced, hpres⟩
  exact ⟨p, B, C, D, hfinite, hB, hC, hD, hforced,
    equivalent_trans hHK hpres⟩

noncomputable def dephaseRowFactor (H : Mat6) (i : I6) : ℂ :=
  star (H i (Sum.inl 0))

noncomputable def dephaseColumnFactor (H : Mat6) (j : I6) : ℂ :=
  star (H (Sum.inl 0) j) * H (Sum.inl 0) (Sum.inl 0)

noncomputable def dephase (H : Mat6) : Mat6 :=
  phaseTransform (dephaseRowFactor H) (dephaseColumnFactor H) H

theorem dephaseRowFactor_unit {H : Mat6} (hH : EntrywiseUnit H) (i : I6) :
    Complex.normSq (dephaseRowFactor H i) = 1 := by
  simpa [dephaseRowFactor, Complex.star_def] using hH i (Sum.inl 0)

theorem dephaseColumnFactor_unit {H : Mat6} (hH : EntrywiseUnit H) (j : I6) :
    Complex.normSq (dephaseColumnFactor H j) = 1 := by
  simp [dephaseColumnFactor, Complex.normSq_mul, Complex.star_def,
    hH (Sum.inl 0) j, hH (Sum.inl 0) (Sum.inl 0)]

theorem dephase_isDephased {H : Mat6} (hH : EntrywiseUnit H) :
    IsDephased (dephase H) := by
  have h00 := star_mul_self_of_normSq_one
    (hH (Sum.inl 0) (Sum.inl 0))
  constructor
  · intro j
    simp only [dephase, phaseTransform, dephaseRowFactor,
      dephaseColumnFactor]
    calc
      star (H (Sum.inl 0) (Sum.inl 0)) * H (Sum.inl 0) j *
          (star (H (Sum.inl 0) j) * H (Sum.inl 0) (Sum.inl 0)) =
        (star (H (Sum.inl 0) j) * H (Sum.inl 0) j) *
          (star (H (Sum.inl 0) (Sum.inl 0)) *
            H (Sum.inl 0) (Sum.inl 0)) := by ring
      _ = 1 := by rw [star_mul_self_of_normSq_one (hH _ _), h00]; norm_num
  · intro i
    simp only [dephase, phaseTransform, dephaseRowFactor,
      dephaseColumnFactor]
    calc
      star (H i (Sum.inl 0)) * H i (Sum.inl 0) *
          (star (H (Sum.inl 0) (Sum.inl 0)) *
            H (Sum.inl 0) (Sum.inl 0)) = 1 := by
        rw [star_mul_self_of_normSq_one (hH _ _), h00]
        norm_num

theorem dephase_isHadamard {H : Mat6} (hH : IsHadamard H) :
    IsHadamard (dephase H) :=
  phaseTransform_isHadamard
    (fun i ↦ dephaseRowFactor_unit hH.1 i)
    (fun j ↦ dephaseColumnFactor_unit hH.1 j) hH

theorem equivalent_dephase {H : Mat6} (hH : EntrywiseUnit H) :
    Equivalent H (dephase H) :=
  equivalent_phaseTransform
    (fun i ↦ dephaseRowFactor_unit hH i)
    (fun j ↦ dephaseColumnFactor_unit hH j)

end Hadamard6
