%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<ctype.h>
	#include "y.tab.h"
	void yyerror(char *s);
	int yylex();
	int symbols[52];
	char* yytext;
	int symbolVal(char symbol);
	void updateSymbolVal(char symbol,int val);
%}

%token BUILTIN ID OPEN_SQ CLOSE_SQ EQ NEW SC COMMA DIGIT
%token MAIN LOOP OPEN_C CLOSE_C OPEN CLOSE SLASH COMMENT RETURN

%%
//grammar
start : BUILTIN varlist SC start
	| BUILTIN OPEN_SQ CLOSE_SQ ID EQ NEW BUILTIN OPEN_SQ DIGIT CLOSE_SQ SC start
	| MAIN OPEN_C CLOSE_C OPEN start
	| BUILTIN varlist SC SLASH SLASH COMMENT start
	| LOOP OPEN_C CLOSE_C OPEN start
	| CLOSE start
	| MAIN OPEN start
	| RETURN SC CLOSE //end of the program so start is not called again from here 

varlist : varlist COMMA ID | ID;
%%

int yywrap()
{
	return 1;
}

int main(void)
{

	printf("SYMBOL TABLE\n");
	printf("---------------------------------\n");
	printf("LEVEL\t|DATATYPE\t|VARIABLE\t\n");
	printf("---------------------------------\n");
	yyparse();
	printf("\n---------------------------------\n");
	return 0;
}
void yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
}
