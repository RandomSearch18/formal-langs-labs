grammar min_max;

expr: INT | 'min(' expr ',' expr ')' | 'max(' expr ',' expr ')';

INT: [+-]* [0-9]+;

WS: [ \n\t\r] -> skip;