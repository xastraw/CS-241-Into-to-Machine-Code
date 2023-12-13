#include <stdio.h>


int main(void)
{
    int max = 9;

    for(int i = 0; i <= max; i++)
    {
        int squared = i * i;
        printf("Current value of I is %i and I*I is %i\n", i,squared);
    }

    return 0;
}