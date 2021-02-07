
A basic compiler which defines grammar for C code using lex/yacc
Multi-level symbol table generated as output of the parser


Compile lex file : lex compiler.l
Generate y.tab.h and compile yacc files : yacc -d compiler.y
Compile generated C files and create executable : gcc lex.yy.c y.tab.c -o Compiler
Run the code to see output : ./Compiler < input.c
