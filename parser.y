%{
#include <stdio.h>
#include "parser.tab.h"

int yylex();
int yywrap(){
    return 1;
}

FILE* yyin;
FILE* yyout;

void yyerror(char* s){
    printf("Error Sintactico\n");
}

%}

%token INICIO REPETIR MOSTRAME NUMERO PALABRA FINAL PUNTO PUNTOYCOMA OPERADOR CORCHDER CORCHIZQ
%token ID
%token CONSTANTE
%token CADENA

%%
programa:
        INICIO listaSentencias FINAL
;

listaSentencias:
        sentencia
    |   listaSentencias sentencia
;

sentencia:
        REPETIR CORCHIZQ CADENA PUNTOYCOMA CONSTANTE CORCHDER PUNTO {printf("Sentencia Repetir Reconocida\n");}
    |   MOSTRAME CORCHIZQ CADENA CORCHDER PUNTO                     {printf("Sentencia Mostrame Reconocida\n");}
    |   expresion
;

expresion:
        NUMERO ID OPERADOR CONSTANTE PUNTO                          {printf("Asignacion Numero Reconocida\n");}
    |   PALABRA ID OPERADOR CADENA PUNTO                            {printf("Asignacion Palabra Reconocida\n");}
;

%%

int main(int argc, char *argv[]){
    if(argc == 2){
        yyin = fopen(argv[1], "r");
        yyout = fopen("salida.txt", "w");

        if(yyin == NULL){
            printf("No se pudo encontrar el archivo");
            return 0;
        }
        yyparse();

        fclose(yyin);
        fclose(yyout);
    }else
    {
        printf("Ingrese a.exe y el txt a probar");
        return 1;
    }
    
    //return 0;
}
