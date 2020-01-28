#include "base.h"
#define NUM (4)

extern void complexThreeTest(long, float*, float*, float*);


int main(void)
{
    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    float* c = mallocVec(NUM);
    
    printf("complexThree: \n");
    setValue(a, 10, NUM);
    setValue(b, 9, NUM);
    setValue(c, 1, NUM);
    complexThreeTest(NUM, a, b, c);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    printVec("c", c, NUM);
    
    
    freeVec(a);
    freeVec(b);
    freeVec(c);
}
