#include "header.h"

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