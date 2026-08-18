#!/usr/bin/env python3
"""Exact common-zero reduction for a product-regular Fourier frame cover."""

from __future__ import annotations

from pathlib import Path
import os
import sys

import sympy as sp
from sympy.polys.rings import xring


HERE = Path(__file__).resolve().parent
ATLAS = HERE.parent
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(ATLAS))

from fourier_product_guard_reduction import (  # noqa: E402
    DOMAIN,
    EXTENSION,
    OMEGA,
    Z1,
    Z2,
    frame_guards,
)


# The seven orderings of one unframed corner cover the generic affine-Fourier
# boundary numerically.  Their residual common-zero set is certified below.
FRAMES = (
    ((0, 2, 5), (0, 2, 5)),
    ((0, 5, 2), (0, 5, 2)),
    ((2, 5, 0), (2, 5, 0)),
    ((0, 2, 5), (0, 5, 2)),
    ((0, 2, 5), (2, 5, 0)),
    ((0, 5, 2), (0, 2, 5)),
    ((2, 5, 0), (0, 2, 5)),
    ((0, 4, 3), (0, 5, 2)),
)

# Discovered on a roots-of-unity boundary grid, then closed under transpose.
# These frames are used only on the finite residual set left by FRAMES.
_RESCUE_SEEDS = (
    ((0, 4, 3), (0, 5, 2)),
    ((0, 3, 4), (0, 2, 5)),
    ((0, 2, 5), (0, 4, 2)),
    ((0, 2, 5), (2, 4, 0)),
    ((0, 2, 5), (0, 3, 4)),
    ((0, 1, 2), (0, 2, 4)),
    ((0, 1, 3), (0, 2, 4)),
    ((0, 2, 4), (0, 1, 3)),
    ((0, 1, 2), (0, 4, 2)),
    ((0, 1, 3), (0, 4, 2)),
    ((0, 1, 2), (0, 5, 2)),
    ((0, 1, 3), (0, 5, 2)),
)
RESCUE_FRAMES = tuple(dict.fromkeys(
    frame
    for seed in _RESCUE_SEEDS
    for frame in (seed, (seed[1], seed[0]))
))
assert all(
    (columns, rows) in RESCUE_FRAMES for rows, columns in RESCUE_FRAMES
), "rescue cover must transport under matrix transposition"


FIELD = DOMAIN
COEFFICIENT_RING = FIELD.poly_ring(Z1)
QUOTIENT_RING, _ = xring((Z2, Z1), FIELD, order="grevlex")


def native_normal_form(polynomial, basis):
    """Reduce a Poly without round-tripping algebraic coefficients via Expr."""
    dividend = QUOTIENT_RING.from_dict(polynomial.rep.to_dict())
    divisors = [
        QUOTIENT_RING.from_dict(item.rep.to_dict()) for item in basis.polys
    ]
    remainder = dividend.rem(divisors)
    return sp.Poly.from_dict(
        remainder.to_dict(), (Z2, Z1), domain=FIELD
    )


def irreducible_factors(guards):
    """Return the distinct nonconstant irreducible guard factors."""
    answer = {}
    for guard in guards:
        if sp.Poly(guard, Z1, Z2, domain=FIELD).total_degree() == 0:
            continue
        for factor, _multiplicity in sp.factor_list(
            guard, Z1, Z2, domain=FIELD
        )[1]:
            polynomial = sp.Poly(factor, Z1, Z2, domain=FIELD).monic()
            # Z1 and Z2 are phases.  A monomial factor is therefore a unit
            # on the algebraic torus and cannot make a physical guard vanish.
            if len(polynomial.terms()) == 1:
                continue
            answer[tuple(sorted(polynomial.rep.to_dict().items()))] = polynomial
    return tuple(answer.values())


def nonconstant_guards(guards):
    """Distinct complete guard numerators, without expensive factorization."""
    answer = {}
    for guard in guards:
        polynomial = sp.Poly(guard, Z1, Z2, domain=FIELD).monic()
        if polynomial.total_degree() == 0 or len(polynomial.terms()) == 1:
            continue
        answer[tuple(sorted(polynomial.rep.to_dict().items()))] = polynomial
    return tuple(answer.values())


def normalized_resultant(left, right):
    def as_univariate(polynomial):
        bivariate = sp.Poly(polynomial, Z1, Z2, domain=FIELD)
        coefficients = {}
        for (z1_degree, z2_degree), coefficient in bivariate.rep.to_dict().items():
            coefficients.setdefault((z2_degree,), {})[(z1_degree,)] = coefficient
        converted = {
            degree: COEFFICIENT_RING.ring.from_dict(items)
            for degree, items in coefficients.items()
        }
        return sp.Poly.from_dict(converted, (Z2,), domain=COEFFICIENT_RING)

    resultant = as_univariate(left).resultant(as_univariate(right))
    if resultant.is_zero:
        return None
    return sp.Poly(resultant.as_expr(), Z1, domain=FIELD).monic()


def key(polynomial):
    if polynomial is None:
        return ("curve",)
    return tuple(sorted(polynomial.rep.to_dict().items()))


def unit_circle_part(polynomial, variable=Z1):
    if polynomial is None:
        return None
    degree = polynomial.degree()
    reciprocal = sum(
        sp.conjugate(coefficient)*variable**(degree-power)
        for (power,), coefficient in polynomial.terms()
    )
    reciprocal = sp.Poly(reciprocal, variable, domain=FIELD)
    common = sp.polys.polytools.gcd(polynomial, reciprocal)
    return False if common.degree() == 0 else common.monic()


def discard_off_circle_linear_factors(polynomial, variable=Z2):
    """Remove exact linear factors whose unique root is not a phase.

    Reciprocal gcds are only a necessary unit-circle test: two off-circle
    reciprocal roots can survive together.  Over Q(omega), the finite
    Fourier residuals split mostly into linear factors, for which the
    physical test root*conj(root)=1 is exact.
    """
    kept = []
    for factor, multiplicity in polynomial.factor_list()[1]:
        factor = sp.Poly(factor, variable, domain=FIELD).monic()
        if factor.degree() == 1:
            root = -factor.nth(0)/factor.nth(1)
            root_expression = sp.sympify(root)
            modulus = FIELD.convert(
                sp.expand(root_expression*sp.conjugate(root_expression)-1)
            )
            if modulus != FIELD.zero:
                continue
        kept.extend([factor]*multiplicity)
    if not kept:
        return False
    answer = sp.Poly(1, variable, domain=FIELD)
    for factor in kept:
        answer *= factor
    return answer.monic()


def curve_unit_condition(polynomial):
    """Necessary z1 condition for a bivariate curve to meet T^2."""
    degree_z1 = polynomial.degree(Z1)
    degree_z2 = polynomial.degree(Z2)
    reciprocal = sum(
        sp.conjugate(coefficient)
        * Z1**(degree_z1-z1_power)
        * Z2**(degree_z2-z2_power)
        for (z1_power, z2_power), coefficient in polynomial.terms()
    )
    reciprocal = sp.Poly(reciprocal, Z1, Z2, domain=FIELD)
    condition = normalized_resultant(polynomial, reciprocal)
    if condition is None:
        return None
    return unit_circle_part(condition)


def reduce_cover(transpose=False):
    factor_sets = [
        irreducible_factors(frame_guards(*frame, transpose=transpose))
        for frame in FRAMES
    ]
    print(
        f"{'transpose' if transpose else 'affine'} factor counts: "
        f"{[len(factors) for factors in factor_sets]}",
        flush=True,
    )

    survivors = {}
    for anchor_index, anchor in enumerate(factor_sets[0]):
        states = {("curve",): None}
        for frame_index in range(1, len(factor_sets)):
            resultants = [
                normalized_resultant(anchor, factor)
                for factor in factor_sets[frame_index]
            ]
            next_states = {}
            for current in states.values():
                for resultant in resultants:
                    if current is None:
                        candidate = resultant
                    elif resultant is None:
                        candidate = current
                    else:
                        candidate = sp.polys.polytools.gcd(current, resultant)
                        if candidate.degree() == 0:
                            continue
                        candidate = candidate.monic()
                    next_states[key(candidate)] = candidate
            states = next_states
            if not states:
                break
        unit_states = {}
        for state in states.values():
            restricted = (
                curve_unit_condition(anchor)
                if state is None
                else unit_circle_part(state)
            )
            if restricted is False:
                continue
            unit_states[key(restricted)] = restricted
        if unit_states:
            survivors[anchor_index] = (anchor, unit_states)
        print(
            f"  anchor {anchor_index+1}/{len(factor_sets[0])}: "
            f"unit residuals={len(unit_states)}",
            flush=True,
        )
    return factor_sets, survivors


def quotient_check(factor_sets, survivors):
    """Resolve the finite unit-torus branches in exact quotient rings."""
    candidates = {}
    for anchor_index, (anchor, states) in survivors.items():
        for state in states.values():
            if state is None:
                raise AssertionError("a positive-dimensional torus branch remains")
            for factor, _multiplicity in sp.factor_list(
                state.as_expr(), Z1, domain=FIELD
            )[1]:
                polynomial = sp.Poly(factor, Z1, domain=FIELD).monic()
                restricted = unit_circle_part(polynomial)
                if restricted is False:
                    continue
                candidates[
                    (anchor_index, tuple(sorted(restricted.rep.to_dict().items())))
                ] = (anchor, restricted)
    print(f"irreducible finite z1 candidates: {len(candidates)}", flush=True)

    unresolved = []
    off_circle_z2 = 0
    for count, ((anchor_index, _), (anchor, q)) in enumerate(
        candidates.items(), start=1
    ):
        base = sp.groebner(
            [q.as_expr(), anchor.as_expr()],
            Z2, Z1, order="grevlex", domain=FIELD,
        )
        def reduce_poly(polynomial):
            # Keep algebraic-number coefficients in their native domain.
            # Converting every intermediate remainder through a radical
            # expression makes SymPy repeatedly recompute minimal
            # polynomials and dominates this finite check.
            return native_normal_form(polynomial, base)

        reduced_witnesses = []
        for factors in factor_sets[1:]:
            remainder = sp.Poly(1, Z2, Z1, domain=FIELD)
            for factor in factors:
                product = remainder*sp.Poly(factor, Z2, Z1, domain=FIELD)
                remainder = reduce_poly(product)
            reduced_witnesses.append(remainder.as_expr())
        generators = [q.as_expr(), anchor.as_expr()] + reduced_witnesses
        final = sp.groebner(
            generators, Z2, Z1, order="grevlex", domain=FIELD
        )
        if any(polynomial.as_expr() == 1 for polynomial in final.polys):
            continue

        lex = sp.groebner(generators, Z1, Z2, order="lex", domain=FIELD)
        excluded = False
        common_z2 = None
        for polynomial in lex.polys:
            expression = polynomial.as_expr()
            if expression != 0 and not expression.has(Z1):
                z2_polynomial = sp.Poly(expression, Z2, domain=FIELD).monic()
                restricted_z2 = unit_circle_part(z2_polynomial, Z2)
                if restricted_z2 is False:
                    excluded = True
                    off_circle_z2 += 1
                    break
                common_z2 = (
                    restricted_z2
                    if common_z2 is None
                    else sp.polys.polytools.gcd(common_z2, restricted_z2).monic()
                )
                if common_z2.degree() == 0:
                    excluded = True
                    off_circle_z2 += 1
                    break
        if not excluded:
            if common_z2 is not None:
                common_z2 = discard_off_circle_linear_factors(common_z2, Z2)
                if common_z2 is False:
                    excluded = True
                    off_circle_z2 += 1
            if excluded:
                continue
            unresolved.append((
                anchor_index,
                q.as_expr(),
                anchor.as_expr(),
                None if common_z2 is None else common_z2.as_expr(),
            ))
        if count % 20 == 0 or count == len(candidates):
            print(
                f"  quotient branches {count}/{len(candidates)}; "
                f"unresolved={len(unresolved)}",
                flush=True,
            )
    print(f"branches excluded by z2 unit-circle test: {off_circle_z2}")
    print(f"finite branches requiring rescue frames: {len(unresolved)}")
    return unresolved


def rescue_check(unresolved, transpose=False):
    """Prove the finite residual set is covered by the rescue frames."""
    rescue_factor_sets = []
    for index, frame in enumerate(RESCUE_FRAMES, start=1):
        try:
            guards = frame_guards(*frame, transpose=transpose)
        except AssertionError as error:
            if str(error) != "incomplete or identically singular product frame":
                raise
            print(
                f"  skipped identically singular rescue frame {index}: {frame}",
                flush=True,
            )
            continue
        rescue_factor_sets.append(nonconstant_guards(guards))
        print(
            f"  built rescue frame {index}/{len(RESCUE_FRAMES)}",
            flush=True,
        )

    failures = []
    for count, (anchor_index, q, anchor, z2_condition) in enumerate(
        unresolved, start=1
    ):
        if z2_condition is None:
            raise AssertionError("residual branch has no finite z2 condition")
        base = sp.groebner(
            [q, anchor, z2_condition],
            Z2, Z1, order="grevlex", domain=FIELD,
        )
        def reduce_poly(polynomial):
            return native_normal_form(polynomial, base)

        reduced_failures = []
        for factors in rescue_factor_sets:
            remainder = sp.Poly(1, Z2, Z1, domain=FIELD)
            for factor in factors:
                product = remainder*sp.Poly(factor, Z2, Z1, domain=FIELD)
                remainder = reduce_poly(product)
            reduced_failures.append(remainder.as_expr())
        final = sp.groebner(
            [q, anchor, z2_condition] + reduced_failures,
            Z2, Z1, order="grevlex", domain=FIELD,
        )
        if not any(polynomial.as_expr() == 1 for polynomial in final.polys):
            failures.append((anchor_index, q, anchor, z2_condition))
        if count % 10 == 0 or count == len(unresolved):
            print(
                f"  rescue branches {count}/{len(unresolved)}; "
                f"failures={len(failures)}",
                flush=True,
            )
    if failures:
        raise AssertionError(f"uncovered Fourier branches: {failures}")
    print("PASS every finite affine-Fourier residual has a product-regular rescue frame")


def main():
    modes = (True,) if os.environ.get("FOURIER_COVER_TRANSPOSE") == "1" else (False,)
    for transpose in modes:
        factor_sets, survivors = reduce_cover(transpose=transpose)
        print(
            f"{'transpose' if transpose else 'affine'} residual anchor branches: "
            f"{sum(len(states) for _, states in survivors.values())}"
        )
        for index, (_anchor, states) in survivors.items():
            degrees = [None if value is None else value.degree() for value in states.values()]
            print(f"    anchor {index+1}: degrees={degrees}")
        unresolved = quotient_check(factor_sets, survivors)
        if unresolved:
            rescue_check(unresolved, transpose=transpose)
        else:
            print("PASS the primary Fourier frames already cover the torus")
    print("FOURIER PRODUCT-COVER RESULTANT REDUCTION COMPLETE")


if __name__ == "__main__":
    main()
