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
    printf("Error sintactico")
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
        REPETIR CORCHIZQ CADENA PUNTOYCOMA CONSTANTE CORCHDER PUNTO
    |   MOSTRAME CORCHIZQ CADENA CORCHDER PUNTO
    |   expresion
;

expresion:
        NUMERO ID OPERADOR CONSTANTE PUNTO
    |   PALABRA ID OPERADOR CADENA PUNTO
;

%%

int main(int argc, char *argv[]){
    if(argc == 2){
        yyin = fopen(argv[1], "r");
        yyout = fopen("salida.txt", "w");
        yyparse();

        fclose(yyin);
        fclose(yyout);
    }else
    {
        return 1;
    }
    
    return 0;
}
