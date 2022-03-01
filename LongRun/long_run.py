"""
Free Weight Cellular Automaton - Computational Exploration
Samer Najjar
21 May 2021

TOFW = Table of Free Weights
"""

import pandas as pd
import math
import datetime
import time
from sympy.ntheory import factorint
from concurrent.futures import ProcessPoolExecutor
import psutil
import platform

# Configure pandas to use high-precision floats
pd.set_option('display.precision', 16)


# returns the value at coordinate k on row n=1 (defined in Burton's paper)
def b(k: int) -> int:
    if (k % 2 == 0) and (k <= 0):
        return 4
    else:
        return 0


# gets the value of a cell in the Table of Free Weights, iteratively
def B(k, n):
    if n < 1:
        msg = 'tape index (n) must be a natural number from [1, inf)'
        raise ValueError(msg)

    # if k and n have the same parity, or k >= n, the value in the cell is always 0
    if ((k % 2) == (n % 2)) or (k >= n):
        return 0

    # cells on and to the left of the diagonal (-n+1, n) are predictable powers of 2
    if k <= -n + 1:
        return 2 ** (2 * n)

    row = [b(j) for j in range(k - n + 1, (k + n - 1) + 1)]
    for _ in range(2, n + 1):
        end_idx = len(row) - 2
        row = [row[j - 1] + 3*row[j + 1] for j in range(1, end_idx + 1)]

    return row[0]


# This function is strictly designed to communicate with outside text files in a specific way;
# it serves a very specific purpose and is not made for testing or general use.
def prime_growth_data_logger(max_depth=None, mp_threshold=69):
    """
    The growth average metric (growth_avg) is the quantity

    (1/ log(4)X) sum_{n=1}^X log(p_n)/n

    where p_n is the largest prime factor in row n and X is the number of rows over which we average
    the quantity log(p_n)/log(4)n which is a measure of how close the growth of p_n is to 4^n (the
    closer this quantity is to 1, the closer the growth is to 4^n).

    Master cells data that is logged:
        n: row index (of master cell)
        k: column index (of master cell)
        p_n: largest prime factor in row n
        growth_avg: the metric by which we measure the growth of p_n against 4^n
        entry: the output of B(k, n), i.e. the value at cell (k, n) of which p_n is a factor
        factors: prime factorization of the entry (as a dictionary)
        runtime: the time it took to compute everything for row n in seconds
    """

    if (max_depth is not None) and (max_depth < 1):
        msg = 'max_depth argument must be at least 1 (row index starts at 1)'
        raise ValueError(msg)

    # Define file paths
    master_data_fp = 'logs/master_data.csv'
    run_info_fp = 'logs/run_info.csv'
    dump_fp = 'logs/all_cells.csv'
    stdout_fp = 'logs/stdout.txt'

    # Start timestamp
    start = f'{datetime.datetime.now()} {time.localtime().tm_zone}'
    print(f'Start run at {start}\n\n')

    # Open file for reading stdout history
    with open(stdout_fp, 'r') as stdout_log:
        log_history = stdout_log.read()

    # Print complete log history
    print('START LOG HISTORY ' + '-'*59 + '\n')
    print(log_history.rstrip() + '\n')
    print('END LOG HISTORY ' + '-'*61 + '\n')

    # Read master data log as a DataFrame (to read most current n and growth_avg values)
    master_data_df = pd.read_csv(master_data_fp)

    # Set n and growth_avg to most current values
    n = list(master_data_df['n'])[-1] + 1
    growth_avg = list(master_data_df['growth_avg'])[-1]

    stop_reason = 'UNKNOWN'

    try:
        while (max_depth is None) or (n <= max_depth):
            t1 = time.time()

            # Open log files for current iteration
            master_data_log = open(master_data_fp, 'a')  # to log master data (master cells, growth avg, etc.)
            dump = open(dump_fp, 'a')  # to log all computed entries and factorizations
            stdout_log = open(stdout_fp, 'a')  # to log print statements (standard output)

            # Generate non-trivial entries in row n (without factoring)
            row = [B(k, n) for k in range(3 - n, 0 + 1)]

            # At low values of n, the overhead from multiprocessing actually takes longer than factoring the row
            # synchronously, so we only let multiprocessing kick in at a higher n when factoring synchronously
            # gets sufficiently slow.
            if n < mp_threshold:
                row_decomp = [factorint(e) for e in row]
            else:
                # Factor the entries in row n using multiprocessing (for speed)
                with ProcessPoolExecutor() as pool:  # by default max_workers=min(32, os.cpu_count() + 4)
                    row_decomp = pool.map(factorint, row)

            # Find the master cell and extract desired values
            # Initialize values at leftmost cell, i.e. on the diagonal (-n+1, n), which is a power of 2
            k = 1 - n
            p_n = 2
            master_entry = 4**n
            master_factors = {2: 2*n}
            for i, factors in enumerate(row_decomp, 3 - n):  # index row_decomp by each cell's k coordinate
                entry = row[i - (3-n)]

                if entry == 0:
                    continue

                max_factor = max(factors.keys())

                # Log --------------------------------------------------------------------------------------------------
                dump.write(f'{n},{i},{entry},"{factors}",{max_factor}\n')
                # ------------------------------------------------------------------------------------------------------

                if max_factor > p_n:
                    k = i
                    p_n = max_factor
                    master_entry = entry
                    master_factors = factors

            # Compute new growth average
            growth_avg = (
                            (n - 1) * growth_avg
                            +
                            (math.log(p_n) / (math.log(4)*n))
                        ) / n

            runtime = time.time() - t1  # in seconds

            # Log ------------------------------------------------------------------------------------------------------
            master_data_log.write(f'{n},{k},{p_n},{growth_avg},{master_entry},"{master_factors}",{runtime}\n')
            # ----------------------------------------------------------------------------------------------------------

            stdout = f'n={n}, k={k}\n'
            stdout += f'p_n = {p_n}\n'
            stdout += f'growth avg = {growth_avg}\n'
            stdout += f'({runtime} sec)\n'

            # Log ------------------------------------------------------------------------------------------------------
            stdout_log.write(stdout + '\n')
            # ----------------------------------------------------------------------------------------------------------

            # Close log files for current iteration
            master_data_log.close()
            dump.close()
            stdout_log.close()

            print(stdout)
            n += 1

        stop_reason = f'MAX DEPTH REACHED (max_depth={max_depth})'
    except KeyboardInterrupt:
        stop_reason = 'PROCESS STOPPED BY USER'
    except Exception as e:
        # Don't re-raise exception, as it will mess up the order of the output. Just print the error below
        stop_reason = f'{type(e).__name__}: {e}'
    finally:
        # End timestamp
        end = f'{datetime.datetime.now()} {time.localtime().tm_zone}'

        # Get last n that was logged
        last_n = list(pd.read_csv(master_data_fp)['n'])[-1]  # better than len(file.readlines()) or Series.max()

        # Get previous run number
        run_numbers = pd.read_csv(run_info_fp)['run']
        if len(run_numbers) == 0:
            prev_run = 0  # i.e. there are no previous runs
        else:
            prev_run = list(run_numbers)[-1]  # better than len(file.readlines()) or Series.max()

        # Get CPU info; if fails, log error
        try:
            cpu_freq = psutil.cpu_freq()
            cpu_info = {
                'cores': psutil.cpu_count(logical=False),
                'current_freq': cpu_freq.current,
                'max_freq': cpu_freq.max,
                'min_freq': cpu_freq.min,
                'os': platform.system()
            }
        except Exception as e:
            cpu_info = f'{type(e).__name__}: {e}'

        # Log ----------------------------------------------------------------------------------------------------------
        with open(run_info_fp, 'a') as run_info_log:
            stop_reason = stop_reason.replace('"', "'")  # to avoid parsing errors in CSV file
            run_info_log.write(f'{prev_run+1},"{start}","{end}",{last_n},"{stop_reason}",{mp_threshold},"{cpu_info}"\n')
        # --------------------------------------------------------------------------------------------------------------

        print(stop_reason)
        print(f'\n\nEnd run at {end}')


def main():
    prime_growth_data_logger(mp_threshold=200)


if __name__ == "__main__":
    main()


# TODO: SET LOG=False WHILE TESTING
#   ========================================================================================
#
#   TODO: start new exploration called MasterSift that gets only master cells in the following way:
#       - since master cells factor very quickly (under 1 sec up to n=126), we will assume that master cells up to
#         n=N factor in under X_N seconds; we then go through a row, and if a cell takes longer than X_N sec to
#         factor, we skip it. we only factor easy cells, then find the master cell among those.
#         * CON: this assumes that master cells will always factor in under X seconds given n=N
#         * PRO: if our assumption holds, then this is a super expedient way to get master cells
#
#   TODO: run git commands from Python to add, commit, and push after every iteration
#
#   TODO: open files AFTER factoring, to reduce the time that files are kept open
#       - consider writing a function that takes a file path and a content argument, opens the file, appends to it,
#         and closes the file. This will simplify the code. Call it append_to_file(fp, content).
#
#   TODO: there are many parts, especially with cado now, so just compartmentalize everything; separate functions
#       for the following (NOTE: non-trivial = non-zero, non-power-of-2, and k<=0):
#       - append content to a file
#       - get non-trivial entries of row n
#       - get list of indexes (k-coordinates) for the non-trivial cells in row n
#       - get cado-nfs output as a list of factors
#       - one big function focused only on factoring an entry:
#           * accepts the multiprocessing threshold parameter mp_threshold
#           * contains all sympy and cado implementation
#
#   TODO: implement cado: cado factors as many cells as possible, gives the rest to sympy
#       - figure out how to silence cado messages and just capture output
#       - use code snippet below to get factors as a list:
#
#     import subprocess
#
#     n = 17113636163329171307055067007779498398991498581710873599122232450394704
#
#     output = subprocess.check_output(['python3', 'cado-nfs.py', str(n), '--screenlog', 'WARNING'])
#     output = output.decode("utf-8")
#
#     factors = [int(i) for i in output.split()]
#     print(factors)
