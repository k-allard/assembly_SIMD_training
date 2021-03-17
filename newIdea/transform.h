#ifndef  _TRANSFORM_H_
#define _TRANSFORM_H_
#include<cstdint>
#include<memory>
template<size_t G> void transform(const uint32_t *psrc, uint32_t *dst, size_t L, size_t Q) noexcept;
template<size_t G> void transformz(const uint32_t *psrc, uint32_t *dst, size_t L, size_t Q) noexcept;
extern "C" void transform3(const uint32_t *psrc, uint32_t *dst, size_t L, size_t Q) noexcept;
extern "C" void transformz2(const uint32_t *psrc, uint32_t *dst, size_t L, size_t Q) noexcept;
extern "C" void transformz3(const uint32_t *psrc, uint32_t *dst, size_t L, size_t Q) noexcept;
extern "C" void transformz5(const uint32_t *psrc, uint32_t *dst, size_t L, size_t Q) noexcept;
#endif
