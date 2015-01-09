#include "stdafx.h"
#include <iostream>
void main()
{
	float y = 9;
	float x = 7;
	float two = 2;
	float result = 0;
	__asm{
		finit
			fld x
			fsub y
			fst result
			fld x
			fld two
			fmul
			fsub y
			fld result
			fmul
	}
	std::cout << result;
	std::cin.get();
}