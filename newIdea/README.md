Assembler code generated from C++ with command ``g++ -S -masm=intel -Ofast -fno-stack-protector -fno-exceptions -fno-rtti -mmmx -msse -msse2 -msse3 -mssse3 -mno-sse4.1 -mno-avx -fno-asynchronous-unwind-tables -std=c++11 -o transform.s transform.cpp`` 

https://www.felixcloutier.com/x86/punpckhbw:punpckhwd:punpckhdq:punpckhqdq 

https://www.felixcloutier.com/x86/pshufd 

https://parallel.ru/russia/MSU-Intel/sse.html

http://www.xtechx.ru/c40-visokotehnologichni-spravochnik-hitech-book/sse-simd-instruction/

Заметки по оптимизации

При реализации функции transformz2 можно убрать цикл второго уровня
Развернуть его.


-
https://gamedev.ru/flame/forum/?id=196945

В случае с SHUFPS первый Xmm регистр переворачивает свои старшие 64 бита и пишет их в младшую часть этого же XMM регистра, затем берутся 64 бита младших байтов из второго XMM регистра , переворачиваются и пишутся в старшую часть первого XMM регистра.

# Загрузка из памяти в xmm128

## __m128 _mm_loadu_ps (float const* mem_addr)
### Synopsis
```cpp
__m128 _mm_loadu_ps (float const* mem_addr)
#include <xmmintrin.h>
Instruction: movups xmm, m128
CPUID Flags: SSE
```
### Description
Load 128-bits (composed of 4 packed single-precision (32-bit) floating-point elements) from memory into dst. mem_addr does not need to be aligned on any particular boundary.
### Operation
```cpp
dst[127:0] := MEM[mem_addr+127:mem_addr]
```

### Performance
Architecture	|Latency	|Throughput (CPI)
--- 			| --- 		| ---
Skylake	|6	|0.5
Broadwell	|1	|0.5
Haswell	|1	|0.5
Ivy Bridge	|1	|1 

# Упаковка чисел в xmm128

## __m128i _mm_set_epi32 (int e3, int e2, int e1, int e0)

__Synopsis__

__m128i _mm_set_epi32 (int e3, int e2, int e1, int e0)
#include <emmintrin.h>
Instruction: Sequence
CPUID Flags: SSE2

__Description__

Set packed 32-bit integers in dst with the supplied values.

__Operation__

```
dst[31:0] := e0
dst[63:32] := e1
dst[95:64] := e2
dst[127:96] := e3
```

# Упаковка чисел в обратном порядка

## __m128i _mm_setr_epi32 (int e3, int e2, int e1, int e0)

### Synopsis
```cpp
__m128i _mm_setr_epi32 (int e3, int e2, int e1, int e0)
#include <emmintrin.h>
Instruction: Sequence
CPUID Flags: SSE2
```

### Description
Set packed 32-bit integers in dst with the supplied values in reverse order.

### Operation
```cpp
dst[31:0] := e3
dst[63:32] := e2
dst[95:64] := e1
dst[127:96] := e0
```
# Обнуление 
## __m128 _mm_setzero_ps (void)
__Synopsis__
```
__m128 _mm_setzero_ps (void)
#include <xmmintrin.h>
Instruction: xorps xmm, xmm
CPUID Flags: SSE
```

__Description__

Return vector of type __m128 with all elements set to zero.

### Operation
```cpp
dst[MAX:0] := 0
```
### Performance
Architecture	|Latency	|Throughput (CPI)
--- 			| --- 		| ---
Broadwell		|1			|1
Haswell			|1			|1
Ivy Bridge		|1			|1


# Обнуление вектора int
## __m128i _mm_setzero_si128 ()
### Synopsis
```cpp
__m128i _mm_setzero_si128 ()
#include <emmintrin.h>
Instruction: pxor xmm, xmm
CPUID Flags: SSE2
```
### Description
Return vector of type __m128i with all elements set to zero.
### Operation
```cpp
dst[MAX:0] := 0
```
### Performance
Architecture	|Latency	|Throughput (CPI)
---				| ---		| ---
Skylake			|1			|0.33
Broadwell		|1			|0.33
Haswell			|1			|0.33
Ivy Bridge		|1			|0.33


__m128i _mm_sll_epi32 (__m128i a, __m128i count)
### Synopsis
```cpp
__m128i _mm_sll_epi32 (__m128i a, __m128i count)
#include <emmintrin.h>
Instruction: pslld xmm, xmm
CPUID Flags: SSE2
```
### Description
Shift packed 32-bit integers in a left by count while shifting in zeros, and store the results in dst.
### Operation
```cpp
FOR j := 0 to 3
	i := j*32
	IF count[63:0] > 31
		dst[i+31:i] := 0
	ELSE
		dst[i+31:i] := ZeroExtend32(a[i+31:i] << count[63:0])
	FI
ENDFOR
```
### Performance
Architecture	|Latency	|Throughput (CPI)
---				| --		| ---
Skylake	|2	|1
Broadwell	|1	|1
Haswell	|1	|1
Ivy Bridge	|1	|1

# Перемещение 32-х 
## __m128i _mm_shuffle_epi32 (__m128i a, int imm8)
### Synopsis
```cpp
__m128i _mm_shuffle_epi32 (__m128i a, int imm8)
#include <emmintrin.h>
Instruction: pshufd xmm, xmm, imm8
CPUID Flags: SSE2
```
### Description
Shuffle 32-bit integers in a using the control in imm8, and store the results in dst.
### Operation
```cpp
DEFINE SELECT4(src, control) {
	CASE(control[1:0]) OF
	0:	tmp[31:0] := src[31:0]
	1:	tmp[31:0] := src[63:32]
	2:	tmp[31:0] := src[95:64]
	3:	tmp[31:0] := src[127:96]
	ESAC
	RETURN tmp[31:0]
}
dst[31:0] := SELECT4(a[127:0], imm8[1:0])
dst[63:32] := SELECT4(a[127:0], imm8[3:2])
dst[95:64] := SELECT4(a[127:0], imm8[5:4])
dst[127:96] := SELECT4(a[127:0], imm8[7:6])
```
### Performance
Architecture	|Latency	|Throughput (CPI)
---				| --		| ---
Skylake	|1	|1
Broadwell	|1	|1
Haswell	|1	|1
Ivy Bridge	|1	|0.5

# Совмещение двух xmm старших половин в один xmm

## __m128i _mm_unpackhi_epi64 (__m128i a, __m128i b)
### Synopsis
```cpp
__m128i _mm_unpackhi_epi64 (__m128i a, __m128i b)
#include <emmintrin.h>
Instruction: punpckhqdq xmm, xmm
CPUID Flags: SSE2
```
### Description
Unpack and interleave 64-bit integers from the high half of a and b, and store the results in dst.
### Operation
```cpp
DEFINE INTERLEAVE_HIGH_QWORDS(src1[127:0], src2[127:0]) {
	dst[63:0] := src1[127:64] 
	dst[127:64] := src2[127:64] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_HIGH_QWORDS(a[127:0], b[127:0])
```
### Performance
Architecture	|Latency	|Throughput (CPI)
---				| --		| ---
Skylake	|1	|1
Broadwell	|1	|1
Haswell	|1	|1
Ivy Bridge	|1	|0.5

# Поочередная перепиковка элементов
## __m128 _mm_unpacklo_ps (__m128 a, __m128 b)
### Synopsis
```cpp
__m128 _mm_unpacklo_ps (__m128 a, __m128 b)
#include <xmmintrin.h>
Instruction: unpcklps xmm, xmm
CPUID Flags: SSE
```

### Description
Unpack and interleave single-precision (32-bit) floating-point elements from the low half of a and b, and store the results in dst.

### Operation
```cpp
DEFINE INTERLEAVE_DWORDS(src1[127:0], src2[127:0]) {
	dst[31:0] := src1[31:0] 
	dst[63:32] := src2[31:0] 
	dst[95:64] := src1[63:32] 
	dst[127:96] := src2[63:32] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_DWORDS(a[127:0], b[127:0])
```

### Performance
Architecture	|Latency	|Throughput (CPI)
--- | --- | ---
Skylake	|1	|1
Broadwell	|1	|1
Haswell	|1	|1
Ivy Bridge	|1	|1


## __m128 _mm_unpackhi_ps (__m128 a, __m128 b)
### Synopsis
```cpp
__m128 _mm_unpackhi_ps (__m128 a, __m128 b)
#include <xmmintrin.h>
Instruction: unpckhps xmm, xmm
CPUID Flags: SSE
```
### Description
Unpack and interleave single-precision (32-bit) floating-point elements from the high half a and b, and store the results in dst.
### Operation
```cpp
DEFINE INTERLEAVE_HIGH_DWORDS(src1[127:0], src2[127:0]) {
	dst[31:0] := src1[95:64] 
	dst[63:32] := src2[95:64] 
	dst[95:64] := src1[127:96] 
	dst[127:96] := src2[127:96] 
	RETURN dst[127:0]	
}
dst[127:0] := INTERLEAVE_HIGH_DWORDS(a[127:0], b[127:0])
```
### Performance
Architecture	|Latency	|Throughput (CPI)
--- | --- | ---
Skylake	|1	|1
Broadwell	|1	|1
Haswell	|1	|1
Ivy Bridge	|1	|1
