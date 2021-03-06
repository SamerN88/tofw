"""
An archive documenting the evolution of the formula for B(k, n) used in this project.

B(k, n) = the entry at coordinates (k, n) in the table of free weights
"""

import math
import time


# Burton's initial biinfinite tape of integers (n=1)
def b(k):
    if (k % 2 == 0) and (k <= 0):
        return 4
    else:
        return 0


def B_recursive(k, n):
    """
    First function for B(k, n); recursive
    (developed 21 May 2021)
    """

    if n == 1:
        # Base case: n=1
        return b(k)
    else:
        return B_recursive(k-1, n-1) + 3*B_recursive(k+1, n-1)


def B_iterative(k, n):
    """
    Second function for B(k, n); iterative
    (developed 27 May 2021)
    """

    # If k and n have the same parity, or k >= n, the entry is always 0
    if ((k % 2) == (n % 2)) or (k >= n):
        return 0

    # Entries on and to the left of the diagonal (-n+1, n) are predictable powers of 4
    if k <= -n+1:
        return 4**n

    row = [b(j) for j in range(k-n+1, (k+n-1) + 1)]  # get the top-level (n=1) entries needed to compute B(k, n)
    for _ in range(n-1):
        end_idx = len(row) - 2
        row = [row[i-1] + 3*row[i+1] for i in range(1, end_idx + 1)]
        # This employs Burton's free weight cellular automaton; although we have a function for this defined above,
        # it is quicker to directly index the row than to make a function call each time.

    return row[0]


def B_mathy(k, n):
    """
    Third function for B(k, n); a mathematical formula using a summation of products
    of binomial coefficients and powers of 3, though not closed-form
    (original form developed 4 April 2022)
    (alternate form developed 8 April 2022)
    """

    # If k and n have the same parity, or k >= n, the entry is always 0
    if ((k % 2) == (n % 2)) or k >= n:
        return 0

    # Entries on and to the left of the diagonal (-n+1, n) are predictable powers of 4
    if k <= -n+1:
        return 4**n

    # Note that on average, over all k, both forms are equally efficient

    if k > 0:
        # Original form; faster for k > 0
        # B(k, n) = 4 * sum_{i=0}^{(n-k-1)/2} binomial(n-1, i) * 3^i
        return 4 * sum(math.comb(n-1, i) * 3**i for i in range(0, (n-k-1)//2 + 1))
    else:
        # Alternate form; faster for k < 0
        # B(k, n) = 4^n - [4 * sum_{i=(n-k+1)/2}^{n-1} binomial(n-1, i) * 3^i]
        return 4**n - 4*sum(math.comb(n-1, i) * 3**i for i in range((n-k+1)//2, (n-1) + 1))


def main():
    # Test that the different functions are equal
    for n in range(1, 10):
        for k in range(-10, 10):
            recursive = B_recursive(k, n)
            iterative = B_iterative(k, n)
            mathy = B_mathy(k, n)
            if not (recursive == iterative == mathy):
                print('FUNCTIONS ARE NOT EQUAL')
                print(f'(recursive == iterative) == {recursive == iterative}')
                print(f'(iterative == mathy) == {iterative == mathy}')
                print(f'(mathy == recursive) == {mathy == recursive}')
                return

    # Show info
    for fxn in (B_recursive, B_iterative, B_mathy):
        print(f'{fxn.__name__}: {fxn.__doc__}')
    print()

    # Compare runtimes of functions

    n = 25
    k = -16
    print(f'n={n}, k={k}')

    t1 = time.perf_counter()
    B_recursive(k, n)
    print(f'Recursive: {time.perf_counter() - t1} sec')

    t2 = time.perf_counter()
    B_iterative(k, n)
    print(f'Iterative: {time.perf_counter() - t2} sec')

    t3 = time.perf_counter()
    B_mathy(k, n)
    print(f'Mathy: {time.perf_counter() - t3} sec')

    print()

    n = 2500
    k = -1501
    print(f'n={n}, k={k}')

    t1 = time.perf_counter()
    B_iterative(k, n)
    print(f'Iterative: {time.perf_counter() - t1} sec')

    t2 = time.perf_counter()
    B_mathy(k, n)
    print(f'Mathy: {time.perf_counter() - t2} sec')


if __name__ == '__main__':
    main()

# The scratch work that led to the mathy formula (analysis of how the terms of B(k, n) are constructed):
'''
1 -> 1
3 -> 1(1 + 3) + 3
5 -> 1(1(1(1 + 3) + 3(1 + 3)) + 3(1(1 + 3) + 3))        +        3(1(1(1 + 3) + 3) + 3)

----

5 -> ((1 + 3) + 3(1 + 3)) + 3((1 + 3) + 3)        +        3(((1 + 3) + 3) + 3)
5 -> 1*1*1*1 + 1*1*1*3 + 1*1*3*1 + 1*1*3*3 + 1*3*1*1 + 1*3*1*3 + 1*3*3*1    +    3*1*1*1 + 3*1*1*3 + 3*1*3*1 + 3*3*1*1

----

3 -> 1*1 + 1*3 + 3*1
5 -> 1*1*1*1 + 1*1*1*3 + 1*1*3*1 + 1*1*3*3 + 1*3*1*1 + 1*3*1*3 + 1*3*3*1 + 3*1*1*1 + 3*1*1*3 + 3*1*3*1 + 3*3*1*1
  -> 1 + 3 + 3 + 9 + 3 + 9 + 9 + 3 + 9 + 9 + 9
  -> 1 + 4(3) + 6(9)


First working formula for center column (k=0):
    Let c(n) = sum_{k=0}^{n//2} binomial(n-1, k) * 3^k. Then
    B(0, n) = (n % 2) * 4 * c(n)
    for n > 3

Find formula for B(k, n):
(try to only compute nontrivial cells; trivial cells are already rapidly computable)

B(k, n) = [(n + k) % 2] * 4 * c(n)

B(-1, 4) = 148
d(-1, 4) = 37

Discovery: c(2n) = B(1, 2n)/4

Beta formula found (though expressed using standard mathematical operations, still not closed-form):
B(k, n) = 4 * sum_{i=0}^{n//2 - k//2} binomial(n-1, i) * 3^i

Compare:
>>> get_row(n, nonpos_k=True, nontrivial=True)
                n       runtime (s)     max temp
original B:     1100    ~107            92??C
      Beta:     1100    ~43             70??C
'''
