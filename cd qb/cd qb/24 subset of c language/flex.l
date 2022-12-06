%{
    #include<stdio.h>
    int Line = 1;
%}

digit[0-9]
letter[A-Za-z_]
%%


{digit}+ {fprintf(yyout,"%d \t\t %s \t\t\t Integer \n",Line,yytext);}
"#"|"&" {fprintf(yyout,"%d \t\t %s \t\t\t Special Char \n",Line,yytext);}
"=" {fprintf(yyout,"%d \t\t %s \t\t\t Assignment operator\n",Line,yytext);}
"&&"|"||" {fprintf(yyout,"%d \t\t %s \t\t\t Logical operator\n",Line,yytext);}
"=="|"!="|"<"|">"|"<="|">=" {fprintf(yyout,"%d \t\t %s \t\t\t Relational operator\n",Line,yytext);}
"+"|"-"|"*"|"/"|"%" {fprintf(yyout,"%d \t\t %s \t\t\t Arithmetic operator\n",Line,yytext);}
"if"|"else"|"else if"|"for"|"while"|"int"|"char"|"return"|"float"|"double"|"do"|"void"|"break"|"long"|"case"  {fprintf(yyout,"%d \t\t %s \t\t\t Keyword\n",Line,yytext);}
{letter}({letter}|{digit})*  {fprintf(yyout,"%d \t\t %s \t\t\t Identifier\n",Line,yytext);}
["]([^"\\\n]|\\.|\\\n)*["] {fprintf(yyout,"%d \t\t %s \t\t String \n",Line,yytext);}
"("|")"|"{"|"}"|"["|"]"|","|";"|"."|"'" {fprintf(yyout,"%d \t\t %s \t\t\t Delimiter \n",Line,yytext);}
{digit}+{letter}+  {fprintf(yyout,"%d \t\t %s \t\t\t Invalid Lexeme\n",Line,yytext);}
"\n" {Line++;}
[[:space:]]|[[:space:]]+;

%%

yywrap() {}



int main()
{
    extern FILE *yyin, *yyout;
    yyin = fopen("Input.txt","r");
    yyout = fopen("Output.txt","w");
    fprintf(yyout, "Line\t\tLexemme\t\t\tToken\n");
    yylex();
    fprintf(yyout, "\n\n");
    fprintf(yyout, "Symbol Table:- ");
    
}