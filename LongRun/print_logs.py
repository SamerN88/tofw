import pandas as pd
import numpy as np

# Configure pandas/numpy
display_width = 331
np.set_printoptions(linewidth=display_width)
pd.set_option('display.width', display_width)
pd.set_option('display.max_columns', 101)
pd.set_option("display.max_rows", None, "display.max_columns", None)  # print whole table instead of a portion of it
pd.set_option('display.precision', 16)  # high-precision floats


def print_logs(filepaths):
    for i, fp in enumerate(filepaths):
        if fp[-4:] == '.csv':
            output = pd.read_csv(fp)
        else:
            with open(fp, 'r') as log:
                output = log.read()

        print(f'[ {fp} ]')
        print(output)
        if i < len(filepaths) - 1:
            print('\n' + '-'*101 + '\n')


def main():
    filepaths = [
        'master_cells.csv',
        'run_info.csv',
        'all_cells.csv',
        'stdout.txt'
    ]
    print_logs(filepaths)


if __name__ == '__main__':
    main()
