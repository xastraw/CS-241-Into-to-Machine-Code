#include <stdio.h>

/*
Python Variables
x = 5
y = 2.3
z = x + y
compile using: gcc aug29.c -o aug29
compile to asm using: gcc aug29.c -S -o aug29.s
*/

int main(void)
{
    int x = 5;
    float y = 2.3;
    float z = x + y;
    printf("The sum of of %i and %f is %f\n",x,y,z);

    long int spam = 42;
    double eggs = 7.4;
    long int foo = spam / x;
    printf("The quotient of %li and %i is %i\n", spam, x, foo);
    long int bar = spam % x;
    printf("And the remainder is %li\n", bar);


    /*
    python for loop:
    for i in range(0,10):
        print("Hello!")
    */

   for(int i = 0; i < 10; i++)
   {
        printf("%i\n", i);
   }
   int bread = 10;
    while (bread > 0)
    {
        printf("Making sandwich!\n");
        bread--;
    }



    return 0;
}