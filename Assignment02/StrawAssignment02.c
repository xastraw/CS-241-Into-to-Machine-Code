#include <stdio.h>

int sumsquares(int n)
{
    if (n <= 0)
    {
        return 0;
    }
    else
    {
        return n*n + sumsquares(n-1);
    }

}


int main(void)
{
    int num = 5;
    printf("The sum of the first %i integers is %i\n", num, sumsquares(num));

    return 0;
} 