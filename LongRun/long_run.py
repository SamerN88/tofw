"""
Free Weight Cellular Automaton - Computational Exploration
Samer Najjar
21 May 2021

TOFW = Table of Free Weights
"""

# Python standard library
import math
import datetime
import time
from concurrent.futures import ProcessPoolExecutor
import platform
import subprocess
import multiprocessing

# Requires installation
import pandas as pd
from sympy.ntheory import factorint
import psutil

# Configure pandas to use high-precision floats
pd.set_option('display.precision', 16)

# False for testing, True for deployment
LOG_DATA = False

# Define logs' file paths
MASTER_CELLS_FP = 'logs/master_cells.csv'
RUN_INFO_FP = 'logs/run_info.csv'
ALL_CELLS_FP = 'logs/all_cells.csv'
STDOUT_FP = 'logs/stdout.txt'

# Define cado-nfs file path
CADO_NFS_FP = '../cado-nfs-master/cado-nfs.py'


# TOFW OPERATIONS ======================================================================================================

# Returns the value at coordinate k on row n=1 (defined in Burton's paper)
def b(k: int) -> int:
    if (k % 2 == 0) and (k <= 0):
        return 4
    else:
        return 0


# Gets the value of a cell in the Table of Free Weights, iteratively
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


# Returns the k-indexes of non-trivial cells in row n (nonpos_k=True gets only k<=0)
def get_k_index(n, nonpos_k=True):
    return range(3-n, (0 if nonpos_k else n-3) + 1, 2)


# Returns the non-trivial entries in row n (nonpos_k=True gets only k<=0)
def get_row(n, nonpos_k=True):
    return [B(k, n) for k in get_k_index(n, nonpos_k)]


# FACTORING ============================================================================================================

def timeout_factorint(n, timeout):
    # Spawn process to factor number, and start it
    process = multiprocessing.Process(target=factorint, args=(n,))
    process.start()

    # Pause execution of main program until process completes or until timeout
    process.join(timeout)

    # If process is still alive at this point, then it timed out so terminate the process and return None
    if process.is_alive():
        process.terminate()
        process.join()  # make sure process terminates before moving on
        return None
    else:
        # Otherwise, return complete factorization
        # (INEFFICIENCY: factors the number again, doubling required time)
        return factorint(n)


# From cado-nfs project: https://gitlab.inria.fr/cado-nfs/cado-nfs
def cado_nfs(n):
    output = subprocess.check_output(['python3', CADO_NFS_FP, str(n), '--screenlog', 'WARNING'])
    output = output.decode("utf-8")
    return sorted([int(i) for i in output.split()])


def corrected_cado_factor(n, *, timeout=5):
    # Check if factorint can factor entry within the timeout length; if not, use cado-nfs
    factors = timeout_factorint(n, timeout=timeout)
    if factors is not None:
        return factors

    # If factorint did not factor it fast enough, use cado-nfs (below)

    def product(it):
        prod = 1
        for k in it:
            prod *= k
        return prod

    try:
        cado_factors = cado_nfs(n)

        # For some numbers, cado-nfs just can't get any factors; in that case, just use factorint
        if len(cado_factors) == 0:
            return factorint(n)

        remaining = n // product(cado_factors)
        factors = factorint(remaining)

        for f in cado_factors:
            try:
                factors[f] += 1
            except KeyError:
                factors[f] = 1
    except:
        # If for whatever reason cado-nfs fails (e.g. if number is too small) then just use factorint anyway
        return factorint(n)

    return factors


# DATA LOGGING =========================================================================================================

def read_file(fp):
    with open(fp, 'r') as file:
        return file.read()


def log_to_file(fp, content):
    # Only logs data if LOG_DATA flag is True
    if LOG_DATA:
        with open(fp, 'a') as file:
            file.write(content)


def get_next_run_no():
    # Get previous run number
    run_numbers = pd.read_csv(RUN_INFO_FP)['run']
    if len(run_numbers) == 0:
        prev_run = 0  # i.e. there are no previous runs
    else:
        prev_run = list(run_numbers)[-1]  # better than len(file.readlines()) or Series.max()

    return prev_run + 1


def update_git(commit_msg, branch='running'):
    # Only update git if data is being logged
    if LOG_DATA:                             # silence output
        subprocess.call(['git', 'add', '.'], stdout=subprocess.DEVNULL)
        subprocess.call(['git', 'commit', '-m', commit_msg], stdout=subprocess.DEVNULL)
        subprocess.call(['git', 'push', '-u', 'origin', branch], stdout=subprocess.DEVNULL)  # never auto push to main


# This function is strictly designed to communicate with outside text files in a specific way;
# it serves a very specific purpose and is not made for general use.
def prime_growth_data_logger(max_depth=None, mp_threshold=None):
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

    # Set n and growth_avg to most current values
    n = list(master_data_df['n'])[-1] + 1
    growth_avg = list(master_data_df['growth_avg'])[-1]

    # Get current run number
    run_no = get_next_run_no()

    # Default stop reason, expected to change later to something meaningful
    stop_reason = 'UNKNOWN'

    # Indicate if data is being logged
    print(f'LOG_DATA = {LOG_DATA}')
    print()

    # Show parameters
    print(f'max_depth = {max_depth}')
    print(f'mp_threshold = {mp_threshold}')
    print()

    try:
        while (max_depth is None) or (n <= max_depth):
            t1 = time.time()

            # Generate non-trivial entries in row n (only k<=0)
            row = get_row(n)

            # At low values of n, the overhead from multiprocessing actually takes longer than factoring the row
            # synchronously, so we only let multiprocessing kick in at a higher n when factoring synchronously
            # gets sufficiently slow.
            if (mp_threshold is None) or (n < mp_threshold):
                row_decomp = [factorint(e) for e in row]
            else:
                # Factor the entries in row n using multiprocessing (for speed)
                with ProcessPoolExecutor() as pool:  # by default max_workers=min(32, os.cpu_count() + 4)
                    row_decomp = pool.map(factorint, row)

            # Find the master cell and extract desired values. Initialize p_n as 2 and other values as None so
            # if no master cell is found for whatever reason, it is visible in the logs
            p_n = 2
            master_k = None
            master_entry = None
            master_factors = None
            for k, entry, factors in zip(get_k_index(n), row, row_decomp):  # index row_decomp by each cell's k coordinate
                max_factor = max(factors)

                # Log --------------------------------------------------------------------------------------------------
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

            # Log ------------------------------------------------------------------------------------------------------
            log_to_file(MASTER_CELLS_FP, f'{n},{master_k},{p_n},{growth_avg},{master_entry},"{master_factors}",{runtime}\n')
            # ----------------------------------------------------------------------------------------------------------

            stdout = f'n={n}, k={master_k}\n'
            stdout += f'p_n = {p_n}\n'
            stdout += f'growth avg = {growth_avg}\n'
            stdout += f'({runtime} sec)\n'

            # Log ------------------------------------------------------------------------------------------------------
            log_to_file(STDOUT_FP, stdout + '\n')
            # ----------------------------------------------------------------------------------------------------------

            # Auto update git repo
            update_git(f'[AUTO] run {run_no}, n={n}')

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
        stop_reason = stop_reason.replace('"', "'")  # to avoid parsing errors in CSV file
        log_to_file(RUN_INFO_FP, f'{run_no},"{start}","{end}",{last_n},"{stop_reason}",{mp_threshold},"{cpu_info}"\n')
        # --------------------------------------------------------------------------------------------------------------

        # Auto update git repo
        update_git(f'[AUTO] finish run {run_no} (n={last_n})')

        print(stop_reason)
        print(f'\n\nEnd run at {end}')


def main():
    prime_growth_data_logger()


if __name__ == "__main__":
    main()


#   TODO: start new exploration called MasterSift that gets only master cells in the following way:
#       - since master cells factor very quickly (under 1 sec up to n=126), we will assume that master cells up to
#         n=N factor in under X_N seconds; we then go through a row, and if a cell takes longer than X_N sec to
#         factor, we skip it. we only factor easy cells, then find the master cell among those.
#         * CON: this assumes that master cells will always factor in under X seconds given n=N
#         * PRO: if our assumption holds, then this is a super expedient way to get master cells
#
