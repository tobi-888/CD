%{
#include<stdio.h>
int v = 0, c = 0;
%}

%%

[aeiouAEIOU] {v++;}
[a-zA-Z] {c++;}

%%

yywrap() {}

int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("V_C_I.txt","r");
    yyout = fopen("V_C_O.txt","w");
    yylex();
    fprintf(yyout,"Number of vowels is :- %d\n",v);
    fprintf(yyout,"Number of consonants is :- %d\n",c);
    
}