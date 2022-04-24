// name             :   Joonas Ikonen
// student number   :   150244761

#include "matrix_mult.h"
#include "matrix.h"
#include <ac_assert.h>


/// Initialize a Matrix class from 2d array with possible transposition.
template<int ID>
void transposeMat(
    ac_channel< chanStruct<hls_data_t> > &matrix_in, 
    bool transpose, 
    ac_channel< Matrix<hls_data_t, N> > &matrix_out)
{
    #ifndef __SYNTHESIS__
    while(matrix_in.available(1))
    #endif
    {
        Matrix<hls_data_t, N> tmp(matrix_in.read().array, transpose);
        matrix_out.write(tmp);
    }
}

/// A * B = C, uses Matrix class internally and moves result to a 2d array.
void multiply(
    ac_channel< Matrix<hls_data_t, N> > &A,
    ac_channel< Matrix<hls_data_t, N> > &B,
    ac_channel< chanStruct<hls_result_t> > &C)
{
    #ifndef __SYNTHESIS__
    while(A.available(1) && B.available(1))
    #endif
    {

        Matrix<hls_data_t, N> mat_a = A.read();
        Matrix<hls_data_t, N> mat_b = B.read();
        Matrix<hls_data_t, N>::mult_result_t matrix_result = mat_a * mat_b;
        chanStruct<hls_result_t> result;
        matrix_result.toArray(result.array);
        C.write(result);
    }
}

/// Top level function, define the interconnect channels and call the block functions.
void matrixMultHLS(
    ac_channel< chanStruct<hls_data_t> > &A,
    ac_channel< chanStruct<hls_data_t> > &B,
    ac_channel< chanStruct<hls_result_t> > &C,
    bool A_trans,
    bool B_trans)
{
    static ac_channel< Matrix<hls_data_t, N> > interconnect_A;
    static ac_channel< Matrix<hls_data_t, N> > interconnect_B;

    transposeMat<0>(A, A_trans, interconnect_A);
    transposeMat<1>(B, B_trans, interconnect_B);
    multiply(interconnect_A, interconnect_B, C);
}
