"""
The Table of Free Weights: A Computational Exploration
Samer Najjar
21 May 2021

TOFW = table of free weights

See Dr. Peter Burton's informal paper "The mystery of the table of free weights" for
background info and definitions on the TOFW:
https://github.com/SamerN88/tofw/blob/main/Papers/The_mystery_of_the_table_of_free_weights_Peter_Burton_1.pdf

Some terminology/notation:
    k - column index of a cell
    n - row index of a cell
    p_n - the largest prime factor found among the entries of row n
    master cell - the cell whose entry has the largest prime factor in its row
    master entry - the entry in the master cell
    master prime - the largest prime factor of the master entry (denoted by p_n)
    4^n sea - the infinite grid of cells stretching leftward where k<3-n; all entries
        here are 4^n where k and n have different parities, and 0 where k and n have
        equal parities (we consider these cells trivial)
    zero sea - the infinite grid of cells stretching rightward where k>n-3; all entries
        here are 0 (we consider these cells trivial)
"""

import math
from math import log as ln
import pandas as pd
from sympy.ntheory import factorint

# Configure pandas to print the whole table instead of a portion of it
pd.set_option("display.max_rows", None, "display.max_columns", None)


def free_weight_cellular_automaton(a, k):
    """free_weight_cellular_automaton(a: function, k: int) -> int

    Burton's free weight cellular automaton (defined in Burton's paper)
        parameter `a` is a function representing a biinfinite tape of integers
        parameter `k` is an integer index on that tape
        returns a(k-1) + 3*a(k+1)
    """
    return a(k - 1) + (3 * a(k + 1))


# NOTE: we can get the same results in terms of generating primes by using an initial tape of 1s and 0s
#   instead of 4s and 0s; the only difference is that the 4^n sea would become a 4^(n-1) sea, but
#   essentially we'd still be measuring the growth of primes against 4^n in the long run.
def b(k):
    """b(k: int) -> int

    Burton's initial biinfinite tape of integers, i.e. row n=1 (defined in Burton's paper)
    Returns the value at index k on this initial input tape:
        - if k is even and less than or equal to 0, return 4
        - otherwise, return 0
    """

    if (k % 2 == 0) and (k <= 0):
        return 4
    else:
        return 0


def B(k, n):
    """B(k: int, n: int) -> int

    Gets the entry at coordinates (k, n) in the table of free weights (defined in Burton's paper);
    a mathematical formula expressed using standard operations, but still not closed-form.

    Formula:
    B(k, n) = 4 * sum_{i=0}^{n//2 - k//2} binomial(n-1, i) * 3^i
    """

    if n < 1:
        msg = 'row index `n` must be a natural number in [1, inf)'
        raise ValueError(msg)

    # If k and n have the same parity, or k >= n, the entry is always 0
    if ((k % 2) == (n % 2)) or k >= n:
        return 0

    # Entries on and to the left of the diagonal (-n+1, n) are predictable powers of 4
    if k <= -n+1:
        return 4**n

    m = n - 1

    num_coefs = (m//2 - k//2) + 1
    binomial_coefs = (math.comb(m, i) for i in range(num_coefs))

    # 4 * sum_{i=0}^{n//2 - k//2} binomial(n-1, i) * 3^i
    return 4 * sum(coef * 3**e for e, coef in enumerate(binomial_coefs))


def get_k_index(n, nonpos_k=False, nontrivial=False):
    """get_k_index(n: int, nonpos_k: bool=False, nontrivial: bool=False) -> range

    By default, returns a range object of the k-coordinates of the cells in row n within
    1-n <= k <= n-1, which includes the index of the first 4^n entry from the left tail
    (first element) and the index of the 4 entry from the right tail (last element); less
    than this is the trivial 4^n sea, greater than this is the trivial zero sea.

        `nonpos_k=True` gets only k<=0 (where the master cell is conjectured to always be)
        `nontrivial=True` gets only non-trivial entries (i.e. excludes zeros and powers of 4)

    Cases:
        - `nonpos_k=False` and `nontrivial=False`: returns range(1-n, (n-1) + 1)
        - `nonpos_k=True` and `nontrivial=False`: returns range(1-n, 0 + 1)
        - `nonpos_k=False` and `nontrivial=True`: returns range(3-n, (n-3) + 1, 2)
        - `nonpos_k=True` and `nontrivial=True`: returns range(3-n, 0 + 1, 2)
    """

    if n < 1:
        msg = 'row index `n` must be a natural number in [1, inf)'
        raise ValueError(msg)

    k_start = 1-n + (2 if nontrivial else 0)
    k_end = (0 if nonpos_k else n-1) - (2 if nontrivial and not nonpos_k else 0)
    step = 2 if nontrivial else 1

    return range(k_start, k_end + 1, step)


def get_row(n, nonpos_k=False, nontrivial=False):
    """get_row(n: int, nonpos_k: bool=False, nontrivial: bool=False) -> list

    By default, returns a list of the entries in row n within 1-n <= k <= n-1, which includes
    the first 4^n entry from the left tail (first element) and the 4 entry from the right tail
    (last element); less than this is the trivial 4^n sea, greater than this is the trivial
    zero sea.

        `nonpos_k=True` gets only k<=0 (where the master cell is conjectured to always be)
        `nontrivial=True` gets only non-trivial entries (i.e. excludes zeros and powers of 4)
    """
    return [B(k, n) for k in get_k_index(n, nonpos_k, nontrivial)]


def get_row_in_range(n, k_start, k_end):
    """get_row_in_range(n: int, k_start: int, k_end: int) -> list

    Returns a list of all entries (including trivial) in row n within k_start <= k <= k_end
    """
    return [B(k, n) for k in range(k_start, k_end + 1)]


def intermediate_growth_ratio(n, p_n):
    """intermediate_growth_ratio(n: int, p_n: int) -> float

    Computes the quantity

        ln(p_n) / (n * ln(4))

    which is the ratio that we average over many rows when measuring the growth of p_n
    against 4^n. Thus, it is an intermediate value that gets computed as part of an
    average that measures growth of p_n, so we call this quantity the intermediate
    growth ratio for row n.
    """
    return ln(p_n) / (n * ln(4))


def tofw_grid(k_range, n_range, factor_entries=False):
    """tofw_grid(k_range: tuple, n_range: tuple, factor_entries: bool=False): -> pandas.core.frame.DataFrame

    Returns a pandas DataFrame of the table of free weights within a specified grid area
        `k_range` is a tuple (k_start, k_end)
        `n_range` is a tuple (n_start, n_end)
        `factor_entries=True` factors all the entries in the table
    """

    k_start, k_end = k_range
    n_start, n_end = n_range

    rows = []
    for n in range(n_start, n_end + 1):
        row = get_row_in_range(n, k_start, k_end)

        if factor_entries:
            row = [factorint(e) for e in row]

        rows.append(row)

    return pd.DataFrame(rows, list(range(n_start, n_end + 1)), list(range(k_start, k_end + 1)))


def Burton_triangle(n, verbose=False):
    """Burton_triangle(n: int, verbose: bool=False) -> dict

    This function essentially builds a triangle of non-trivial entries up to and including
    row n (resembles Pascal's triangle). The left diagonal of the triangle is comprised of
    powers of 4 (4^i for i from 1 to n) and the right diagonal of the triangle is comprised
    of only 4s. Only these two diagonals are trivial entries; the numbers inside the triangle
    are the non-trivial entries up to and including row n.

    Returns a dictionary representing the first n rows of the table of free weights; keys are
    integer row indexes (1 to n), and values are tuples of row entries. Each tuple is built as
    follows (let i be the row index from 1 to n):
        - first element is 4^i
        - inside elements are the non-trivial entries of row i
        - last element is 4
    Thus, each row of the triangle (except row 1) is essentially equivalent to
    `[4**i] + get_row(i, nontrivial=True) + [4]`

    `verbose=True` prints the triangle neatly
    """

    if n < 1:
        msg = 'row index `n` must be a natural number in [1, inf)'
        raise ValueError(msg)

    initial = [[4]]
    if n == 1:
        triangle = initial
    else:
        triangle = initial + [[4**i] + get_row(i, nontrivial=True) + [4] for i in range(2, n+1)]

    if verbose:
        width = len(str(max(triangle[-1]))) + 1
        width += (width % 2)

        half_width = width // 2
        index_width = len(str(n)) + 1

        num_pads = len(triangle[-1]) - 1
        for i, row in enumerate(triangle, 1):
            if n < 3:
                index = ''
            else:
                index = str(i).ljust(index_width)

            padding = num_pads * half_width * ' '
            print(index + padding + ''.join(str(e).center(width) for e in row))

            num_pads -= 1

    return {i: tuple(row) for i, row in enumerate(triangle, 1)}


def main():
    # Get grid range and factor_entries option
    n_start, n_end = [int(n) for n in input('Enter n range: ').split()]
    k_start, k_end = [int(k) for k in input('Enter k range: ').split()]
    factor_entries = input('Factor entries? [y/n]: ').strip().lower()[0] == 'y'

    print()

    # Get filepath
    fp = input('Enter filename (path accepted): ')

    # Get extension
    rev = ''.join(reversed(fp))
    dot_idx = rev.find('.')
    ext = rev[:dot_idx][::-1]

    if ext not in ['csv', 'xlsx'] or dot_idx == -1:
        print(f'\nInvalid file extension (only .csv and .xlsx allowed)')
        exit()

    # Generate the TOFW with specified grid range
    print('\nGenerating TOFW...')
    table = tofw_grid(k_range=(k_start, k_end), n_range=(n_start, n_end), factor_entries=factor_entries)
    print('Done')

    if ext == 'csv':
        table.to_csv(fp)
    elif ext == 'xlsx':
        table.to_excel(fp)

    print(f'\nTable saved in {fp}')


if __name__ == "__main__":
    main()
