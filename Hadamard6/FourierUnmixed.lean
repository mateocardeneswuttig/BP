import Hadamard6.FourierBlockCoordinates

/-!
# The two unmixed Fourier cases
-/

namespace Hadamard6

theorem three_dft_zero
    {ω x₀ x₁ x₂ : ℂ} (hω : ω ^ 2 + ω + 1 = 0)
    (h₀ : x₀ + x₁ + x₂ = 0)
    (h₁ : x₀ + ω * x₁ + ω ^ 2 * x₂ = 0)
    (h₂ : x₀ + ω ^ 2 * x₁ + ω * x₂ = 0) :
    x₀ = 0 ∧ x₁ = 0 ∧ x₂ = 0 := by
  have hx₀3 : (3 : ℂ) * x₀ = 0 := by
    linear_combination h₀ + h₁ + h₂ - (x₁ + x₂) * hω
  have hx₀ : x₀ = 0 :=
    (mul_eq_zero.mp hx₀3).resolve_left (by norm_num)
  have hx₂ : x₂ = -x₁ := by
    rw [hx₀, zero_add] at h₀
    exact eq_neg_of_add_eq_zero_right h₀
  have hcoef : (ω - ω ^ 2) * x₁ = 0 := by
    rw [hx₀, zero_add, hx₂] at h₁
    linear_combination h₁
  have hne : ω - ω ^ 2 ≠ 0 := by
    rw [sub_ne_zero]
    intro heq
    have hωnz : ω ≠ 0 := by
      intro hz
      rw [hz] at hω
      norm_num at hω
    have : ω * 1 = ω * ω := by simpa [pow_two] using heq
    exact quadratic_ne_one hω (mul_left_cancel₀ hωnz this).symm
  have hx₁ : x₁ = 0 := (mul_eq_zero.mp hcoef).resolve_left hne
  exact ⟨hx₀, hx₁, by simpa [hx₁] using hx₂⟩

theorem Ahat₀_zero
    {ω p q : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hp : Complex.normSq p = 1) (hq : Complex.normSq q = 1) :
    seqA₀ ω p q + seqA₁ ω p q + seqA₂ ω p q = 0 := by
  have hsω := star_eq_square_of_quadratic_unit hωu hω
  have hsω2 := star_square_eq_of_quadratic_unit hωu hω
  have hp' := star_mul_self_of_normSq_one hp
  have hq' := star_mul_self_of_normSq_one hq
  have h3 := cubic_of_quadratic hω
  unfold IsCubicRoot at h3
  have h4 : ω ^ 4 = ω := by
    calc
      ω ^ 4 = ω * ω ^ 3 := by ring
      _ = ω := by rw [h3, mul_one]
  simp only [seqA₀, seqA₁, seqA₂, vHat₀, vHat₁, vHat₂,
    star_add, star_mul, star_one]
  rw [hsω, hsω2]
  ring_nf
  rw [h3, h4]
  ring_nf
  linear_combination
    (3 + p + p * star q + star p + star p * q + star q + q) * hω +
    (3 * ω) * hp' + (3 * ω ^ 2) * hq'

theorem Ahat_both_zero_gives_seqA_zero
    {ω p q : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hp : Complex.normSq p = 1) (hq : Complex.normSq q = 1)
    (h₁ : Ahat₁ ω p q = 0) (h₂ : Ahat₂ ω p q = 0) :
    seqA₀ ω p q = 0 ∧ seqA₁ ω p q = 0 ∧ seqA₂ ω p q = 0 := by
  exact three_dft_zero hω (Ahat₀_zero hωu hω hp hq)
    (by simpa [Ahat₁] using h₁) (by simpa [Ahat₂] using h₂)

theorem vHat_sum (ω p q : ℂ) (hω : ω ^ 2 + ω + 1 = 0) :
    vHat₀ p q + vHat₁ ω p q + vHat₂ ω p q = 3 := by
  simp only [vHat₀, vHat₁, vHat₂]
  linear_combination (p + q) * hω

theorem vHat_support_singleton_of_seqA_zero
    {ω p q : ℂ} (_hω : ω ^ 2 + ω + 1 = 0)
    (hA : seqA₀ ω p q = 0 ∧ seqA₁ ω p q = 0 ∧ seqA₂ ω p q = 0) :
    (vHat₁ ω p q = 0 ∧ vHat₂ ω p q = 0) ∨
      (vHat₀ p q = 0 ∧ vHat₂ ω p q = 0) ∨
      (vHat₀ p q = 0 ∧ vHat₁ ω p q = 0) := by
  rcases hA with ⟨hA₀, hA₁, hA₂⟩
  simp only [seqA₀, seqA₁, seqA₂] at hA₀ hA₁ hA₂
  have hpair₀ := mul_eq_zero.mp hA₀
  have hpair₁ := mul_eq_zero.mp hA₁
  have hpair₂ := mul_eq_zero.mp hA₂
  simp only [star_eq_zero] at hpair₀ hpair₁ hpair₂
  by_cases h₀ : vHat₀ p q = 0
  · by_cases h₁ : vHat₁ ω p q = 0
    · exact Or.inr (Or.inr ⟨h₀, h₁⟩)
    · have h₂ : vHat₂ ω p q = 0 := hpair₂.resolve_right h₁
      exact Or.inr (Or.inl ⟨h₀, h₂⟩)
  · have h₁ : vHat₁ ω p q = 0 := hpair₁.resolve_right h₀
    have h₂ : vHat₂ ω p q = 0 := hpair₀.resolve_left h₀
    exact Or.inl ⟨h₁, h₂⟩

theorem parameters_of_vHat₀_support
    {ω p q : ℂ} (hω : ω ^ 2 + ω + 1 = 0)
    (h₁ : vHat₁ ω p q = 0) (h₂ : vHat₂ ω p q = 0) :
    p = 1 ∧ q = 1 := by
  have hd : (ω - ω ^ 2) * (p - q) = 0 := by
    simp only [vHat₁, vHat₂] at h₁ h₂
    linear_combination h₁ - h₂
  have hne : ω - ω ^ 2 ≠ 0 := by
    rw [sub_ne_zero]
    intro heq
    have hωnz : ω ≠ 0 := by
      intro hz; rw [hz] at hω; norm_num at hω
    have : ω * 1 = ω * ω := by simpa [pow_two] using heq
    exact quadratic_ne_one hω (mul_left_cancel₀ hωnz this).symm
  have hpq : p = q := sub_eq_zero.mp ((mul_eq_zero.mp hd).resolve_left hne)
  rw [hpq] at h₁
  simp only [vHat₁] at h₁
  have hq1 : q = 1 := by
    have : q - 1 = 0 := by linear_combination q * hω - h₁
    exact sub_eq_zero.mp this
  exact ⟨hpq.trans hq1, hq1⟩

theorem parameters_of_vHat₁_support
    {ω p q : ℂ} (hω : ω ^ 2 + ω + 1 = 0)
    (h₀ : vHat₀ p q = 0) (h₂ : vHat₂ ω p q = 0) :
    p = ω ^ 2 ∧ q = ω := by
  have he : (ω ^ 2 - ω) * (p - ω ^ 2) = 0 := by
    simp only [vHat₀, vHat₂] at h₀ h₂
    have hcub := cubic_of_quadratic hω
    unfold IsCubicRoot at hcub
    have h4 : ω ^ 4 = ω := by
      calc
        ω ^ 4 = ω * ω ^ 3 := by ring
        _ = ω := by rw [hcub, mul_one]
    ring_nf
    rw [h4, hcub]
    ring_nf
    linear_combination h₂ - ω * h₀
  have hne : ω ^ 2 - ω ≠ 0 := by
    rw [sub_ne_zero]
    intro heq
    have hωnz : ω ≠ 0 := by
      intro hz; rw [hz] at hω; norm_num at hω
    have : ω * ω = ω * 1 := by simpa [pow_two] using heq
    exact quadratic_ne_one hω (mul_left_cancel₀ hωnz this)
  have hp := sub_eq_zero.mp ((mul_eq_zero.mp he).resolve_left hne)
  have hq : q = ω := by
    simp only [vHat₀] at h₀
    rw [hp] at h₀
    have : q - ω = 0 := by linear_combination h₀ - hω
    exact sub_eq_zero.mp this
  exact ⟨hp, hq⟩

theorem parameters_of_vHat₂_support
    {ω p q : ℂ} (hω : ω ^ 2 + ω + 1 = 0)
    (h₀ : vHat₀ p q = 0) (h₁ : vHat₁ ω p q = 0) :
    p = ω ∧ q = ω ^ 2 := by
  have he : (ω - ω ^ 2) * (p - ω) = 0 := by
    simp only [vHat₀, vHat₁] at h₀ h₁
    have hcub := cubic_of_quadratic hω
    unfold IsCubicRoot at hcub
    linear_combination h₁ - ω ^ 2 * h₀ + hcub
  have hne : ω - ω ^ 2 ≠ 0 := by
    rw [sub_ne_zero]
    intro heq
    have hωnz : ω ≠ 0 := by
      intro hz; rw [hz] at hω; norm_num at hω
    have : ω * 1 = ω * ω := by simpa [pow_two] using heq
    exact quadratic_ne_one hω (mul_left_cancel₀ hωnz this).symm
  have hp := sub_eq_zero.mp ((mul_eq_zero.mp he).resolve_left hne)
  have hq : q = ω ^ 2 := by
    simp only [vHat₀] at h₀
    rw [hp] at h₀
    have : q - ω ^ 2 = 0 := by linear_combination h₀ - hω
    exact sub_eq_zero.mp this
  exact ⟨hp, hq⟩

theorem fourierNormalForm_hasTwoByTwo_of_D_neg_one
    {ω p q r s : ℂ} {D : Mat3} {a j : I3}
    (hD : D a j = -1) :
    HasHadamardTwoByTwo (fourierNormalForm ω p q r s D) := by
  let rows : I2 ↪ I6 :=
    pairEmbedding (Sum.inl 0) (Sum.inr a) (by simp)
  let cols : I2 ↪ I6 :=
    pairEmbedding (Sum.inl 0) (Sum.inr j) (by simp)
  refine ⟨rows, cols, ?_⟩
  have heq : (fourierNormalForm ω p q r s D).submatrix rows cols =
      rowHadamard2 1 := by
    ext i k
    fin_cases i <;> fin_cases k <;>
      simp [rows, cols, fourierNormalForm, fourier3, rowGauge,
        columnGauge, fourierParameters, rowHadamard2, hD]
  rw [heq]
  exact rowHadamard2_isHadamard2 (by norm_num)

theorem fourierForcedD_neg_one_of_vHat₀_support
    {ω r s : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    fourierForcedD ω 1 1 r s 0 0 = -1 := by
  have hz : 1 + ω + ω ^ 2 = 0 := by linear_combination hω
  have hz' : 1 + ω ^ 2 + ω = 0 := by linear_combination hω
  simp [fourierForcedD, dftEntry₀, zCol₀, vHat₀, vHat₁, vHat₂,
    dft₀, hz, hz']
  norm_num

theorem fourierForcedD_neg_one_of_vHat₁_support
    {ω r s : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    fourierForcedD ω (ω ^ 2) ω r s 0 1 = -1 := by
  have h3 := cubic_of_quadratic hω
  unfold IsCubicRoot at h3
  have h4 : ω ^ 4 = ω := by calc
    ω ^ 4 = ω * ω ^ 3 := by ring
    _ = ω := by rw [h3, mul_one]
  have hz0 : vHat₀ (ω ^ 2) ω = 0 := by
    simp [vHat₀]; linear_combination hω
  have hz1 : vHat₁ ω (ω ^ 2) ω = 3 := by
    simp [vHat₁]
    ring_nf
    rw [h3]
    norm_num
  have hz2 : vHat₂ ω (ω ^ 2) ω = 0 := by
    simp [vHat₂]
    ring_nf
    rw [h4]
    linear_combination hω
  simp [fourierForcedD, dftEntry₀, zCol₁, dft₀, hz0, hz1, hz2]

theorem fourierForcedD_neg_one_of_vHat₂_support
    {ω r s : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    fourierForcedD ω ω (ω ^ 2) r s 0 2 = -1 := by
  have h3 := cubic_of_quadratic hω
  unfold IsCubicRoot at h3
  have h4 : ω ^ 4 = ω := by calc
    ω ^ 4 = ω * ω ^ 3 := by ring
    _ = ω := by rw [h3, mul_one]
  have hz0 : vHat₀ ω (ω ^ 2) = 0 := by
    simp [vHat₀]; linear_combination hω
  have hz1 : vHat₁ ω ω (ω ^ 2) = 0 := by
    simp [vHat₁]
    ring_nf
    rw [h4]
    linear_combination hω
  have hz2 : vHat₂ ω ω (ω ^ 2) = 3 := by
    simp [vHat₂]
    ring_nf
    rw [h3]
    norm_num
  simp [fourierForcedD, dftEntry₀, zCol₂, dft₀, hz0, hz1, hz2]

theorem Ahat_both_zero_hasTwoByTwo
    {ω p q r s : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hp : Complex.normSq p = 1) (hq : Complex.normSq q = 1)
    (h₁ : Ahat₁ ω p q = 0) (h₂ : Ahat₂ ω p q = 0) :
    HasHadamardTwoByTwo
      (fourierNormalForm ω p q r s (fourierForcedD ω p q r s)) := by
  have hseq := Ahat_both_zero_gives_seqA_zero hωu hω hp hq h₁ h₂
  rcases vHat_support_singleton_of_seqA_zero hω hseq with h0 | h1 | h2
  · rcases parameters_of_vHat₀_support hω h0.1 h0.2 with ⟨rfl, rfl⟩
    exact fourierNormalForm_hasTwoByTwo_of_D_neg_one
      (fourierForcedD_neg_one_of_vHat₀_support hω)
  · rcases parameters_of_vHat₁_support hω h1.1 h1.2 with ⟨rfl, rfl⟩
    exact fourierNormalForm_hasTwoByTwo_of_D_neg_one
      (fourierForcedD_neg_one_of_vHat₁_support hω)
  · rcases parameters_of_vHat₂_support hω h2.1 h2.2 with ⟨rfl, rfl⟩
    exact fourierNormalForm_hasTwoByTwo_of_D_neg_one
      (fourierForcedD_neg_one_of_vHat₂_support hω)

theorem nontrivial_dft_zero_gives_constant
    {ω x₀ x₁ x₂ : ℂ} (hω : ω ^ 2 + ω + 1 = 0)
    (h₁ : x₀ + ω * x₁ + ω ^ 2 * x₂ = 0)
    (h₂ : x₀ + ω ^ 2 * x₁ + ω * x₂ = 0) :
    x₀ = x₁ ∧ x₁ = x₂ := by
  have hd : (ω - ω ^ 2) * (x₁ - x₂) = 0 := by
    linear_combination h₁ - h₂
  have hne : ω - ω ^ 2 ≠ 0 := by
    rw [sub_ne_zero]
    intro heq
    have hωnz : ω ≠ 0 := by
      intro hz; rw [hz] at hω; norm_num at hω
    have : ω * 1 = ω * ω := by simpa [pow_two] using heq
    exact quadratic_ne_one hω (mul_left_cancel₀ hωnz this).symm
  have hx12 : x₁ = x₂ :=
    sub_eq_zero.mp ((mul_eq_zero.mp hd).resolve_left hne)
  rw [hx12] at h₁
  have hx02 : x₀ = x₂ := by
    have : x₀ - x₂ = 0 := by linear_combination h₁ - x₂ * hω
    exact sub_eq_zero.mp this
  have hx01 : x₀ = x₁ := hx02.trans hx12.symm
  exact ⟨hx01, hx12⟩

theorem cubic_root_eq_one_or_omega
    {ω z : ℂ} (hω : ω ^ 2 + ω + 1 = 0)
    (hz : IsCubicRoot z) : z = 1 ∨ z = ω ∨ z = ω ^ 2 := by
  have hω3 := cubic_of_quadratic hω
  unfold IsCubicRoot at hω3
  have hfac : (z - 1) * (z - ω) * (z - ω ^ 2) = z ^ 3 - 1 := by
    linear_combination (z - z ^ 2) * hω + (z - 1) * hω3
  unfold IsCubicRoot at hz
  have hprod : (z - 1) * (z - ω) * (z - ω ^ 2) = 0 := by
    rw [hfac, hz]
    ring
  rcases mul_eq_zero.mp hprod with hab | hc
  · rcases mul_eq_zero.mp hab with h1 | hωz
    · exact Or.inl (sub_eq_zero.mp h1)
    · exact Or.inr (Or.inl (sub_eq_zero.mp hωz))
  · exact Or.inr (Or.inr (sub_eq_zero.mp hc))

theorem alphaHat_both_zero_gives_parameters
    {ω r s : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hr : Complex.normSq r = 1) (hs : Complex.normSq s = 1)
    (h₁ : alphaHat₁ ω r s = 0) (h₂ : alphaHat₂ ω r s = 0) :
    (r = 1 ∧ s = 1) ∨
      (r = ω ^ 2 ∧ s = ω) ∨
      (r = ω ∧ s = ω ^ 2) := by
  have hconst := nontrivial_dft_zero_gives_constant hω
    (by simpa [alphaHat₁, alpha₀, alpha₁, alpha₂] using h₁)
    (by simpa [alphaHat₂, alpha₀, alpha₁, alpha₂] using h₂)
  have hrs : star r = s := hconst.1.trans hconst.2
  have hrs' : r = star s := by
    have := congrArg star hrs
    simpa using this
  have hprod : star r * (r * star s) * s = 1 := by
    have hr' := star_mul_self_of_normSq_one hr
    have hs' := star_mul_self_of_normSq_one hs
    calc
      star r * (r * star s) * s = (star r * r) * (star s * s) := by ring
      _ = 1 := by rw [hr', hs']; norm_num
  have scubic : IsCubicRoot s := by
    unfold IsCubicRoot
    calc
      s ^ 3 = s * s * s := by ring
      _ = star r * (r * star s) * s := by
        change s * s * s =
          (starRingEnd ℂ) r * (r * (starRingEnd ℂ) s) * s
        rw [hconst.1, hconst.2]
      _ = 1 := hprod
  rcases cubic_root_eq_one_or_omega hω scubic with hs1 | hsω | hsω2
  · left
    refine ⟨?_, hs1⟩
    rw [hrs', hs1]
    simp
  · right; left
    refine ⟨?_, hsω⟩
    rw [hrs', hsω, star_eq_square_of_quadratic_unit hωu hω]
  · right; right
    refine ⟨?_, hsω2⟩
    rw [hrs', hsω2]
    exact star_square_eq_of_quadratic_unit hωu hω

theorem fourierForcedD_neg_one_of_alpha₀_support
    {ω p q : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    fourierForcedD ω p q 1 1 0 0 = -1 := by
  rw [show fourierForcedD ω p q 1 1 0 0 =
      -(vHat₀ p q + vHat₂ ω p q + vHat₁ ω p q) / 3 by
    simp [fourierForcedD, dftEntry₀, zCol₀, dft₀]]
  rw [show vHat₀ p q + vHat₂ ω p q + vHat₁ ω p q = 3 by
    linear_combination vHat_sum ω p q hω]
  norm_num

theorem fourierForcedD_neg_one_of_alpha₁_support
    {ω p q : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    fourierForcedD ω p q (ω ^ 2) ω 1 0 = -1 := by
  have h3 := cubic_of_quadratic hω
  unfold IsCubicRoot at h3
  rw [show fourierForcedD ω p q (ω ^ 2) ω 1 0 =
      -(vHat₀ p q + ω ^ 3 * vHat₂ ω p q + ω ^ 3 * vHat₁ ω p q) / 3 by
    simp [fourierForcedD, dftEntry₁, zCol₀, dft₁]
    ring]
  rw [h3]
  rw [show vHat₀ p q + 1 * vHat₂ ω p q + 1 * vHat₁ ω p q = 3 by
    linear_combination vHat_sum ω p q hω]
  norm_num

theorem fourierForcedD_neg_one_of_alpha₂_support
    {ω p q : ℂ} (hω : ω ^ 2 + ω + 1 = 0) :
    fourierForcedD ω p q ω (ω ^ 2) 2 0 = -1 := by
  have h3 := cubic_of_quadratic hω
  unfold IsCubicRoot at h3
  rw [show fourierForcedD ω p q ω (ω ^ 2) 2 0 =
      -(vHat₀ p q + ω ^ 3 * vHat₂ ω p q + ω ^ 3 * vHat₁ ω p q) / 3 by
    simp [fourierForcedD, dftEntry₂, zCol₀, dft₂]
    ring]
  rw [h3]
  rw [show vHat₀ p q + 1 * vHat₂ ω p q + 1 * vHat₁ ω p q = 3 by
    linear_combination vHat_sum ω p q hω]
  norm_num

theorem alphaHat_both_zero_hasTwoByTwo
    {ω p q r s : ℂ}
    (hωu : Complex.normSq ω = 1) (hω : ω ^ 2 + ω + 1 = 0)
    (hr : Complex.normSq r = 1) (hs : Complex.normSq s = 1)
    (h₁ : alphaHat₁ ω r s = 0) (h₂ : alphaHat₂ ω r s = 0) :
    HasHadamardTwoByTwo
      (fourierNormalForm ω p q r s (fourierForcedD ω p q r s)) := by
  rcases alphaHat_both_zero_gives_parameters hωu hω hr hs h₁ h₂ with
    h0 | h1 | h2
  · rcases h0 with ⟨rfl, rfl⟩
    exact fourierNormalForm_hasTwoByTwo_of_D_neg_one
      (fourierForcedD_neg_one_of_alpha₀_support hω)
  · rcases h1 with ⟨rfl, rfl⟩
    exact fourierNormalForm_hasTwoByTwo_of_D_neg_one
      (fourierForcedD_neg_one_of_alpha₁_support hω)
  · rcases h2 with ⟨rfl, rfl⟩
    exact fourierNormalForm_hasTwoByTwo_of_D_neg_one
      (fourierForcedD_neg_one_of_alpha₂_support hω)

end Hadamard6
