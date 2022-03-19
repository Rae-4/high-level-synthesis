/// Class-based matrix implementation.
// name             :   Joonas Ikonen
// student number   :   150244761

#ifndef _MATRIX
#define _MATRIX

#include <ac_int.h>
//#include "matrix_mult.h"

/// Matrix class
// template params:
//  element_t: algorithmic c datatype
//  N: Width of the matrix
template<typename element_t, int N>
class Matrix {
public:
    /// Bit accurate type for indexing the matrix
    typedef ac_int<ac::log2_ceil<N+1>::val, false> index_t;
    /// Element type for multiplication result
    typedef ac_int<2*element_t::width+ac::log2_ceil<N>::val, false> result_element_t;
    //typedef hls_result_t result_element_t;
    typedef Matrix<result_element_t, N> mult_result_t;

    /// Initialize the matrix to zero
    Matrix() : transposed(false) { ac::init_array<AC_VAL_0>(&data[0][0], N*N); }
    /// Initialize the matrix with input values
    Matrix(element_t input_vals[N][N]) : transposed(false) { 
        for (index_t i = 0; i != N; i++) {
            for (index_t j = 0; j != N; j++) {
                setElement(i, j, input_vals[i][j]);
            }
        }
    }
    void setElement(index_t i, index_t j, element_t val) {
        index_t a, b;
        if (transposed) {
            a = j;
            b = i;
        } else {
            a = i;
            b = j;
        }
        data[a][b] = val;
    }

    element_t getElement(index_t i, index_t j) const {
        index_t a, b;
        if (transposed) {
            a = j;
            b = i;
        } else {
            a = i;
            b = j;
        }
        return data[a][b];
    }
    
    /// Transpose the matrix
    void transpose(bool tr) {
        transposed = tr;
    };

    /// Operator overload for matrix multiplication
    mult_result_t operator * (const Matrix& param) {
        mult_result_t result;
        result_element_t tmp;
        
        for (index_t i = 0; i != N; i++) {
            for (index_t j = 0; j != N; j++) {
                tmp = 0;
                for (index_t k = 0; k != N; k++) {
                    tmp += getElement(i, k) * param.getElement(k, j);
                }
                result.setElement(i, j, tmp);
            }
        }
        return result;
    }

    void toArray(element_t target[N][N]) {
        for (index_t i = 0; i != N; i++) {
            for (index_t j = 0; j != N; j++) {
                target[i][j] = getElement(i, j);
            }
        }
    }

private:
    element_t data[N][N];
    bool transposed;
};

#endif
