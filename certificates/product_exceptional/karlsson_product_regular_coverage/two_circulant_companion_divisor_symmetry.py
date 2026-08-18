#!/usr/bin/env python3
"""Exact equivalences sending primary factors 13, 19 and 20 to factor 10.

Factor 10 is epsilon*gamma=1.  On each of factors 13, 19 and 20, the family
relation is a monomial copy of the same three-variable polynomial.  The
parameter changes below put the transformed tuple on factor 10, and fixed
row/column permutations plus redephasing identify the two X_6 matrices.
Thus product regularity (and equivalence to H_x) transport in both
directions, so the factor-10 certificate closes all four divisors.
"""

from __future__ import annotations

import sympy as sp

import two_circulant_guard_pullback as G


U, V, W = sp.symbols("u v w", nonzero=True)


def x_matrix(beta, gamma, epsilon, phi):
    return G.x_matrix().subs({
        G.B: beta, G.G: gamma, G.E: epsilon, G.P: phi,
    }, simultaneous=True)


def redephase_after_permutation(matrix, rows, columns):
    source = matrix.extract(rows, columns)
    pivot = source[0, 0]
    return sp.Matrix(6, 6, lambda i, j: sp.cancel(
        source[i, j]*pivot/(source[i, 0]*source[0, j])
    ))


def assert_matrix_identity(original, transformed, rows, columns):
    normalized = redephase_after_permutation(original, rows, columns)
    for actual, expected in zip(normalized, transformed):
        assert sp.cancel(actual-expected) == 0


def common_polynomial(beta, epsilon, phi):
    return (
        beta**2*epsilon**2*phi+beta*epsilon**2
        +beta*epsilon*phi**2+2*beta*phi+epsilon*phi
    )


def verify_factor13():
    # Independent variables are beta=u, epsilon=v, gamma=w; factor 13 gives
    # phi=epsilon*gamma/beta.
    beta, epsilon, gamma = U, V, W
    phi = epsilon*gamma/beta
    original = x_matrix(beta, gamma, epsilon, phi)
    transformed_parameters = (beta, beta/gamma, gamma/beta, phi)
    transformed = x_matrix(*transformed_parameters)
    assert sp.cancel(transformed_parameters[1]*transformed_parameters[2]-1) == 0
    assert_matrix_identity(
        original, transformed,
        (1, 0, 5, 4, 3, 2), (3, 5, 4, 0, 2, 1),
    )

    family = sp.factor(G.family_relation().subs({
        G.B: beta, G.G: gamma, G.E: epsilon, G.P: phi,
    }, simultaneous=True))
    target_core = common_polynomial(beta, gamma/beta, phi)
    assert sp.cancel(family-beta*epsilon*target_core) == 0


def verify_factor19():
    # factor 19 gives gamma=beta*epsilon.
    beta, epsilon, phi = U, V, W
    gamma = beta*epsilon
    original = x_matrix(beta, gamma, epsilon, phi)
    transformed_parameters = (beta, 1/epsilon, epsilon, epsilon/phi)
    transformed = x_matrix(*transformed_parameters)
    assert sp.cancel(transformed_parameters[1]*transformed_parameters[2]-1) == 0
    assert_matrix_identity(
        original, transformed,
        (1, 5, 4, 0, 3, 2), (3, 4, 0, 5, 2, 1),
    )

    source_core = common_polynomial(beta, epsilon, phi)
    target_core = common_polynomial(beta, epsilon, epsilon/phi)
    assert sp.cancel(source_core-(phi**2/epsilon)*target_core) == 0
    family = sp.factor(G.family_relation().subs({
        G.B: beta, G.G: gamma, G.E: epsilon, G.P: phi,
    }, simultaneous=True))
    assert sp.cancel(family-beta*epsilon*source_core) == 0


def verify_factor20():
    # factor 20 gives epsilon=gamma*phi.
    beta, gamma, phi = U, V, W
    epsilon = gamma*phi
    original = x_matrix(beta, gamma, epsilon, phi)
    transformed_parameters = (beta, gamma, 1/gamma, 1/(gamma*phi))
    transformed = x_matrix(*transformed_parameters)
    assert sp.cancel(transformed_parameters[1]*transformed_parameters[2]-1) == 0
    assert_matrix_identity(
        original, transformed,
        (0, 2, 3, 1, 4, 5), (0, 2, 3, 1, 4, 5),
    )

    source_core = (
        beta**2*phi+2*beta*gamma**2*phi+beta*gamma*phi**2
        +beta+gamma*phi
    )
    target_core = common_polynomial(beta, 1/gamma, 1/(gamma*phi))
    assert sp.cancel(source_core-gamma**3*phi**2*target_core) == 0
    family = sp.factor(G.family_relation().subs({
        G.B: beta, G.G: gamma, G.E: epsilon, G.P: phi,
    }, simultaneous=True))
    assert sp.cancel(family-gamma*phi*source_core) == 0


def main():
    factors = G.primary_irreducible_factors()
    assert sp.expand(factors[9]-(G.E*G.G-1)) == 0
    assert sp.expand(factors[12]-(G.B*G.P-G.E*G.G)) == 0
    assert sp.expand(factors[18]-(G.B*G.E-G.G)) == 0
    assert sp.expand(factors[19]-(-G.E+G.G*G.P)) == 0
    verify_factor13()
    verify_factor19()
    verify_factor20()
    print("PASS factors 13, 19 and 20 are explicitly equivalent to factor 10")
    print("CERTIFIED: factor-10 coverage transports to all four divisors")


if __name__ == "__main__":
    main()
