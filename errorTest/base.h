#ifndef VEC_BASE
#define VEC_BASE

#include <stdlib.h>
#include <stdio.h>

#define align(s,a) (((size_t)(s) + ((a) - 1)) & ~((size_t) (a) - 1))
#define SSE_ALIGN (16)

float* mallocVec(int num);
void freeVec(float* vec);
void setValue(float* vec, float val, int num);
void printVec(char* rep, float* vec, int num);

#endif
