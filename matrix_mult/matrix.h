/// Class-based matrix implementation.
// name             :   Joonas Ikonen
// student number   :   150244761

#ifndef _MATRIX
#define _MATRIX

#include <ac_int.h>
#include "matrix_mult.h"

/// Matrix class
// template params:
//  element_t: algorithmic c datatype
//  N: Width of the matrix
template<typename element_t, int N>
class Matrix {
public:
    /// Bit accurate type for indexing the matrix
    typedef ac_int<ac::log2_ceil<N+2>::val, false> index_t;
    /// Element type for multiplication result
    //typedef ac_int<2*element_t::width+ac::log2_ceil<N>::val, false> result_element_t;
    typedef hls_result_t result_element_t;
    typedef Matrix<result_element_t, N> mult_result_t;

    /// Initialize the matrix to zero
    Matrix() {
        ac::init_array<AC_VAL_0>(&data[0][0], N*N);
        ac::init_array<AC_VAL_DC>(&cache[0], 2*N);
    }
    
    /// Initialize the matrix with input values
    Matrix(element_t input_vals[N][N], bool transpose) { 
        index_t a, b;
        INIT_I:for (index_t i = 0; i != N; i++) {
            INIT_J:for (index_t j = 0; j != N; j++) {
                if (transpose) {
                    a = j;
                    b = i;
                } else {
                    a = i;
                    b = j;
                }
                data[i][j] = input_vals[a][b];
            }
        }
        ac::init_array<AC_VAL_DC>(&cache[0], 2*N);
    }
    
    /// Set a value to an element in the matrix.
    void setElement(index_t i, index_t j, element_t val) {
        data[i][j] = val;
    }

    /// Return a value of an element in the matrix.
    element_t getElement(index_t i, index_t j) const {
        return data[i][j];
    }

    /// Operator overload for matrix multiplication
    mult_result_t operator * (Matrix& param) {
        mult_result_t result;
        result_element_t tmp;
               
        MUL_I:for (index_t i = 0; i != N; i++) {                
            MUL_J:for (index_t j = 0; j != N; j++) {
                tmp = 0;
                cache[0] = getElement(i, 0);
                cache[N] = param.getElement(0, j);
                
                // Start multiplying once one element is read
                MUL_K:for (index_t k = 1; k != N+1; k++) {
                    if (k != N) {
                        cache[k] = getElement(i, k);
                        cache[k+N] = param.getElement(k, j);
                    }
                    tmp += cache[k-1] * cache[k+N-1];
                }   // MUL_K
                result.setElement(i, j, tmp);
            } // MUL_J
        } // MUL_I
        return result;
    }

    /// Move the contents of the matrix class to the target array.
    void toArray(element_t target[N][N]) {
        // index_t a, b;
        TO_ARRAY_I:for (index_t i = 0; i != N; i++) {
            TO_ARRAY_J:for (index_t j = 0; j != N; j++) {
                target[i][j] = data[i][j];
            }
        }
    }

private:
    element_t data[N][N];
    element_t cache[2*N];
    // bool transposed;
};

#endif
