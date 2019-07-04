#!/usr/bin/env python3

import pandas as pd
import sys
from os import listdir

# TODO: arguement parser
if len(sys.argv) != 3:
    print("usage: %s <CSV-dump-path> <output-file>" % (sys.argv[0]))
    sys.exit(1)

DUMP_PATH=sys.argv[1]
OUTPUT_FILE=sys.argv[2]

dfs = [] # list of CSV dump dataframes

for csv_dump in listdir(DUMP_PATH):
    dfs.append(pd.read_csv(DUMP_PATH+"/"+csv_dump))

# TODO: the mean of index column is also computed. Ideally this should not happen
pd.concat(dfs).groupby(level=0).mean().to_csv(OUTPUT_FILE)
