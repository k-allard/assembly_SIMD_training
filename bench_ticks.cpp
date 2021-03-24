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
    int Q = 300;

	int matrix[L * Q] __attribute__ ((aligned (16)));
	int matrixNew[L * Q] __attribute__ ((aligned (16)));


    // Прогрев кеша
    for(int i = 0; i < 1000; i++)
    {
        matrixTransformG5_SIMD(matrix, matrixNew, L, Q);
        matrixTransformG3_SIMD(matrix, matrixNew, L, Q);
        matrixTransformG2_unpack(matrix, matrixNew, L, Q);
    }

    printf("%s\t%s\t%s\t%s\n", "NAME", "ITEMS", "TICKS", "TICKS_PER_ITEMS");
    for(int q = 2; q < Q; q += 20)
	{
        unsigned long start, tiks, iteration;
        iteration = 100000;
        
        start = rtdsc();
        for(int i = 0; i < iteration; i++)
        {
            matrixTransformG2_unpack(matrix, matrixNew, L, q);
        }
        tiks = rtdsc() - start;
        printf("%s\t%d\t%ld\t%f\n", "matrixTransformG2_unpack", L*q, tiks/iteration, 1.0*(tiks/iteration)/(L*q));

        start = rtdsc();
        for(int i = 0; i < iteration; i++)
        {
            matrixTransformG5_SIMD(matrix, matrixNew, L, q);
        }
        tiks = rtdsc() - start;
        printf("%s\t%d\t%ld\t%f\n", "matrixTransformG5_SIMD", L*q, tiks/iteration, 1.0*(tiks/iteration)/(L*q));
        
        start = rtdsc();
        for(int i = 0; i < iteration; i++)
        {
            matrixTransformG3_SIMD(matrix, matrixNew, L, q);
        }
        tiks = rtdsc() - start;
        printf("%s\t%d\t%ld\t%f\n", "matrixTransformG3_SIMD", L*q, tiks/iteration, 1.0*(tiks/iteration)/(L*q));
        fflush(stdout);
    }

	return 0;
}
