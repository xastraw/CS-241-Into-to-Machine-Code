#include<stdio.h>
#include<math.h>


struct point{
    double x,y,z;
};


struct triangle{
    struct point ptA, ptB, ptC;
};

struct tetrahedron{
    struct point vert1, vert2, vert3, vert4;
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

double tetraSurfaceArea(struct tetrahedron tetra){
    //sqrt(3)*all area
    struct triangle face1 = {tetra.vert1, tetra.vert2, tetra.vert3};
    struct triangle face2 = {tetra.vert1, tetra.vert2, tetra.vert4};
    struct triangle face3 = {tetra.vert1, tetra.vert3, tetra.vert4};
    struct triangle face4 = {tetra.vert2, tetra.vert3, tetra.vert4};
    
    double area1 = area(face1);
    double area2 = area(face2);
    double area3 = area(face3);
    double area4 = area(face4);

    double totalArea = area1 + area2 + area3 + area4;
    return sqrt(3)*totalArea;
}


int main(void)
{
    struct point pt1 = {3.14, 5.7};
    struct point pt2 = {7, 5};
    struct point pt3 = {-1, 0};
    struct point pt4 = {-5, 4};

    struct tetrahedron tetrahedron = {pt1, pt2, pt3, pt4};

    double tetraSA = tetraSurfaceArea(tetrahedron);


    printf("The surface area of the tetrahedron is: %f\n", tetraSA);



    return 0;
}