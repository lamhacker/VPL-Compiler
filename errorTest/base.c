#include "base.h"

float* mallocVec(int num)
{
    float* vec = malloc(sizeof(float) * num + SSE_ALIGN);
	vec = (float *) align(vec, SSE_ALIGN);
	return vec;
}

void freeVec(float* vec)
{
    free(vec);
}

void setValue(float* vec, float val, int num)
{
    for (int i = 0; i < num; i++)
    {
        vec[i] = val;
    }
}

void printVec(char* rep, float* vec, int num)
{
	printf("%s: ", rep);
    for (int i = 0; i < num; i++)
    {   
        printf("%f ", vec[i]);
    }
	printf("\n");
}


