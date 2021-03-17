#include "header.h"

void	matrixTransformG3(int matrix[], int matrixNew[])
{
	int index;
	int blockLength = L / 3; 						

	for (int q = 0; q < Q; q++) {					
		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < 3; g++) {
				matrixNew[q * L + 3 * i + g] = matrix [q * L + i + g * blockLength];
			}
		}
    }
}