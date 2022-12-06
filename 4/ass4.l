%{
#include "y.tab.h"
#include <stdio.h>
#include <math.h>
%}
%%
([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {yylval.dval=atof(yytext);return
NUMBER;}
log |
LOG {return LOG;}
sin |
SIN {return SINE;}
cos |
COS {return COS;}
tan |
TAN {return TAN;}
sqrt { return SQRT; }
var { return VAR;}
[\t];
\$ return 0;
\n|. return yytext[0];
%%