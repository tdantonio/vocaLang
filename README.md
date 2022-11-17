# VocaLang

Introducción
El lenguaje que elegimos esta formado solo por vocales, números y caracteres de puntuación. Las
palabras que forman parte de este lenguaje surgen de tomar solo las vocales de las palabras normales y
separarlas con guiones bajos “_”.

El lenguaje está compuesto por las siguientes características:
• Tipos de dato: {u_e_o, a_a_a}
• Identificadores de longitud máxima de 10 caracteres.
• Los identificadores arrancan con una letra.
• Dos sentencias con convención de fin, apretura y cierre.
1) e_e_i [algo; cantidad].
2) o_a_e [algo].
• Palabras reservadas: {a_a_a, u_e_o, o_a_e, e_e_i, i_i_i_o, i_a}.
• Alfabeto = {a, e, i, o, u, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, _, [, ], ., =, ;}.

Diseño de categorías léxicas en BNF:
<identificador> ::= <letra><resto>
<constante> ::= <digito><constante> | <digito>
<cadena> ::= <vocal><demas>
<operador> ::= =
<caracterPuntuacion> ::= . | [ | ] | ;
<palabraReservada> ::= a_a_a | e_e_i | u_e_o | o_a_e | i_i_i_o | i_a
<resto>::= <letra><resto> | <digito><resto> | <digito> | <letra>
<demas>::= <letra><demas> | <letra>
<letra>::= <vocal> | _
<vocal> ::= a | e | i | o | u |
<digito> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
<simbolo>::= <letra> | <digito>

Diseño de categorías sintácticas en BNF:
<programa> ::= i_i_i_o [ <listaSentencias> ] i_a
<listaSentencias> ::= <sentencia> { <sentencia> }
<sentencia> ::= <e_e_i> | <o_a_e> | <expresion>
<e_e_i> ::= e_e_i <apertura> <cadena> ; <constante> <cierre> <fin>
<o_a_e> ::= o_a_e <apertura> <cadena> <cierre> <fin>
<expresion> ::= <u_e_o> | <a_a_a>
<u_e_o> ::= u_e_o <identificador> = <constante> <fin>
<a_a_a> ::= a_a_a <identificador> = <cadena> <fin>
<apertura> ::= [
<cierre> ::= ]
<fin> ::= .
