#include "base.h"
#define NUM (4)

extern void empty(long, float*);

int main(void) {
	
	float* a = mallocVec(NUM);
	
	printf("function: \n");
    setValue(a, 0, NUM);
    empty(NUM, a);
	printVec("a", a, NUM);
	
	freeVec(a);
	
	return 0;
}
