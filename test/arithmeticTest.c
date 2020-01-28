#include "base.h"
#define NUM (4)

extern void arith1(long, float*, float*, float*);
extern void arith2(long, float*, float*, float*);
extern void arith3(long, float*, float*, float*);
extern void arith4(long, float*, float*, float*);
extern void arith5(long, float*, float*, float*);
extern void arith6(long, float*, float*, float*);

int main(void) {
	
	float* a = mallocVec(NUM);
	float* b = mallocVec(NUM);
	float* c= mallocVec(NUM);
	
	printf("add: \n");
    setValue(a, 1, NUM);
	setValue(b, 2, NUM);
    arith1(NUM, a, b, c);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	
	printf("minus: \n");
    setValue(a, 3, NUM);
	setValue(b, 2, NUM);
    arith2(NUM, a, b, c);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	
	printf("mult: \n");
    setValue(a, 5, NUM);
	setValue(b, 5, NUM);
    arith3(NUM, a, b, c);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	
	printf("divide: \n");
    setValue(a, 100, NUM);
	setValue(b, 50, NUM);
    arith4(NUM, a, b, c);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	
	printf("min: \n");
    setValue(a, 25, NUM);
	setValue(b, 150, NUM);
    arith5(NUM, a, b, c);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	
	printf("add2: \n");
    setValue(a, 1, NUM);
	setValue(b, 2, NUM);
    arith6(NUM, a, b, c);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	printVec("c", c, NUM);
	
	freeVec(a);
	freeVec(b);
	freeVec(c);
	
	return 0;
}
