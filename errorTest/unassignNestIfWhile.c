#include "base.h"
#define NUM (4)

extern void unassignNestIfWhileTest(long, float*, float*);

int main(void)
{
    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    
    printf("errorFour: \n");
    setValue(a, 10, NUM);
    setValue(b, 30, NUM);
    unassignNestIfWhileTest(NUM, a, b);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
   
    
    freeVec(a);
    freeVec(b);
    
}
