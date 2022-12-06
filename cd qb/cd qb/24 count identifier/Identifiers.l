%{
#include<stdio.h>
int i = 1;
%}

letter[a-zA-Z]
digit[0-9]

%%

{letter}|({letter}|{digit})* {i++;}


%%

yywrap() {}

int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("Identifiers_I.txt","r");
    yyout = fopen("Identifiers_O.txt","w");
    yylex();
    fprintf(yyout,"Number of identifiers is :- %d\n",i);
    
}