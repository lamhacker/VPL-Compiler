#include "base.h"
#define NUM (4)

extern void complex4(long, float*, float*, float*, float*, float*);

int main(void)
{
    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    float* c = mallocVec(NUM);
	float* d = mallocVec(NUM);
	float* e = mallocVec(NUM);
    
    printf("complexOne: \n");
    setValue(a, 10, NUM);
    setValue(b, 30, NUM);
    setValue(c, 4, NUM);
	setValue(d, 1, NUM);
	setValue(e, 0, NUM);
    complex4(NUM, a, b, c, d, e);
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
}
