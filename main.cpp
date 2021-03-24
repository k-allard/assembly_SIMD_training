#include "header.h"
void transformz3(const uint32_t *psrc, uint32_t *pdst, size_t L_val, size_t Q_val) noexcept;
void transformz4(const uint32_t *psrc, uint32_t *pdst, size_t L_val, size_t Q_val) noexcept;

int main()
{
	int L = 24;	//строки
	int Q = 3;	//столбцы
	int G = 3;		//кол-во блоков в столбце

	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	printf("   Initial matrix                  ");
	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	int matrix2D[L][Q] __attribute__ ((aligned (16)));
	int matrixNew[L * Q] __attribute__ ((aligned (16)));

	int index = 0;
	for (int i = 0; i < L; i++) {
        for (int j = 0; j < Q; j++) {
            matrix2D[i][j] = index;
            printf("%5d", matrix2D[i][j]);
			index++;
        }
        printf("\n");
    }
    printf("\n");

	int matrix1D[L * Q] __attribute__ ((aligned (16)));

	int k = -1;
    for (int j = 0; j < Q; j++)
        for (int i = 0; i < L; i++) {
            k++;
            matrix1D[k] = matrix2D[i][j];
			matrixNew[k] = 0;
            printf("%5d", matrix1D[k]);
        }
    printf("\n");

	switch (G)
	{
	case 2:
		matrixTransformG2(matrix1D, matrixNew, L, Q);
		break;
	case 3:
		matrixTransformG3(matrix1D, matrixNew, L, Q);
		break;
	case 5:
		matrixTransformG5(matrix1D, matrixNew, L, Q);
		break;
	default:
	    printf("ERROR: G can be 2, 3 or 5\n");
		break;
	}

	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	printf("   Result matrix                  ");
	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	for (int i = 0; i < L * Q; i++) {
		printf("%5d", matrixNew[i]);
		matrixNew[i] = 0;
	}
	printf("\n");

	switch (G)
	{
	case 2:
		matrixTransformG2_SIMD((int*)matrix1D, (int*)matrixNew, L, Q);
		break;
	case 3:
		matrixTransformG3_SIMD((int *)matrix1D, (int *)matrixNew, L, Q);
		break;
	case 5:
		matrixTransformG5_SIMD(matrix1D, matrixNew, L, Q);
		break;
	default:
	    printf("ERROR: G can be 2, 3 or 5\n");
		break;
	}

	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	printf("   Result matrix                  ");
	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	for (int i = 0; i < L * Q; i++) {
		printf("%5d", matrixNew[i]);
	}
	printf("\n");

	return 0;
}
