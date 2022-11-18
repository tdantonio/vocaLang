%{
#include <stdlib.h>
#include "parser.tab.h"
%}

digito                  [0-9]
vocal                   [aeiou]
letra                   [aeiou_]
constante               ({digito})+
identificador           {letra}({letra}|{digito})*
cadena                  {vocal}{letra}*

%%

"="                     {return OPERADOR;}
"."                     {return PUNTO;}
";"                     {return PUNTOYCOMA;}
"["                     {return CORCHIZQ;}
"]"                     {return CORCHDER;}
"a_a_a"                 {return PALABRA;}
"e_e_i"                 {return REPETIR;}
"u_e_o"                 {return NUMERO;}
"o_a_e"                 {return MOSTRAME;}
"i_i_i_o"               {return INICIO;}
"i_a"                   {return FINAL;}
{cadena}                {return CADENA;}
{identificador}         {return ID;}
{constante}             {return CONSTANTE;}
.                       {printf("Error lexico\n");}

%%
/*
int yyerror(void){
    printf("Error lexico.");
}

int main (int argc, char** argv){
    yylex();
    fclose(yylex);
    return 0;
}
*/