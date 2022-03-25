import subprocess
import pandas as pd


def read_file(fp):
    with open(fp, 'r') as file:
        return file.read()


def log_to_file(fp, content):
    with open(fp, 'a') as file:
        file.write(content)


def update_git(commit_msg, branch):
    subprocess.call(['git', 'add', '.'])
    subprocess.call(['git', 'commit', '-m', commit_msg])
    subprocess.call(['git', 'push', 'origin', branch])  # never auto push to main


# Presupposes an existing CSV file with a "run" column
def get_next_run_no(fp):
    # Get previous run number
    run_numbers = pd.read_csv(fp)['run']
    if len(run_numbers) == 0:
        prev_run = 0  # i.e. there are no previous runs
    else:
        prev_run = list(run_numbers)[-1]  # better than len(file.readlines()) or Series.max()

    return prev_run + 1
