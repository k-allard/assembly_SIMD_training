#include"transform.h"
template<size_t G> void transform(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
    for (size_t i=0; i<Q; i++, psrc += L)
    {
        const size_t d = L/G;
        for (size_t j=0; j<d; j++)
            for (size_t k=j; k<L; k+=d)
                *pdst++ = psrc[k];
    }
}
template<size_t G> void transformz(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
    for (size_t i=0; i<Q; i++, pdst += L)
    {
        for (size_t j=0; j<G; j++)
            for (size_t k=j; k<L; k+=G)
                pdst[k] = *psrc++;
    }
}
void transform3(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
    transform<3>(psrc, pdst, L, Q);
}
void transformz2(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
    transformz<2>(psrc, pdst, L, Q);
}
void transformz3(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
    transformz<3>(psrc, pdst, L, Q);
}
void transformz5(const uint32_t *psrc, uint32_t *pdst, size_t L, size_t Q) noexcept
{
    transformz<5>(psrc, pdst, L, Q);
}

