// name             :   Joonas Ikonen
// student number   :   150244761
/*
Multiplies two NxN matrices A and B of type int and puts the product in matrix C.
Allows transposition of A and/or B before multiplication.

transpose = 0: Use A and B as is
transpose = 1: Transpose A before multiplication
transpose = 2: Transpose B before multiplication
transpose = 3: Transpose A and B before multiplication
*/

#ifndef _matrix_mult
#define _matrix_mult

#include <ac_int.h>


const int N = 8;
const int RANGE_MAX = 31;
const int RANGE_MIN = -32;
//#define NATIVE_TYPES

// Calculate the bit widths based on given range.
const int WIDTH_MIN = ac::log2_ceil<-RANGE_MIN+1>::val;
const int WIDTH_MAX = ac::log2_ceil<RANGE_MAX+1>::val+1;
const int WIDTH = WIDTH_MIN < WIDTH_MAX ? WIDTH_MIN : WIDTH_MAX;
// Matrix multiplication requires 2*width+log2(N) bits.
const int RESULT_WIDTH = 2*WIDTH+ac::log2_ceil<N>::val;
// Transposing can be done in 4 different ways, width of 2 bits is sufficient.
const int TRANSPOSE_WIDTH = 2;

typedef int data_t;
typedef int result_t;

#ifdef NATIVE_TYPES
typedef int hls_data_t; 
typedef int hls_result_t;
typedef int hls_transpose_t;
#else
typedef ac_int<WIDTH,true> hls_data_t;
typedef ac_int<RESULT_WIDTH,true> hls_result_t;
typedef ac_int<TRANSPOSE_WIDTH, false> hls_transpose_t;
#endif

// Golden reference implementation
void matrixMult(data_t A[N][N], data_t B[N][N], result_t C[N][N], int transpose);

// HLS implementation
void matrixMultHLS(hls_data_t A[N][N], hls_data_t B[N][N], hls_result_t C[N][N], hls_transpose_t transpose);

#endif
