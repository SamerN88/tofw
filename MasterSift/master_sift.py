"""
MasterSift
Samer Najjar
24 March 2022

MasterSift picks up from n=160 (LongRun stopped at n=159).
"""

# Python standard library
import math
import datetime
import time
import multiprocessing
import os
import sys

# Requires installation
import pandas as pd
from sympy.ntheory import factorint

# Add root directory to path so tofw.py can be imported (this is a non-Pythonic hack, but is the quickest solution)
sys.path.append('..' + os.sep)

# In project
from tofw import B, get_k_index, get_row
from utils.factoring import timeout_factorint
from utils.datalogging import get_next_run_no, log_to_file, update_git

# False for testing, True for deployment
LOG_DATA = False

# Define file paths of data logs
MASTER_CELLS_SIFTED_FP = os.path.join('logs', 'master_cells_sifted.csv')
RUN_INFO_SIFTED_FP = os.path.join('logs', 'run_info_sifted.csv')

# Define the name of the git branch receiving the logged data in real-time
RUNNING_BRANCH = 'running'

# Configure pandas to use high-precision floats
pd.set_option('display.precision', 16)


def get_benchmark_timeout_rule():
    # Returns a function that determines reasonable timeout for a given n, based on machine's speed.

    # This function times how long it takes to factor the master entry in row 1000 (arbitrarily chosen),
    # located at B(-951, 1000). This time length will be used as a benchmark to determine how the timeout
    # should increase as n increases. A rule is then defined such that every 1000 rows, the timeout increases
    # by the benchmark time.

    master_entry_1000 = B(-951, 1000)

    # Get max runtime among 10 benchmark runs
    bm_runtime = 0
    for _ in range(10):
        # Spawn process to factor entry, and start it
        process = multiprocessing.Process(target=factorint, args=(master_entry_1000,))
        process.start()

        # Pause execution of main program until process completes; get runtime
        t1 = time.time()
        process.join()
        t2 = time.time()

        runtime = t2 - t1
        if runtime > bm_runtime:
            bm_runtime = runtime

    # Timeout rule:
    #   - timeout for n=1-1000 is triple the benchmark runtime
    #   - every 1000 rows after that, timeout increases by the benchmark runtime
    return lambda n: (n//1001) * bm_runtime + (3 * bm_runtime)


def sift_row(n, timeout):
    row = get_row(n, nonpos_k=True, nontrivial=True)
    k_index = get_k_index(n, nonpos_k=True, nontrivial=True)

    # Sift through row for potential master entries (we know p_n is found in an entry that factors quickly)
    row_decomp = [timeout_factorint(e, timeout) for e in row]

    # If no entries were sifted out, then timeout is too small; return None
    if row_decomp == [None]*len(row_decomp):
        return None

    # Find the max prime among the factors of the potential master entries
    p_n = 2
    master_k = None
    master_entry = None
    master_factors = None
    for k, entry, factors in zip(k_index, row, row_decomp):
        if factors is None:  # factors will be None if the entry didn't factor quickly (i.e. process timed out above)
            continue

        max_factor = max(factors)
        if max_factor > p_n:
            p_n = max_factor
            master_k = k
            master_entry = entry
            master_factors = factors

    return {'n': n, 'k': master_k, 'p_n': p_n, 'entry': master_entry, 'factors': master_factors}


def master_sifter(max_depth=None):
    if (max_depth is not None) and (max_depth < 1):
        msg = 'max_depth argument must be at least 1 (row index starts at 1)'
        raise ValueError(msg)

    # Start timestamp
    start_time = time.time()
    start = f'{datetime.datetime.now()} {time.localtime().tm_zone}'
    print(f'Start run at {start}\n\n')

    # Read sifted master data log as a DataFrame (to read last n and growth_avg values)
    master_sift_df = pd.read_csv(MASTER_CELLS_SIFTED_FP)

    # Set n and growth_avg to most current values (ASSUMES THERE IS PREVIOUS DATA)
    n = list(master_sift_df['n'])[-1] + 1
    growth_avg = list(master_sift_df['growth_avg'])[-1]

    # Get current run number
    run_no = get_next_run_no(RUN_INFO_SIFTED_FP)

    # Indicate if data is being logged, and show max_depth parameter
    print(f'LOG_DATA = {LOG_DATA}')
    print(f'max_depth = {max_depth}')
    print()

    print('Getting timeout rule...')
    timeout_rule = get_benchmark_timeout_rule()
    print(f'Begin sifting master cells at n={n}:\n')

    try:
        while (max_depth is None) or (n <= max_depth):
            t1 = time.time()

            # Get appropriate timeout based on timeout rule for this n, then sift through row n for master data
            timeout = timeout_rule(n)
            master_cell = sift_row(n, timeout)

            n = master_cell['n']
            k = master_cell['k']
            p_n = master_cell['p_n']
            entry = master_cell['entry']
            factors = master_cell['factors']

            # Compute new growth average
            growth_avg = (
                                 (n - 1) * growth_avg
                                 +
                                 (math.log(p_n) / (math.log(4) * n))
                         ) / n

            runtime = time.time() - t1  # in seconds

            # Log ------------------------------------------------------------------------------------------------------
            if LOG_DATA:
                log_to_file(MASTER_CELLS_SIFTED_FP,
                            f'{n},{k},{p_n},{growth_avg},{entry},"{factors}",{runtime},{timeout}\n')

                # Auto update git repo
                update_git(f'[AUTO] run {run_no}, n={n} (sifted)', RUNNING_BRANCH)
            # ----------------------------------------------------------------------------------------------------------

            if not LOG_DATA:
                print('(NOT LOGGED)')
            print(f'n={n}, k={k}')
            print(f'p_n = {p_n}')
            print(f'growth avg = {growth_avg}')
            print(f'({runtime} sec)')
            print()

            n += 1
        # while-loop ends here
    except KeyboardInterrupt:
        print('PROCESS STOPPED BY USER\n')
    finally:
        # End timestamp
        end_time = time.time()
        end = f'{datetime.datetime.now()} {time.localtime().tm_zone}'

        # Get last n that was logged
        last_n = list(pd.read_csv(MASTER_CELLS_SIFTED_FP)['n'])[-1]  # better than len(file.readlines()) or Series.max()

        # Log ----------------------------------------------------------------------------------------------------------
        if LOG_DATA:
            log_to_file(RUN_INFO_SIFTED_FP,
                        f'{run_no},"{start}","{end}",{last_n},{end_time - start_time},{timeout_rule(1000)}\n')

            # Auto update git repo
            update_git(f'[AUTO] finish run {run_no} (n={last_n}) (sifted)', RUNNING_BRANCH)
        # --------------------------------------------------------------------------------------------------------------

        print(f'\nEnd run at {end}')


def main():
    # Safety net; must confirm data logging before updating git
    if LOG_DATA:
        confirm = input('LOG_DATA is True; are you sure you want to update git? [y/n]: ')
        if confirm == '' or confirm.strip()[0].lower() != 'y':
            exit()

        print('*' * 77 + '\n')

        # Check if logs are in sync before continuing (ASSUMES THERE IS PREVIOUS DATA)
        last_n = list(pd.read_csv(RUN_INFO_SIFTED_FP)['last_n'])[-1]
        max_n = list(pd.read_csv(MASTER_CELLS_SIFTED_FP)['n'])[-1]
        if last_n != max_n:
            print(f'DATA LOGS OUT OF SYNC; check "n" in {MASTER_CELLS_SIFTED_FP} and "last_n" in {RUN_INFO_SIFTED_FP}')
            exit()

    master_sifter()


if __name__ == '__main__':
    main()
