#include <benchmark/benchmark.h>
#include <x86intrin.h>
#include <cstring>
#include "newIdea/transform.h"

#define L 240	//строки
#define Q 16	//столбцы
#define G 2		//кол-во блоков в столбце

const size_t L_val = L;
const size_t Q_val = Q;
// const int G = 2;


void	matrixTransformG2(int matrix[], int matrixNew[], size_t L_val, size_t Q_val);
void	matrixTransformG3(int matrix[], int matrixNew[], size_t L_val, size_t Q_val);
void	matrixTransformG5(int matrix[], int matrixNew[], size_t L_val, size_t Q_val); 

void	matrixTransformG2_unpack(int* matrix, int* matrixNew, int L_val, int Q_val);
void	matrixTransformG3_SIMD(int* matrix, int* matrixNew, int L_val, int Q_val);

static int matrix2D[L][Q];
static int matrix1D[L * Q];
static int matrixNew[L * Q];

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

static void BM_matrixTransformG5(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG5(matrix1D, matrixNew, L_val, Q_val);
}

static void BM_matrixTransformG3(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG3(matrix1D, matrixNew, L_val, Q_val);
}

static void BM_matrixTransformG2(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG2(matrix1D, matrixNew, L_val, Q_val);
}




static void BM_matrixTransformG2_unpack(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG2_unpack((int *)matrix1D, (int *)matrixNew, L, Q);
}

static void BM_matrixTransformG3_SIMD(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG3_SIMD((int *)matrix1D, (int *)matrixNew, L, Q);
}

BENCHMARK(BM_matrixTransformG5);
BENCHMARK(BM_matrixTransformG3);
BENCHMARK(BM_matrixTransformG2);


BENCHMARK(BM_matrixTransformG2_unpack);
BENCHMARK(BM_matrixTransformG3_SIMD);

BENCHMARK_MAIN();
