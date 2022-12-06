%{
    #include<stdio.h>
    int i = 0;
%}

%%


[a-zA-Z0-9]* {i++;}


%%

yywrap() {}



int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("Input2 wordcount.txt","r");
    yyout = fopen("Output2 wordcount.txt","w");
    yylex();
    {fprintf(yyout, "Number of words are :- %d", i);}
    
}