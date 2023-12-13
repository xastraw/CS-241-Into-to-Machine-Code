#include <stdio.h>



int stringToInt(char *input)
{
    int result = 0;
    char isNegative = 'F';
    int i = 0;

    if(input[0] == '-')
    {
        isNegative = 'T';
        i=1;
    }

    while (input[i] != '\0')
    {
        result = result * 10 + (input[i] - '0');
        i++;
    }

    if(isNegative == 'T')
    {
        result = -result;
    }

    return result;
}



int main(void)
{
    char mystr[30];

    printf("Please type an integer.\n");
    scanf("%s", mystr);

    int convertedInt = stringToInt(mystr);

    printf("String: %s\n", mystr);
    printf("Converted Value: %d\n", convertedInt);

    return 0;
}