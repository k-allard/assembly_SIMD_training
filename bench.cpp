#include <benchmark/benchmark.h>
#include <x86intrin.h>
#include <cstring>
// #include "newIdea/transform.h"

#define L 240	//строки
#define Q 40	//столбцы

const size_t L_val = L;
const size_t Q_val = Q;
// const int G = 2;


void	matrixTransformG2(int matrix[], int matrixNew[], size_t L_val, size_t Q_val);
void	matrixTransformG3(int matrix[], int matrixNew[], size_t L_val, size_t Q_val);
void	matrixTransformG5(int matrix[], int matrixNew[], size_t L_val, size_t Q_val); 

void	matrixTransformG2_unpack(int* matrix, int* matrixNew, int L_val, int Q_val);
void	matrixTransformG3_SIMD(int* matrix, int* matrixNew, int L_val, int Q_val);
void	matrixTransformG5_SIMD(int* matrix, int* matrixNew, int L_val, int Q_val);

void transformz3(const uint32_t *psrc, uint32_t *pdst, size_t L_val, size_t Q_val) noexcept;
void transformz4(const uint32_t *psrc, uint32_t *pdst, size_t L_val, size_t Q_val) noexcept;

static int matrix2D[L][Q] __attribute__ ((aligned (16)));
static int matrix1D[L * Q] __attribute__ ((aligned (16)));
static int matrixNew[L * Q] __attribute__ ((aligned (16)));

static int init()
{
	int index = 0;
	for (int i = 0; i < L; i++) {
        for (int j = 0; j < Q; j++) {
            matrix2D[i][j] = index;
			index++;
        }
    }

	int k = -1;
    for (int j = 0; j < Q; j++)
        for (int i = 0; i < L; i++) {
            k++;
            matrix1D[k] = matrix2D[i][j];
        }
	return (0);
}

static int test_init = init();

static void BM_matrixTransformG5_withoutSIMD(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG5(matrix1D, matrixNew, L_val, Q_val);
}

static void BM_matrixTransformG3_withoutSIMD(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG3(matrix1D, matrixNew, L_val, Q_val);
}

static void BM_matrixTransformG2_withoutSIMD(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG2(matrix1D, matrixNew, L_val, Q_val);
}




static void BM_matrixTransformG2_SIMD(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG2_unpack((int *)matrix1D, (int *)matrixNew, L, Q);
}

static void BM_matrixTransformG3_SIMD(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG3_SIMD((int *)matrix1D, (int *)matrixNew, L, Q);
}

static void BM_matrixTransformG5_SIMD(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG5_SIMD((int *)matrix1D, (int *)matrixNew, L, Q);
}

static void BM_matrixTransformG3_maskmovdqu(benchmark::State& state) {
  for (auto _ : state)
    transformz3((const uint32_t *)matrix1D, (uint32_t *)matrixNew, L, Q);
}

static void BM_matrixTransformG3_pandPor(benchmark::State& state) {
  for (auto _ : state)
    transformz4((const uint32_t *)matrix1D, (uint32_t *)matrixNew, L, Q);
}

BENCHMARK(BM_matrixTransformG2_withoutSIMD);
BENCHMARK(BM_matrixTransformG3_withoutSIMD);
BENCHMARK(BM_matrixTransformG5_withoutSIMD);


BENCHMARK(BM_matrixTransformG2_SIMD);
BENCHMARK(BM_matrixTransformG3_SIMD);
BENCHMARK(BM_matrixTransformG5_SIMD);
BENCHMARK(BM_matrixTransformG3_maskmovdqu);
BENCHMARK(BM_matrixTransformG3_pandPor);

BENCHMARK_MAIN();
