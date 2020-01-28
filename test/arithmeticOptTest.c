#include "base.h"
#define NUM (4)

extern void arithOpt1(long, float*);
extern void arithOpt2(long, float*);
extern void arithOpt3(long, float*);
extern void arithOpt4(long, float*);
extern void arithOpt5(long, float*);
extern void arithOpt6(long, float*);

int main(void) {
	
	float* a = mallocVec(NUM);
	
	printf("arithOpt1: \n");
    setValue(a, 1, NUM);
    arithOpt1(NUM, a);
	printVec("a", a, NUM);
	
	printf("arithOpt2: \n");
    setValue(a, 1, NUM);
    arithOpt2(NUM, a);
	printVec("a", a, NUM);
	
	printf("arithOpt3: \n");
    setValue(a, 1, NUM);
    arithOpt3(NUM, a);
	printVec("a", a, NUM);
	
	printf("arithOpt4: \n");
    setValue(a, 1, NUM);
    arithOpt4(NUM, a);
	printVec("a", a, NUM);
	
	printf("arithOpt5: \n");
    setValue(a, 1, NUM);
    arithOpt5(NUM, a);
	printVec("a", a, NUM);
	
	printf("arithOpt6: \n");
    setValue(a, 1, NUM);
    arithOpt6(NUM, a);
	printVec("a", a, NUM);
	
	freeVec(a);
	
	return 0;
}
