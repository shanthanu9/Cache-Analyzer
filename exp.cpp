#include <iostream>
#include <stdlib.h>
#include <chrono>
using namespace std;
using namespace std::chrono;

int main(int argc, char *argv[]) {
    if(argc != 4) {
        fprintf(stderr, "%s <number-of-iterations> <number-of-cycles> <stride>\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    
    const int iterations = atoi(argv[1]);
    const int cycles = atoi(argv[2]);
    const int stride = atoi(argv[3]);
    const int nbyte_array = iterations * stride;

    char *byte_array = (char *) malloc(nbyte_array * sizeof(char));

    int set_value = rand()%(sizeof(char));

    for(int i = 0; i < cycles; i++) {
        //auto start = high_resolution_clock::now();
       
        cout << "index,time" << endl;

        for(int k = 0; k < nbyte_array; k+=stride) {
            auto start = high_resolution_clock::now();
            
            byte_array[k] = set_value;
            
            auto stop = high_resolution_clock::now();
            auto duration = duration_cast<nanoseconds>(stop - start);
            cout << (k/stride) << ",\t" << duration.count() << endl;
        }

        //auto stop = high_resolution_clock::now();
        //auto duration = duration_cast<nanoseconds>(stop - start);
        //cout << "Time taken in cycle " << i << ": " << duration.count() << endl;

        set_value = rand()%(sizeof(char));
    }

    return 0;
}
