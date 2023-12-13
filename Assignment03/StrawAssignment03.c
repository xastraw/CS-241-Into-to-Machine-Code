#include<stdio.h>


int fibrec(int n)
{
    //recursive
    if (n < 3){
        return 1;
    }
    else{
        return fibrec(n-1) + fibrec(n-2);
    }    
}


int fibiter(int n)
{
    int firstnum = 1;
    int secnum = 1;
    //iteratively
    if (n < 3){
        return 1;
    }
    else{
        for (int i = 3; i <= n; i++){
            int fib = firstnum + secnum;
            secnum = firstnum;
            firstnum = fib;
            printf("%d\n", fib);
        }
    }
}

int main(void)
{
    int num = 9;
    int num2 = 9;
    printf("Here is the Fibonacci sequence using iteration: \n");
    fibiter(num);
    printf("Here is the Fibonacci sequence using recursion: \n");
    printf("%i\n", fibrec(num2));

    return 0;
}