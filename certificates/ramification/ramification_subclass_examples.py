#!/usr/bin/env python3
"""Numerical examples on the finite-corner product-sheet ramification locus.

The generic product coordinate satisfies u^2-Uu+V=0.  On the phase torus
the quadratic is self-inversive: |V|=1 and U=conj(U)V.  Its two roots
coalesce exactly when |U|^2=4 (equivalently U^2-4V=0).

This script fixes three seed angles, locates a zero of |U|^2-4 in the
fourth angle by bisection, reconstructs the unique horizontal and vertical
product sheets, and checks the resulting Hadamard matrix.  It also reports
numerical witnesses excluding the Karlsson and Tao strata.
"""

from __future__ import annotations

import numpy as np

from scan_lower_block_pairing import build_symbolic_functions, candidate_data


GRID_SIZE = 721
BISECTION_STEPS = 70
TARGET_EXAMPLES = 3


def seed_matrix(angles):
    a, b, c, d = np.exp(1j * np.asarray(angles, dtype=float))
    return np.array([[1, 1, 1], [1, a, b], [1, c, d]], dtype=complex)


def branch_value(angles, coefficient_function):
    data = candidate_data(seed_matrix(angles), coefficient_function)
    if data is None:
        return np.nan
    U, V, *_ = data
    if abs(abs(V) - 1) > 1e-7 or abs(U - np.conj(U) * V) > 1e-7:
        return np.nan
    return float(abs(U) ** 2 - 4)


def bisect_fourth_angle(base, left, right, coefficient_function):
    left_value = branch_value((*base, left), coefficient_function)
    right_value = branch_value((*base, right), coefficient_function)
    if not np.isfinite(left_value * right_value) or left_value * right_value > 0:
        raise ValueError("interval does not bracket product-sheet ramification")
    for _ in range(BISECTION_STEPS):
        midpoint = (left + right) / 2
        middle_value = branch_value((*base, midpoint), coefficient_function)
        if left_value * middle_value <= 0:
            right = midpoint
            right_value = middle_value
        else:
            left = midpoint
            left_value = middle_value
    return (left + right) / 2


def block_from_product(E, product, coefficient_function):
    a, b = E[1, 1], E[1, 2]
    c, d = E[2, 1], E[2, 2]
    s = -(1 + a + b)
    t = -(1 + c + d)
    r = -(1 + c / a + d / b)
    values = coefficient_function(
        s, np.conj(s), t, np.conj(t), r, np.conj(r)
    )
    A_coefficients = np.asarray(values[3:7], dtype=complex)
    B_coefficients = np.asarray(values[7:11], dtype=complex)
    roots = np.roots([1, -s, product * np.conj(s), -product])
    companions = -np.polyval(A_coefficients, roots) / np.polyval(
        B_coefficients, roots
    )
    residual = max(
        np.max(abs(abs(roots) - 1)),
        np.max(abs(abs(companions) - 1)),
        abs(sum(companions) - t),
        abs(sum(companions / roots) - r),
    )
    return np.vstack([np.ones(3), roots, companions]), float(residual)


def karlsson_witness(H):
    """Minimum modulus of the 225 H_2-reducibility equations."""
    return min(
        abs(H[i, j] * H[k, ell] + H[i, ell] * H[k, j])
        for i in range(6)
        for k in range(i + 1, 6)
        for j in range(6)
        for ell in range(j + 1, 6)
    )


def tao_witness(H):
    """A Tao matrix has every four-entry cross-ratio in the cubic roots."""
    cubic_roots = np.exp(2j * np.pi * np.arange(3) / 3)
    cross_ratios = [
        H[i, j] * H[k, ell] / (H[i, ell] * H[k, j])
        for i in range(6)
        for k in range(i + 1, 6)
        for j in range(6)
        for ell in range(j + 1, 6)
    ]
    return max(min(abs(value - root) for root in cubic_roots) for value in cross_ratios)


def reconstruct(angles, coefficient_function):
    E = seed_matrix(angles)
    horizontal = candidate_data(E, coefficient_function)
    vertical = candidate_data(E.T, coefficient_function)
    if horizontal is None or vertical is None:
        raise ValueError("singular product coordinates")
    U_h, V_h, c6_h, delta_h, _ = horizontal
    U_v, V_v, c6_v, delta_v, _ = vertical
    u = U_h / 2
    m = U_v / 2
    B, horizontal_residual = block_from_product(E, u, coefficient_function)
    C_transpose, vertical_residual = block_from_product(
        E.T, m, coefficient_function
    )
    C = C_transpose.T
    D = -C @ E.conj().T @ np.linalg.inv(B).conj().T
    H = np.block([[E, B], [C, D]])
    derivative_step = 1e-6
    angles_plus = np.asarray(angles, dtype=float).copy()
    angles_minus = np.asarray(angles, dtype=float).copy()
    angles_plus[3] += derivative_step
    angles_minus[3] -= derivative_step
    transverse_derivative = (
        branch_value(angles_plus, coefficient_function)
        - branch_value(angles_minus, coefficient_function)
    ) / (2 * derivative_step)
    return {
        "angles": np.asarray(angles),
        "H": H,
        "branch_residual_h": abs(U_h**2 - 4 * V_h),
        "branch_residual_v": abs(U_v**2 - 4 * V_v),
        "candidate_residual": max(horizontal_residual, vertical_residual),
        "flatness_residual": np.max(abs(abs(H) - 1)),
        "hadamard_residual": np.max(abs(H @ H.conj().T - 6 * np.eye(6))),
        "minimum_block_determinant": min(
            abs(np.linalg.det(block)) for block in (E, B, C)
        ),
        "minimum_karlsson_equation": karlsson_witness(H),
        "tao_cross_ratio_witness": tao_witness(H),
        "regular_factors": min(abs(c6_h), abs(c6_v), abs(delta_h), abs(delta_v)),
        "transverse_derivative": abs(transverse_derivative),
    }


def find_examples(coefficient_function):
    rng = np.random.default_rng(20260808)
    grid = np.linspace(-np.pi, np.pi, GRID_SIZE)
    examples = []
    for _ in range(200):
        base = rng.uniform(-np.pi, np.pi, 3)
        values = [branch_value((*base, angle), coefficient_function) for angle in grid]
        for index in range(len(grid) - 1):
            if not np.isfinite(values[index] * values[index + 1]):
                continue
            if values[index] * values[index + 1] >= 0:
                continue
            fourth = bisect_fourth_angle(
                base, grid[index], grid[index + 1], coefficient_function
            )
            example = reconstruct((*base, fourth), coefficient_function)
            if (
                example["candidate_residual"] < 2e-6
                and example["flatness_residual"] < 2e-6
                and example["hadamard_residual"] < 5e-6
                and example["minimum_block_determinant"] > 1e-3
                and example["regular_factors"] > 1e-5
                and example["minimum_karlsson_equation"] > 1e-3
                and example["tao_cross_ratio_witness"] > 1e-2
                and example["transverse_derivative"] > 1e-3
            ):
                examples.append(example)
                break
        if len(examples) == TARGET_EXAMPLES:
            return examples
    raise AssertionError(f"found only {len(examples)} regular examples")


def main():
    coefficient_function = build_symbolic_functions()
    examples = find_examples(coefficient_function)
    for index, example in enumerate(examples, start=1):
        print(f"EXAMPLE {index}")
        print("seed angles", " ".join(f"{x:.12f}" for x in example["angles"]))
        print("dephased phase matrix")
        for row in np.angle(example["H"]):
            print(" ".join(f"{x: .12f}" for x in row))
        for key in (
            "branch_residual_h",
            "branch_residual_v",
            "candidate_residual",
            "flatness_residual",
            "hadamard_residual",
            "minimum_block_determinant",
            "minimum_karlsson_equation",
            "tao_cross_ratio_witness",
            "transverse_derivative",
        ):
            print(f"{key} {example[key]:.3e}")
    print("ALL PRODUCT-SHEET RAMIFICATION EXAMPLES PASSED")


if __name__ == "__main__":
    main()
