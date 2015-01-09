#include "stdafx.h"
#include <iostream>
void main()
{
	float x = 3;
	float mn1 = 135;
	float mn2 = 2042;
	float c = 2000;
	float a = 4;
	float b = 5;
	float result = 0;
	float prom1 = 0;
	float prom2 = 0;
	float prom3 = 0;
	_asm{
		finit
			fld x
			fld mn1
			fmul
			fst prom1
			fld c
			fld x
			fmul
			fst prom2
			fld mn2
			fld b
			fmul
			fld prom2
			fsubr
			fst prom2
			fld a
			fmul a
			fdiv
			fld prom1
			fadd
			fst result
	}
	std::cout << result;
	std::cin.get();
}