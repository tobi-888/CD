%{
double var;
%}
%union
{
double dval;
}
%token<dval>NUMBER
%token<dval>VAR
%token LOG SQRT SINE COS TAN
%left '+' '-'
%left '*' '/'
%left '^'
%left LOG SINE COS TAN
%nonassoc UMINUS
%type<dval>expression
%%

start:statement'\n'
|start statement '\n'
;

statement:VAR'='expression {var=$3;}
| expression{printf("Result = %g\n",$1);}
;

expression:expression'+'expression {$$=$1+$3;}
| expression '-' expression {$$=$1-$3;}
| expression '*' expression {$$=$1*$3;}
| expression '/' expression  { if($3==0) yyerror("divide by zero"); else $$=$1/$3; }
| expression '^' expression { $$=pow($1,$3); }
;

|'('expression')'{$$=$2;}
|LOG expression {$$=log($2)/log(10);}
|SINE expression {$$=sin($2*3.14159/180);}
|SQRT expression {$$=sqrt($2);}
|COS expression {$$=cos($2*3.14159/180);}
|TAN expression {$$=tan($2*3.14159/180);}
|NUMBER {$$=$1;}
|VAR {$$=var;}
;

%%
int main()
{
	yyparse();
	return 0;
}

int yyerror(char *error)
{
	printf("%s\n",error);
}