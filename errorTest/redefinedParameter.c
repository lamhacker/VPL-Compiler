#include "base.h"
#define NUM (4)

extern void redefinedParameter(long, float*, float*);

int main(void)
{
    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    
    printf("errorTwo: \n");
    setValue(a, 10, NUM);
    setValue(b, 30, NUM);
    redefinedParameter(NUM, a, b);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
   
    
    freeVec(a);
    freeVec(b);
    
}
