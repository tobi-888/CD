%{

#include <stdio.h>

int lno = 1;
%}


%%
		printf("Line no\tLexeme\tToken\n");
int|float|double|char|if|else|while|do|return|break|continue|void|switch|for	  { printf("\n%d\t%s\tKeyword", lno, yytext);}

[$\n] 	{lno++; printf("\n");}

[a-z|A-Z][a-z|A-Z|0-9]*		   { 	printf("\n%d\t%s\tIdentifier", lno, yytext); }

[\}\{\(\)\[\]\,\"\;/]	          {   printf("\n%d\t%s\tDelimiter", lno, yytext); }

[\/\*\-\+\++\%\!=\=\==\>\<\--\<=\>=]  { 	printf("\n%d\t%s\tOperator", lno, yytext); }

#.*					   {   printf("\n%d\t%s\tPreprocessor Directive", lno, yytext); }

[0-9]+					   { 	printf("\n%d\t%s\tConstant", lno, yytext); }

%%	
int yywrap(void)
{ 
   return 0;

}
int main(int argc, char *argv[])
{
   yyin = fopen("Ass2.txt", "r");
   yylex();
   return 0;
}