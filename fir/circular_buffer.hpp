#ifndef __CIRCULAR_BUFFER__
#define __CIRCULAR_BUFFER__

#include <ac_int.h>

/// T: Type of the element in array
/// N: Number of elements in the array
template<typename T, int N>
class CircularBuffer
{
private:
	T mem[N];
	// Read pointer needs to be signed to calculate 
	// it from the write pointer and index.
	ac_int<ac::log2_ceil<N>::val+1, false> wptr;
	ac_int<ac::log2_ceil<N>::val+1, true> rptr;

public:
	/// Initialize the memory array
	CircularBuffer()
	{
		T dummy;
		wptr = 0;
		rptr = 0;
		// Initialize the array as dont care to prevent
		// actual initialization logic from being synthesized
		for (int i = 0; i < N; i++) {
			mem[i] = dummy;
		}
	}
	
	/// Insert an element to the front of the buffer
	void operator << (T data)
	{
		mem[wptr] = data;
		wptr++;
		if (wptr == N)
			wptr = 0;
	}
	
	/// Read a value in the buffer at index 'idx'
	T operator [] (ac_int<ac::log2_ceil<N>::val+1, false> idx) {
		rptr = (wptr - 1 - idx);
		if (rptr < 0)
			rptr = rptr + N;
		return mem[rptr];
	}
};

#endif
