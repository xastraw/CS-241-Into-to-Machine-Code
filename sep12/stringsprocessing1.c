#include<stdio.h>

int mystringlength(char instring[])
{    
    int i = 0;
    while(instring[i] != '\0') 
    {
        printf("%c\n", instring[i]);
        i++;
    }
    return 5;
}



int main(void){

    int ans = mystringlength("Wabash Always Fights!");

    return 0;
}