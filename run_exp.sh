# TODO: this script is probably not required. anyways it should be rewritten by user as per their needs.

# This script is useful for running "bulk" experiments at once.

stride=1
max_stride=32768
iterations=128

DIR=$(dirname $0)

while [ $stride -le $max_stride ] 
do
    echo "./cache.sh $iterations 1 $stride"
    $DIR/cache.sh $iterations 1 $stride
    stride=$((2*$stride))
    echo -e "=============================================================================\n"
done

echo "Experiment done! Checkout plots and csv folder for the results."
