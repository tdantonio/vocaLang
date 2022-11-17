%{
int yylex();

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yyerror(char *s);

extern int yynerrs;
extern int yylexerrs;
extern FILE* yyin;

%}

%token INICIO REPETIR MOSTRAME NUMERO PALABRA FINAL PUNTO PUNTOYCOMA OPERADOR CORCHDER CORCHIZQ
%token <id> ID
%token <cte> CONSTANTE
%token <string> CADENA

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

int main(int argc, char** argv){
    if(argc > 2){
        return EXIT_FAILURE;
    }
    
    return yyparse();
}
