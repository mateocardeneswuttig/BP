# Lean audit of the order-six classification

Start with `Hadamard6/PaperTheorem.lean`.  It is the human-readable audit
surface and follows the manuscript verbatim:

```text
Hadamard H
  -> if no finite corner, intrinsic Karlsson OR Tao      (routing)
  -> contradiction: both exceptional sectors have one   (close branches)
  -> retained finite-dilation output                     (completeness)
retained finite-dilation output -> Hadamard              (soundness)
  -> equality on equivalence classes                     (classification)
```

The same file has a separate theorem for non-Tao, non-Karlsson recovery by
our completed finite-dilation output.  Routing already forces a finite corner there, so
this theorem uses only the published cubic-root criterion.  The manuscript
then combines that result with its construction-level identification of the
complete finite nonexceptional Construction 3.1 output to obtain the (S/K/G)
form of Conjecture 4.2 in the final journal version (Conjecture 4.4 in arXiv
v1); that construction-level comparison is not represented by a
definitional Lean alias.

## Relation to the paper's two published inputs

The paper cites (1) the `H₂`--Karlsson parametrization theorem and (2) the
cubic-root row-and-column lemma. Lean uses the following exact residual
interfaces. They are ordinary theorem arguments, not project axioms or
opaque witnesses.

1. `PublishedCubicRootCriterion`: item (2), stated as Tao or the intrinsic
   Karlsson sector.
2. `IntrinsicKarlssonSeamIdentification`: the part of item (1) still needed
   after Lean has derived the intrinsic
   `H₂` normalization, canonical raw coordinates, the common Fourier point,
   and four literal exceptional cores; the input identifies those explicit
   remainders with the affine-Fourier or transposed-affine-Fourier seams.

`IsKarlssonConcrete H` means that `H` is Hadamard and intrinsically
`H₂`-reducible. The paper's item (1) is what licenses calling this the
Karlsson locus. Lean does not pretend that naming the predicate proves the
published parametrization theorem: its remaining constructional use is the
explicit seam-identification argument above.

Before using the second input Lean proves Karlsson's block normalization,
extracts the Hermitian involution and canonical raw coordinates, and reduces
the entire exceptional branch to the common Fourier point or four explicit
diagonal cores. It also proves that if one Möbius factor vanishes on a singly
degenerate curve, the reciprocal half-angle representative has the other
factor nonzero and is equivalent to the original matrix. Lean then applies
the exact regular-corner or affine-Fourier seam certificate.

Lean proves the singular-corner lemma, the fixed-Gram fibre analysis, block
routing, Fourier normalization, the explicit Tao witness, the regular
Karlsson and seam certificates, retained-output soundness, equivalence
invariance, and the final logical recombination.

## Why Lake reports thousands of jobs

The number printed by `lake build` is a build-scheduler count that includes
the pinned Mathlib dependency graph.  It is not a count of assumptions,
classification cases, or bespoke Hadamard proof obligations.  The public
argument is the short theorem spine above; the transitive modules contain its
detailed algebra and several large exact certificate tables.

The library root `Hadamard6.lean` intentionally imports only
`Hadamard6.PaperTheorem`. The intrinsic `H₂` derivation is in that public
dependency graph; unrelated experimental modules are not.

`CUBIC_CRITERION_FORMALIZATION.md` records the exact remaining criterion,
its relation to Szöllősi's lemma, and its five-step formalization route.

## Build and trust audit

With Elan installed:

```text
lake build Hadamard6.PaperTheorem
lake build
python3 audit_public_theorem.py
```

The public file prints the axiom dependencies of all nine paper-facing
endpoints. A successful audit contains no `sorryAx`; the only reported
foundational principles are `propext`, `Classical.choice`, and `Quot.sound`.
This kernel report does not erase the two displayed theorem parameters; it
only verifies that no additional Lean axioms are hidden behind them.
The source tree is also checked for `sorry`, `admit`, project-defined
`axiom`/`constant`, source-level `opaque`/`unsafe` declarations, and unchecked
native-decision shortcuts.
