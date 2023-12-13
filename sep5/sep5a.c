// && is like Python and
// || is like Python or
// != is not equals, ! is not

#include<stdio.h>

int addnums(int num1, int num2)
{
    return num1 + num2;
}

extern int subnums(int num1, int num2);

int main(void)
{
    int ans = subnums(5, 3);
    printf("The difference of %i and %i is %i\n", 5, 3, ans);
    return 0;
}