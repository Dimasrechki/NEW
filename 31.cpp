#include "stdafx.h"
#include <iostream>
void main()
{
	float x = 0.78539816339744830961566084581988;
	float result = 0;
	__asm{
		finit
			fld x
			fptan
			fdiv
			fst result
	}
	std::cout << result;
	std::cin.get();
}