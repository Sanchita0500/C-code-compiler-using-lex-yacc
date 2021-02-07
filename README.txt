
Compile lex file : lex compiler.l
Generate y.tab.h and compile yacc files : yacc -d compiler.y
Compile generated C files and create executable : gcc lex.yy.c y.tab.c -o Compiler
Run the code to see output : ./Compiler < input.c
