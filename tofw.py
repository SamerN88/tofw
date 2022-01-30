"""
Free Weight Cellular Automaton - Computational Exploration
Samer Najjar
21 May 2021

TOFW = Table of Free Weights
"""

import pandas as pd
import math
import matplotlib.pyplot as plt
import datetime
from sympy.ntheory import factorint

# Configure pandas to print the whole table instead of a portion of it
pd.set_option("display.max_rows", None, "display.max_columns", None)


# argument `a` is a biinfinite tape of integers, k is an integer coordinate on that tape
def free_weight_cellular_automaton(a, k: int) -> int:
    return a(k - 1) + (3 * a(k + 1))


# returns the value at coordinate k on a particular biinfinite tape of integers
# (defined in Burton's paper)
def b(k: int) -> int:
    if (k % 2 == 0) and (k <= 0):
        return 4
    else:
        return 0


# gets the value of a cell in the Table of Free Weights, recursively (using memoization)
def B_recursive(k: int, n: int, memo={}) -> int:
    if n < 1:
        msg = 'tape index (n) must be a natural number from [1, inf)'
        raise ValueError(msg)

    # if k and n have the same parity, or k >= n, the value in the cell is always 0
    if ((k % 2) == (n % 2)) or (k >= n):
        return 0

    if n == 1:
        return b(k)
    else:
        if (n in memo.keys()) and (k in memo[n].keys()):
            return memo[n][k]

        value = B_recursive(k - 1, n - 1, memo) + (3 * B_recursive(k + 1, n - 1, memo))

        try:
            memo[n][k] = value
        except KeyError:
            memo[n] = {k: value}

        return value


# gets the value of a cell in the Table of Free Weights, iteratively
def B(k, n):
    if n < 1:
        msg = 'tape index (n) must be a natural number from [1, inf)'
        raise ValueError(msg)

    # if k and n have the same parity, or k >= n, the value in the cell is always 0
    if ((k % 2) == (n % 2)) or (k >= n):
        return 0

    # cells on and to the left of the diagonal (-n+1, n) are predictable powers of 2
    if k <= -n+1:
        return 2 ** (2 * n)

    row = [b(j) for j in range(k-n+1, (k+n-1) + 1)]
    for _ in range(2, n + 1):
        end_idx = len(row) - 2
        row = [row[j-1] + 3*row[j+1] for j in range(1, end_idx + 1)]
        # This uses Burton's cellular automaton; although we have a function for this defined above,
        # it is quicker to directly index the row than to make a function call each time.

    return row[0]


def prime_factors(n):
    factors_dict = factorint(n)
    factors = []
    for prime in factors_dict.keys():
        factors += [prime] * factors_dict[prime]
    return tuple(sorted(factors))
    # # Naive algorithm:
    # i = 2
    # factors = []
    # while i * i <= n:
    #     if n % i:
    #         i += 1
    #     else:
    #         n //= i
    #         factors.append(i)
    # if n > 1:
    #     factors.append(n)
    # return tuple(factors)


def tofw_dataframe(k_range=(-10, 10), n_range=(1, 20), prime_decomp=False):
    k_start, k_end = k_range
    n_start, n_end = n_range

    tapes = []
    for n in range(n_start, n_end + 1):
        tape = []

        for k in range(k_start, k_end + 1):
            value = B(k, n)

            if prime_decomp:
                factors = prime_factors(value)
                if len(factors) == 0:
                    decomp = f'N/A ({value})'
                elif all(f == 2 for f in factors):
                    decomp = f'2^{len(factors)}'
                else:
                    decomp = str(factors)[1:][:-1]

            tape.append(value if not prime_decomp else decomp)

        tapes.append(tape)

    return pd.DataFrame(tapes, list(range(n_start, n_end + 1)), list(range(k_start, k_end + 1)))


# Slow but best chance of demonstrating long-term growth of p_n consummate with 4^n
def prime_growth(max_depth=None):
    """
    We define the relative average to be the quantity

    (1/ log(4)X) sum_{n=1}^X log(p_n)/n

    where p_n is the largest prime factor in row n and X is the number of rows over which we average
    the quantity log(p_n)/log(4)n which is a measure of how close the growth of the largest prime
    factor is to 4^n (the closer this quantity is to 1, the closer the growth is to 4^n).
    """

    if max_depth is None:
        max_depth = -1
    else:
        if max_depth < 1:
            msg = 'max_depth argument must be at least 1 (row index starts at 1)'
            raise ValueError(msg)

        if max_depth in [1, 2]:
            return

    # The first non-trivial row is n=3, so we begin printing results at B(0, 3) where p_3=7
    # (non-trivial = contains numbers that aren't 0 or powers of 2)
    # Thus the initial relative average accounts for rows 1 and 2, where p_1=p_2=2
    relative_average = 1/(2*math.log(4)) * sum(math.log(2)/i for i in [1, 2])

    n = 3

    try:
        while n != max_depth + 1:
            tape_decomp = [prime_factors(B(k, n)) for k in range(3 - n, 0 + 1)]

            # This for-loop allows us to get k (k is the column containing the max prime p_n)
            p_n = 2
            k = 0
            for i, d in enumerate(tape_decomp, 3 - n):
                if len(d) == 0:
                    continue
                else:
                    max_factor = d[-1]
                    if max_factor >= p_n:
                        p_n = max_factor
                        k = i

            relative_average = ((n - 1)*relative_average + (math.log(p_n) / (math.log(4) * n))) / n

            print(f'n={n}, k={k}')
            print(f'p_n={p_n}')
            print(f'average={relative_average}')
            print()

            n += 1
    except KeyboardInterrupt:
        print('Process stopped by user.')
    except Exception as e:
        print('#' * 100)
        print(f'{type(e).__name__}:', e)


# Shown to be ineffective
def prime_growth_fixed_col(k, max_depth=None):
    if max_depth is None:
        max_depth = -1
    else:
        if max_depth < 1:
            msg = 'max_depth argument must be at least 1 (row index starts at 1)'
            raise ValueError(msg)

        if max_depth in [1, 2]:
            return

    # Starts on the diagonals (k, |k|+3) which contain the first non-trivial cells
    n = abs(k) + 3
    value = B(k, n)
    p_n = prime_factors(value)[-1]
    relative_average = math.log(p_n) / (n * math.log(4))

    print(f'n={n}')
    print(f'p_n={p_n}')
    print(f'average={relative_average}')
    print()

    n += 1

    try:
        while n != max_depth + 1:
            value = B(k, n)

            if value == 0:
                print(f'n={n} (skip)')
            else:
                p_n = prime_factors(value)[-1]
                relative_average = ((n - 1)*relative_average + (math.log(p_n) / (math.log(4) * n))) / n

                print(f'n={n}')
                print(f'p_n={p_n}')
                print(f'average={relative_average}')

            print()
            n += 1
    except KeyboardInterrupt:
        print('Process stopped by user.')
    except Exception as e:
        print('#' * 100)
        print(f'{type(e).__name__}:', e)


# Shown to be ineffective
def prime_growth_diagonal(max_depth=None):
    if max_depth is None:
        max_depth = -1
    else:
        if max_depth < 1:
            msg = 'max_depth argument must be at least 1 (row index starts at 1)'
            raise ValueError(msg)

        if max_depth in [1, 2]:
            return

    # Starts on (0, 3), the first non-trivial cell
    k, n = 0, 3
    value = B(k, n)
    p_n = prime_factors(value)[-1]
    relative_average = math.log(p_n) / (n * math.log(4))

    print(f'n={n}, k={k}')
    print(f'p_n={p_n}')
    print(f'average={relative_average}')
    print()

    n += 1
    k -= 1

    try:
        while n != max_depth + 1:
            value = B(k, n)

            p_n = prime_factors(value)[-1]
            relative_average = ((n - 1)*relative_average + (math.log(p_n) / (n * math.log(4)))) / n

            print(f'n={n}, k={k}')
            print(f'p_n={p_n}')
            print(f'average={relative_average}')

            print()
            n += 1
            k -= 1
    except KeyboardInterrupt:
        print('Process stopped by user.')
    except Exception as e:
        print('#' * 100)
        print(f'{type(e).__name__}:', e)


def prime_growth_data():
    data = [
        (3, 7, 0.48929749566986686),
        (4, 37, 0.5297685394283048),
        (5, 67, 0.5451366153517994),
        (6, 71, 0.5396936672307312),
        (7, 347, 0.5487046928567314),
        (8, 14197, 0.5878767506430095),
        (9, 41479, 0.6172490468233154),
        (10, 45853, 0.6329477846755027),
        (11, 792697, 0.6563839777665438),
        (12, 174659, 0.6621512207988038),
        (13, 14120011, 0.6814864460531348),
        (14, 22394171, 0.6950961384904065),
        (15, 13783631, 0.7014596240336706),
        (16, 3067231, 0.699705322126485),
        (17, 365080129, 0.707756631733834),
        (18, 17050729021, 0.7208891558555862),
        (19, 5964084611, 0.7279249808644502),
        (20, 36735763033, 0.7353993145584893),
        (21, 1088863403, 0.7344167801175071),
        (22, 123468206909, 0.7390975758963556),
        (23, 8500589429053, 0.7475590234656376),
        (24, 11236322557, 0.7453928930555795),
        (25, 19161552580567, 0.7508758010892754),
        (26, 1440528320401, 0.7518700270550895),
        (27, 4479028257696649, 0.7596828704915519),
        (28, 1020107072457383, 0.7643483049711789),
        (29, 10260171502270477, 0.7696132887263253),
        (30, 36427199530664773, 0.7745238822161569),
        (31, 376314558252191479, 0.7799163047025427),
        (32, 303949858714099727, 0.7839016403765149),
        (33, 36948020548661539, 0.7854162585256977),
        (34, 3649714872483233, 0.7846759469357152),
        (35, 647782406270270647, 0.7864069553490798),
        (36, 1176650246775723437617, 0.7915666292526021),
        (37, 4670216935694787852433, 0.7964636522598667),
        (38, 2360432768258337611243, 0.8000884111976829),
        (39, 12002719487977695198019, 0.8036843623259581),
        (40, 3254793154373872449323, 0.8059244582222179)
    ]

    df = pd.DataFrame(data={
        'n': [e[0] for e in data],
        'p_n': [e[1] for e in data],
        'average': [e[2] for e in data]
    }, index=range(len(data)))

    df.plot(kind='scatter', x='n', y='average')
    plt.show()

    return df


def main():
    #####################################################
    print(f'Running main at {datetime.datetime.now()}\n')
    #####################################################

    prime_growth()
    # prime_growth_fixed_col(0)
    # prime_growth_diagonal()
    return

    # Generate the TOFW with specified grid range
    table = tofw_dataframe(k_range=(-27, 27), n_range=(1, 30), prime_decomp=False)

    # Print the table
    print(table)
    print()

    # Create Excel file of the table
    # table.applymap(str).to_excel('Spreadsheets/' + input('Enter filename (no ext): ') + '.xlsx')


if __name__ == "__main__":
    main()

'''
Notes for scalability:
- parallelize along row
- adapt code to C++
- run on AWS server

Questions for Burton:
- (fix 1 column, or go diagonal) Is this the right way of computing the long-term average?
    * I think when going down the diagonal starting at (0, 3) we compare with 4^n
    
Notes:
- since these numbers are the product of one large prime and many smaller factors, maybe 
    after factoring out the small primes we can just do a Miller-Rabin test on what remains
'''
