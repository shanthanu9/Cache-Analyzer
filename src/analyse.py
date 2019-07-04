#!/usr/bin/env python3

import pandas as pd
import matplotlib.pyplot as plt
import sys

if len(sys.argv) != 3:
    print("usage: %s <input-csv-file> <output-plot-file>" % (sys.argv[0]))
    sys.exit(1)

CSV_FILE = sys.argv[1]
PLOT_FILE = sys.argv[2]

df = pd.read_csv(CSV_FILE)
plot = df.plot(x='index', y = 'time') # TODO: generalise this for various experiments

fig = plot.get_figure()
fig.savefig(PLOT_FILE)
