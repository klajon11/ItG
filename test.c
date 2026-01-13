
//Primzahlen

#include <stdio.h>

int main(){
    char primes[100];
    for (int i = 0; i <= 100; i++){
        primes[i] = 1; 
    }
    primes[0] = 0;
    primes[1] = 0;
    for (int i = 2; i <= 50; i++){
        for (int j = 2 * i; j <= 100; j = j + i){
            primes[j]= 0;
        }
    }
    for (int i = 0; i <= 100; i++){
        if (primes[i] == 1){
            printf("%d\n", i);
        }
    }
    return 0;
}

