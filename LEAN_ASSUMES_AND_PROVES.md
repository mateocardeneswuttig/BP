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
