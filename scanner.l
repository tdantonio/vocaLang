%{

#include <stdio.h>
#include <string.h>
#include "TS.c"

void yyerror(char *s);
int yylex();

char buffer[32];
int yylexerrs;
%}

digito                  [0-9]
vocal                   [aeiou]
letra                   {vocal} | _
constante               ({digito})+
identificador           {letra}({letra}|{digito})*
cadena                  {vocal}{letra}*

%%

"="                     return OPERADOR;
"."                     return PUNTO;
";"                     return PUNTOYCOMA;
"["                     return CORCHIZQ;
"]"                     return CORCHDER;
"a_a_a"                 return PALABRA;
"e_e_i"                 return REPETIR;
"u_e_o"                 return NUMERO;
"o_a_e"                 return MOSTRAME;
"i_i_i_o"               return INICIO;
"i_a"                   return FINAL;
{cadena}                return CADENA;
{identificador}         return ID;
{constante}             return CONSTANTE;
.                       {showError();}

%%

void showError(){
    printf("Error lexico.")
}

int yywrap(void) {
    return 1;
}