#include <iostream>

unsigned long rtdsc()
{
  unsigned long low, high;
  __asm__ volatile("rdtsc" : "=a"(low), "=d"(high));
  return (high << 32) | low;
}

void	matrixTransformG5_SIMD(int* matrix, int* matrixNew, int L, int Q);
void	matrixTransformG3_SIMD(int* matrix, int* matrixNew, int L, int Q);
void	matrixTransformG2_unpack(int* matrix, int* matrixNew, int L, int Q);
int main()
{
	int L = 240;	//строки
	int Q = 2;	//столбцы
    unsigned long start, tiks, iteration;

	int matrix[L * Q] __attribute__ ((aligned (16)));
	int matrixNew[L * Q] __attribute__ ((aligned (16)));

    // Прогрев кеша
    for(int i = 0; i < 10000; i++)
    {
        matrixTransformG5_SIMD(matrix, matrixNew, L, Q);
        matrixTransformG3_SIMD(matrix, matrixNew, L, Q);
        matrixTransformG2_unpack(matrix, matrixNew, L, Q);
    }

    iteration = 3000000;
    
    start = rtdsc();
    for(int i = 0; i < iteration; i++)
    {
        matrixTransformG2_unpack(matrix, matrixNew, L, Q);
    }
    tiks = rtdsc() - start;
    printf("matrixTransformG2_unpack tiks: %ld\n", tiks/iteration);

    start = rtdsc();
    for(int i = 0; i < iteration; i++)
    {
        matrixTransformG5_SIMD(matrix, matrixNew, L, Q);
    }
    tiks = rtdsc() - start;
    printf("matrixTransformG5_SIMD tiks: %ld\n", tiks/iteration);
    
    start = rtdsc();
    for(int i = 0; i < iteration; i++)
    {
        matrixTransformG3_SIMD(matrix, matrixNew, L, Q);
    }
    tiks = rtdsc() - start;
    printf("matrixTransformG3_SIMD tiks: %ld\n", tiks/iteration);

	return 0;
}
