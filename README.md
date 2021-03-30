# assembly_SIMD_training

resultsFinal.txt chart1.png chart2.png

Consider a matrix A having L rows and Q columns. In memory, the matrix is stored by columns in the form of a one-dimensional array. I.e., to access the element in row l and column q, you need to access the array element A[l + L*q].

The following transformation is performed on each column of the matrix:
First, the column is divided into G continuous blocks of equal size (it is assumed that L can be divided by G without remainder). Then one element (the first one) is taken from each block and written to the output matrix one after the other. The same is done for all other elements of the block.

For example, let G = 3, L = 12, and the column of the initial matrix: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11.
Then after the conversion, the column will look like this: 0, 4, 8, 1, 5, 9, 2, 6, 10, 3, 7, 11.

Functions should be written in x86-64 assembly language (for 64-bit mode). They should perform the transformations specified above for the values G 2, 3, and 5, over a matrix of 4-byte elements. Q can be any, L is a multiple of 8*G. The sizes of the input and output matrices are such that they both fit entirely into the processor cache. It is necessary to get the maximum performance of functions on a single processor core, provided that the input matrix is initially in the cache.
For the solution, you should use vector instructions (SIMD). You can use instructions from the SSE, SSE2, SSE3, and SSSE3 sets.

It is assumed that the main program will be console-based and written in C or C++, and the assembly language functions are compiled into a separate object file that links to the main program. Or you can write the entire program in assembly language, but in this case, the conversion functions must be also designed as separate procedures called from the main program.

You should measure the performance of the conversion functions in clock cycles per element of the input matrix, for several sets of L and Q values.
