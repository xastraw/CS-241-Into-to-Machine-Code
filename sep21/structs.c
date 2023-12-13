#include<stdio.h>
#include<math.h>

void flush(void)
{
    char TEMPCHARBUF;
    while((TEMPCHARBUF=getchar()) != EOF && TEMPCHARBUF != '\n');
}

struct point 
{
    double x,y;
};

struct triangle
{
    struct point ptA, ptB, ptC;
};

double distance(struct point ptA, struct point ptB)
{
    double temp1 = ptA.x - ptB.x;
    double temp2 = ptA.y - ptB.y;
    temp1 = temp1*temp1;
    temp2 = temp2*temp2;
    return sqrt(temp1+temp2);
}

double area(struct triangle tri)
{
    double c = distance(tri.ptA, tri.ptB);
    double b = distance(tri.ptA, tri.ptC);
    double a = distance(tri.ptB, tri.ptC);
    double s = (a+b+c)/2;
    return sqrt(s*(s-a)*(s-b)*(s-c));
}


int main(void)
{
    struct point pt1 = {3.14, 5.7};
    struct point pt2 = {7, 5};
    struct point pt3 = {-1, 0};
    struct triangle mytri = {pt1, pt2, pt3};

    double myarea = area(mytri);
    printf("The area of my triange is %f square units\n", myarea);

    struct triangle *ptr1 = &mytri;
    printf("The triangle is located at: %p", ptr1);

    return 0;
}