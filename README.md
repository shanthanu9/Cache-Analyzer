# Cache Analyzer

Simple tool to analyse the cache in your system. For now, the tool runs the following code

```c++
for(int i = 0; i < stride * iterations; i += stride) {
    // start timer
    byte_array[i] = some_value;
    // stop timer
    // output time taken
}
```

And analyzes the output by varying ```stride``` and ```iterations```. The tool outputs the results as CSV files and plots.

## How to run

Fire up the terminal and run the following:
```bash
$ ./cache.sh 128 1 8
```
This sets ```iterations = 128``` and ```stride = 8``` and generates plot and csv files. The 2nd parameter (1) is not functional yet.

For running several experiments at once, customize ```run_exp.sh``` to your needs and run it. (Just run ```./run_exp.sh``` to run it with default parameters).


## PLAN

- [ ] Find block size of L1 cache (this will be same of L2 and L3) from plots.
- [ ] Find cache size and set associativity of L1, L2 and L3 cache.

## TODO:

- [ ] Checkout TODO comments in code.
- [ ] Give more flexibilty for filenames in plots and csv
- [ ] Support for variety of cache experiments? Need an interface for csv results and a good code design.
- [ ] A better README
