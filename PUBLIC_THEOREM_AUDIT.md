# Public Lean theorem audit

## Human-readable proof spine

`Hadamard6/PaperTheorem.lean` is intentionally short. Its principal proof now
uses the same contradiction structure as the manuscript:

```text
assume hfailed : not HasFiniteCorner H
paper_failed_corner_search_forces_karlsson_or_tao hcubic hH hfailed
  : IsKarlssonConcrete H ∨ IsTaoOrbit H

Karlsson branch -> paper_karlsson_has_finite_corner -> contradiction
Tao branch      -> paper_tao_has_finite_corner       -> contradiction
```

The result is `paper_finite_corner_theorem`.  Atlas membership and equality
are derived afterwards.  This ordering prevents the output definition from
doing any logical work in the witness theorem.

## Concrete predicates

- `IsKarlssonConcrete H` means exactly that `H` is Hadamard and contains a
  `2 x 2` Hadamard submatrix.  Karlsson's published theorem identifies this
  intrinsic locus with his complete three-parameter family.
- `IsTaoOrbit H` means that `H` is standard-equivalent to the displayed Tao
  matrix for a primitive cubic phase.
- `InFiniteCornerAtlas H` unfolds to a four-phase dephased seed, two finite
  nonempty normalized invertible candidate fibres, an actual candidate pair,
  the forced block and its entrywise-unit test, and equivalence to the
  completed matrix.

None is an opaque family placeholder.

## Exact assumption flow

`PublishedCubicRootCriterion` enters only where the Fourier calculation has
already produced a noninitial cubic-root row and column. Its conclusion is
stated exactly as Tao or `IsKarlssonConcrete`, matching the two sectors named
in the manuscript.

`KarlssonRawOrSeamCoverage` is the concrete coordinate form of the published
complete `H₂`--Karlsson parametrization. It says that an `H₂`-reducible
Hadamard has either a canonical raw Karlsson presentation or an
affine-Fourier seam presentation. Lean then checks the reciprocal orientation,
selection of nonzero `M₊`, and the finite-corner certificates for both pieces.

The theorem `paper_nonexceptional_completed_dilation_recovery` excludes Karlsson and
Tao in its hypotheses, so the routing disjunction closes it without the
Karlsson coverage input.  It deliberately does not call this predicate
`G_6^(4)`: the manuscript's separate construction-level output-identification
proposition is what converts completed-output recovery into the three-sector
conjecture.

## Kernel and source audit

The public file prints axiom reports for nine endpoints.  A passing build must
show only:

```text
propext, Classical.choice, Quot.sound
```

The source audit separately rejects `sorry`, `admit`, project-defined
`axiom`/`constant`, source-level `opaque`/`unsafe` declarations, and unchecked
native-decision shortcuts. The thousands figure shown by Lake is its
scheduler count including Mathlib, not a count of assumptions or bespoke
classification lemmas.

The axiom report concerns kernel dependencies. The cubic-root criterion and
complete Karlsson parametrization remain explicit arguments of the displayed
theorems, so a clean axiom report is not presented as an unconditional proof
of those two historical inputs.
