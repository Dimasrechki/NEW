#include "stdafx.h"
#include <iostream>
void main()
{
	float r = 1;
	float two = 2;
	float result = 0;
	__asm{
	finit
	fld r
	fmul two
	fldpi
	fmul
	fst result
	}
	std::cout<<result;
	std::cin.get();
}