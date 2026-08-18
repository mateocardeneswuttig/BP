#!/usr/bin/env python3
"""Independent standard-library audit of the 24 incidence types.

This deliberately does not import SymPy or the primary threshold checker.
It uses Fraction Gaussian elimination and elementary set combinatorics.
"""

from fractions import Fraction
from itertools import combinations, permutations


EXPECTED = (
    (180, "123 124 125 126 134", "E"),
    (180, "123 124 125 134 135", "T"),
    (360, "123 124 125 134 136", "E"),
    (360, "123 124 125 134 156", "E"),
    (180, "123 124 125 134 234", "T"),
    (360, "123 124 125 134 235", "T"),
    (720, "123 124 125 134 236", "E"),
    (360, "123 124 125 134 345", "E"),
    (360, "123 124 125 136 146", "E"),
    (180, "123 124 125 136 236", "E"),
    (360, "123 124 125 136 246", "E"),
    (360, "123 124 125 136 345", "E"),
    (360, "123 124 134 156 235", "E"),
    (360, "123 124 134 235 245", "T"),
    (360, "123 124 134 235 246", "E"),
    (180, "123 124 135 145 256", "R"),
    (72, "123 124 135 146 156", "E"),
    (720, "123 124 135 146 236", "E"),
    (360, "123 124 135 146 256", "E"),
    (720, "123 124 135 146 345", "E"),
    (72, "123 124 135 245 345", "E"),
    (360, "123 124 135 245 346", "E"),
    (360, "123 124 135 256 346", "E"),
    (180, "123 124 156 256 345", "E"),
)


def main():
    vertices = tuple(range(6))
    vertex_set = frozenset(vertices)
    edges = tuple(combinations(vertices, 2))
    triples = tuple(combinations(vertices, 3))
    edge_index = {edge: index for index, edge in enumerate(edges)}
    triple_index = {triple: index for index, triple in enumerate(triples)}

    admissible = []
    for chosen in combinations(range(20), 5):
        chosen_set = set(chosen)
        if any(
            triple_index[tuple(sorted(vertex_set - set(triples[index])))]
            in chosen_set
            for index in chosen
        ):
            continue
        admissible.append(chosen)
    assert len(admissible) == 8064

    all_permutations = tuple(permutations(vertices))

    def transport(chosen, permutation):
        return tuple(sorted(
            triple_index[tuple(sorted(permutation[value]
                                      for value in triples[index]))]
            for index in chosen
        ))

    seen = set()
    actual = []
    for chosen in admissible:
        if chosen in seen:
            continue
        orbit = {transport(chosen, permutation)
                 for permutation in all_permutations}
        seen.update(orbit)
        solutions = solve_weight_system(
            chosen, vertices, vertex_set, edges, triples, edge_index
        )
        selected = [
            solutions[edge_index[next(iter(combinations(triples[index], 2)))]]
            for index in chosen
        ]
        category = classify(selected, chosen, triples)
        representative = " ".join(
            "".join(str(value + 1) for value in triples[index])
            for index in chosen
        )
        actual.append((len(orbit), representative, category))

    assert tuple(actual) == EXPECTED
    assert len(seen) == len(admissible)
    assert sum(size for size, _, _ in actual) == 8064
    assert sum(category == "E" for _, _, category in actual) == 19
    assert sum(category == "R" for _, _, category in actual) == 1
    assert sum(category == "T" for _, _, category in actual) == 4

    print("PASS independent standard-library enumeration gives 24 S6 orbits")
    print("PASS independent Fraction elimination gives the 19+1+4 split")
    print("PASS the visible orbit table and all orbit sizes agree exactly")
    print("ALL INDEPENDENT DEPENDENT-BLOCK CHECKS PASSED")


def solve_weight_system(chosen, vertices, vertex_set, edges, triples,
                        edge_index):
    """Return every edge weight as an affine vector in the free variables."""
    variable_count = len(edges)
    rows = []

    def equation(coefficients, right_hand_side):
        row = [Fraction(0) for _ in range(variable_count + 1)]
        for index, coefficient in coefficients.items():
            row[index] += Fraction(coefficient)
        row[-1] = Fraction(right_hand_side)
        rows.append(row)

    for vertex in vertices:
        equation(
            {edge_index[edge]: 1 for edge in edges if vertex in edge}, 9
        )

    for index in chosen:
        triangle_edges = tuple(combinations(triples[index], 2))
        base = edge_index[triangle_edges[0]]
        for edge in triangle_edges[1:]:
            equation({edge_index[edge]: 1, base: -1}, 0)
        complement = tuple(sorted(vertex_set - set(triples[index])))
        coefficients = {
            edge_index[edge]: 1 for edge in combinations(complement, 2)
        }
        coefficients[base] = coefficients.get(base, 0) - 3
        equation(coefficients, 0)

    pivot_row = 0
    pivot_columns = []
    for column in range(variable_count):
        selected_row = next(
            (row for row in range(pivot_row, len(rows))
             if rows[row][column] != 0),
            None,
        )
        if selected_row is None:
            continue
        rows[pivot_row], rows[selected_row] = rows[selected_row], rows[pivot_row]
        pivot = rows[pivot_row][column]
        rows[pivot_row] = [value / pivot for value in rows[pivot_row]]
        for row in range(len(rows)):
            if row == pivot_row or rows[row][column] == 0:
                continue
            multiplier = rows[row][column]
            rows[row] = [
                value - multiplier * pivot_value
                for value, pivot_value in zip(rows[row], rows[pivot_row])
            ]
        pivot_columns.append(column)
        pivot_row += 1

    assert not any(
        all(value == 0 for value in row[:-1]) and row[-1] != 0
        for row in rows
    )
    free_columns = [
        column for column in range(variable_count)
        if column not in pivot_columns
    ]
    free_position = {column: index
                     for index, column in enumerate(free_columns)}
    affine = [None] * variable_count
    for column in free_columns:
        coefficients = [Fraction(0)] * (1 + len(free_columns))
        coefficients[1 + free_position[column]] = Fraction(1)
        affine[column] = tuple(coefficients)
    for row, column in enumerate(pivot_columns):
        coefficients = [rows[row][-1]] + [Fraction(0)] * len(free_columns)
        for free_column in free_columns:
            coefficients[1 + free_position[free_column]] = -rows[row][free_column]
        affine[column] = tuple(coefficients)
    assert all(value is not None for value in affine)
    return affine


def classify(selected, chosen, triples):
    endpoint = (Fraction(9, 5),) + (Fraction(0),) * (len(selected[0]) - 1)
    if all(value == endpoint for value in selected):
        return "E"

    distinct = list(dict.fromkeys(selected))
    if len(distinct) == 2:
        for first, second in ((distinct[0], distinct[1]),
                              (distinct[1], distinct[0])):
            relation = tuple(
                left + Fraction(2, 3) * right
                for left, right in zip(first, second)
            )
            target = (Fraction(3),) + (Fraction(0),) * (len(relation) - 1)
            if relation == target:
                return "R"

    chosen_triples = {triples[index] for index in chosen}
    has_tetrahedron = any(
        sum(face in chosen_triples for face in combinations(four_set, 3)) >= 3
        for four_set in combinations(range(6), 4)
    )
    assert has_tetrahedron
    return "T"


if __name__ == "__main__":
    main()
