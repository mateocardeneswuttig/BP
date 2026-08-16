# What Lean assumes and what it proves

## Assumes

The paper cites two structural results: the `H₂`--Karlsson parametrization
and the cubic-root row-and-column lemma. At Lean's current boundary these
appear as two explicit residual propositions:

- `PublishedCubicRootCriterion`, the paper-facing cubic-root row-and-column
  implication to Tao or the intrinsic Karlsson locus;
- `IntrinsicKarlssonSeamIdentification`, the residual part of Karlsson's
  global theorem identifying the internally derived common/degenerate core
  remainders with affine-Fourier or transposed-affine-Fourier seams.

They are parameters, not axioms. The first is item (2) of the manuscript's
published-input proposition. The second is the exact part of item (1) that
remains after Lean has internally normalized the intrinsic Karlsson locus,
extracted canonical raw coordinates, and reduced the remainder to explicit
seam cores. It is therefore not an additional third literature assumption.
In particular, non-Tao, non-Karlsson recovery by our completed output needs only the
first input.  The paper's additional comparison with the complete finite
nonexceptional Construction 3.1 output (G_6^{(4)}) is outside this Lean audit.

## The seam assumption in detail

`PublishedCubicRootCriterion` can be compared directly against its source: it
is the manuscript's Proposition 7(2), and a reader can hold the two statements
side by side.  `IntrinsicKarlssonSeamIdentification` cannot be read that way.
It is stated in terms of two structures this development derives itself, so a
reader must first accept that those structures capture the degenerate cases of
the published parametrization.  This section records that correspondence
explicitly, because it is the one link in the audit chain that is otherwise
left to the reader's trust in the development's own bookkeeping.

Both clauses conclude `IsAffineFourierSeam H`, which is concrete: `H` is
equivalent to `affineFourierMatrix omega z₁ z₂` or to its transpose, where
`affineFourierMatrix` is a displayed matrix literal and its Hadamard property
is proved, not assumed.

### Clause 1: the common Fourier point

`IntrinsicKarlssonCommonFourierPresentation H` (`H2KarlssonParametrization.lean`)
carries four unimodular phases and the single equation

```text
Equivalent H (karlssonRawMatrix 1 1 z₁ z₂ z₃ z₄).
```

That is the raw Karlsson chart evaluated at the one parameter point
`(t, p) = (1, 1)`.  The regular chart excludes exactly this point, via the
field `not_common_fourier : ¬ (t = 1 ∧ p = 1)` of
`CanonicalKarlssonRawPresentation`.  It corresponds to the locus in the
manuscript's Proposition 15 where the phase-determining formulas of the
parametrization degenerate simultaneously.

Independent corroboration exists for this clause.  Numerically, the
unimodularity locus of `karlssonRawMatrix` is one-dimensional at generic
`(t, p)` — giving three continuous parameters in total, matching Karlsson's
three-real-parameter family — and jumps to two dimensions exactly at
`(t, p) = (1, 1)`, matching the two free phases of `affineFourierMatrix`.
Haagerup invariants of the two families agree there to grid resolution.  The
dimension count is therefore consistent on both sides of the identification.

### Clause 2: the four exceptional cores

`H2ExceptionalCorePresentation H` carries a normalized representative `K` and
the requirement that

```text
h2KarlssonLambda (h2ParameterA K) ∈ {1, -1, karlssonSign2, -karlssonSign2}
```

where `karlssonSign2` is `diag (1, -1)`.  These are the two scalar Hermitian
involutions and the two diagonal traceless involutions — the cases in which
the Möbius coordinates used by the regular chart are undefined.  Unfolding
`h2KarlssonLambda`, each of the four pins the `2 x 2` parameter block
`h2ParameterA K` to a cube-root dressing of the Fourier matrix `F₂`, which is
why the manuscript expects them to land in the affine-Fourier seam or its
transpose.

**This clause has not been independently checked.**  It rests on the
degenerate-case analysis of the published parametrization cited in
Proposition 7(1).  Unlike clause 1 it has no numerical corroboration recorded
here, and unlike `PublishedCubicRootCriterion` it has no formalization
roadmap.  A reader assessing the trust boundary should treat it as the least
scrutinized input of the development.

### Outstanding

Pinpoint citations are not yet supplied.  Proposition 7(1) of the manuscript
cites its sources for the parametrization as a whole, but neither the common
Fourier point nor the four exceptional cores is matched to a specific
statement in those sources.  Adding those two pointers would let a referee
check the seam assumption the same way the cubic criterion can already be
checked, and is the single cheapest improvement available to this document.

## Proves internally

- Hadamard equivalence and invariance of every concrete public predicate;
- singular `3 x 3` corner implies a `2 x 2` Hadamard submatrix;
- the normalized fixed-Gram fibre trichotomy, including the common-root case;
- complementary-block sign reversal and the block-swap routing theorem;
- simultaneous Fourier normalization and the exact cubic-criterion call site;
- the explicit Tao orbit and its complete finite-corner witness;
- finite-corner certificates on the regular Karlsson chart;
- intrinsic `H₂` block normalization, Hermitian-involution extraction,
  positive half-angle coordinates, canonical phase orientation, and the
  exact common-point/four-core exceptional split;
- the reciprocal half-angle equivalence and the fact that every singly
  degenerate Möbius point reaches that regular chart in one orientation;
- the six-corner affine-Fourier seam certificate and transpose transfer;
- forced completion and retained-output Hadamard soundness;
- `HasFiniteCorner H <-> InFiniteCornerAtlas H`;
- non-Tao, non-Karlsson recovery by the completed finite-dilation output;
- the universal finite-corner theorem; and
- the raw and quotient-level two-sided classification equalities.

The finite-corner definition now matches the manuscript exactly.  It requires
finite nonempty invertible horizontal and vertical candidate fibres, but does
not require the seed block `E` to be invertible; the completion formula
inverts `B`, not `E`.  The actual classification witnesses satisfy the
stronger invertible-seed property where that is needed in the routing proof.

## Does not prove

Lean does not formalize the cubic-root literature proposition, the
construction-level comparison with the nonexceptional Construction 3.1 output, or the final
explicit equivalences identifying its four derived degenerate cores with the
two affine-Fourier seams. It also does not formalize the separate
algebraic-atlas geometry (generic nonsplitting, ramification, and intersection
certificates). Those limits are explicit in the manuscript.

## Trust statement

The project contains no `sorry`, `admit`, project-defined `axiom` or
`constant`, source-level `opaque` or `unsafe` declaration, or unchecked native
decision. `#print axioms` on the nine public endpoints must
report only the ordinary Lean/Mathlib foundations `propext`,
`Classical.choice`, and `Quot.sound`. The two propositions listed above are
still visible theorem parameters; Lean's axiom report does not and cannot
certify them.
