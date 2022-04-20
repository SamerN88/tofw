import pandas as pd
import numpy as np
from math import log as ln


def _compile_master_cells_data():
    # Master cells data from LongRun
    master_cells_LR = pd.read_csv('LongRun/logs/master_cells.csv',
                                  converters={
                                      'n': int,
                                      'k': int,
                                      'p_n': int,
                                      'growth_avg': float,
                                      'entry': int,
                                      'factors': eval,
                                      'runtime_s': float
                                  })

    # Master cells data from MasterSift
    master_cells_MS = pd.read_csv('MasterSift/logs/master_cells_sifted.csv',
                                  converters={
                                      'n': int,
                                      'k': int,
                                      'p_n': int,
                                      'growth_avg': float,
                                      'entry': int,
                                      'factors': eval,
                                      'runtime_s': float,
                                  })

    master_cells_MS.drop('timeout', axis=1, inplace=True)
    master_cells = pd.concat([master_cells_LR, master_cells_MS], axis=0, ignore_index=True)

    return master_cells


def compute_growth_avg(up_to_n=None):
    df = master_cells_df.copy()
    n = df['n']
    p_n = df['p_n']

    if up_to_n is None:
        up_to_n = n.max()

    ln_p_n = np.array([ln(p) for p in p_n[n <= up_to_n]])
    ln_4n = np.array([i*ln(4) for i in range(1, up_to_n+1)])

    return (ln_p_n / ln_4n).mean()


def mc(n):
    # Returns the master cell of row n as a Series containing its relevant data
    # (n, k, p_n, growth_avg, entry, factors)
    df = master_cells_df.copy()
    return df[['n', 'k', 'p_n', 'growth_avg', 'entry', 'factors']][df['n'] == n].iloc[0]


master_cells_df = _compile_master_cells_data()
