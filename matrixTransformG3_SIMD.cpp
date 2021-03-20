#include <unistd.h>
#include <x86intrin.h>
#include <xmmintrin.h>
#include <emmintrin.h>

void	matrixTransformG3_SIMD(int* matrix, int* matrixNew, int L, int Q)
{
    int G = 3;
	int blockLength = L / G; 					

	for (int q = 0; q < Q; q++) 
    {					
		for(int i = 0; i < blockLength; i+=sizeof(__m128))
        {	
            __m128 x0 = ((__m128*)(matrix + q*L + i ))[0];
            __m128 x1 = ((__m128*)(matrix + q*L + i + blockLength))[0];
            __m128 x2 = ((__m128*)(matrix + q*L + i + blockLength * 2))[0];

            // TODO:
            __m128 x3; // x3 = x0[0],x1[0],x2[0],x0[1]
            __m128 x4; // x4 = x1[1],x2[1],x0[2],x1[2]
            __m128 x5; // x5 = x2[2],x0[3],x1[3],x2[3]

            x3 = _mm_setzero_ps();
            x4 = _mm_setzero_ps();
            x5 = _mm_setzero_ps();

            ((__m128*)(matrixNew + q*L + G*i ))[0] = x3;        
            ((__m128*)(matrixNew + q*L + G*i + sizeof(__m128)))[0] = x4;
            ((__m128*)(matrixNew + q*L + G*i + 2*sizeof(__m128)))[0] = x5;
		}
    }
}