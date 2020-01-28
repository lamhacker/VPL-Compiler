#include "base.h"
#define NUM (4)

extern void undefinedVariableTestOne(long, float*, float*, float*);

int main(void)
{
    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    
    printf("complexOne: \n");
    setValue(a, 10, NUM);
    setValue(b, 30, NUM);
    undefinedVariableTest(NUM, a, b,c);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
   
    
    freeVec(a);
    freeVec(b);
    
}
