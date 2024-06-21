#include "adder.h"

int __attribute__ ( ( section ( ".mprjram" ) ) ) adder()
{
	int local_var = 0;
	int index;
	for (int index = 0; index < COUNT; index++)
	{
		local_var += Number[index];
	}
	return local_var;
}