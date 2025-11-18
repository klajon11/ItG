#include <math.h>
#include <stdlib.h>
#include <stdio.h>

int main()
{
    int N = 50;
    int primes[N];
    int i, j;
    primes[0] = 0;
    primes[1] = 1;

    for (i = 1; i < N; i++)
        primes[i] = 1;

    for (i = 2; i < N / 2; i++)
    {
        for (j = 2 * i; j < N; j += i)
        {
            primes[j] = 0;
        }
    }
    for (i = 1; i < N; i++)
        if (primes[i] == 1)
            printf("%8d\n", i);

    return 0;
}
