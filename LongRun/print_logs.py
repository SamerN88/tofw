import pandas as pd
import numpy as np

# Configure pandas/numpy
display_width = 331
np.set_printoptions(linewidth=display_width)
pd.set_option('display.width', display_width)
pd.set_option('display.max_columns', 101)
pd.set_option("display.max_rows", None, "display.max_columns", None)  # print whole table instead of a portion of it
pd.set_option('display.precision', 16)  # high-precision floats

ALL_FILEPATHS = [
    'logs/master_cells.csv',
    'logs/run_info.csv',
    'logs/all_cells.csv',
    'logs/stdout.txt'
]


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
    filepaths = []
    inp = input('Enter file paths separated by newline:\n')
    while inp != '':
        filepaths.append(inp)
        inp = input()

    if len(filepaths) == 0:
        filepaths = ALL_FILEPATHS

    print_logs(filepaths)


if __name__ == '__main__':
    main()
