#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define imax = 20

typedef struct
{
    double re;
    double im;
} Complex;

Complex C_sub(Complex x, Complex y)
{
    Complex r;
    r.re = x.re - y.re;
    r.im = x.im - y.im;
    return r;
}

Complex C_mul(Complex x, Complex y)
{
    Complex r;
    r.re = x.re * y.re - x.im * y.im;
    r.im = x.re * y.im + x.im * y.re;
    return r;
}

Complex C_Kerwert(Complex x)
{
    Complex r;
    r.re = x.re /((x.re)*(x.re) + (x.im)*(x.im));
    r.im = - x.im /((x.re)*(x.re) + (x.im)*(x.im));
    return r;
}


double C_abs(Complex x)
{
    return sqrt(x.re * x.re + x.im * x.im);
}

Complex C_set(double re, double im)
{
    Complex r;
    r.re = re;
    r.im = im;
    return r;
}

Complex f5(Complex z, int n)
{
    return (C_mul(C_mul(C_mul(C_mul(z, z),z),z),z));
}
Complex f5_abl(Complex z, int n)
{
    return (5 * C_mul(C_mul(C_mul(z, z), z), z)-1);
}


int main(){
    int n=1;
    printf("Bitte geben sie für  f=z^n -1 ein Wert für n an(5,6 oder 20):");
    scanf("%d", &n);
    if (n==5);
        for (int i = 0; i < imax; i++)
            z = C_sub(z,C_mul(f5,C_Kerwert(f5_abl)))

}