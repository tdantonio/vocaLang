#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const TAM_FILAS = 20;
const TAM_COLUM = 17;

// dudas: como implementar la tabla?
//        como se vinculan el scanner/parser con la tabla de simbolos? 

int TS[20][17];

void armarTabla(){
    for(int i=0; i<=18; i++){
        TS[i][0] = i;
    }

    TS[1][1] = 1;
    TS[1][2] = 1;
    TS[1][3] = 1;

    // no estamos seguros todavia, falta implementar
}

int buscarCaracter(char c){
    int indice = -1;
    for(int i=1; i+1<TAM_COLUM; i++){
        if(TS[0][i] == c){
            indice=i;
        }
    }
    return indice;
}

bool esFinal(estado){
    if(estado != 0  && estado != 19){
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
        estadoActual = TS[estadoActual][indice];
        i++;
    }

    if(!esFinal(estadoActual)){
        return -1;
    }

    return 1;
}