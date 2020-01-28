#include "base.h"
#define NUM (4)

extern void complexOne(long, float*, float*, float*);
extern void complexTwo(long, float*, float*, float*);
extern void complexThree(long, float*, float*, float*);



int main(void)
{
    float* a = mallocVec(NUM);
    float* b = mallocVec(NUM);
    float* c = mallocVec(NUM);
    
    printf("complexOne: \n");
    setValue(a, 0, NUM);
    setValue(b, 0, NUM);
    setValue(c, 0, NUM);
    complexOne(NUM, a, b, c);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    printVec("c", c, NUM);
    
    
    printf("complexTwo: \n");
    setValue(a, 0, NUM);
    setValue(b, 0, NUM);
    setValue(c, 0, NUM);
    complexTwo(NUM, a, b, c);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    printVec("c", c, NUM);
    
    printf("complexThree: \n");
    setValue(a, 1, NUM);
    setValue(b, 3, NUM);
    setValue(c, 5, NUM);
    complexThree(NUM, a, b, c);
    printVec("a", a, NUM);
    printVec("b", b, NUM);
    printVec("c", c, NUM);
    
    
    freeVec(a);
    freeVec(b);
    freeVec(c);
}
