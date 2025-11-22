#include <math.h>
#include <stdlib.h>
#include <stdio.h>

int rows , cols ,i , j ;

int matrixausgabe ( int r , int c , int A[r][c]) {
    for ( i=0; i<r; i++) {
        for (j=0; j<c; j++) {
        printf ("%4i", A[i][j]) ;
    }
    printf ("\n");
    }
    printf ("\n");
}

int vektorausgabe ( int c , int x[c]) {
    for ( j=0; j<c; j++){
        printf ("%4i\n", x[j]) ;
        }
    printf ("\n") ;
    }

int matrixvektormult ( int r , int c , int A[r][c], int x[c] , int y[r]) {
    for (i=0; i<r; i++) {
        y[i]=0;
        for (j=0; j<c; j++){
            y[i]+= A[i][j]* x[j];
         }
    }
}

int main () {
    printf ( " Anzahl Zeilen und Spalten ? " ) ;
    scanf ("%d %d" , &rows , &cols ) ;
    int  M[rows][cols], v[cols], w[rows];
    for (i=0; i<rows; i++){
        for (j=0; j<cols; j++) {
            printf ( "M[%d,%d] = ", i+1, j+1);
            scanf ("%d",  &M[i][j]);
        }
    }   
     for (j=0; j<cols; j++){
        printf ("v[%d] = ", j+1) ;
        scanf ("%d", &v[j]) ;
    }
    matrixausgabe (rows, cols, M) ;
    vektorausgabe (cols, v) ;
    matrixvektormult (rows, cols, M, v, w ) ;
    vektorausgabe (rows, w ) ;
}