#include "stdafx.h"
#include <iostream>
void main()
{
	int x = 3;
	int y = 4;
	float z = 0;
	__asm{
	finit
	fild x
	fimul x
	fild y
	fimul y
	fadd
	fsqrt
	fst z
	}
	std::cout<<z;
	std::cin.get();
}