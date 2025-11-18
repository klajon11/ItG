#include <math.h>
#include <stdlib.h>
#include <stdio.h>

/* Matrix-Vektor-Multiplikation */
int art, rows, cols, i, j, k, cols1, rows1, cols2, rows2;

int matrixausgabe(int r, int c, int A[r][c])
{
    for (i = 0; i < r; i++)
    {
        for (j = 0; j < c; j++)
            printf("%4i ", A[i][j]);
        printf("\n");
    }
    printf("\n");
}

int vektorausgabe(int c, int x[c])
{
    for (j = 0; j < c; j++)
        printf("%4i\n", x[j]);
    printf("\n");
}

int matrixmult(int r, int c, int A[r][c], int x[c], int y[r])
{
    for (i = 0; i < r; i++)
    {
        y[i] = 0;
        for (j = 0; j < c; j++)
            y[i] += A[i][j] * x[j];
    }
}

int skalarpr(int r, int v[r], int w[r], int z)
{
    for (i = 0; i < r; i++){
        z += v[i] * w[i];
    }
    printf("%d\n", z);
}

int matrixpr(int r1, int c1, int c2, int M1[r1][c1], int M2[c1][c2], int M3[r1][c2]){
    for (i = 0; i < r1; i++)
    {   
        for (j = 0; j < c2; j++)
            M3[i][j] = 0;
    }
    for (i = 0; i < r1; i++)
    {   
        for (j = 0; j < c2; j++)
            for (k = 0; k < c1; k++)
            M3[i][j] += M1[i][k] * M2[k][j];
    }

    
}

int main()
{
    printf("Matrix-Vektor (1), Skalarprodukt (2), Matrix-Matrix (3) ");
        scanf("%d", &art);
    if (art == 1)
    {
        printf("Anzahl Zeilen und Spalten? ");
        scanf("%d %d", &rows, &cols);
        int M[rows][cols], v[cols], w[rows];

        for (i = 0; i < rows; i++)
            for (j = 0; j < cols; j++)
            {
                printf("M[%d,%d] = ", i + 1, j + 1);
                scanf("%d", &M[i][j]);
            }
        for (j = 0; j < cols; j++)
        {
            printf("v[%d] = ", j + 1);
            scanf("%d", &v[j]);
        }
        matrixausgabe(rows, cols, M);
        vektorausgabe(cols, v);
        matrixmult(rows, cols, M, v, w);
        vektorausgabe(rows, w);
    }
    if (art == 2)
    {
        printf("Anzahl Zeilen? ");
        scanf("%d", &rows);
        int v[rows], w[rows], z;

        for (i = 0; i < rows; i++)
        {
            printf("v[%d] = ", i + 1);
            scanf("%d", &v[i]);
            }
         for (i = 0; i < rows; i++)
        {
            printf("w[%d] = ", i + 1);
            scanf("%d", &w[i]);
        } 
         vektorausgabe(rows, v);
        vektorausgabe(rows, w);
        skalarpr(rows, v, w, z);
        ; 

    }
    if (art == 3)
    {
        printf("Anzahl Zeilen und Spalten erste Matrix ");
        scanf("%d %d", &rows1, &cols1);
        int M1[rows1][cols1];
        printf("Anzahl Spalten zweite Matrix ");
        scanf("%d", &cols2);
        int M2[cols1][cols2];
        int M3[rows1][cols2];

        for (i = 0; i < rows1; i++)
            for (j = 0; j < cols1; j++)
            {
                printf("M1[%d,%d] = ", i + 1, j + 1);
                scanf("%d", &M1[i][j]);
            }
        for (i = 0; i < cols1; i++)
            for (j = 0; j < cols2; j++)
            {
                printf("M2[%d,%d] = ", i + 1, j + 1);
                scanf("%d", &M2[i][j]);
            }
        matrixausgabe(rows1, cols1, M1);
        matrixausgabe(cols1, cols2, M2);
        matrixpr(rows1, cols1, cols2, M1, M2, M3);
        matrixausgabe(rows1, cols2, M3);




    }
    else{
        printf("Gib bitte 1 2 oder 3 an!");
        main();
    }
}
