#!/usr/bin/env python3
"""Deterministic numerical scan of the lower-block product-sheet pairing."""

import numpy as np
import sympy as sp


def build_symbolic_functions():
    x, y = sp.symbols("x y", nonzero=True)
    s, sb, t, tb, r, rb = sp.symbols("s sb t tb r rb", nonzero=True)
    h = (x - s) * (1 / y - tb) * (y / x - r)
    hb = (1 / x - sb) * (y - t) * (x / y - rb)
    sigma2 = (x - s) * (1 / x - sb)
    delta2 = (y - t) * (1 / y - tb)
    psi2 = (y / x - r) * (x / y - rb)
    first = sp.Poly(sp.cancel(x * y * (h - hb)), y)
    second = sp.Poly(
        sp.cancel(x * y * (h - 4 + sigma2 + delta2 + psi2)), y
    )
    f0, f1, f2 = (first.coeff_monomial(y**k) for k in range(3))
    g0, g1, g2 = (second.coeff_monomial(y**k) for k in range(3))
    A = sp.Poly(sp.expand(f2 * g0 - f0 * g2), x)
    B = sp.Poly(sp.expand(f2 * g1 - f1 * g2), x)

    def star(expr):
        return expr.subs(
            {
                x: 1 / x,
                s: sb,
                sb: s,
                t: tb,
                tb: t,
                r: rb,
                rb: r,
            },
            simultaneous=True,
        )

    fundamental = sp.Poly(
        sp.expand(x**3 * (A.as_expr() * star(A.as_expr())
                         - B.as_expr() * star(B.as_expr()))),
        x,
    )
    coefficients = [
        fundamental.coeff_monomial(x**k) for k in range(7)
    ]
    return sp.lambdify(
        (s, sb, t, tb, r, rb),
        [coefficients[0], coefficients[4], coefficients[6]]
        + A.all_coeffs()
        + B.all_coeffs(),
        "numpy",
    )


def candidate_data(E, coefficient_function):
    a, b = E[1, 1], E[1, 2]
    c, d = E[2, 1], E[2, 2]
    s = -(1 + a + b)
    t = -(1 + c + d)
    r = -(1 + c / a + d / b)
    values = coefficient_function(
        s, np.conj(s), t, np.conj(t), r, np.conj(r)
    )
    c0, c4, c6 = values[:3]
    if abs(np.conj(s) * c6) < 1e-10:
        return None
    U = (c4 - s**2 * c6) / (np.conj(s) * c6)
    V = c0 / c6
    A_coefficients = np.asarray(values[3:7], dtype=complex)
    B_coefficients = np.asarray(values[7:11], dtype=complex)
    candidates = []
    for product in np.roots([1, -U, V]):
        roots = np.roots([1, -s, product * np.conj(s), -product])
        companions = -np.polyval(A_coefficients, roots) / np.polyval(
            B_coefficients, roots
        )
        root_residual = max(abs(abs(roots) - 1))
        companion_residual = max(abs(abs(companions) - 1))
        trace_residual = max(
            abs(sum(companions) - t),
            abs(sum(companions / roots) - r),
        )
        if max(root_residual, companion_residual, trace_residual) < 1e-7:
            candidates.append(
                (product, np.vstack([np.ones(3), roots, companions]))
            )
    delta = r * np.conj(r) - t * np.conj(t)
    return U, V, c6, delta, candidates


def closest_candidate(target, candidates):
    return min(candidates, key=lambda item: abs(item[0] - target))


def main():
    coefficient_function = build_symbolic_functions()
    rng = np.random.default_rng(20260807)
    required_seeds = 24
    attempts = 0
    accepted = 0
    minus_flatness = []
    plus_flatness = []
    unitarity_residuals = []

    while accepted < required_seeds and attempts < 5000:
        attempts += 1
        phases = rng.uniform(-np.pi, np.pi, 4)
        a, b, c, d = np.exp(1j * phases)
        E = np.array([[1, 1, 1], [1, a, b], [1, c, d]], dtype=complex)
        horizontal = candidate_data(E, coefficient_function)
        vertical = candidate_data(E.T, coefficient_function)
        if horizontal is None or vertical is None:
            continue
        U_h, _, c6_h, delta_h, horizontal_candidates = horizontal
        U_v, _, c6_v, delta_v, vertical_candidates = vertical
        if len(horizontal_candidates) != 2 or len(vertical_candidates) != 2:
            continue
        if abs(delta_h * delta_v * c6_h * c6_v) < 1e-10:
            continue

        kappa = delta_v * c6_h / (delta_h * c6_v)
        for u, B in horizontal_candidates:
            targets = {
                "minus": (U_v - kappa * (2 * u - U_h)) / 2,
                "plus": (U_v + kappa * (2 * u - U_h)) / 2,
            }
            for label, target in targets.items():
                m, C_transpose = closest_candidate(target, vertical_candidates)
                if abs(m - target) > 1e-6:
                    raise AssertionError(
                        f"cover matching failed with residual {abs(m-target)}"
                    )
                C = C_transpose.T
                D = -C @ E.conj().T @ np.linalg.inv(B).conj().T
                H = np.block([[E, B], [C, D]])
                flatness = max(abs(abs(D.reshape(-1)) - 1))
                unitarity = max(
                    abs((H @ H.conj().T - 6 * np.eye(6)).reshape(-1))
                )
                unitarity_residuals.append(unitarity)
                if label == "minus":
                    minus_flatness.append(flatness)
                else:
                    plus_flatness.append(flatness)
        accepted += 1

    if accepted != required_seeds:
        raise AssertionError(
            f"only found {accepted} admissible seeds in {attempts} attempts"
        )
    if max(minus_flatness) >= 1e-9:
        raise AssertionError(
            f"minus matching flatness residual {max(minus_flatness)}"
        )
    if min(plus_flatness) <= 1e-3:
        raise AssertionError(
            f"plus matching unexpectedly flat: {min(plus_flatness)}"
        )
    if max(unitarity_residuals) >= 1e-8:
        raise AssertionError(
            f"scaled-unitarity residual {max(unitarity_residuals)}"
        )

    print(f"PASS {accepted} generic admissible seeds in {attempts} attempts")
    print(f"PASS {2*accepted} minus-matched Hadamard completions")
    print(f"PASS max minus flatness residual {max(minus_flatness):.3e}")
    print(f"PASS min rejected-plus residual {min(plus_flatness):.3e}")
    print(f"PASS max scaled-unitarity residual {max(unitarity_residuals):.3e}")
    print("ALL NUMERICAL LOWER-BLOCK PAIRING CHECKS PASSED")


if __name__ == "__main__":
    main()
