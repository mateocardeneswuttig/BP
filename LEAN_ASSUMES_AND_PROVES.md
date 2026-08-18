# What Lean assumes and what it proves

The public endpoint is `Hadamard6/PaperTheorem.lean`. Its classification
theorems take exactly two explicit literature-facing arguments, matching the
two items in Proposition 7 of the manuscript.

## Assumes

1. `PublishedCubicRootCriterion`: a dephased order-six Hadamard with a
   noninitial cubic-root row and a noninitial cubic-root column lies in the
   Tao orbit or in the intrinsic `H₂`-reducible sector.

2. `KarlssonRawOrSeamCoverage`: every `H₂`-reducible order-six Hadamard has
   either a canonical presentation in Karlsson's raw coordinates or an
   affine-Fourier (possibly transposed) seam presentation.

The second proposition is the concrete coordinate form of Karlsson's complete
parametrization of the `H₂`-reducible matrices. Its conclusion is not an
abstract family name: `CanonicalKarlssonRawPresentation` contains the explicit
raw matrix and its phase conditions, while `IsAffineFourierSeam` is defined by
equivalence to a displayed affine-Fourier matrix or its transpose.

Both propositions are ordinary theorem parameters. They are not Lean `axiom`
declarations, opaque witnesses, or predicates defined in terms of the desired
classification conclusion. Consequently the formal result is correctly read
as: *the two published structural inputs imply the complete finite-corner
classification*.

## Proves internally

From those inputs Lean proves:

- Hadamard equivalence and invariance of every public predicate;
- the singular-corner reduction and normalized fixed-Gram fibre trichotomy;
- complementary-block sign reversal, corner routing, and Fourier-block
  closure;
- the explicit Tao orbit and its finite-corner witness;
- exact finite-corner certificates on the regular Karlsson chart;
- exact finite-corner certificates for every affine-Fourier seam, including
  transpose transfer;
- forced completion and retained-output Hadamard soundness;
- `HasFiniteCorner H ↔ InFiniteCornerAtlas H`;
- the universal finite-corner theorem; and
- matrix-level and equivalence-class-level two-sided classification
  equalities.

The finite-corner definition matches the manuscript: it requires finite,
nonempty, invertible horizontal and vertical candidate fibres containing the
actual adjacent blocks. It does not require the seed block `E` to be
invertible; the completion formula inverts the adjacent block `B`.

The longer `H2...` modules derive an intrinsic normalization, canonical raw
coordinates, and a small exceptional-core remainder. They are useful
supporting formal mathematics, but the paper-facing theorem deliberately uses
Karlsson's complete published parametrization directly. This keeps the
formal trust boundary identical to the manuscript instead of introducing a
third, library-specific literature interface.

## Does not prove

Lean does not formalize either of the two published inputs themselves. It
also does not formalize:

- the construction-level comparison with Szöllősi's Construction 3.1;
- the generic quadratic--cubic reconstruction geometry;
- nonsplitting of the product cover;
- the physical seed-domain theorem;
- global product-regular reach; or
- the illustrative ramification seed.

The retained post-classification calculations are instead supplied in
`certificates/`, with a SHA-256 manifest and a one-command verifier. They are
not represented as Lean theorems.

## Trust statement

The project contains no `sorry`, `admit`, project-defined `axiom` or
`constant`, source-level `opaque` or `unsafe` declaration, or unchecked
`native_decide`. `#print axioms` on the nine public endpoints reports only
the ordinary Lean/Mathlib foundations `propext`, `Classical.choice`, and
`Quot.sound`. Those reports certify the proof terms after the two theorem
parameters are supplied; they do not certify the historical papers.
