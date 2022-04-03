// A circular buffer based FIR filter function
// Copied and modified fir_shift_reg.cpp

// Use the same definitions as shift reg version
#include "fir_shift_reg.h" 
#include "circular_buffer.hpp"

void fir_circular_buffer(dType din, dType taps[N_REGS], dType &dout){
	static CircularBuffer<dType, N_REGS> buf;
	dType temp = 0;
	buf << din;
	
	MAC:for(int i=0;i<N_REGS;i++) //Multiply-accumulate
		temp += taps[i]*buf[i];
	dout = temp;
}
