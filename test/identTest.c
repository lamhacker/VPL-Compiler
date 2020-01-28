#include "base.h"
#define NUM (4)

extern void ident1(long, float*, float*);
extern void ident2(long, float*, float*, float*, float*, float*);

int main(void) {
	
	float* a = mallocVec(NUM);
	float* b = mallocVec(NUM);
	float* c = mallocVec(NUM);
	float* d = mallocVec(NUM);
	float* e = mallocVec(NUM);
	
	printf("ident1: \n");
    setValue(a, 1, NUM);
	setValue(b, 2, NUM);
    ident1(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("ident2: \n");
    setValue(a, 1, NUM);
	setValue(b, 2, NUM);
	setValue(c, 3, NUM);
	setValue(d, 4, NUM);
	setValue(e, 5, NUM);
	ident2(NUM, a, b, c, d, e);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	printVec("d", d, NUM);
	printVec("e", e, NUM);
	
	freeVec(a);
	freeVec(b);
	freeVec(c);
	freeVec(d);
	freeVec(e);
	
	return 0;
}
