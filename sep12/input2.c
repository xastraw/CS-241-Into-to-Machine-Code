#include<stdio.h>

int main(void){


    char instring1[] = "%i";
    int myint = 0;

    printf("Please type an integer: \n");
    scanf("%i", &myint);

    printf("Your integer is: %i and is located at %p\n", myint, &myint);
    printf("%li", myint);


    return 0;
}