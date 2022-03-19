#include <iostream>
#include <fstream>

#include "mc_scverify.h"
#include "determinant.h"


#define N_TESTS 5;
// Simple testbench. The result should be 2882 if the determinant implementation is correct. It is recommended to develop this TB further.

void get_minor(int **minor, int **source, int n, int i, int j);
int ref_determinant(int **matrix, int n);


CCS_MAIN(int argc, char *argv[])
{
    int det_ref[N_TESTS];
    ac_int<W,S> det_duv[N_TESTS];


    // Control test values and negative values. Expanded with modulo indexes for larger arrays.
    ac_int<W,S> A[N][N] = { {1,0,10},{11,12,0},{33,55,66} }; // Determinant = 2882;
    
    // Initialize the reference source matrix.
    int **matrix_ref = new int*[N];
    int **matrix_ref_neg = new int*[N];
    for (int i = 0; i < N; ++i) {
        matrix_ref[i] = new int[N];
        matrix_ref_neg[i] = new int[N];
    }

    ac_int<W,S> matrix_duv[N][N];

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            matrix_duv[i][j] = A[i % 3][j % 3];
             // TODO: Does this need explicit type conversion
            matrix_ref[i][j] = A[i % 3][j % 3];
            matrix_ref_neg[i][j] = -A[i % 3][j % 3];
        }
    }
    det_ref[0] = ref_determinant(matrix_ref, N);
    CCS_DESIGN(determinant)(matrix_duv, det_duv[0]);
    
    // TODO: Random values
    



    //ac_int<W,S> det;
    //CCS_DESIGN(determinant)(A, det);
    
    //std::cout << det << std::endl;
 
    // Open the testbench result report file
    std::ofstream ofile;
    ofile.open("determinant_tb_output.txt", std::ios::out);
    ofile << "Determinant testbench results" << std::endl;

    // Close the output file
    ofile.close();

    // Cleanup the reference array
    for (int i = 0; i < N; ++i) {
        delete matrix_ref[i];
        delete matrix_ref_neg[i];
    }
    delete [] matrix_ref;
    delete [] matrix_ref_neg;
    
    CCS_RETURN(0);
}


/// Return the minor matrix at i,j for source matrix
void get_minor(int **minor, int **source, int n, int i, int j)
{
    int source_row, source_col;

    for (int row = 0; row < n-1; ++row) {
        for (int col = 0; col < n-1; ++col) {
            source_row = row + (row >= i ? 1 : 0);
            source_col = col + (col >= j ? 1 : 0);
            minor[row][col] = source[source_row][source_col];
        }
    }
}

// Return the determinant for a nxn matrix
int ref_determinant(int **matrix, int n)
{
    int det = 0;

    // End the recursion on 1x1 matrix
    if (n == 1)
        return matrix[1][1];

    // Initialize the minor array
    int **minor = new int*[n-1];
    for (int i = 0; i < n-1; ++i) {
        minor[i] = new int[n-1];
    }

    // Calculate the determinant recursively
    for (int j = 0; j < n; ++j) {
        get_minor(minor, matrix, n, 0, j);
        det += (j % 2 == 0 ? 1 : -1) * matrix[0][j] * ref_determinant(minor, n-1);
    }

    // Cleanup the minor array
    for (int i = 0; i < n-1; ++i) {
        delete minor[i];
    }
    delete[] minor;

    return det;
}