%{
#include<stdio.h>
int pos = 0, neg = 0, pos_f = 0, neg_f = 0;
%}

DIGIT[0-9]

%%

\+?{DIGIT}+             {pos++;}
-{DIGIT}+               {neg++;}
  
\+?{DIGIT}*\.{DIGIT}+   {pos_f++;}
-{DIGIT}*\.{DIGIT}+     {neg_f++;}

%%

yywrap() {}

int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("pos_neg_I.txt","r");
    yyout = fopen("pos_neg_O.txt","w");
    yylex();
    fprintf(yyout,"Number of Positive nos is :- %d\n",pos);
    fprintf(yyout,"Number of Negative nos is :- %d\n",neg);
    fprintf(yyout,"Number of Positive fraction nos is :- %d\n",pos_f);
    fprintf(yyout,"Number of Negative fraction nos is :- %d\n",neg_f);


}