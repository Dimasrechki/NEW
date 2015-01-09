#include "stdafx.h"
#include "conio.h"
#include <iostream>

void main()
{
	float a = 0;
	float result = 0;
	__asm{
		finit
			fld a
			fcos
			fst result
	}
	std::cout<<result;
	_getch();
}