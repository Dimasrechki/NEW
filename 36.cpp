#include "stdafx.h"
#include <iostream>
void main()
{
	float x = 5;
	float mn = 4;
	float result = 0;
	float cel = 0;
	_asm{
		finit
			fld x
			fldl2e
			fmul
			fst result
			fld result
			frndint
			fst cel
			fsub
			f2xm1
			fld1
			fadd
			fst result
			fld cel
			fld result
			fscale
			fld mn
			fdiv
			fst result
	}
	std::cout << result;
	std::cin.get();
}