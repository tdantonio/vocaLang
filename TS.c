#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const tam_filas = 20;
const tam_colum = 17;

// dudas: como implementar la tabla?
//        como se vinculan el scanner/parser con la tabla de simbolos? 

int ts[20][17];

void armarTabla(){
    for(int i=1; i<=19; i++){
        ts[i][0] = i;
    }

    ts[1][1] = 1;
    ts[1][2] = 1;
    ts[1][3] = 1;
    // ...
    
    // no estamos seguros todavia, falta implementar
}

void cargarEnTabla(int fila, int columna, int estado){
    ts[fila][columna] = estado
}

int buscarCaracter(char c){
    int indice = -1;
    for(int i=1; i+1<tam_colum; i++){
        if(ts[0][i] == c){
            indice=i;
        }
    }
    return indice;
}

bool esFinal(estado){
    if(estado != 0  || estado != 99){
        return true;
    }
    return false;
}

int reconocerToken(char* s){
    int i=0;
    int estadoActual = 0;

    while(i < strlen(s)){
        char caracter = s[i];
        if(buscarCaracter(caracter) == -1){
            return -1;
        }
        int indice = buscarCaracter(caracter);
        estadoActual = ts[estadoActual][indice];
        i++;
    }

    if(!esFinal(estadoActual)){
        return -1;
    }

    return 1;
}