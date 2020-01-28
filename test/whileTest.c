#include "base.h"
#define NUM (4)
#include <time.h>

extern void whileOne(long, float*);
extern void whileTwo(long, float*);
extern void whileThree(long, float*);
extern void whileFour(long, float*, float*);
extern void whileFive(long, float*);
extern void whileSix(long, float*);

int main(void)
{
	clock_t start = clock();
	
	
    float* a = mallocVec(NUM);
	float* b = mallocVec(NUM);
	
	printf("whileOne: \n");
	setValue(a, 13, NUM);
	whileOne(NUM, a);
	printVec("a", a, NUM);
	
	printf("whileTwo: \n");
    setValue(a, 7, NUM);
    whileTwo(NUM, a);
	printVec("a", a, NUM);
	
	printf("whileThree: \n");
	setValue(a, 10, NUM);
	whileThree(NUM, a);
	printVec("a", a, NUM);
	
	printf("whileFour: \n");
	setValue(a, 4, NUM);
	setValue(b, 1, NUM);
	whileFour(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("whileFive: \n");
	setValue(a, 3, NUM);
	whileFive(NUM, a);
	printVec("a", a, NUM);
	
	printf("whileSix: \n");
	setValue(a, 1, NUM);
	whileSix(NUM, a);
	printVec("a", a, NUM);
	
	freeVec(a);
	freeVec(b);
	
	printf("Processor time used by program: %Lg sec.\n", \
    (clock() - start) / (long double) CLOCKS_PER_SEC);
}
