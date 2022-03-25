"""
LongRun
Samer Najjar
30 January 2022

This exploration aims to measure the growth of the master prime p_n against 4^n in the long run. To
do so, for each row, we find p_n by factoring all non-trivial entries in row n and finding the
largest prime among all the factors. Then, we compute the "growth average" described below, which is
our metric for measuring the growth of p_n against 4^n. The goal is to observe the behavior of this
metric in the long run, in hopes that it approaches 1 (see below).

The growth average metric (growth_avg) is the quantity

    (1 / log(4)X) sum_{n=1}^X log(p_n)/n

where p_n is the largest prime factor in row n and X is the number of rows over which we average
the quantity log(p_n)/log(4)n which is a measure of how close the growth of p_n is to 4^n; the
closer this quantity is to 1, the closer the growth of p_n is to that of 4^n. If the growth
average approaches 1 in the long run, this indicates that p_n grows like 4^n, i.e. it grows as
fast as possible given that it is less than 4^n.

Master cells data that is logged:
    n: row index (of master cell)
    k: column index (of master cell)
    p_n: largest prime factor in row n
    growth_avg: the metric by which we measure the growth of p_n against 4^n
    entry: the output of B(k, n), i.e. the entry at cell (k, n) of which p_n is a factor
    factors: prime factorization of the entry (as a dictionary)
    runtime: the time it took to compute everything for row n in seconds

This exploration assumes the following conjecture:
    All master cells satisfy k<=0 (i.e. all master cells lie to the
    left of or on the center column k=0).
"""

# Python standard library
import math
import datetime
import time
import platform
import os
import sys

# Requires installation
import pandas as pd
import psutil

# Add root directory to path so tofw.py can be imported (this is a non-Pythonic hack, but is the quickest solution)
sys.path.append('..' + os.sep)

# In project
from tofw import get_k_index, get_row
from utils.factoring import corrected_cado_factor
from utils.datalogging import read_file, get_next_run_no, log_to_file, update_git

# False for testing, True for deployment
LOG_DATA = False

# Define file paths of data logs
MASTER_CELLS_FP = os.path.join('logs', 'master_cells.csv')
RUN_INFO_FP = os.path.join('logs', 'run_info.csv')
ALL_CELLS_FP = os.path.join('logs', 'all_cells.csv')
STDOUT_FP = os.path.join('logs', 'stdout.txt')

# Define the name of the git branch receiving the logged data in real-time
RUNNING_BRANCH = 'running'

# Configure pandas to use high-precision floats
pd.set_option('display.precision', 16)


# This function is strictly designed to communicate with outside text files in a specific way;
# it serves a very specific purpose and is not made for general use.
# (NOTE: removed multiprocessing implementation because the cado-nfs implementation is already
# multi-threaded; using multiprocessing on row decomposition would overwhelm the CPU)
def prime_growth_data_logger(max_depth=None):
    # Argument validation
    if (max_depth is not None) and (max_depth < 1):
        msg = 'max_depth argument must be at least 1 (row index starts at 1)'
        raise ValueError(msg)

    # Start timestamp
    start = f'{datetime.datetime.now()} {time.localtime().tm_zone}'
    print(f'Start run at {start}\n\n')

    # Read stdout history
    log_history = read_file(STDOUT_FP)

    # Print complete log history
    print('START LOG HISTORY ' + '-'*59 + '\n')
    print(log_history.rstrip() + '\n')
    print('END LOG HISTORY ' + '-'*61 + '\n')

    # Read master data log as a DataFrame (to read last n and growth_avg values)
    master_data_df = pd.read_csv(MASTER_CELLS_FP)

    # Set n and growth_avg to most current values (ASSUMES THERE IS PREVIOUS DATA)
    n = list(master_data_df['n'])[-1] + 1
    growth_avg = list(master_data_df['growth_avg'])[-1]

    # Get current run number
    run_no = get_next_run_no(RUN_INFO_FP)

    # Default stop reason, expected to change later to something meaningful
    stop_reason = 'UNKNOWN'

    # Indicate if data is being logged, and show max_depth parameter
    print(f'LOG_DATA = {LOG_DATA}')
    print(f'max_depth = {max_depth}')
    print()

    try:
        while (max_depth is None) or (n <= max_depth):
            t1 = time.time()

            # Get k-coordinates of non-trivial cells (only k<=0, by conjecture)
            k_index = get_k_index(n, nonpos_k=True, nontrivial=True)

            # Generate non-trivial entries in row n (only k<=0, by conjecture)
            row = get_row(n, nonpos_k=True, nontrivial=True)

            # Factor entries in row, and show progress
            row_decomp = []
            for k, entry in zip(k_index, row):
                factors, method_used = corrected_cado_factor(entry, return_method_used=True)
                row_decomp.append(factors)
                print(f'  (n={n}) Progress:  @ k={k} [{method_used}]')
            print()

            # Find the master cell and extract desired values. Initialize p_n as 2 and other values as None so
            # if no master cell is found for whatever reason, it is visible in the logs
            p_n = 2
            master_k = None
            master_entry = None
            master_factors = None
            for k, entry, factors in zip(k_index, row, row_decomp):  # index row_decomp by each cell's k-coordinate
                max_factor = max(factors)

                # Log --------------------------------------------------------------------------------------------------
                if LOG_DATA:
                    log_to_file(ALL_CELLS_FP, f'{n},{k},{entry},"{factors}",{max_factor}\n')
                # ------------------------------------------------------------------------------------------------------

                if max_factor > p_n:
                    p_n = max_factor
                    master_k = k
                    master_entry = entry
                    master_factors = factors

            # Compute new growth average
            growth_avg = (
                            (n - 1) * growth_avg
                            +
                            (math.log(p_n) / (math.log(4)*n))
                        ) / n

            runtime = time.time() - t1  # in seconds

            stdout = f'n={n}, k={master_k}\n'
            stdout += f'p_n = {p_n}\n'
            stdout += f'growth avg = {growth_avg}\n'
            stdout += f'({runtime} sec)\n'

            # Log ------------------------------------------------------------------------------------------------------
            if LOG_DATA:
                log_to_file(MASTER_CELLS_FP,
                            f'{n},{master_k},{p_n},{growth_avg},{master_entry},"{master_factors}",{runtime}\n')
                log_to_file(STDOUT_FP, stdout + '\n')

                # Auto update git repo
                update_git(f'[AUTO] run {run_no}, n={n}', RUNNING_BRANCH)
            # ----------------------------------------------------------------------------------------------------------

            if not LOG_DATA:
                print('(NOT LOGGED)')
            print(stdout)
            n += 1
        # while-loop ends here

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
        last_n = list(pd.read_csv(MASTER_CELLS_FP)['n'])[-1]  # better than len(file.readlines()) or Series.max()

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
        if LOG_DATA:
            stop_reason = stop_reason.replace('"', "'")  # to avoid parsing errors in CSV file
            log_to_file(RUN_INFO_FP, f'{run_no},"{start}","{end}",{last_n},"{stop_reason}",N/A,"{cpu_info}"\n')

            # Auto update git repo
            update_git(f'[AUTO] finish run {run_no} (n={last_n})', RUNNING_BRANCH)
        # --------------------------------------------------------------------------------------------------------------

        print(stop_reason)
        print(f'\n\nEnd run at {end}')


def main():
    # Safety net; must confirm data logging before updating git
    if LOG_DATA:
        confirm = input('LOG_DATA is True; are you sure you want to update git? [y/n]: ')
        if confirm == '' or confirm.strip()[0].lower() != 'y':
            exit()

        print('*'*77 + '\n')

        # Check if logs are in sync before continuing (ASSUMES THERE IS PREVIOUS DATA)
        last_n = list(pd.read_csv(RUN_INFO_FP)['last_n'])[-1]
        max_n = list(pd.read_csv(MASTER_CELLS_FP)['n'])[-1]
        if last_n != max_n:
            print(f'DATA LOGS OUT OF SYNC; check "n" in {MASTER_CELLS_FP} and "last_n" in {RUN_INFO_FP}')
            exit()

    prime_growth_data_logger()


if __name__ == "__main__":
    main()
