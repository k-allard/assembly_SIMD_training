#include <unistd.h>
#include <x86intrin.h>
#include <xmmintrin.h>
#include <emmintrin.h>

void	matrixTransformG5_SIMD(int* matrix, int* matrixNew, int L, int Q)
{
    int G = 5;
	int blockLength = L / G; 					

	for (int q = 0; q < Q; q++) 
    {					
		for(int i = 0; i < blockLength; i += 4)
        {	
            __m128i x1 = ((__m128i*)(matrix + q*L + i ))[0];
            __m128i x2 = ((__m128i*)(matrix + q*L + i + blockLength))[0];
            __m128i x3 = ((__m128i*)(matrix + q*L + i + blockLength * 2))[0];
            __m128i x4 = ((__m128i*)(matrix + q*L + i + blockLength * 3))[0];
            __m128i x5 = ((__m128i*)(matrix + q*L + i + blockLength * 4))[0];

            __m128i tmp;

                                                     // должны будут быть такими:
                                                       // x4[0],x3[0],x2[0],x1[0] 
                                                       // x3[1],x2[1],x1[1],x5[0]
                                                       // x2[2],x1[2],x5[1],x4[1]
                                                       // x1[3],x5[2],x4[2],x3[2]
                                                       // x5[3],x4[3],x3[3],x2[3]

            __m128i tmp1;
            __m128i tmp2;
            __m128i tmp3;

            tmp = _mm_bslli_si128(_mm_and_si128(x4, _mm_set_epi32(0, 0, 0, 0xffffffff)), 12);            // tmp   = x4[0],00000,00000,00000
            tmp1 = _mm_bslli_si128(_mm_and_si128(x3, _mm_set_epi32(0, 0, 0, 0xffffffff)), 8);            // tmp1  = 00000,x3[0],00000,00000
            tmp2 = _mm_bslli_si128(_mm_and_si128(x2, _mm_set_epi32(0, 0, 0, 0xffffffff)), 4);            // tmp2  = 00000,00000,x2[0],00000
            tmp3 = _mm_and_si128(x1, _mm_set_epi32(0, 0, 0, 0xffffffff));                                // tmp3  = 00000,00000,00000,x1[0]
            tmp = _mm_or_si128(_mm_or_si128(_mm_or_si128(tmp, tmp1), tmp2), tmp3);                   // tmp   = x4[0],x3[0],x2[0],x1[0]
            ((__m128i*)(matrixNew + q*L + G*i))[0] = tmp;        


            tmp = _mm_bslli_si128(_mm_and_si128(x3, _mm_set_epi32(0, 0, 0xffffffff, 0)), 8);             // tmp   = x3[1],00000,00000,00000
            tmp1 = _mm_bslli_si128(_mm_and_si128(x2, _mm_set_epi32(0, 0, 0xffffffff, 0)), 4);            // tmp1  = 00000,x2[1],00000,00000
            tmp2 = _mm_and_si128(x1, _mm_set_epi32(0, 0, 0xffffffff, 0));                                // tmp2  = 00000,00000,x1[1],00000
            tmp3 = _mm_and_si128(x5, _mm_set_epi32(0, 0, 0, 0xffffffff));                                // tmp3  = 00000,00000,00000,x5[0]
            tmp = _mm_or_si128(_mm_or_si128(_mm_or_si128(tmp, tmp1), tmp2), tmp3);                   // tmp   = x3[1],x2[1],x1[1],x5[0]
            ((__m128i*)(matrixNew + q*L + G*i))[1] = tmp;


            tmp = _mm_bslli_si128(_mm_and_si128(x2, _mm_set_epi32(0, 0xffffffff, 0, 0)), 4);             // tmp   = x2[2],00000,00000,00000
            tmp1 = _mm_and_si128(x1, _mm_set_epi32(0, 0xffffffff, 0, 0));                                // tmp1  = 00000,x1[2],00000,00000
            tmp2 = _mm_and_si128(x5, _mm_set_epi32(0, 0, 0xffffffff, 0));                                // tmp2  = 00000,00000,x5[1],00000
            tmp3 = _mm_bsrli_si128(_mm_and_si128(x4, _mm_set_epi32(0, 0, 0xffffffff, 0)), 4);            // tmp3  = 00000,00000,00000,x4[1]
            tmp = _mm_or_si128(_mm_or_si128(_mm_or_si128(tmp, tmp1), tmp2), tmp3);                   // tmp   = x2[2],x1[2],x5[1],x4[1]
            ((__m128i*)(matrixNew + q*L + G*i))[2] = tmp;


            tmp = _mm_and_si128(x1, _mm_set_epi32(0xffffffff, 0, 0, 0));                                 // tmp   = x1[3],00000,00000,00000
            tmp1 = _mm_and_si128(x5, _mm_set_epi32(0, 0xffffffff, 0, 0));                                // tmp1  = 00000,x5[2],00000,00000
            tmp2 = _mm_bsrli_si128(_mm_and_si128(x4, _mm_set_epi32(0, 0xffffffff, 0, 0)), 4);            // tmp2  = 00000,00000,x4[2],00000
            tmp3 = _mm_bsrli_si128(_mm_and_si128(x3, _mm_set_epi32(0, 0xffffffff, 0, 0)), 8);            // tmp3  = 00000,00000,00000,x3[2]
            tmp = _mm_or_si128(_mm_or_si128(_mm_or_si128(tmp, tmp1), tmp2), tmp3);                   // tmp   = x1[3],x5[2],x4[2],x3[2]
            ((__m128i*)(matrixNew + q*L + G*i))[3] = tmp;


            tmp = _mm_and_si128(x5, _mm_set_epi32(0xffffffff, 0, 0, 0));                                 // tmp   = x5[3],00000,00000,00000
            tmp1 = _mm_bsrli_si128(_mm_and_si128(x4, _mm_set_epi32(0xffffffff, 0, 0, 0)), 4);            // tmp1  = 00000,x4[3],00000,00000
            tmp2 = _mm_bsrli_si128(_mm_and_si128(x3, _mm_set_epi32(0xffffffff, 0, 0, 0)), 8);            // tmp2  = 00000,00000,x3[3],00000
            tmp3 = _mm_bsrli_si128(_mm_and_si128(x2, _mm_set_epi32(0xffffffff, 0, 0, 0)), 12);           // tmp3  = 00000,00000,00000,x2[3]
            tmp = _mm_or_si128(_mm_or_si128(_mm_or_si128(tmp, tmp1), tmp2), tmp3);                   // tmp   = x5[3],x4[3],x3[3],x2[3]
            ((__m128i*)(matrixNew + q*L + G*i))[4] = tmp;
		}
    }
}