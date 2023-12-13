#include<stdio.h>



int myStringLen(char inputstring[]){
    int i = 0;
    while(inputstring[i] != '\0'){
        i++;
    }
    return i;
}


int main(void){

    char instring[32];
    char outstring[] = "Please type a string: \n";
    
    printf("%s", outstring);
    scanf("%31s", instring);

    int ans = myStringLen(instring);
    printf("The length of your string is: %i\n", ans);
    
    return 0;
}