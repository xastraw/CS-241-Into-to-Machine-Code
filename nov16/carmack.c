#include<stdio.h>

extern float finvsqrt(float number);

int main(void)
{

    float number = 9.0;
    float ans;
    ans = finvsqrt(number);
    printf("The answer is %f\n", ans);

    return 0;
}