"""
MasterSift
Samer Najjar
24 March 2022

MasterSift picks up from n=160 (LongRun stopped at n=159).
"""

# Python standard library
import datetime
import time
import sys
import os

# Third-party
import pandas as pd

# Add root directory to path so top-level modules can be imported
# (this is a non-Pythonic hack, but is the quickest solution)
sys.path.append('..' + os.sep)

# In-project
from config import LOG_DATA, RUNNING_BRANCH
from tofw import B, get_k_index, get_row, intermediate_growth_ratio
from utils.factoring import timeout_factorint
from utils.datalogging import get_next_run_no, log_to_file, update_git

# Define file paths of data logs
MASTER_CELLS_SIFTED_FP = os.path.join('logs', 'master_cells_sifted.csv')
RUN_INFO_SIFTED_FP = os.path.join('logs', 'run_info_sifted.csv')


def get_benchmark_timeout(bm_entry=B(-951, 1000)):
    # This function times how long it takes to factor the entry bm_entry (default value B(-951, 1000)
    # is arbitrarily chosen) using the timeout_factorint implementation, and returns the average of 10
    # runs. This time length is expected to be used as a benchmark to determine what timeout length to
    # use when sifting a given row. The entry bm_entry should be a master entry; problems may arise if
    # it isn't.

    # Get average runtime of 10 benchmark runs
    t1 = time.time()
    for _ in range(10):
        timeout_factorint(bm_entry, 2**19 - 1)  # absurdly long timeout to ensure bm_entry is factored
    runtime = time.time() - t1

    bm_runtime = runtime / 10
    return bm_runtime


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

    # Get last master entry and determine benchmark timeout
    print('Getting benchmark timeout...')
    last_master_entry = int(list(master_sift_df['entry'])[-1])
    bm_timeout = get_benchmark_timeout(last_master_entry)
    print(f'  benchmark timeout = {bm_timeout} sec')
    print(f'Begin sifting master cells at n={n}:\n')

    try:
        while (max_depth is None) or (n <= max_depth):
            # Every 1000 rows, update benchmark timeout
            if n % 1000 == 1:
                bm_timeout = get_benchmark_timeout(last_master_entry)

            t1 = time.time()

            # Based on benchmark timeout get appropriate timeout for this n, then sift through row n for master data
            timeout = bm_timeout * 2  # arbitrary multiplier; just give enough time
            master_cell = sift_row(n, timeout)

            n = master_cell['n']
            k = master_cell['k']
            p_n = master_cell['p_n']
            entry = master_cell['entry']
            factors = master_cell['factors']

            # Save last master entry to update benchmark timeout next iteration, if needed
            last_master_entry = entry

            # Compute new growth average
            growth_avg = (
                                 (n - 1) * growth_avg
                                 +
                                 intermediate_growth_ratio(n, p_n)
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
                        f'{run_no},"{start}","{end}",{last_n},{end_time - start_time}\n')

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
