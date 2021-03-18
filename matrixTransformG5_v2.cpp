#include "header.h"
 
void	matrixTransformG5_v2(const uint32_t *matrix, uint32_t *matrixNew, int L, int Q))
{
	int index;
	int blockLength = L / 5; 			
	for (int q = 0; q < Q; q++) {
		matrix += L;
		matrixNew +=L;					
		for (int i = 0; i < blockLength; i++) { 	
			for (int g = 0; g < 5; g++) {
				matrixNew[5 * i + g] = matrix [i + g * blockLength];
			}
		}
    }
}