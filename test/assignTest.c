#include "base.h"
#define NUM (4)

extern void assign(long, float*);
extern void assignTwo(long, float*, float*);
extern void assignThree(long, float*, float*);
extern void assignFour(long, float*, float*);
extern void assignFive(long, float*, float*);
extern void assignSix(long, float*, float*, float*);
extern void assignSeven(long, float*, float*);



int main(void)
{
    float* a = mallocVec(NUM);
	float* b = mallocVec(NUM);
	float* c = mallocVec(NUM);
	
	printf("assign: \n");
    setValue(a, 0, NUM);
    assign(NUM, a);
	printVec("a", a, NUM);
	
	printf("assignTwo: \n");
	setValue(a, 0, NUM);
	setValue(b, 0, NUM);
	assignTwo(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("assignThree: \n");
	setValue(a, 1, NUM);
	setValue(b, 3, NUM);
	assignThree(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("assignFour: \n");
	setValue(a, 1, NUM);
	setValue(b, 3, NUM);
	assignFour(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("assignFive: \n");
	setValue(a, 1, NUM);
	setValue(b, 3, NUM);
	assignFive(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("assignSix: \n");
	setValue(a, 1, NUM);
	setValue(b, 3, NUM);
	setValue(c, 4, NUM);
	assignSix(NUM, a, b, c);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	
	printf("assignSeven: \n");
	setValue(a, 1, NUM);
	setValue(b, 3, NUM);
	assignSeven(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	freeVec(a);
	freeVec(b);
	freeVec(c);
}
