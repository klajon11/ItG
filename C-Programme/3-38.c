#include<stdio.h>
#include<stdlib.h>
#include<math.h>

void main(){
    int a=7;
    int* b;
    double c=3.14;
    double* d;
    b = malloc(sizeof(int)); d = malloc(sizeof(double));
//a = *b; c = *d;
//*b = a; *d = c;
//b = &a; d = &c;
//*b=a; *d=c; (*b)++; (*d)++;
//*b=a; *d=c; ++*b; ++*d;
//b = &a+1; d = &c+1;
//b=&a; d=&c; *b++; *d++;
//*b = *&a+1; *d = *&c+1;
//*b = a+1; *d = c+1;
//*b = a++; *d = c++;
    printf(" Adresse | Inhalt der Adresse | Inhalt des Ziels\n");
    printf("----------------------+--------------------+-----------------\n");
    printf("a: ADD=%14p | VAL=%14i |\n", &a, a);
    printf("b: ADD=%14p | VAL=%14p | TARVAL=%8i\n", &b, b, *b);
    printf("c: ADD=%14p | VAL=%14f |\n", &c, c);
    printf("d: ADD=%14p | VAL=%14p | TARVAL=%8f\n", &d, d, *d);
    //return 0;
}