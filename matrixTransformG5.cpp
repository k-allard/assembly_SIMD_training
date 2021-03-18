#include "header.h"

void	matrixTransformG5(int matrix[], int matrixNew[], size_t L, size_t Q)
{
	int index;
	int blockLength = L / 5; 			
	for (int q = 0; q < Q; q++) {					
		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < 5; g++) {
				matrixNew[q * L + 5 * i + g] = matrix [q * L + i + g * blockLength];
			}
		}
    }
}