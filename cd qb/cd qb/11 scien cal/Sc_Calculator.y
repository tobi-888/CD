%{
#include<stdio.h>
double memvar;
%}
%union
{
double dval;
}
%token<dval>NUMBER
%token<dval>MEM
%token LOG SINE nLOG COS TAN
%left '-' '+'
%left '*' '/'
%right '^'
%left LOG SINE nLOG COS TAN
%nonassoc UMINUS
%type<dval>expression
%%
start:statement'\n'
|start statement'\n'
;

statement:MEM'='expression {memvar=$3;}
| expression{printf("Answer=%g\n",$1);}
;
expression:expression'+'expression {$$=$1+$3;}
| expression '-' expression {$$=$1-$3;}
| expression '*' expression {$$=$1*$3;}
| expression '/' expression
{ if($3==0)
{
yyerror("Error! divide by zero");
}
else
{
$$=$1/$3;
}
}
|expression'^'expression {$$=pow($1,$3);}
;
expression:'-'expression %prec UMINUS{$$=-$2;}
|'('expression')'{$$=$2;}
|LOG expression {$$=log($2)/log(10);}
|nLOG expression {$$=log($2);}
|SINE expression {$$=sin($2*3.14/180);}
|COS expression {$$=cos($2*3.14/180);}
|TAN expression {$$=tan($2*3.14/180);}
|NUMBER {$$=$1;}
|MEM {$$=memvar;}
;
%%

yywrap() {} 

main()
{
printf("Enter the expression: ");
yyparse();
}
int yyerror(char *error)
{
printf("%s\n",error);
}
