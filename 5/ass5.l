%{
#include "y.tab.h"
void yyerror(char *);
%}

%%
"if" {return IF;}
"else" {return ELSE;}
"else if" {return ELSEIF;}
"+"|"-"|"*"|"/"|"%"|"^"  {return OP;}
"&&" {return AND;}
"!"  {return NOT;} 
"||" {return OR;}
"!=" {return NTEQ;}
"==" {return EQ;}
"<"  {return LT;}
"<=" {return LTEQ;}
">"  {return GT;}
">=" {return GTEQ;}

[=,{}();] {return *yytext;}
[ \t\n]+ ;
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
[0-9]+ {return NUM;}
. {printf("\n\nlex err");}

%%

