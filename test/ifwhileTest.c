#include "base.h"
#define NUM (4)

extern void ifwhileOne(long, float*, float*);
extern void ifwhileTwo(long, float*, float*);

int main(void)
{

    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    
    printf("ifwhileOne: \n");
    setValue(a, 20, NUM);
    setValue(b, 10, NUM);
    ifwhileOne(NUM, a, b);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    
    printf("ifwhileTwo: \n");
    setValue(a, 2, NUM);
    setValue(b, 1, NUM);
    ifwhileTwo(NUM, a, b);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    
    
    freeVec(a);
    freeVec(b);
	
}

