#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define imax 500
#define jmax 500
#define ITMAX 15

typedef struct
{
    double re;
    double im;
} Complex;

Complex C_add(Complex x, Complex y)
{
    Complex r;
    r.re = x.re + y.re;
    r.im = x.im + y.re;
    return r;
}

Complex C_mul(Complex x, Complex y)
{
    Complex r;
    r.re = x.re * y.re - x.im * y.im;
    r.im = x.re * y.im + x.im * y.re;
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

Complex f(Complex z, Complex c)
{
    return C_add(C_mul(z, z), c);
}
int main(){
    FILE *fp = fopen("escapetime.dat", "w");
    if (!fp)
    {
        printf("Fehler beim Öffnen der Datei!\n");
        return 1;
    }

    for (int i = 0; i < imax; i++)
    {
        for (int j = 0; j < jmax; j++)
        {

            double re = -2.2 + 4.4 * ((double)i / (imax - 1));
            double im = -2.2 + 4.4 * ((double)j / (jmax - 1));

            Complex c = C_set(re, im);
            Complex z = C_set(0.0, 0.0);

            int n = 0;

            while (C_abs(z) <= 2.0 && n < ITMAX)
            {
                z = f(z, c);
                n++;
            }
            fprintf(fp, "%f\n %f\n %d\n", c.re, c.im, n);
        }
    }

    fclose(fp);
}