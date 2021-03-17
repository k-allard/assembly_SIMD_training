#ifndef HEADER_H
# define HEADER_H

#define L 240	//строки
#define Q 180	//столбцы
#define G 2		//кол-во блоков в столбце

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <x86intrin.h>

//  L 24 
//  Q 25 
//  G 3


//  L 40 
//  Q 40 
//  G 5

void	matrixTransformG2Asm(int matrix[], int matrixNew[]);
void	matrixTransformG3Asm(int matrix[], int matrixNew[]);
void	matrixTransformG5Asm(int matrix[], int matrixNew[]); 


#endif