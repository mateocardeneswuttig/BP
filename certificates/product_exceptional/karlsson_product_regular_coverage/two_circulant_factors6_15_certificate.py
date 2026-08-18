#!/usr/bin/env python3
"""Exact physical-root certificates for primary factors 6 and 15.

For each factor we form the real polynomial system consisting of the real
and imaginary parts of the two-circulant relation and the guard factor,
together with four unit-circle equations.  Exact msolve isolation proves
that this system has 24 real roots.  Independently, exact arithmetic in
Q(zeta_12) exhibits 24 distinct solutions, so the list is exhaustive.

Eighteen solutions on each divisor have explicit equivalence witnesses to
H_x.  The remaining six have a single exact product-regular rescue frame;
the frames for factors 6 and 15 are transposes of one another.
"""

from __future__ import annotations

from itertools import product
from pathlib import Path
import re
import subprocess
import tempfile

import sympy as sp

from msolve_tool import msolve_executable

import exact_product_exceptional_karlsson as HX
import two_circulant_guard_pullback as G
import two_circulant_hx_factor_certificate as HXDIV
import two_circulant_factor4_rescue_certificate as F4


PHASE_VARIABLES = (G.B, G.G, G.E, G.P)


FACTOR6_SOLUTIONS = (
    (0, 4, 0, 4), (0, 6, 0, 3), (0, 6, 0, 9), (0, 6, 3, 0),
    (0, 6, 9, 0), (0, 8, 0, 8), (2, 10, 8, 1), (2, 10, 8, 7),
    (4, 0, 4, 0), (4, 2, 1, 8), (4, 2, 4, 5), (4, 2, 4, 11),
    (4, 2, 7, 8), (4, 4, 4, 4), (6, 6, 0, 3), (6, 6, 0, 9),
    (8, 0, 8, 0), (8, 8, 8, 8), (8, 10, 5, 4), (8, 10, 8, 1),
    (8, 10, 8, 7), (8, 10, 11, 4), (10, 2, 4, 5), (10, 2, 4, 11),
)

FACTOR15_SOLUTIONS = (
    (0, 4, 0, 8), (0, 6, 0, 3), (0, 6, 0, 9), (0, 6, 3, 0),
    (0, 6, 9, 0), (0, 8, 0, 4), (2, 4, 8, 1), (2, 4, 8, 7),
    (4, 0, 4, 4), (4, 2, 1, 8), (4, 2, 4, 5), (4, 2, 4, 11),
    (4, 2, 7, 8), (4, 4, 4, 0), (6, 0, 0, 3), (6, 0, 0, 9),
    (8, 0, 8, 8), (8, 8, 8, 0), (8, 10, 5, 4), (8, 10, 8, 1),
    (8, 10, 8, 7), (8, 10, 11, 4), (10, 8, 4, 5), (10, 8, 4, 11),
)

FACTOR6_REGULAR = (
    (0, 4, 0, 4), (0, 8, 0, 8), (4, 0, 4, 0),
    (4, 4, 4, 4), (8, 0, 8, 0), (8, 8, 8, 8),
)
FACTOR15_REGULAR = (
    (0, 4, 0, 8), (0, 8, 0, 4), (4, 0, 4, 4),
    (4, 4, 4, 0), (8, 0, 8, 8), (8, 8, 8, 0),
)

FACTOR6_FRAME = ((1, 2, 4), (0, 2, 3))
FACTOR15_FRAME = ((0, 1, 3), (1, 2, 5))


def real_system(factor):
    names = "br bi gr gi er ei pr pi"
    variables = sp.symbols(names, real=True)
    br, bi, gr, gi, er, ei, pr, pi = variables
    substitution = {
        G.B: br+sp.I*bi, G.G: gr+sp.I*gi,
        G.E: er+sp.I*ei, G.P: pr+sp.I*pi,
    }

    def parts(expression):
        value = sp.expand_complex(sp.expand(expression.subs(substitution)))
        return sp.expand(sp.re(value)), sp.expand(sp.im(value))

    equations = (
        *parts(G.family_relation()), *parts(factor),
        br**2+bi**2-1, gr**2+gi**2-1,
        er**2+ei**2-1, pr**2+pi**2-1,
    )
    return variables, equations


def msolve_input(variables, equations):
    body = ",\n".join(str(sp.expand(item)).replace("**", "^") for item in equations)
    return ",".join(str(item) for item in variables)+"\n0\n"+body+"\n"


def certify_real_root_count(factor, label):
    variables, equations = real_system(factor)
    with tempfile.TemporaryDirectory(prefix=f"two-circulant-{label}-") as directory:
        source = Path(directory)/"system.ms"
        output = Path(directory)/"roots.out"
        source.write_text(msolve_input(variables, equations), encoding="utf-8")
        completed = subprocess.run(
            [msolve_executable(), "-f", str(source), "-o", str(output),
             "-t", "4", "-v", "1"],
            check=False, capture_output=True, text=True,
        )
    assert completed.returncode == 0
    log = completed.stdout+completed.stderr
    assert re.search(r"degree of ideal\s+42", log)
    assert re.search(r"Number of real roots:\s+24", log)


def exact_polynomial_value(polynomial, exponents):
    poly = sp.Poly(polynomial, *PHASE_VARIABLES, domain=sp.QQ)
    answer = HX.ZERO
    for monomial, coefficient in poly.terms():
        assert coefficient.q == 1
        exponent = sum(a*b for a, b in zip(monomial, exponents)) % 12
        answer = HX.add(answer, HX.scale(int(coefficient), HX.ROOTS[exponent]))
    return answer


def enumerate_twelfth_root_solutions(factor):
    family = G.family_relation()
    return tuple(point for point in product(range(12), repeat=4) if
        exact_polynomial_value(family, point) == HX.ZERO and
        exact_polynomial_value(factor, point) == HX.ZERO
    )


def verify_rescue_frame(points, frame):
    guards = tuple(
        G.numerator(expression).as_expr()
        for expression in F4.frame_guard_expressions(*frame)
    )
    assert len(guards) == 11
    for point in points:
        assert all(exact_polynomial_value(guard, point) != HX.ZERO for guard in guards)


def x_exponents(parameters):
    return HXDIV.x_exponents(parameters)


def hx_witness_dictionary():
    return dict(zip(HXDIV.EXPECTED_SOLUTIONS, HXDIV.EQUIVALENCE_WITNESSES))


def verify_hx_points(points, extra_witnesses):
    witnesses = hx_witness_dictionary()
    witnesses.update(extra_witnesses)
    target = HX.EXPONENTS
    for point in points:
        rows, columns = witnesses[point]
        assert HXDIV.redephase_exponents(x_exponents(point), rows, columns) == target


FACTOR6_EXTRA_WITNESSES = {
    (2, 10, 8, 1): ((0, 1, 5, 3, 4, 2), (0, 4, 2, 3, 1, 5)),
    (2, 10, 8, 7): ((0, 4, 1, 3, 2, 5), (0, 1, 4, 3, 5, 2)),
    (6, 6, 0, 3): ((0, 4, 1, 3, 2, 5), (0, 1, 4, 3, 5, 2)),
    (6, 6, 0, 9): ((0, 1, 5, 3, 4, 2), (0, 4, 2, 3, 1, 5)),
    (10, 2, 4, 5): ((0, 1, 5, 3, 4, 2), (0, 4, 2, 3, 1, 5)),
    (10, 2, 4, 11): ((0, 4, 1, 3, 2, 5), (0, 1, 4, 3, 5, 2)),
}

FACTOR15_EXTRA_WITNESSES = {
    (2, 4, 8, 1): ((0, 1, 4, 3, 2, 5), (0, 1, 4, 3, 2, 5)),
    (2, 4, 8, 7): ((0, 2, 1, 3, 5, 4), (0, 2, 1, 3, 5, 4)),
    (6, 0, 0, 3): ((0, 2, 1, 3, 5, 4), (0, 2, 1, 3, 5, 4)),
    (6, 0, 0, 9): ((0, 1, 4, 3, 2, 5), (0, 1, 4, 3, 2, 5)),
    (10, 8, 4, 5): ((0, 1, 4, 3, 2, 5), (0, 1, 4, 3, 2, 5)),
    (10, 8, 4, 11): ((0, 2, 1, 3, 5, 4), (0, 2, 1, 3, 5, 4)),
}


def main():
    factors = G.primary_irreducible_factors()
    factor6, factor15 = factors[5], factors[14]
    certify_real_root_count(factor6, "factor6")
    certify_real_root_count(factor15, "factor15")
    assert enumerate_twelfth_root_solutions(factor6) == FACTOR6_SOLUTIONS
    assert enumerate_twelfth_root_solutions(factor15) == FACTOR15_SOLUTIONS

    verify_rescue_frame(FACTOR6_REGULAR, FACTOR6_FRAME)
    verify_rescue_frame(FACTOR15_REGULAR, FACTOR15_FRAME)
    hx6 = tuple(point for point in FACTOR6_SOLUTIONS if point not in FACTOR6_REGULAR)
    hx15 = tuple(point for point in FACTOR15_SOLUTIONS if point not in FACTOR15_REGULAR)
    assert len(hx6) == len(hx15) == 18
    verify_hx_points(hx6, FACTOR6_EXTRA_WITNESSES)
    verify_hx_points(hx15, FACTOR15_EXTRA_WITNESSES)

    print("PASS factors 6 and 15 each have exactly 24 physical roots")
    print("PASS eighteen roots on each divisor are equivalent to H_x")
    print("PASS the remaining six roots have exact rescue frames")
    print("CERTIFIED: factors 6 and 15 are product regular away from [H_x]")


if __name__ == "__main__":
    main()
