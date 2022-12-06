%{
    #include<stdio.h>
    int i = 0;
%}

%%


"/*"([^*]|\*+[^*/])*\*+*"/" {i++;}
"//"[a-zA-Z0-9 \t]+ {i++;}
"\n\n"
. ECHO;


%%

yywrap() {}



int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("Input1 comments.txt","r");
    yyout = fopen("Output1 comments.txt","w");
    yylex();
    {fprintf(yyout, "\n\nNumber of comments are :- %d", i);}
    
}