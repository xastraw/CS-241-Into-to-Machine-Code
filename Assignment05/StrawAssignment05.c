#include <stdio.h>


int caesar(char *phrase, int shift)
{   
    char c;
    int i;

    for(i = 0; phrase[i] != '\0'; i++)
    {
        c = phrase[i];

        if(c >= 'A' && c <= 'Z') //capital letters
        {
            c = ((c - 'A') + shift) % 26 + 'A';
            phrase[i] = c;
        }
        else if(c >= 'a' && c <= 'z') //lowercase letters
        {
            c = ((c - 'a') + shift) % 26 + 'a';
            phrase[i] = c;
        }
    }

    return *phrase;
}



int main(void)
{
    int key;
    char mystr[31];

    printf("What is your phrase?\n");
    scanf("%s", mystr);
    
    printf("What is your key?\n");
    scanf("%d", &key);


    printf("Your original phrase is: %s\n", mystr);
    caesar(mystr, key);
    printf("Your new cipher phrase is: %s\n", mystr);


    return 0;
}