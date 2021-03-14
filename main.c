#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <x86intrin.h>

#define L 16	//строки
#define Q 15	//столбцы
#define G 2		//кол-во блоков в столбце

//  L 16 
//  Q 15 
//  G 2
void	matrixTransformG2(int matrix[], int matrixNew[])
{
	int blockLength = L / G; 					
	int index;

	for (int q = 0; q < Q; q++) {					
		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < G; g++) {
				matrixNew[q * L + G * i + g] = matrix [q * L + i + g * blockLength];
			}
		}
    }
}

//  L 24 
//  Q 25 
//  G 3
void	matrixTransformG3(int matrix[], int matrixNew[])
{
	int index;
	int blockLength = L / G; 						

	for (int q = 0; q < Q; q++) {					
		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < G; g++) {
				matrixNew[q * L + G * i + g] = matrix [q * L + i + g * blockLength];
			}
		}
    }
}

//  L 40 
//  Q 40 
//  G 5
void	matrixTransformG5(int matrix[], int matrixNew[])
{
	int index;
	int blockLength = L / G; 			
	for (int q = 0; q < Q; q++) {					
		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < G; g++) {
				matrixNew[q * L + G * i + g] = matrix [q * L + i + g * blockLength];
			}
		}
    }
}

int main()
{
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
		matrixTransformG2(matrix1D, matrixNew);
		break;
	case 3:
		matrixTransformG3(matrix1D, matrixNew);
		break;
	case 5:
		matrixTransformG5(matrix1D, matrixNew);
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

	return 0;
}
