#include <stdio.h>
#include <stdlib.h>

extern int myadd(int a, int b);

// to compile:
//gcc dontbeanidiot.c myadd.o -o dontbeanidiot
//  ./dontbeanidiot

int main(void)
{
    int a = 2;
    int b = 3;
    int ans;
    ans = myadd(a,b);
    printf("The sum is: %i\n", ans);
    return 0;
}