# Exact product-exceptional classes

This directory supports the strengthened product-regular reach theorem

```text
H_6 \ P_6 = T_6 disjoint-union {[H_x]}.
```

Here `P_6` is the set of equivalence classes admitting a product-regular
ordered `3 x 3` frame. The printed `100 > 80` argument covers every class
outside Karlsson and Tao. The files here certify the two remaining sectors.

## Fast all-frame audits

```bash
python certificates/product_exceptional/tao_product_exceptional_check.py
python certificates/product_exceptional/karlsson_product_regular_coverage/exact_product_exceptional_karlsson.py
python certificates/product_exceptional/karlsson_product_regular_coverage/sympy_verify_product_exceptional_karlsson.py
```

The Tao calculation is exact in the Eisenstein integers. The two independent
`H_x` calculations verify the displayed matrix and all `14,400` ordered
frames without numerical tolerances.

## Complete Karlsson singleton audit

The complete characteristic-zero audit of

```text
K_6^(3) \ P_6 = {[H_x]}
```

is run sequentially by

```bash
python certificates/verify.py --full-product-exceptional
```

This requires `msolve` in `PATH`, or an explicit executable supplied through
`MSOLVE_BIN`. The master runner checks the ordinary Karlsson chart, its 49
double-failure cases and rescue frames, the affine-Fourier boundary, the
two-circulant sector, and two independent all-frame audits of `H_x`. It uses
the theorem of Matszangosz--Szollosi concerning normalized matrices with
`-1` in three distinct columns as the published routing input identified in
the Supplemental Material.

Only theorem-facing source files are retained here; exploratory searches and
floating-point surveys are excluded.
