#include "base.h"
#define NUM (4)

extern void ifOne(long, float*);
extern void ifTwo(long, float*);
extern void ifThree(long, float*);
extern void ifFour(long, float*);
extern void ifFive(long, float*);
extern void ifSix(long, float*, float*);
extern void ifSeven(long, float*, float*);
extern void ifEight(long, float*);

int main(void)
{
    float* a = mallocVec(NUM);
	float* b = mallocVec(NUM);
	
	printf("ifOne: \n");
    setValue(a, 2, NUM);
    ifOne(NUM, a);
	printVec("a", a, NUM);
	
	printf("ifTwo: \n");
    setValue(a, 11, NUM);
    ifTwo(NUM, a);
	printVec("a", a, NUM);
	
	printf("ifThree: \n");
    setValue(a, 13, NUM);
    ifThree(NUM, a);
	printVec("a", a, NUM);
	
	printf("ifFour: \n");
    setValue(a, 16, NUM);
    ifFour(NUM, a);
	printVec("a", a, NUM);
	
	printf("ifFive: \n");
    setValue(a, 17, NUM);
    ifFive(NUM, a);
	printVec("a", a, NUM);
	
	printf("ifSix: \n");
    setValue(a, 6, NUM);
	setValue(b, 20, NUM);
    ifSix(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("ifSeven: \n");
	setValue(a, 1, NUM);
	setValue(b, 20, NUM);
	ifSeven(NUM, a, b);
	printVec("a", a, NUM);
	printVec("b", b, NUM);
	
	printf("ifEight: \n");
    setValue(a, 4, NUM);
    ifEight(NUM, a);
	printVec("a", a, NUM);

	freeVec(a);
	freeVec(b);
}
