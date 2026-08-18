#!/usr/bin/env python3
"""Exact real elimination for a base failure pair plus one rescue guard.

This is the characteristic-zero certificate generator for the remaining
mixed imbalance/opposite curves.  It reuses the real Cayley model from
``ordinary_real_elimination.py`` and permits a guard from any ordered rescue
frame to be added to a selected base failure pair.

Environment variables:

``KARLSSON_BASE_PAIR``       e.g. ``1,5`` (opposite proxy for indices 5--7)
``KARLSSON_RESCUE_ROWS``     e.g. ``0,2,1``
``KARLSSON_RESCUE_COLUMNS``  e.g. ``0,4,1``
``KARLSSON_RESCUE_SIDE``     ``horizontal`` or ``vertical``
``KARLSSON_RESCUE_GUARD``    ``detE``, ``detB``, ``detC``, ``lead1``,
                              ``lead2``, ``delta``, ``equal0..2``, or
                              ``opposite0..2``

An optional second frame guard can be imposed with
``KARLSSON_EXTRA_ROWS``, ``KARLSSON_EXTRA_COLUMNS``,
``KARLSSON_EXTRA_SIDE``, and ``KARLSSON_EXTRA_GUARD``.  This is used to
prove that a second frame is regular on the residual failure divisor of the
first frame.

The output ``[-1]:`` from msolve is an exact proof that the selected rescue
guard cannot vanish on that physical base branch (away from the already
separated Cayley endpoints).
"""

from __future__ import annotations

import os

import sympy as sp

from msolve_tool import msolve_executable

import ordinary_cover_modular_probe as O
import ordinary_real_elimination as R


PAIRS = ((0, 1), (0, 2), (1, 2))


def tuple_env(name, default):
    return tuple(int(item) for item in os.environ.get(name, default).split(","))


def side_data(block):
    xs = tuple(block[1, j] for j in range(3))
    ys = tuple(block[2, j] for j in range(3))
    s = sum(xs)
    sb = O.star(s)
    t = sum(ys)
    tb = O.star(t)
    r = sum(O.star(xs[j]) * ys[j] for j in range(3))
    rb = O.star(r)
    return xs, ys, s, sb, t, tb, r, rb


def rescue_expression(rows, columns, side, name):
    chart = O.redephase(O.karlsson_matrix(), rows, columns)
    e, b, c = chart[:3, :3], chart[:3, 3:], chart[3:, :3]
    if name == "detE":
        return e.det()
    if name == "detB":
        return b.det()
    if name == "detC":
        return c.det()
    block = b if side == "horizontal" else c.T
    xs, _ys, s, sb, t, tb, r, rb = side_data(block)
    if name == "lead1":
        return r**2 * tb - r * sb * t * tb + 3 * r * sb + sb**2 * t
    if name == "lead2":
        return r * rb * sb * tb - r * tb**2 - rb * sb**2 - 3 * sb * tb
    if name == "delta":
        return r * rb - t * tb
    for prefix, sign in (("equal", -1), ("opposite", 1)):
        if name.startswith(prefix):
            index = int(name[len(prefix):])
            left, right = PAIRS[index]
            return xs[left] + sign * xs[right]
    raise ValueError(f"unknown rescue guard {name}")


def main():
    base_pair = tuple_env("KARLSSON_BASE_PAIR", "1,5")
    rows = tuple_env("KARLSSON_RESCUE_ROWS", "0,2,1")
    columns = tuple_env("KARLSSON_RESCUE_COLUMNS", "0,4,1")
    side = os.environ.get("KARLSSON_RESCUE_SIDE", "horizontal")
    name = os.environ.get("KARLSSON_RESCUE_GUARD", "delta")
    extra_name = os.environ.get("KARLSSON_EXTRA_GUARD")
    extra_rows = tuple_env("KARLSSON_EXTRA_ROWS", "0,2,1")
    extra_columns = tuple_env("KARLSSON_EXTRA_COLUMNS", "0,5,1")
    extra_side = os.environ.get("KARLSSON_EXTRA_SIDE", "horizontal")

    old_proxy = os.environ.get("KARLSSON_OPPOSITE_PROXY")
    os.environ["KARLSSON_OPPOSITE_PROXY"] = "1"
    try:
        orders = ((0, 2, 3), (0, 3, 2))
        omit_name = os.environ.get("KARLSSON_OMIT_PHASE")
        if not omit_name and os.environ.get("KARLSSON_REDUCED_CHART") == "1":
            omit_name = "z4"
        omitted = {
            "z1": (O.Z1, R.SIGMA),
            "z2": (O.Z2, R.R2),
            "z3": (O.Z3, R.R3),
            "z4": (O.Z4, R.R4),
        }.get(omit_name)
        omitted_phase = omitted[0] if omitted else None
        omitted_real = omitted[1] if omitted else None
        variables = tuple(
            variable for variable in R.REAL_VARIABLES
            if variable != omitted_real
        )
        equations = [sp.Poly(R.SQRT3**2 - 3, *variables, domain=sp.QQ)]
        cayley_variables = (
            variable
            for variable in (R.T, R.RHO, R.SIGMA, R.R2, R.R3, R.R4)
            if variable != omitted_real
        )
        cayley_denominator = R.T * sp.prod(
            1 + variable**2 for variable in cayley_variables
        )
        equations.append(sp.Poly(
            R.INVERSE * cayley_denominator - 1,
            *variables,
            domain=sp.QQ,
        ))
        mobius = R.mobius_relations()
        if omitted_real is not None:
            # Removing equations enlarges the projected physical set.  Thus
            # a unit ideal in this relaxed system remains a valid proof that
            # the original system has no solutions.
            mobius = tuple(item for item in mobius if item.degree(omitted_real) == 0)

        def project(items):
            return [sp.Poly(item.as_expr(), *variables, domain=sp.QQ) for item in items]

        equations.extend(project(mobius))
        base_expressions = (
            R.guard("horizontal", orders[0], base_pair[0]),
            R.guard("horizontal", orders[1], base_pair[1]),
        )
        if omitted_phase is not None and any(
            omitted_phase in item.free_symbols for item in base_expressions
        ):
            raise ValueError(f"base branch depends on omitted {omit_name}")
        for base_expression in base_expressions:
            equations.extend(project(R.real_polynomials(base_expression)))
        expression = rescue_expression(rows, columns, side, name)
        if omitted_phase is not None and omitted_phase in expression.free_symbols:
            raise ValueError(f"requested rescue guard depends on omitted {omit_name}")
        equations.extend(project(R.real_polynomials_sparse(expression)))
        if extra_name:
            extra_expression = rescue_expression(
                extra_rows, extra_columns, extra_side, extra_name
            )
            if omitted_phase is not None and omitted_phase in extra_expression.free_symbols:
                raise ValueError(f"requested extra guard depends on omitted {omit_name}")
            equations.extend(project(R.real_polynomials_sparse(extra_expression)))
    finally:
        if old_proxy is None:
            os.environ.pop("KARLSSON_OPPOSITE_PROXY", None)
        else:
            os.environ["KARLSSON_OPPOSITE_PROXY"] = old_proxy

    unique = {}
    for equation in equations:
        monic = equation.monic()
        unique[tuple(sorted(monic.rep.to_dict().items()))] = monic
    equations = tuple(unique.values())
    print(
        f"base={base_pair} rescue={rows}/{columns} {side}:{name}; "
        + (
            f" extra={extra_rows}/{extra_columns} {extra_side}:{extra_name};"
            if extra_name else ""
        )
        + f" equations={len(equations)}, "
        f"degrees={[item.total_degree() for item in equations]}",
        flush=True,
    )
    if os.environ.get("MSOLVE_SKIP") == "1":
        return

    # Reuse the carefully bounded msolve launcher and output parser.
    original_mobius = R.mobius_relations
    original_guard = R.guard
    try:
        R.mobius_relations = lambda: equations[2:2]
        # Directly call msolve using the assembled equations rather than
        # rebuilding a standard two-guard case.
        import subprocess
        import tempfile
        from pathlib import Path

        with tempfile.TemporaryDirectory(prefix="karlsson-rescue-") as directory:
            source = Path(directory) / "system.ms"
            output = Path(directory) / "output.txt"
            order = (
                tuple(reversed(variables))
                if os.environ.get("MSOLVE_REVERSE_ORDER") == "1"
                else variables
            )
            variable_text = ",".join(str(item) for item in order)
            body = ",\n".join(
                str(item.as_expr()).replace("**", "^") for item in equations
            )
            source.write_text(
                f"{variable_text}\n0\n{body}\n", encoding="utf-8"
            )
            completed = subprocess.run(
                [
                    msolve_executable(),
                    "-f", str(source),
                    "-o", str(output),
                    "-t", os.environ.get("MSOLVE_THREADS", "4"),
                    "-v", "1",
                ],
                check=False,
                text=True,
                capture_output=os.environ.get("MSOLVE_QUIET") == "1",
            )
            result = output.read_text(encoding="utf-8") if output.exists() else ""
        print(f"msolve exit={completed.returncode}")
        is_unit = result.strip() == "[-1]:"
        print("unit ideal" if is_unit else result[:2000])
        if completed.returncode != 0:
            raise SystemExit(completed.returncode)
        if os.environ.get("MSOLVE_REQUIRE_UNIT") == "1" and not is_unit:
            raise SystemExit(2)
    finally:
        R.mobius_relations = original_mobius
        R.guard = original_guard


if __name__ == "__main__":
    main()
