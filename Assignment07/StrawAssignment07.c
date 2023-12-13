#include <stdio.h>

void stringReverse(char *instr,char *outstr,int len)
{
    int i;

    for (i = 0; i < len; i++)
    {
        outstr[len - i - 1] = instr[i];
    }

    outstr[len] = '\0'; //have to add the null terminator back
    
    return outstr;
}


void intToString(int innum, char *outputstr)
{
    int i = 0;
    int isNegative = 0;
    if(innum < 0)
    {
        isNegative = 1;
        innum=-innum;
    }


    while (innum / 10 != 0)
    {
        outputstr[i] = (innum % 10) + 0x30;
        innum = innum / 10;
        i++;
    }

    outputstr[i] = innum + 0x30; //converts the last digit
    
    if(isNegative == 1){
        outputstr[i+1] = '-';
        outputstr[i+2] = '\0';
    }else{
        outputstr[i+1] = '\0'; //adds null terminator
    }




    return outputstr;
}


int main(void)
{
    
    int mynum;
    printf("Please enter an integer.\n");
    scanf("%d", &mynum);

    char convertedStr[32];
    intToString(mynum, convertedStr);
    
    //%10 add 0x30


    int strlen = 0;
    for (strlen = 0; convertedStr[strlen] != '\0'; strlen++); //gets the length of the string

    
    char finalstr[32];
    stringReverse(convertedStr, finalstr, strlen);
    printf("Your final converted string is: %s\n", finalstr);
    


    return 0;
}