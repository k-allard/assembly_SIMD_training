# assembly_SIMD_training

Consider a matrix A having L rows and Q columns. In memory, the matrix is stored by columns in the form of a one-dimensional array. I.e., to access the element in row l and column q, you need to access the array element A[l + L*q].

The following transformation is performed on each column of the matrix:
First, the column is divided into G continuous blocks of equal size (it is assumed that L can be divided by G without remainder). Then one element (the first one) is taken from each block and written to the output matrix one after the other. The same is done for all other elements of the block.

For example, let G = 3, L = 12, and the column of the initial matrix: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11.
Then after the conversion, the column will look like this: 0, 4, 8, 1, 5, 9, 2, 6, 10, 3, 7, 11.

Functions should be written in x86-64 assembly language (for 64-bit mode). They should perform the transformations specified above for the values G 2, 3, and 5, over a matrix of 4-byte elements. Q can be any, L is a multiple of 8*G. The sizes of the input and output matrices are such that they both fit entirely into the processor cache. It is necessary to get the maximum performance of functions on a single processor core, provided that the input matrix is initially in the cache.
For the solution, you should use vector instructions (SIMD). You can use instructions from the SSE, SSE2, SSE3, and SSSE3 sets.

It is assumed that the main program will be console-based and written in C or C++, and the assembly language functions are compiled into a separate object file that links to the main program. Or you can write the entire program in assembly language, but in this case, the conversion functions must be also designed as separate procedures called from the main program.

You should measure the performance of the conversion functions in clock cycles per element of the input matrix, for several sets of L and Q values.

________________

Рассмотрим матрицу A из L строк и Q столбцов. В памяти матрица хранится по столбцам в виде одномерного массива. Т.е. для доступа к элементу в строке l и столбце q необходимо обратится к элементу массива A[l + L*q].

Над каждым столбцом матрицы выполняется следующее преобразование:
Сначала столбец делится на G непрерывных блоков равного размера (считается, что L делится на G нацело). Затем берется по одному элементу (первому) из каждого блока и записываются в выходную матрицу друг за другом. То же выполняется для всех остальных элементов блока.

Например, пусть G = 3, L = 12, а столбец начальной матрицы: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11.
Тогда после преобразования, столбец будет выглядеть так: 0, 4, 8, 1, 5, 9, 2, 6, 10, 3, 7, 11.

Необходимо написать функции на ассемблере x86-64 (для 64битного режима), которые выполняют указанные преобразования для значений G 2, 3 и 5, над матрицей из 4х байтных элементов. Q может быть любым, L - кратно 8*G. Размеры входной и выходной матриц такие, что они обе целиком помещаются в процессорный кеш. Необходимо получить максимальную производительность функций на одном процессорном ядре, при условии, что входная матрица изначально находится в кеше.
Для решения следует использовать инструкции векторные (SIMD) инструкции. Разрешается использовать инструкции из наборов SSE, SSE2, SSE3, SSSE3.

Предполагается, что основная программа будет консольной и написана на языке C или C++, а функции на ассемблере компилируются в отдельный объектный файл, который линкуется к основной программе. Либо можно всю программу написать на ассемблере, но и в этом случае, функции преобразований должны быть оформлены в виде отдельных процедур, вызываемых из основной программы.

В качестве решения следует предоставить результаты замеров производительности функций преобразования в тактах на элемент входной матрицы, для нескольких наборов значений L и Q. Так же может потребоваться показать часть ассемблерного кода, который собственно выполняет преобразование.
