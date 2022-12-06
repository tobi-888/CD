%{
  #include <math.h>
  #include"ass4.tab.h"
  extern float yylavl;
%}

%%
[0-9]+|[0-9]*\.[0-9]+ {
                        yylval.p = atof(yytext);
                        return num;
                      }

sin {return SIN;}
cos {return COS;}
tan {return TAN;}
log {return LOG;}
sqrt {return SQRT;}

[\t] ;
\n return 0;
. return yytext[0];

%%
