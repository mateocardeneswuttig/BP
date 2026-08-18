# Paper claim and verification audit

This file records the proof boundary after the August 2026 manuscript audit.
It is intentionally organized by mathematical claim rather than by the
history of the exploratory computation.

| Paper claim | Status | Verification source |
|---|---|---|
| Complete finite-corner classification (Theorem 6) | Exact, conditional only on the two published structural inputs displayed in Proposition 7 | Printed proof and `Hadamard6/PaperTheorem.lean` |
| Soundness and exact retained output | Exact | Printed direct-completion proof and Lean |
| Karlsson finite-corner coverage | Exact | Printed reduction; generated resultant and Bernstein identities are kernel checked in Lean |
| Tao finite-corner witness | Exact | Printed calculation and Lean |
| Szöllősi sector identification and Conjecture 4.2 | Exact mathematical consequence, not Lean formalized | Printed fixed-corner comparison plus the classification theorem |
| Product quadratic/cubic reconstruction | Exact | Printed identities and `generic_cover/product_cubic_*.py` |
| Generic cover is nonsplit | Exact | Printed square-free specialization and `generic_cover/product_discriminant_check.py` |
| Horizontal and vertical covers have the same branch function | Exact | `generic_cover/horizontal_vertical_cover_check.py` |
| Complement positivity, including `omega_n = 0` | Exact | Printed proof and `generic_cover/positivity_lemma_reduction.py` |
| Generic lower-block minus matching | Exact | Printed irreducibility/dominance proof; `generic_cover/exact_lower_block_specialization.py` verifies nonempty regular localization and excludes the plus matching |
| Regular seed-domain theorem (Theorem 21) | Exact | Printed proof plus the five generic-cover certificates above; the dominance step cites Bondal--Zhdanovskiy and semialgebraic Hardt triviality |
| Product-regular reach outside Karlsson and Tao (Theorem 22) | Exact | Printed `100 > 80` proof, including the biunimodular endpoint reduction and Cayley sign argument; all six files in `product_escape/` verify the algebraic and finite subclaims |
| Representative ramification seed and table | Rigorous exact/interval diagnostic, explicitly not a theorem about a neighborhood | `ramification/ramification_seed_certificate.py` |
| Section IV figure | Numerical illustration only | `figure/` sources, component data, component PDFs, and final vector asset |

## Lean boundary

Lean is used only for the classification. Its public endpoint has two visible
theorem parameters:

1. `PublishedCubicRootCriterion`;
2. `KarlssonRawOrSeamCoverage`, the concrete coordinate form of the published
   complete `H_2`--Karlsson parametrization.

The post-classification product geometry is deliberately absent from the Lean
dependency graph. It is supported by the smaller exact and interval
certificates in this directory.

## Claims removed to minimize certification

The audit removed the following stronger but unnecessary assertions from the
manuscript and its Supplemental Material:

- a unique product-exceptional Karlsson class;
- global product exceptionality of Tao;
- a complete `14,400`-frame census for those assertions;
- framed Karlsson noncontainment and its unprinted degree-five/degree-eight
  factorization;
- the `13,632`-frame and `720`-ramified-frame numerical census at the example
  seed.

None is needed for the classification, Szöllősi's conjecture, the regular
seed-domain theorem, or product-regular reach outside the named sectors.

## No frozen solver output

Every retained script reconstructs its polynomial or finite enumeration and
checks the claimed result. No manuscript theorem relies on an unverified
solver transcript, cached Gröbner basis, or unprinted factorization.
