#include<stdio.h>
#include<stdlib.h>

int main(void)
{
    int* pp = malloc(10000000000);

    if (pp == NULL)
    {
        puts("Null pointer! Oh noes! \n");
    }
    else
    {
        puts("Malloc succeeded!\n");
    }

    free(pp);

    return 0;
}