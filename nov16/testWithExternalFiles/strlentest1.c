#include<stdio.h>

extern long int stringlength(char mystring[]);

int main(void)
{

    char mystring[] = "Wabash Always Fights!";
    long int ans;

    ans = stringlength(mystring);

    printf("The length is %li\n", ans);

    return 0;
}