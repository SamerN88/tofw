import pandas as pd


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


master_cells_df = _compile_master_cells_data()
