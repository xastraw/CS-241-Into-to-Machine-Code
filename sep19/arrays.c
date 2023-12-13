#include <stdio.h>

int main(void)
{
    char mystring[] = "Hello, world!\n";
    int myarray[] = {1, 2, 3, 4};

    printf("%c\n", mystring[0]);
    printf("%i\n", myarray[0]);

    printf("The string is locate at: %p\n", &mystring);
    printf("The array is locate at: %p\n", &myarray);


    char* myptr1 = &mystring;
    int* myptr2 = &myarray;

    printf("The thing pointed to by myptr1 is: %c\n", *(myptr1+1));
    printf("myptr1 is: %p\n", myptr1+1);

    printf("The thing pointed to by myptr2 is: %i\n", *(myptr2+1));
    printf("myptr2 is: %p\n", myptr2+1);


    return 0;
}