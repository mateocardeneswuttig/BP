# Formalizing the published cubic-root criterion

## Exact remaining statement

The public theorem assumes the following paper-facing intrinsic proposition:

```text
PublishedCubicRootCriterion :=
  ∀ K, IsHadamard K →
    HasNoninitialCubicRootRowAndColumn K →
      IsTaoOrbit K ∨ IsKarlssonConcrete K
```

`HasNoninitialCubicRootRowAndColumn` already includes dephasing. The
invariant statement for an equivalent representative is derived internally,
so equivalence transport is not part of the literature input.

Here `IsKarlssonConcrete K` is `IsHadamard K ∧
HasHadamardTwoByTwo K`; the paper's first published structural input
identifies that intrinsic locus with Karlsson's complete block model.

This is the intrinsic interface extracted in the manuscript from journal
Lemma 2.14 (arXiv v1 Lemma 2.15) of Szöllősi's
[four-parameter paper](https://arxiv.org/abs/1008.0632). The name deliberately
does not claim that the displayed Lean proposition is a verbatim rendering of
the source's family notation. The source proof splits according to the cubic
value at the intersection of the distinguished row and column: `1`, `omega`,
or `omega^2`.

## What Lean already has

- cubic roots are exactly `1`, `omega`, and `omega^2`
  relative to either primitive cubic phase
  (`cubicRoot_eq_one_or_primitive_or_sq`);
- the Tao matrix and its ordinary equivalence orbit are explicit;
- Tao is Hadamard and has no Hadamard `2 x 2` submatrix;
- Hadamardness, the `H₂` predicate, and Tao-orbit membership are
  invariant under equivalence;
- row and column permutations, phase operations, and dephasing are explicit;
- a Hadamard `2 x 2` submatrix, together with the already available
  Hadamard hypothesis, constructs `IsKarlssonConcrete`.

Thus the remaining work is a finite normal-form argument, not new atlas
geometry and not a polynomial solver certificate.

## Source-proof decomposition

### 1. Normalize the distinguished row and column

Prove that after permutations preserving the first row and column, any
noninitial cubic row is

```text
(1, 1, omega, omega, omega^2, omega^2)
```

and similarly for the distinguished column. This follows from orthogonality
to the all-one row and the three-value cubic-root split.

The useful Lean output should be an explicit equivalent matrix together with
indices fixed to the second row and second column. Avoid a large existential
normal-form structure: one small theorem returning the representative and
its entry equations is easier to audit.

### 2. Intersection value `1`

With the source notation, orthogonality gives

```text
a + b = -omega
c + d = -1.
```

Unit modulus then forces, up to pair swaps,

```text
(a,b) = (1,-omega^2)
(c,d) = (omega,omega^2).
```

The remaining Hadamard equations force the displayed Tao matrix. The clean
formal target is a direct equivalence theorem to `taoMatrix omega`;
there is no need to classify arbitrary partial completions as a separate
datatype.

### 3. Intersection value `omega`

The source calculation gives a dichotomy:

- `a = -1`, which immediately exhibits a Hadamard `2 x 2`
  submatrix;
- or the relevant entries are cubic and a further cubic row and column meet
  at `1`, reducing to the preceding theorem.

Formalize the explicit orthogonality identity yielding this dichotomy, then
reuse the `1`-intersection theorem.

### 4. Intersection value `omega^2`

Obtain this case from the `omega` case by conjugation or by swapping
the two primitive cubic phases. Prove the transport once; do not duplicate
the entry calculation.

### 5. Public closure

Combine the three cases to construct a theorem term of
`PublishedCubicRootCriterion`. At that point the classification
endpoint will retain only `IntrinsicKarlssonSeamIdentification` as an
external argument.

## Recommended implementation order

1. cubic-row multiplicity and permutation normal form;
2. unit-circle two-sum lemmas used in the `1` case;
3. explicit Tao completion/equivalence theorem;
4. `omega`-intersection dichotomy;
5. conjugation transport and final assembly.

The first two stages are small and reusable. The Tao completion theorem is
the substantive finite calculation. It should remain entrywise and
human-readable; an automatically generated table is acceptable only as a
separate certificate imported by a short conceptual theorem.

## Honest scope

This is feasible but materially larger than the residual Karlsson seam
bridge. The published proof compresses “fill out the fourth row and the third
and fourth columns” into one sentence; Lean must make that uniqueness
calculation explicit. It should therefore be pursued after the seam bridge,
not interleaved with it.
