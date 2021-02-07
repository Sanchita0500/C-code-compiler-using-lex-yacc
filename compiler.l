%{
	#include<stdio.h>
	#include "y.tab.h"
	int yylex();
	int level=0;
	void yyerror(char *s);
%}

%%
int|float|char|double		{printf("\n%d\t|%s\t\t|",level,yytext); return BUILTIN;}
"main"				{return MAIN;}
"while"			{return LOOP;}
"return 0"			{return RETURN;}
new 				{return NEW;}
"("				{return OPEN_C;}
")"				{return CLOSE_C;}
"{"				{level++; return OPEN;}
"}"				{level--; return CLOSE;}
"["				{return OPEN_SQ;}
"]"				{return CLOSE_SQ;}
","				{return COMMA;}
";"				{return SC;}
"/"				{return SLASH;}
[a-zA-Z]+[a-zA-Z0-9]*		{printf("%s ",yytext); return ID;}
[a-zA-Z]+[a-zA-Z0-9 ]*[\n]	{return COMMENT;}
[0-9]+				{return DIGIT;}
[ \t\n]			;
.				{ECHO;yyerror("unexpected character\n");}
%%

