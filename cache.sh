# NOTE: dump/ should be empty while runnig this script

# check for correct arguements passed
# TODO: use getopt for arguement parsing
# TODO: add a quiet execution flag (no status output)
# TODO: support for cycles
if [ "$#" -lt "3" ]; then
    echo "usage: $0 <iterations> <cycles> <stride> [<runs>]"
    exit 1
fi

# set experiment variables
iterations=$1
cycles=$2
stride=$3

if [ ! -z "$4" ]; then
    runs=$4
else
    runs=10 # default
fi

# print status
echo "Iterations = $iterations"
echo "Cycles = $cycles"
echo "Stride = $stride"
echo "Runs = $runs"

echo "Setting relevant path variables"

# set paths
DIR=$(dirname $0)
DUMP=$DIR/dump # TODO: should dump be moved to /tmp?
PLOTS=$DIR/plots
CSV=$DIR/csv
SRC=$DIR/src

# create folder if they don't exist
mkdir -p $DUMP $PLOTS $CSV

# compile experiment
if [ ! -f "$DIR/exp" ]; then
    echo "Compiling experiment code"
    g++ $DIR/exp.cpp -o $DIR/exp -O0 # TODO: support for multiple experiments? a exp folder? will Makefile be needed?
fi

echo "Running experiment and generating CSV dump"

# run experiment and generate csv dumps
for ((i = 0; i < $runs; i++))
do
    $DIR/exp $iterations $cycles $stride > $DUMP/dump$i.csv
done

# set result file paths
CSV_FILE=$CSV/csv-$iterations-$stride.csv
PLOT_FILE=$PLOTS/plot-$iterations-$stride.png

echo "Combinig CSV dumps"

# combine all csv dumps into one csv (mean)
$SRC/combine.py $DUMP $CSV_FILE

echo "Generatig plot"

# generate plot of combined csv
$SRC/analyse.py $CSV_FILE $PLOT_FILE

echo "Cleaning CSV dump"

# clean csv dumps
rm -r $DUMP
