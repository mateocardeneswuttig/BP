#!/usr/bin/env python3
"""Real-algebraic probe for simultaneous ordinary-Karlsson guard failures.

Every unit phase is written in a real Cayley coordinate.  This turns the
Karlsson cross-multiplied Moebius relations and two selected actual-lift
guard failures into polynomial equations over QQ(sqrt(3)).  Introducing a
real variable ``sqrt3`` with ``sqrt3^2=3`` gives a rational real system that
msolve can check without admitting nonphysical complex phase parameters.

This is a proof-certificate discovery script.  The endpoint charts omitted
by the Cayley coordinates are handled separately by the Fourier/seam cover.
"""

from __future__ import annotations

import os
from pathlib import Path
import subprocess
import sys
import tempfile

import sympy as sp

from msolve_tool import msolve_executable


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import ordinary_cover_modular_probe as O  # noqa: E402


T, RHO, SIGMA, R2, R3, R4, SQRT3, INVERSE = sp.symbols(
    "t rho sigma r2 r3 r4 sqrt3 inverse", real=True
)
REAL_VARIABLES = (INVERSE, R4, R3, R2, SIGMA, RHO, T, SQRT3)


def cayley(value):
    return (1 + sp.I*value)/(1 - sp.I*value)


SUBSTITUTION = {
    O.U: (1-T**2)/(1+T**2),
    O.V: 2*T/(1+T**2),
    O.P: cayley(RHO),
    O.Z1: cayley(SIGMA),
    O.Z2: cayley(R2),
    O.Z3: cayley(R3),
    O.Z4: cayley(R4),
    O.K: sp.I*SQRT3,
}


def real_polynomials(expression):
    """Clear nonzero Cayley denominators and split into real equations."""
    # Cancelling in the compact phase variables first is dramatically
    # cheaper than expanding the raw rational expression after six Cayley
    # substitutions.  The discarded denominator is a product of nonzero
    # phase monomials and positive Cayley denominators on this chart.
    phase_numerator = sp.fraction(sp.cancel(expression))[0]
    numerator = sp.together(
        phase_numerator.subs(SUBSTITUTION)
    ).as_numer_denom()[0]
    expanded = sp.expand_complex(sp.expand(numerator))
    answer = []
    for part in (sp.re(expanded), sp.im(expanded)):
        reduced_part = sp.rem(
            sp.expand(part), SQRT3**2-3, SQRT3
        )
        polynomial = sp.Poly(sp.expand(reduced_part), *REAL_VARIABLES, domain=sp.QQ)
        if not polynomial.is_zero:
            # Cayley and half-angle denominators contribute only positive
            # factors 1+x^2 on the real domain.  Remove them before handing
            # the system to the real solver.
            for variable in (T, RHO, SIGMA, R2, R3, R4):
                divisor = sp.Poly(variable**2+1, *REAL_VARIABLES, domain=sp.QQ)
                while True:
                    quotient, remainder = sp.div(polynomial, divisor)
                    if not remainder.is_zero:
                        break
                    polynomial = quotient
            _content, primitive = polynomial.primitive()
            answer.append(primitive)
    return answer


def real_polynomials_fast(expression):
    """Split a Cayley pullback through polynomial coefficients.

    This is algebraically identical to :func:`real_polynomials`, but avoids
    ``expand_complex``.  The latter is disproportionately expensive for the
    larger rescue-frame leading factors.  All Cayley variables and
    ``sqrt3`` are real, so after they are declared as polynomial generators
    the coefficients lie in ``QQ(i)`` and can be split term by term.
    """
    numerator = sp.together(expression.subs(SUBSTITUTION)).as_numer_denom()[0]
    imaginary_unit = sp.Symbol("imaginary_unit")
    polynomial = sp.Poly(
        numerator.subs(sp.I, imaginary_unit),
        imaginary_unit,
        *REAL_VARIABLES,
        domain=sp.QQ,
    )
    real_terms = {}
    imaginary_terms = {}
    for monomial, coefficient in polynomial.terms():
        imaginary_power, *real_monomial = monomial
        sqrt_power = real_monomial[-1]
        real_monomial[-1] = sqrt_power % 2
        value = coefficient * (-1) ** (imaginary_power // 2) * 3 ** (sqrt_power // 2)
        target = imaginary_terms if imaginary_power % 2 else real_terms
        key = tuple(real_monomial)
        target[key] = target.get(key, 0) + value

    answer = []
    for terms in (real_terms, imaginary_terms):
        if not terms:
            continue
        part = sp.Poly.from_dict(terms, REAL_VARIABLES, domain=sp.QQ)
        for variable in (T, RHO, SIGMA, R2, R3, R4):
            cayley_factor = sp.Poly(variable**2 + 1, *REAL_VARIABLES, domain=sp.QQ)
            while True:
                quotient, remainder = sp.div(part, cayley_factor)
                if not remainder.is_zero:
                    break
                part = quotient
        _content, primitive = part.primitive()
        if not primitive.is_zero:
            answer.append(primitive)
    return answer


def real_polynomials_sparse(expression):
    """Sparse, quotient-aware Cayley expansion for large guard factors.

    The compact phase numerator usually has only a few hundred terms, while
    asking SymPy to expand all substituted rational functions at once can
    create a very large intermediate expression.  This routine clears one
    common Cayley denominator term-by-term and multiplies sparse dictionaries
    while reducing ``i^2=-1`` and ``sqrt3^2=3`` after every product.
    """
    phase_variables = (O.U, O.V, O.P, O.Z1, O.Z2, O.Z3, O.Z4, O.K)
    phase_numerator = sp.fraction(sp.cancel(expression))[0]
    source = sp.Poly(phase_numerator, *phase_variables, domain=sp.QQ)
    terms = source.terms()
    uv_max = max(monomial[0] + monomial[1] for monomial, _ in terms)
    phase_maxima = [max(monomial[index] for monomial, _ in terms) for index in range(2, 7)]

    # Sparse keys are (imaginary parity, inverse, r4, r3, r2, sigma, rho,
    # t, sqrt3 parity).  Coefficients remain rational throughout.
    zero_key = (0,) * 9

    def add(target, key, value):
        if not value:
            return
        target[key] = target.get(key, sp.QQ(0)) + value
        if not target[key]:
            del target[key]

    def multiply(left, right):
        answer = {}
        for left_key, left_value in left.items():
            for right_key, right_value in right.items():
                imaginary_power = left_key[0] + right_key[0]
                sqrt_power = left_key[8] + right_key[8]
                key = (
                    imaginary_power % 2,
                    *(left_key[index] + right_key[index] for index in range(1, 8)),
                    sqrt_power % 2,
                )
                scalar = (
                    left_value
                    * right_value
                    * (-1) ** (imaginary_power // 2)
                    * 3 ** (sqrt_power // 2)
                )
                add(answer, key, scalar)
        return answer

    def power(base, exponent):
        answer = {zero_key: sp.QQ(1)}
        for _ in range(exponent):
            answer = multiply(answer, base)
        return answer

    def monomial(variable_index, coefficient=1, imaginary=0, sqrt=0):
        key = [0] * 9
        key[0] = imaginary
        key[variable_index] = 1
        key[8] = sqrt
        return {tuple(key): sp.QQ(coefficient)}

    one = {zero_key: sp.QQ(1)}
    t_term = monomial(7)
    t_squared = multiply(t_term, t_term)
    u_numerator = dict(one)
    for key, value in t_squared.items():
        add(u_numerator, key, -value)
    v_numerator = {key: 2 * value for key, value in t_term.items()}
    uv_denominator = dict(one)
    for key, value in t_squared.items():
        add(uv_denominator, key, value)

    # P,Z1,Z2,Z3,Z4 use rho,sigma,r2,r3,r4 respectively.
    cayley_indices = (6, 5, 4, 3, 2)
    plus = []
    minus = []
    for variable_index in cayley_indices:
        imaginary_variable = monomial(variable_index, imaginary=1)
        plus_item = dict(one)
        minus_item = dict(one)
        for key, value in imaginary_variable.items():
            add(plus_item, key, value)
            add(minus_item, key, -value)
        plus.append(plus_item)
        minus.append(minus_item)
    k_numerator = monomial(8, imaginary=1, sqrt=1)

    u_powers = [power(u_numerator, exponent) for exponent in range(uv_max + 1)]
    v_powers = [power(v_numerator, exponent) for exponent in range(uv_max + 1)]
    uv_denominator_powers = [
        power(uv_denominator, exponent) for exponent in range(uv_max + 1)
    ]
    plus_powers = [
        [power(base, exponent) for exponent in range(maximum + 1)]
        for base, maximum in zip(plus, phase_maxima)
    ]
    minus_powers = [
        [power(base, exponent) for exponent in range(maximum + 1)]
        for base, maximum in zip(minus, phase_maxima)
    ]

    expanded = {}
    for monomial_exponents, coefficient in terms:
        u_power, v_power, *phase_powers, k_power = monomial_exponents
        item = {zero_key: coefficient}
        for factor in (
            u_powers[u_power],
            v_powers[v_power],
            uv_denominator_powers[uv_max - u_power - v_power],
        ):
            item = multiply(item, factor)
        for index, exponent in enumerate(phase_powers):
            item = multiply(item, plus_powers[index][exponent])
            item = multiply(
                item,
                minus_powers[index][phase_maxima[index] - exponent],
            )
        item = multiply(item, power(k_numerator, k_power))
        for key, value in item.items():
            add(expanded, key, value)

    split = ({}, {})
    for key, value in expanded.items():
        imaginary_parity, *real_key = key
        add(split[imaginary_parity], tuple(real_key), value)

    answer = []
    for terms_by_part in split:
        if not terms_by_part:
            continue
        polynomial = sp.Poly.from_dict(
            terms_by_part, REAL_VARIABLES, domain=sp.QQ
        )
        for variable in (T, RHO, SIGMA, R2, R3, R4):
            cayley_factor = sp.Poly(
                variable**2 + 1, *REAL_VARIABLES, domain=sp.QQ
            )
            while True:
                quotient, remainder = sp.div(polynomial, cayley_factor)
                if not remainder.is_zero:
                    break
                polynomial = quotient
        _content, primitive = polynomial.primitive()
        answer.append(primitive)
    return answer


def mobius_relations():
    _f2, a, b = O.blocks()

    def relation(core, source, target):
        numerator = core[0, 1]**2*source**2-core[0, 0]**2
        denominator = (
            O.star(core[0, 0])**2*source**2
            - O.star(core[0, 1])**2
        )
        return target**2*denominator-numerator

    raw = (
        relation(a, O.Z1, O.Z3),
        relation(b, O.Z2, O.Z3),
        relation(b, O.Z1, O.Z4),
        relation(a, O.Z2, O.Z4),
    )
    answer = []
    for item in raw:
        answer.extend(real_polynomials(item))
    return answer


def guard(direction, order, index):
    matrix = O.karlsson_matrix()
    base = (0, 2, 3)
    chart = O.redephase(
        matrix,
        order if direction == "horizontal" else base,
        base if direction == "horizontal" else order,
    )
    block = chart[:3, 3:] if direction == "horizontal" else chart[3:, :3].T
    if index >= 5 and os.environ.get("KARLSSON_OPPOSITE_PROXY") == "1":
        xs = tuple(block[1, column] for column in range(3))
        pairs = ((0, 1), (0, 2), (1, 2))
        left, right = pairs[index-5]
        return xs[left]+xs[right]
    return O.missing_side_guards(block)[index-1]


def msolve_text(polynomials):
    order = (
        (SQRT3, R4, R3, R2, SIGMA, RHO, T, INVERSE)
        if os.environ.get("MSOLVE_REVERSE_ORDER") == "1"
        else REAL_VARIABLES
    )
    variables = ",".join(str(item) for item in order)
    body = ",\n".join(str(item.as_expr()).replace("**", "^") for item in polynomials)
    return f"{variables}\n0\n{body}\n"


def run_case(direction, left_index, right_index):
    orders = ((0, 2, 3), (0, 3, 2))
    equations = [sp.Poly(SQRT3**2-3, *REAL_VARIABLES, domain=sp.QQ)]
    cayley_denominator = T*sp.prod(
        1+variable**2 for variable in (T, RHO, SIGMA, R2, R3, R4)
    )
    equations.append(sp.Poly(
        INVERSE*cayley_denominator-1, *REAL_VARIABLES, domain=sp.QQ
    ))
    equations.extend(mobius_relations())
    equations.extend(real_polynomials(guard(direction, orders[0], left_index)))
    equations.extend(real_polynomials(guard(direction, orders[1], right_index)))
    # Remove literal duplicates after primitive normalization.
    unique = {}
    for equation in equations:
        monic = equation.monic()
        unique[tuple(sorted(monic.rep.to_dict().items()))] = monic
    equations = tuple(unique.values())
    print(
        f"{direction} pair {left_index},{right_index}: "
        f"equations={len(equations)}, "
        f"degrees={[item.total_degree() for item in equations]}",
        flush=True,
    )
    if os.environ.get("MSOLVE_SKIP") == "1":
        return 0, ""

    with tempfile.TemporaryDirectory(prefix="karlsson-real-") as directory:
        source = Path(directory)/"system.ms"
        output = Path(directory)/"output.txt"
        source.write_text(msolve_text(equations), encoding="utf-8")
        quiet = os.environ.get("MSOLVE_QUIET") == "1"
        completed = subprocess.run(
            [msolve_executable(), "-f", str(source), "-o", str(output),
             "-t", os.environ.get("MSOLVE_THREADS", "4"), "-v", "1"],
            check=False,
            text=True,
            capture_output=quiet,
        )
        result = output.read_text(encoding="utf-8") if output.exists() else ""
    print(f"msolve exit={completed.returncode}")
    if not quiet:
        print(result)
    else:
        print("unit ideal" if result.strip() == "[-1]:" else result[:500])
    if os.environ.get("MSOLVE_REQUIRE_UNIT") == "1" and result.strip() != "[-1]:":
        raise SystemExit(2)
    return completed.returncode, result


def main():
    direction = os.environ.get("KARLSSON_DIRECTION", "horizontal")
    pair = tuple(int(item) for item in os.environ.get(
        "KARLSSON_GUARD_PAIR", "1,2"
    ).split(","))
    run_case(direction, *pair)


if __name__ == "__main__":
    main()
