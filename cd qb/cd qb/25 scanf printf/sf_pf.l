%{
#include<stdio.h>
int sf = 0, pf = 0;
%}

%%

"scanf"	{ sf++; fprintf(yyout,"readf");}           // replace scanf  with readf
"printf" { pf++; fprintf(yyout,"writef");}            // replace printf  with writef


%%

yywrap() {}

int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("sf_pf_I.txt","r");
    yyout = fopen("sf_pf_O.txt","w");
    yylex();
    fprintf(yyout,"Number of scanf is :- %d\n",sf);
    fprintf(yyout,"Number of printf is :- %d\n",pf);
    
}