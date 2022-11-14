"""
As of now, this is still an experimental module to explore how the TOFW can be generalized.
"""

from sympy.ntheory import factorint, isprime
import pandas as pd
import math
import random


# For the generalized table, I decided to start indexing rows at n=0
# Default parameters are simplest initial conditions: x=y=1
class GeneralizedTOFW:
    def __init__(self, x=1, y=1, i_tape=lambda k: int(k >= 0 and k % 2 == 0)):
        self.x = x
        self.y = y
        self.i_tape = i_tape

        # self.data = pd.DataFrame(columns=['n', 'k', 'p_n', 'growth_avg', 'entry', 'factors'])

    def __call__(self, n, k):
        x = self.x
        y = self.y
        i_tape = self.i_tape

        # Base case; initial tape; first row; n=0
        if n == 0:
            return i_tape(k)

        # If n and k have different parity, entry is 0
        if (k % 2) != (n % 2):
            return 0

        row = [i_tape(j) for j in range(k-n, (k+n) + 1)]  # get top-level (n=0) entries needed to compute entry
        for _ in range(n):
            end_idx = len(row) - 2
            row = [x*row[i-1] + y*row[i+1] for i in range(1, end_idx + 1)]

        return row[0]

    def get_row(self, n, nontrivial=True):
        return [self(n, k) for k in range(-n, n+1)][::2 if nontrivial else 1]

    def triangle(self, n, verbose=False, indicate_primes=False):
        triangle = [[self(i, k) for k in range(-i, i+1)][::2] for i in range(n)]

        if verbose:
            width = len(str(max(triangle[-1]))) + 1 + (2 if indicate_primes else 0)
            width += (width % 2)

            half_width = width // 2
            index_width = len(str(n)) + 1

            num_pads = len(triangle[-1]) - 1
            for i, row in enumerate(triangle, 0):
                index = '' if n < 3 else str(i).ljust(index_width)
                padding = num_pads * half_width * ' '
                print(index + padding + ''.join(
                    (f'[{e}]' if isprime(e) and indicate_primes else f'{e}').center(width) for e in row
                ))

                num_pads -= 1

        return triangle

    def prime_sequence(self, max_depth=None):
        n = 0
        growth_avg = 0
        while (max_depth is None) or (n < max_depth):
            row = self.get_row(n)

            p_n = 1
            target_k = None
            target_entry = None
            target_factors = None
            for k, entry in zip(range(-n, n+1, 2), row):
                if entry in [0, 1]:
                    continue

                factors = factorint(entry)
                max_factor = max(factors)

                if max_factor > p_n:
                    p_n = max_factor
                    target_k = k
                    target_entry = entry
                    target_factors = factors

            growth_avg = (growth_avg*n +
                          math.log(p_n) / ((n+1) * math.log(self.x + self.y))
                          ) / (n + 1)

            print(f'n={n}, k={target_k}')
            print(f'p_n = {p_n}')
            print(f'entry = {target_entry}' + (' (prime)' if p_n == target_entry else ''))
            print(f'factors = {target_factors}')
            print(f'growth avg: {growth_avg}')
            print()

            n += 1

    def prime_frequency(self, n):
        entries = [e for row in self.triangle(n) for e in row[1:-1]]

        count = len(entries) - (2 * n - 1)
        bound = max(entries)
        randos = [random.randint(1, bound) for _ in range(count)]

        num_random_primes = len([n for n in randos if isprime(n)])
        num_generated_primes = len([n for n in entries if isprime(n)])

        print('# random primes =', num_random_primes, f'({num_random_primes / count :%})')
        print('# generated primes =', num_generated_primes, f'({num_generated_primes / count :%})')

    def formula(self, n, k):
        # Base case; initial tape; first row; n=0
        if n == 0:
            return self.i_tape(k)

        # If n and k have different parity, entry is 0
        if (k % 2) != (n % 2):
            return 0

        x = self.x
        y = self.y

        return (x+y) * sum(math.comb(n, i) * x**(n-i) * y**i for i in range(0, (n-k)//2 + 1))

    def test_formula(self):
        for n in range(0, 50):
            for k in range(-50, 50):
                print(self(n, k))
                print(self.formula(n, k))
                print()
                assert self(n, k) == self.formula(n, k)


def main():
    # EXPERIMENTING

    # gt = GeneralizedTOFW(x=4, y=5, i_tape=lambda k: int(k <= 0 and k % 2 == 0))
    # gt.test_formula()
    # return
    def i_tape(k):
        if k >= 0:  # 1 3 2 1 -> 5.2% for n=100
            if k % 7 == 0:
                return 1
            elif k % 6 == 0:
                return 2
            elif k % 4 == 0:
                return 3
            elif k % 2 == 0:
                return 1
            else:
                return 0
        else:
            return 0

    i_tape = lambda k: int(k <= 0 and k % 2 == 0)
    gt = GeneralizedTOFW(x=1, y=3, i_tape=i_tape)#x=1, y=1, i_tape=i_tape)

    gt.prime_frequency(100)
    gt.triangle(15, verbose=True, indicate_primes=True)
    # gt.prime_sequence()


if __name__ == '__main__':
    main()
