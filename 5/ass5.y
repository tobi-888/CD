%{
#include <stdio.h>
void yyerror(char *);
int yylex();
%}

%token IF ELSE ELSEIF AND OR NTEQ EQ LT LTEQ GT GTEQ ID NUM NOT OP

%%

elcond : ifcondition elsec | ifcondition | ifcondition elifc | ifcondition elifc elifscond ;

elifscond : elsec | elifc elifscond;


ifcondition: IF '(' cond ')' '{' stmt '}'  {printf("parsing successful of ifcondition");} 
;
ifcondition: IF '(' cond  '{' stmt '}'  {printf("parsing unsuccessful closing bracket absent ");} 
;
elifc: ELSEIF '(' cond ')' '{' stmt '}' {printf("\nparsing successful of elseif");} 
;
elsec: ELSE '{' stmt '}' {printf("\nparsing successful of else");}
;

//if(i<40){i=i+1;i=3;}else if(i<2){a=3;} else if(i<4){s = s+1;} else {b=3;}
//if(i<40){i=i+1;i=3;}else if{a=3;}

cond	: scond  | scond logop scond ;

stmt :  A | A stmt;

scond	: nid | nid relop nid ;

nid	: ID | NUM ;

A : ID '=' nid OP nid ';'| ID '=' nid  ';'; 

logop	: AND | OR | NOT  ;

relop	: NTEQ | EQ | LT | LTEQ | GT | GTEQ ;

%%

int yywrap()
{
return 1;
}

void yyerror(char *s)
{
	printf("\nparsing err ");
}

int main()
{
	yyparse();
	return 0;
	
}

