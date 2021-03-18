#include "header.h"

int main()
{
	int L = 16;	//строки
	int Q = 2;	//столбцы
	int G = 2;		//кол-во блоков в столбце

	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	printf("   Initial matrix                  ");
	printf("\n-.-.-.-.-.-.-.-.-.-.-\n");
	int matrix2D[L][Q];
	int matrixNew[L * Q];

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

	int matrix1D[L * Q];

	int k = -1;
    for (int j = 0; j < Q; j++)
        for (int i = 0; i < L; i++) {
            k++;
            matrix1D[k] = matrix2D[i][j];
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
	}
	printf("\n");

	return 0;
}