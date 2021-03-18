#include"transform.h"

void transform3(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
    const size_t d = 80;
	for (size_t i=0; i<180; i++, psrc += 240)
    {
        for (size_t j=0; j<80; j++)
            for (size_t k=j; k<240; k+=80)
                *pdst++ = psrc[k];
    }
}
