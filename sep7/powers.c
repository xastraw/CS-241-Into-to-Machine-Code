#include<stdio.h>
#include<math.h>

int main(void)
{
    int num = 5;
    int ans = pow(num,2);
    printf("%i squaed is %i\n", num, num);
    return 0;
}

//use  gcc powers.c -lm -o powers