# Certificates for the reconstruction geometry

The Lean project at the repository root audits the classification theorem.
This directory is deliberately separate: it contains the smaller exact and
interval calculations used only by the post-classification geometry in
Section IV and its Supplemental Material.

No theorem depends on a cached CAS session or a frozen solver transcript.
Every retained calculation is reconstructed from the displayed equations and
fails by raising an exception if the claimed identity or bound is false.
`SHA256SUMS` fixes the audited contents of this directory, and the verifier
checks that manifest before running any calculation.

These programs certify the exact algebraic identities and finite enumerations
used by the printed proofs.  They are not substitutes for the human routing,
density, or sign arguments in the Supplemental Material; the claim map below
states that boundary explicitly.

## One-command verification

The certificate environment is tested in CI on 64-bit Ubuntu with Python
3.10. Create an isolated Python 3.10 environment, install the pinned packages,
and run:

```bash
python -m pip install -r certificates/requirements.txt
python certificates/verify.py
```

The default command verifies every theorem-facing calculation. It takes about
one minute on a recent laptop. The independent incidence checker uses only the
Python standard library and does not import SymPy.

The representative ramification seed is illustrative rather than
theorem-facing. Verify its exact and Arb bounds with:

```bash
python certificates/verify.py --ramification
```

To regenerate the numerical data and the two data-derived components of the
Section IV figure:

```bash
cd certificates/figure
python generate_transect.py 1201 0.06
python plot_figure_composite.py --out figure_stack.pdf
python plot_branch_collision.py --out branch_collision.pdf
```

The checked-in `data/transect.npz` file allows the branch-collision component to be
rendered without first recomputing its transect. The final publication vector
asset, `seed_geometry_manuscript.pdf`, combines these components with labels
and markers. It is checked in because the final typographic assembly was
performed in a vector editor; no numerical content was changed at that stage.

## Exact claim map

### Generic product cover

- `generic_cover/product_cubic_reduction.py` derives the uncancelled
  companion relation, fundamental sextic, product quadratic, cubic
  factorization, and self-inversive coefficient identities.
- `generic_cover/product_cubic_candidate_check.py` verifies the two trace
  equations for the companion coordinates in the cubic quotient algebra.
- `generic_cover/product_discriminant_check.py` verifies the residual
  discriminant, its sharp reality, and the nonsquare specialization used to
  prove that the generic cover does not split over the seed field.
- `generic_cover/horizontal_vertical_cover_check.py` verifies that the
  horizontal and vertical residual discriminants agree.
- `generic_cover/positivity_lemma_reduction.py` verifies every polynomial
  identity used in the complement-positivity lemma, including the repaired
  boundary case `omega_n = 0`.
- `generic_cover/exact_lower_block_specialization.py` performs only the
  finite jobs needed by the printed dominance proof: it proves the regular
  localization is nonempty and excludes the plus horizontal--vertical sheet
  matching at `(2,3,5,7)`. The global minus-sheet
  identity itself follows from the irreducibility-and-density argument in the
  Supplemental Material; this script is not presented as a four-variable
  characteristic-zero normal-form proof.

### Global product-regular reach

- `product_escape/product_regular_escape_reduction_check.py` verifies the
  local guard-reversal and repeated-coordinate reductions.
- `product_escape/bi_equimodular_core_check.py` verifies the exact normal
  forms and the dependent-curve identity.
- `product_escape/global_escape_incidence_check.py` verifies the 400-corner
  partition, sign reversal, and the combinatorial reduction used for the
  lower bound; the fixed-Gram trichotomy supplies its mathematical premise in
  the printed proof.
- `product_escape/zero_invariant_endpoint_check.py` enumerates all 12 exact
  candidates and all 144 pairings at the zero-invariant endpoint after the
  printed biunimodular reduction; exactly 108 have a flat fourth block, and
  every one is Karlsson or Tao.
- `product_escape/dependent_block_threshold_check.py` verifies the 24
  `S_6`-orbit calculation, the exact Cayley identities used in the physical
  range proof, and the determinant reductions used for `N_dep <= 80`.
- `product_escape/dependent_block_threshold_independent_check.py` rebuilds
  the same orbit table and rational elimination independently with
  `fractions.Fraction`.

### Representative ramification seed

- `ramification/ramification_seed_certificate.py` verifies the exact number
  field, branch equation, companion coprimality, transversality, and rigorous
  Arb enclosures used in the numerical table. It also excludes the Karlsson,
  Tao, and four-circulant-block diagnostics printed for this one matrix.
- The other files in `ramification/` are its reconstruction dependencies.

### Figure

`figure/` contains the source, component data, component PDFs, and final vector
asset for the Section IV plot. `plot_figure_composite.py` reconstructs the
five discriminant slices and torus; `plot_branch_collision.py` reconstructs
the inset. The figure is an illustration of the normalized discriminant; it is not used to
prove a theorem, estimate a global measure, or count equivalence classes.
