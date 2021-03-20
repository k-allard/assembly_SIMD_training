#include <unistd.h>
#include <x86intrin.h>
#include <xmmintrin.h>

void	matrixTransformG2_unpack(int* matrix, int* matrixNew, int L, int Q)
{
    int G = 2;
	int blockLength = L / G; 					

	for (int q = 0; q < Q; q++) 
    {					
		for(int i = 0; i < blockLength; i+=4)
        {	
            __m128 x0 = ((__m128*)(matrix + q*L + i ))[0];
            __m128 x1 = ((__m128*)(matrix + q*L + i + blockLength))[0];
            __m128 x2 = x0;
            x2 = _mm_unpacklo_ps(x2, x1);                       // x2 = x2[0],x1[0],x2[1],x1[1]
            x0 = _mm_unpackhi_ps(x0, x1);                       // x0 = x0[2],x1[2],x0[3],x1[3]
            ((__m128*)(matrixNew + q*L + 2*i ))[0] = x2;        // x2[0],x1[0],x2[1],x1[1]
            ((__m128*)(matrixNew + q*L + 2*i + 4))[0] = x0;    //                        x0[2],x1[2],x0[3],x1[3]
		}
    }
}