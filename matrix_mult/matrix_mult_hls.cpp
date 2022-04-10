// name             :   Joonas Ikonen
// student number   :   150244761

#include "matrix_mult.h"
#include "matrix.h"
#include <ac_assert.h>

void matrixMultHLS(hls_data_t A[N][N], hls_data_t B[N][N], hls_result_t C[N][N], hls_transpose_t transpose)
{
    // Check that transpose has legal value
    assert(transpose >= 0 && transpose < 4);
        
    Matrix<hls_data_t, N> matrix_a(A);
    Matrix<hls_data_t, N> matrix_b(B);
    Matrix<hls_data_t, N>::mult_result_t matrix_c;
    
    if (transpose == 1 || transpose == 3) {
        matrix_a.transpose(true);
    } 
    if (transpose == 2 || transpose == 3) {
        matrix_b.transpose(true);
    }

    matrix_c = matrix_a * matrix_b;
    matrix_c.toArray(C);
}
