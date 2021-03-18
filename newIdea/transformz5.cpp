#include"transform.h"

void transformz5(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
	for (size_t i=0; i<180; i++, pdst += 240)
    {
        for (size_t j=0; j<5; j++)
            for (size_t k=j; k<240; k+=5)
                pdst[k] = *psrc++;
    }
}
