#include <stdio.h>

int main(void)
{
    int int1 = 1832;
    float float1 = 7.5;

    long int int2 = 1776;
    double float2 = -4.25;

    printf("int1 is loacated at: %p\n", &int1);
    printf("float1 is loacated at: %p\n", &float1);
    printf("int2 is loacated at: %p\n", &int2);
    printf("float2 is loacated at: %p\n", &float2);


    return 0;
}