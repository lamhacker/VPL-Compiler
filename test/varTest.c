#include "base.h"
#define NUM (4)

extern void varOne(long, float*, float*);
extern void varTwo(long, float*, float*);
extern void varThree(long, float*, float*);



int main(void)
{
    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    
    printf("varOne: \n");
    setValue(a, 0, NUM);
    setValue(b, 0, NUM);
    varOne(NUM, a, b);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    
    printf("varTwo: \n");
    setValue(a, 0, NUM);
    setValue(b, 0, NUM);
    varTwo(NUM, a, b);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    
    printf("varThree: \n");
    setValue(a, 1, NUM);
    setValue(b, 3, NUM);
    varThree(NUM, a, b);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    
    
    freeVec(a);
    freeVec(b);
}
