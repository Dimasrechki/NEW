#include "stdafx.h"
#include "conio.h"
#include <iostream>

void main()
{
	float y = 0;
__asm{
finit
fldpi
fst y 
}
printf("%.5f", y);
_getch();
}