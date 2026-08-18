#!/usr/bin/env python3
"""Exact pullback of the product guards to the explicit 2-circulant model.

This is a symbolic discovery/audit script.  It does not assert nonvanishing;
it exposes the factors whose simultaneous physical zeros must be covered.
"""

from __future__ import annotations

from pathlib import Path
import sys

import sympy as sp


ATLAS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ATLAS))

import exact_lower_block_specialization as EL  # noqa: E402


B, G, E, P = sp.symbols("beta gamma epsilon phi", nonzero=True)
PHASES = (B, G, E, P)


def family_relation():
    return B*G*E**2+B*G*P+B**2*E*P+G*E*P+B*G**2*E*P+B*G*E*P**2


def star(value):
    return sp.cancel(value.xreplace({B: 1/B, G: 1/G, E: 1/E, P: 1/P}))


def x_matrix():
    b, g, e, p = B, G, E, P
    return sp.Matrix([
        [1, 1, 1, 1, 1, 1],
        [1, -1, -1/(g*e), -1/(b*p), 1/(g*e), 1/(b*p)],
        [1, -e/b, -1, -e/(g*p), e/(g*p), e/b],
        [1, -p/g, -p/(b*e), -1, p/g, p/(b*e)],
        [1, e/b, p/(b*e), 1/(b*p), 1/(b*g), g/b**2],
        [1, p/g, 1/(g*e), e/(g*p), b/g**2, 1/(b*g)],
    ])


def redephase(matrix, rows, columns):
    row_order = rows + tuple(i for i in range(6) if i not in rows)
    column_order = columns + tuple(j for j in range(6) if j not in columns)
    source = matrix.extract(row_order, column_order)
    pivot = source[0, 0]
    return sp.Matrix(6, 6, lambda i, j:
        sp.cancel(source[i, j]*pivot/(source[i, 0]*source[0, j])))


def numerator(value):
    return sp.Poly(sp.expand(sp.cancel(value).as_numer_denom()[0]), *PHASES)


def side_guards(block):
    xs = tuple(block[1, j] for j in range(3))
    ys = tuple(block[2, j] for j in range(3))
    s, t = sum(xs), sum(ys)
    sb, tb = star(s), star(t)
    r = sum(star(xs[j])*ys[j] for j in range(3))
    rb = star(r)
    substitution = {EL.s: s, EL.sb: sb, EL.t: t, EL.tb: tb, EL.r: r, EL.rb: rb}
    c6 = EL.FUNDAMENTAL_COEFFICIENTS[6].subs(substitution)
    delta = r*rb-t*tb
    discriminant = sp.prod(xs[i]-xs[j] for i in range(3) for j in range(i+1, 3))
    denominator = EL.B_GENERIC.subs(substitution)
    companion = sp.prod(denominator.subs(EL.x, root) for root in xs)
    return c6, delta, discriminant, companion


def primary_guard_expressions():
    chart = redephase(x_matrix(), (0, 1, 2), (0, 3, 4))
    expressions = [
        chart[:3, :3].det(), chart[:3, 3:].det(), chart[3:, :3].det(),
        *side_guards(chart[:3, 3:]),
        *side_guards(chart[3:, :3].T),
    ]
    return chart, tuple(expressions)


def primary_irreducible_factors():
    """Return the distinct nonmonomial guard factors over QQ."""
    _chart, expressions = primary_guard_expressions()
    unique = {}
    for expression in expressions:
        polynomial = numerator(expression)
        _constant, factors = sp.factor_list(polynomial.as_expr())
        for factor, _multiplicity in factors:
            item = sp.Poly(factor, *PHASES, domain=sp.QQ)
            if len(item.terms()) == 1:
                continue
            monic = item.monic()
            unique[tuple(sorted(monic.rep.to_dict().items()))] = monic.as_expr()
    return tuple(unique.values())


def report(label, value):
    polynomial = numerator(value)
    print(
        f"{label}: degree={polynomial.total_degree()} terms={len(polynomial.terms())}",
        flush=True,
    )
    print(sp.factor(polynomial.as_expr()), flush=True)


def main():
    chart, _expressions = primary_guard_expressions()
    report("det E", chart[:3, :3].det())
    report("det B", chart[:3, 3:].det())
    report("det C", chart[3:, :3].det())
    for direction, block in (
        ("horizontal", chart[:3, 3:]),
        ("vertical", chart[3:, :3].T),
    ):
        for name, value in zip(
            ("c6", "delta", "discriminant", "companion"),
            side_guards(block),
        ):
            report(f"{direction} {name}", value)
    report(
        "family relation",
        family_relation(),
    )
    print(f"distinct primary factors={len(primary_irreducible_factors())}")
    print("TWO-CIRCULANT PRODUCT-GUARD PULLBACK COMPLETE")


if __name__ == "__main__":
    main()
