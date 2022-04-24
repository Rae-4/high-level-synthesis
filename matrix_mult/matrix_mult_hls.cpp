// name             :   Joonas Ikonen
// student number   :   150244761

#include "matrix_mult.h"
#include "matrix.h"
#include <ac_assert.h>


template<int ID>
void transposeMat(
    ac_channel<chanStruct<hls_data_t>> &matrix_in, 
    bool transpose, 
    ac_channel<Matrix<hls_data_t, N>> &matrix_out)
{
    #ifndef __SYNTHESIS__
    while(matrix_in.available(1))
    #endif
    {
        Matrix<hls_data_t, N> tmp(matrix_in.read().array, transpose);
        matrix_out.write(tmp);
    }
}

void multiply(
    ac_channel<Matrix<hls_data_t, N>> &A,
    ac_channel<Matrix<hls_data_t, N>> &B,
    ac_channel<chanStruct<hls_result_t>> &C)
{
    #ifndef __SYNTHESIS__
    while(A.available(1) && B.available(1))
    #endif
    {
        Matrix<hls_result_t, N> matrix_result = A.read() * B.read();
        chanStruct<hls_result_t> result;
        matrix_result.toArray(result.array);
        C.write(result);
    }
}

void matrixMultHLS(
    ac_channel<chanStruct<hls_data_t>> &A,
    ac_channel<chanStruct<hls_data_t>> &B,
    ac_channel<chanStruct<hls_result_t>> &C,
    bool A_trans,
    bool B_trans)
{
    static ac_channel<Matrix<hls_data_t, N>> A_tmp;
    static ac_channel<Matrix<hls_data_t, N>> B_tmp;

    transposeMat<0>(A, A_trans, A_tmp);
    transposeMat<1>(B, B_trans, B_tmp);
    multiply(A_tmp, B_tmp, C);

    // Check that transpose has legal value
    // assert(transpose >= 0 && transpose < 4);
        
    // Matrix<hls_data_t, N> matrix_a(A, (transpose == 1 || transpose == 3));
    // Matrix<hls_data_t, N> matrix_b(B, (transpose == 2 || transpose == 3));
    // Matrix<hls_data_t, N>::mult_result_t matrix_c;
    
    // if (transpose == 1 || transpose == 3) {
    //     matrix_a.transpose(true);
    // } 
    // if (transpose == 2 || transpose == 3) {
    //     matrix_b.transpose(true);
    // }

    // matrix_c = matrix_a * matrix_b;
    // matrix_c.toArray(C);
}
