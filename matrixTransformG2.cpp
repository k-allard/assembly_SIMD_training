#include "header.h"

void	matrixTransformG2(int matrix[], int matrixNew[], size_t L, size_t Q)
{
	int blockLength = L / 2; 					

	for (int q = 0; q < Q; q++) {					
		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < 2; g++) {
				matrixNew[q * L + 2 * i + g] = matrix [q * L + i + g * blockLength];
			}
		}
    }
}