#include "base.h"
#define NUM (4)

extern void exprOne(long, float*);
extern void exprTwo(long, float*, float*);
extern void exprThree(long, float*);
extern void exprFour(long, float*, float*);


int main(void)
{
    float* a = mallocVec(NUM);
	float* b = mallocVec(NUM);
	float* c = mallocVec(NUM);
	
	printf("exprOne: \n");
    setValue(a, 1, NUM);
    exprOne(NUM, a);
	printVec("a", a, NUM);
	
	printf("exprTwo: \n");
	setValue(a, 1, NUM);
	setValue(b, 2, NUM);
	exprTwo(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("exprThree: \n");
	setValue(a, 1, NUM);
	exprThree(NUM, a);
	printVec("a", a, NUM);
	
	printf("exprFour: \n");
	setValue(a, 3, NUM);
	setValue(b, 10, NUM);
	exprFour(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	freeVec(a);
	freeVec(b);
	freeVec(c);
}
