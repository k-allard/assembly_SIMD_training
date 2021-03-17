#include <benchmark/benchmark.h>
#include <x86intrin.h>
#include <cstring>


#define L 240	//строки
#define Q 180	//столбцы
#define G 2		//кол-во блоков в столбце


void	matrixTransformG2(int matrix[], int matrixNew[]);
void	matrixTransformG3(int matrix[], int matrixNew[]);
void	matrixTransformG5(int matrix[], int matrixNew[]); 


void	matrixTransformG2Asm(int matrix[], int matrixNew[]);
void	matrixTransformG3Asm(int matrix[], int matrixNew[]);
void	matrixTransformG5Asm(int matrix[], int matrixNew[]); 

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
    matrixTransformG5(matrix1D, matrixNew);
}

static void BM_matrixTransformG3(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG3(matrix1D, matrixNew);
}

static void BM_matrixTransformG2(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG2(matrix1D, matrixNew);
}


static void BM_matrixTransformG5Asm(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG5Asm(matrix1D, matrixNew);
}

static void BM_matrixTransformG3Asm(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG3Asm(matrix1D, matrixNew);
}

static void BM_matrixTransformG2Asm(benchmark::State& state) {
  for (auto _ : state)
    matrixTransformG2Asm(matrix1D, matrixNew);
}


BENCHMARK(BM_matrixTransformG5);
BENCHMARK(BM_matrixTransformG3);
BENCHMARK(BM_matrixTransformG2);


BENCHMARK(BM_matrixTransformG5Asm);
BENCHMARK(BM_matrixTransformG3Asm);
BENCHMARK(BM_matrixTransformG2Asm);


BENCHMARK_MAIN();
