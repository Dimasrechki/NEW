#include "stdafx.h"
#include <iostream>
void main()
{
	float a = 0;
	int max = 0;
	int flag;
	std::cin >> max;
	for (float i = 2; i < max; i++) {
		flag = 1;
		for (float j = 2; j < i; j++)
		{
			_asm{
				finit
					fld i
					fdiv j
					fst a
					fld a
					frndint
					fsubr
					fst a
			}
			if (a == 0){
				flag = 0;
			}
		}
		if (flag == 1){
			std::cout << i;
		}
	}

	system("pause");
}