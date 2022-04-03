// Simple test bench for a FIR filter
// Prints the sequence 1, 3, 7, 15, 23, 27, 29, 30 with the given values

#include "fir_shift_reg.h"
#include <mc_scverify.h>
#include <iostream>

CCS_MAIN(int argc, char *argv[]){
	dType taps[] = {1, 2, 4, 8, 8, 4, 2, 1};
	dType expected[] = {1, 3, 7, 15, 23, 27, 29, 30};
	dType dummy_output;
	
	// Expicitly initialize the array to zero.
	// Because the circular buffer internal array is initialized as dont care
	// this testbench would not give correct results until all the 
	// elements have been written to.
	for (int i = 0; i<N_REGS;i++) {
	   CCS_DESIGN(fir_circular_buffer)(0, taps, dummy_output);
	}
	
	for (int i = 0; i<N_REGS;i++){
	    dType input = 1;
	    dType output;
		//CCS_DESIGN(fir_shift_reg)(input,taps,output);
		CCS_DESIGN(fir_circular_buffer)(input, taps, output);
		std::cout << "input = " << input
			<< ", output = " << output
			<< ", expected output = " << expected[i];
			
		if (expected[i] != output)
		    std::cout << " ERROR ";
		
		std::cout << std::endl;
	}
	CCS_RETURN(0);
}
