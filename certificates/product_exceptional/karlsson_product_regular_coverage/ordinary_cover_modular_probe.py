#!/usr/bin/env python3
"""Finite-field probe of the four-frame ordinary Karlsson cover.

The existing Karlsson containment theorem proves the determinant and
finite-fibre guards for the mixed/mixed corner and its two noncanonical row
and column orientations.  This script studies only the missing actual-lift
guards: Gram imbalance, coordinate simplicity, and companion denominators.

It is a discovery calculation, not the final characteristic-zero proof.
"""

from __future__ import annotations

import sympy as sp


PRIME = 7
K_VALUE = 2  # 2^2 = -3 mod 7, representing i*sqrt(3)

U, V, P, Z1, Z2, Z3, Z4, K = sp.symbols(
    "u v p z1 z2 z3 z4 k", nonzero=True
)
VARIABLES = (U, V, P, Z1, Z2, Z3, Z4)
RELATION_ORDER = (Z4, Z3, Z2, U, V, P, Z1)


def star(expression):
    return expression.xreplace({
        P: 1/P,
        Z1: 1/Z1,
        Z2: 1/Z2,
        Z3: 1/Z3,
        Z4: 1/Z4,
        K: -K,
    })


def blocks():
    f2 = sp.Matrix([[1, 1], [1, -1]])
    lam = sp.Matrix([[U, P*V], [V/P, -U]])
    a = f2*(-sp.eye(2)/2 + K*lam/2)
    b = -f2-a
    return f2, a, b


def z_right(z):
    return sp.Matrix([[1, 1], [z, -z]])


def z_left(z):
    return sp.Matrix([[1, z], [1, -z]])


def karlsson_matrix():
    f2, a, b = blocks()
    z1m, z2m = z_right(Z1), z_right(Z2)
    z3m, z4m = z_left(Z3), z_left(Z4)
    return sp.Matrix.vstack(
        sp.Matrix.hstack(f2, z1m, z2m),
        sp.Matrix.hstack(z3m, z3m*a*z1m/2, z3m*b*z2m/2),
        sp.Matrix.hstack(z4m, z4m*b*z1m/2, z4m*a*z2m/2),
    )


def redephase(matrix, rows, columns):
    row_order = rows + tuple(i for i in range(6) if i not in rows)
    column_order = columns + tuple(j for j in range(6) if j not in columns)
    permuted = matrix.extract(row_order, column_order)
    pivot = permuted[0, 0]
    return sp.Matrix(6, 6, lambda i, j:
        permuted[i, j]*pivot/(permuted[i, 0]*permuted[0, j])
    )


def companion_denominator(x, s, sb, t, tb, r, rb):
    y = sp.symbols("y", nonzero=True)
    h = (x-s)*(1/y-tb)*(y/x-r)
    hb = (1/x-sb)*(y-t)*(x/y-rb)
    sigma2 = (x-s)*(1/x-sb)
    delta2 = (y-t)*(1/y-tb)
    psi2 = (y/x-r)*(x/y-rb)
    first = sp.Poly(sp.cancel(x*y*(h-hb)), y)
    second = sp.Poly(
        sp.cancel(x*y*(h-4+sigma2+delta2+psi2)), y
    )
    f0, f1, f2 = (first.coeff_monomial(y**j) for j in range(3))
    g0, g1, g2 = (second.coeff_monomial(y**j) for j in range(3))
    return sp.expand(f2*g1-f1*g2)


def missing_side_guards(block):
    xs = tuple(block[1, j] for j in range(3))
    ys = tuple(block[2, j] for j in range(3))
    s, t = sum(xs), sum(ys)
    sb, tb = star(s), star(t)
    r = sum(star(xs[j])*ys[j] for j in range(3))
    rb = star(r)
    denominator = companion_denominator(sp.Symbol("x"), s, sb, t, tb, r, rb)
    x_symbol = next(symbol for symbol in denominator.free_symbols if symbol.name == "x")
    guards = [r*rb-t*tb]
    guards.extend(xs[i]-xs[j] for i in range(3) for j in range(i+1, 3))
    guards.extend(denominator.subs(x_symbol, root) for root in xs)
    return guards


def modular_polynomial(expression):
    numerator = sp.together(expression.subs(K, K_VALUE)).as_numer_denom()[0]
    return sp.Poly(sp.expand(numerator), *VARIABLES, modulus=PRIME)


def side_witness(block, relation_basis):
    guards = missing_side_guards(block)
    witness = sp.Poly(1, *VARIABLES, modulus=PRIME)
    for guard in guards:
        polynomial = modular_polynomial(guard)
        if polynomial.is_zero:
            raise AssertionError("a missing guard vanished identically")
        if len(polynomial.terms()) == 1:
            continue
        product = (witness*polynomial).as_expr()
        witness = sp.Poly(
            relation_basis.reduce(product)[1], *VARIABLES, modulus=PRIME
        )
    return witness.monic()


def mobius_relations():
    _f2, a, b = blocks()

    def relation(core, source, target):
        numerator = core[0, 1]**2*source**2-core[0, 0]**2
        denominator = star(core[0, 0])**2*source**2-star(core[0, 1])**2
        return modular_polynomial(target**2*denominator-numerator)

    return (
        relation(a, Z1, Z3),
        relation(b, Z2, Z3),
        relation(b, Z1, Z4),
        relation(a, Z2, Z4),
    )


def main():
    matrix = karlsson_matrix()
    row_orders = ((0, 2, 3), (0, 3, 2))
    relations = [
        sp.Poly(U**2+V**2-1, *VARIABLES, modulus=PRIME),
        *mobius_relations(),
    ]
    relation_basis = sp.groebner(
        [item.as_expr() for item in relations],
        *RELATION_ORDER, modulus=PRIME, order="lex",
    )
    print(
        "relation stats:",
        [(item.total_degree(), len(item.terms())) for item in relations],
        f"basis={len(relation_basis.polys)}",
        flush=True,
    )

    horizontal = []
    vertical = []
    for rows in row_orders:
        chart = redephase(matrix, rows, row_orders[0])
        witness = side_witness(chart[:3, 3:], relation_basis)
        horizontal.append(witness)
        print(
            f"horizontal {rows}: degree={witness.total_degree()}, "
            f"terms={len(witness.terms())}",
            flush=True,
        )
    for columns in row_orders:
        chart = redephase(matrix, row_orders[0], columns)
        witness = side_witness(chart[3:, :3].T, relation_basis)
        vertical.append(witness)
        print(
            f"vertical {columns}: degree={witness.total_degree()}, "
            f"terms={len(witness.terms())}",
            flush=True,
        )

    for label, witnesses in (("horizontal", horizontal), ("vertical", vertical)):
        basis = sp.groebner(
            [item.as_expr() for item in relations+witnesses],
            *VARIABLES, modulus=PRIME, order="grevlex",
        )
        print(f"{label} common-failure basis size={len(basis.polys)}", flush=True)
        for polynomial in basis.polys:
            expression = polynomial.as_expr()
            if expression in (V, U, P-1):
                print(f"{label} boundary generator: {expression}")
    print("ORDINARY KARLSSON MODULAR COVER PROBE COMPLETE")


if __name__ == "__main__":
    main()
