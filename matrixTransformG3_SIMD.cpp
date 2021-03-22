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
		for(int i = 0; i < blockLength; i += 4)
        {	
            __m128i x0 = ((__m128i*)(matrix + q*L + i ))[0];
            __m128i x1 = ((__m128i*)(matrix + q*L + i + blockLength))[0];
            __m128i x2 = ((__m128i*)(matrix + q*L + i + blockLength * 2))[0];

                                // должны будут быть такими:
            __m128i x3;         // x3 = x0[0],x1[0],x2[0],x0[1]
            __m128i x4;         // x4 = x1[1],x2[1],x0[2],x1[2]
            __m128i x5;         // x5 = x2[2],x0[3],x1[3],x2[3]

            /*
            * _mm_and_si128 
            * pand xmm, xmm
            * https://software.intel.com/sites/landingpage/IntrinsicsGuide/#techs=MMX,SSE,SSE2,SSE3,SSSE3&expand=291,291,300&text=_mm_and_si128%20
            * 
            * _mm_bslli_si128 
            * pslldq xmm, imm8
            * https://software.intel.com/sites/landingpage/IntrinsicsGuide/#techs=MMX,SSE,SSE2,SSE3,SSSE3&cats=Shift&text=_mm_bslli_si128
            * 
            * _mm_or_si128 
            * por xmm, xmm
            * https://software.intel.com/sites/landingpage/IntrinsicsGuide/#techs=MMX,SSE,SSE2,SSE3,SSSE3&text=_mm_or_si128
            * 
            */ 
            x3 = _mm_and_si128(x0, _mm_set_epi32(0, 0, 0xffff, 0xffff));                                // x3       = 00000,00000,x0[1],x0[0]
            __m128i from_x1 = _mm_bslli_si128(_mm_and_si128(x1, _mm_set_epi32(0, 0, 0, 0xffff)), 8);    // from_x1  = 00000,x1[0],00000,00000
            __m128i from_x2 = _mm_bslli_si128(_mm_and_si128(x2, _mm_set_epi32(0, 0, 0, 0xffff)), 12);   // from_x2  = x2[0],00000,00000,00000
            x3 = _mm_or_si128(_mm_or_si128(x3, from_x1), from_x2);                                      // x3       = x2[0],x1[0],x0[1],x0[0]
            /*
            *                  3     2     1     0
            * x3           = x2[0],x1[0],x0[1],x0[0]
            * надо получить:
            * x3           = x0[0],x1[0],x2[0],x0[1]
            * маска            0     2     3     1
            * __m128i _mm_shuffle_epi32 (__m128i a, int imm8) 
            * pshufd xmm, xmm, imm8
            * https://software.intel.com/sites/landingpage/IntrinsicsGuide/#techs=MMX,SSE,SSE2,SSE3,SSSE3&text=pshufd
            */
            x3 = _mm_shuffle_epi32(x3, _MM_SHUFFLE(1, 3, 2, 0));


            // Надо будет получить вот так:
            // x4 = x1[1],x2[1],x0[2],x1[2]
            x4 = _mm_and_si128(x1, _mm_set_epi32(0, 0xffff, 0xffff, 0));                                // x4 = 00000,x1[2],x1[1],00000
            from_x2 = _mm_bsrli_si128(_mm_and_si128(x2, _mm_set_epi32(0, 0, 0xffff, 0)), 4);            // from_x2 = 00000,00000,00000,x2[1]
            __m128i from_x0 = _mm_bslli_si128(_mm_and_si128(x0, _mm_set_epi32(0, 0xffff, 0, 0)), 4);    // from_x0 = x0[2],00000,00000,00000
            x4 = _mm_or_si128(_mm_or_si128(x4, from_x2), from_x0);
            /*                  3     2     1     0
            * x4           = x0[2],x1[2],x1[1],x2[1]
            * надо получить:
            * x4           = x1[1],x2[1],x0[2],x1[2]
            * маска            1     0     3     2
            */
            x4 = _mm_shuffle_epi32(x4, _MM_SHUFFLE(2, 3, 0, 1));

            // Надо будет получить вот так:
            // x5 = x2[2],x0[3],x1[3],x2[3]
            x5 = _mm_and_si128(x2, _mm_set_epi32(0xffff, 0xffff, 0, 0));                                // x5 = x2[3],x2[2],00000,00000
            from_x0 = _mm_bsrli_si128(_mm_and_si128(x0, _mm_set_epi32(0xffff, 0, 0, 0)), 12);           // from_x0 = 00000,00000,00000,x0[3]
            from_x1 = _mm_bsrli_si128(_mm_and_si128(x1, _mm_set_epi32(0xffff, 0, 0, 0)), 8);            // from_x1 = 00000,00000,x1[3],00000
            x5 = _mm_or_si128(_mm_or_si128(x5, from_x0), from_x1);
            /*                  3     2     1     0
            * x5           = x2[3],x2[2],x1[3],x0[3]
            * надо получить:
            * x5           = x2[2],x0[3],x1[3],x2[3]
            * маска             2     0     1     3
            */
            x5 = _mm_shuffle_epi32(x5, _MM_SHUFFLE(3, 1, 0, 2));

            ((__m128i*)(matrixNew + q*L + G*i))[0] = x3;        
            ((__m128i*)(matrixNew + q*L + G*i))[1] = x4;
            ((__m128i*)(matrixNew + q*L + G*i))[2] = x5;
		}
    }
}