/// Exercise 2 - Testbench
// name             :   Joonas Ikonen
// student number   :   150244761

// I/O lib for printing the test results to file
#include <fstream>
#include <string>
#include <string.h> // memcpy()
#include <cstdlib>  // For rand()
#include <climits>  // For integer limits

// This library must be included to use the macros below
#include "mc_scverify.h"
#include "matrix_mult.h"

// TODO: Comment here what the error was in the "matrix_mult_hls" function
// According to the tb result file, transpose=1 branch results in errors.
// Transposing was not done correctly in this branch
// Chaning in line 51 B[j][k] to B[k][j] fixed the error.

#define NTESTS 4    // The number of different test cases

std::string test_description(int t);

CCS_MAIN(int argc, char *argv[]) // The Catapult testbench should always be invoked with this macro
{
    
    // Output file for the test results
    std::ofstream file("matrix_mult_output.txt");
    file << "matrix_mult_tb test results\n";
    
	// Use this variable as a return value from the testbench (0 indicates passing the testbench, 1 failing it)
	int ret = 0; // Change value to 1 if test fails
	int count = 0; // Count of the data mismatches.
    
    // Input arrays for the golden reference function.
	data_t a_in[N][N], b_in[N][N];
	
	// Struct for writing a 2d array to channels.
	chanStruct<hls_data_t> array_a, array_b;
	
	// Channels for the hierarchical top level function.
    ac_channel< chanStruct<hls_data_t> > chan_a;
    ac_channel< chanStruct<hls_data_t> > chan_b;
    ac_channel< chanStruct<hls_result_t> > chan_c;
	
	// Put the output data of all tests here
	result_t golden_out[NTESTS][N][N];
	hls_result_t hls_out[NTESTS][N][N];

	int transpose = 0;
	int transpose_n = 4;
	
	int sign = 1, i, j, x, y;
	bool descriped = false;
    
    // Report data mismatches in a table 
    file << "Result mismatches between golden design and DUV:\n"; 
    file << "transpose,test,i,j,golden,DUV\n";
    
    // Check for all transpose values
    for (transpose = 0; transpose < transpose_n; ++transpose) {
        // Change the old transpose number value into booleans for A and B matrices.
        bool transpose_a = (transpose == 1 || transpose == 3);
        bool transpose_b = (transpose == 2 || transpose == 3);
        
        // Control test case
        for (i = 0; i < N; ++i) {
            for (j = 0; j < N; ++j) {
                x = i < RANGE_MIN ? RANGE_MIN : i;
                x = i > RANGE_MAX ? RANGE_MAX : i;
 
                y = j < RANGE_MIN ? RANGE_MIN : j;
                y = j > RANGE_MAX ? RANGE_MAX : j;
 
                a_in[i][j] = x+y;
                b_in[i][j] = x-y;
                array_a.array[i][j] = a_in[i][j];
                array_b.array[i][j] = b_in[i][j];
            }
        }
        // Write the 2d array structs to the input channels
        chan_a.write(array_a);
        chan_b.write(array_b);
        CCS_DESIGN(matrixMultHLS)(chan_a, chan_b, chan_c, transpose_a, transpose_b);
        // Copy the result struct contents to the old 2d array result
        memcpy(hls_out[0], chan_c.read().array, N*N*sizeof(hls_result_t));
        matrixMult(a_in, b_in, golden_out[0], transpose);

        // Negatives test - test range of [-N/2; N/2]
        for (i = 0; i < N; ++i) {
            for (j = 0; j < N; ++j) {
                x = i-N/2 < RANGE_MIN ? RANGE_MIN : i-N/2;
                x = i-N/2 > RANGE_MAX ? RANGE_MAX : i-N/2;
 
                y = j-N/2 < RANGE_MIN ? RANGE_MIN : j-N/2;
                y = j-N/2 > RANGE_MAX ? RANGE_MAX : j-N/2;
 
                a_in[i][j] = x;
                b_in[i][j] = y;
                array_a.array[i][j] = a_in[i][j];
                array_b.array[i][j] = b_in[i][j];
            }
        }
        chan_a.write(array_a);
        chan_b.write(array_b);
        CCS_DESIGN(matrixMultHLS)(chan_a, chan_b, chan_c, transpose_a, transpose_b);
        memcpy(hls_out[1], chan_c.read().array, N*N*sizeof(hls_result_t));
        matrixMult(a_in, b_in, golden_out[1], transpose);
        
        // Random values with a in with different signs
        for (i = 0; i < N; ++i) {
            for (j = 0; j < N; ++j) {
                sign = (i+j) & 1 ? -1 : 1;
                x = sign * (std::rand() % RANGE_MAX);
                
                a_in[i][j] = x < RANGE_MIN ? RANGE_MIN : x;
                b_in[i][j] = std::rand() % RANGE_MAX;
                
                array_a.array[i][j] = a_in[i][j];
                array_b.array[i][j] = b_in[i][j];
            }
        }
        chan_a.write(array_a);
        chan_b.write(array_b);
        CCS_DESIGN(matrixMultHLS)(chan_a, chan_b, chan_c, transpose_a, transpose_b);
        memcpy(hls_out[2], chan_c.read().array, N*N*sizeof(hls_result_t));
        matrixMult(a_in, b_in, golden_out[2], transpose);
        
        // Limits - Test for different min and max integer limits
        for (i = 0; i < N; ++i) {
            for (j = 0; j < N; ++j) {
                a_in[i][j] = (i+j) & 1 ? RANGE_MAX : RANGE_MIN;
                b_in[i][j] = i+j < N ? RANGE_MAX: RANGE_MIN;
                array_a.array[i][j] = a_in[i][j];
                array_b.array[i][j] = b_in[i][j];
            }
        }
        chan_a.write(array_a);
        chan_b.write(array_b);
        CCS_DESIGN(matrixMultHLS)(chan_a, chan_b, chan_c, transpose_a, transpose_b);
        memcpy(hls_out[3], chan_c.read().array, N*N*sizeof(hls_result_t));
        matrixMult(a_in, b_in, golden_out[3], transpose);
        
        // Check for correctness and print the output file
        for (int t = 0; t < NTESTS; ++t) {
            descriped = false;         
        
            // Print test case results
            for (i = 0; i < N; ++i) {
                for (j = 0; j < N; ++j) {
                    // Error in result, print the data that has a mismatch.
                    if (golden_out[t][i][j] != hls_out[t][i][j]) {
                        // Print description if not done already for this test case
                        if (!descriped)
                            file << test_description(t);
                            descriped = true;
                        
                        file << transpose << "," << t << "," 
                             << i << "," << j << "," 
                             << std::dec << golden_out[t][i][j] << ","
                             << std::dec << hls_out[t][i][j] << "\n";
                        count++;
                        ret = 1;
                    }
                }
            }
        }
    }
    
    // Report the total result and close the file.
    file << "Test run complete.\n";
    if (ret) {
        file << "Found " << count << " errors in results.\n";
    } else {
        file << "No errors found.\n";
    }
    
    file.close();
    
    CCS_RETURN(ret);
}

/// Return test case descriptions
// t (int) : The test case number
std::string test_description(int t)
{
    switch (t) {
    case 0:
        return "Control test values.\n";
        break;
    case 1:
        return "Negative test values.\n";
        break;
            
    case 2:
        return "Random test values.\n";
        break;
    case 3:
        return "Limit test values.\n";
        break;
    default:
        return "Unnamed test.\n";
    }
}

