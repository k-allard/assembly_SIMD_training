#include"transform.h"

void transformz2(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
	for (size_t i=0; i<180; i++, pdst += 240)
    {
        for (size_t j=0; j<2; j++)
            for (size_t k=j; k<240; k+=2)
                pdst[k] = *psrc++;
    }
}


void transformz2(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
	for (size_t i=0; i<180; i++, pdst += 240)
    {
		size_t j=0;

		for (size_t k=j; k<240; k+=2)
			pdst[k] = *psrc++;
		
		j++;

		for (size_t k=j; k<240; k+=2)
			// L кратно G * 8 = 2 * 8 = 16
			pdst[k] = *psrc++; //sse 
    }
}
