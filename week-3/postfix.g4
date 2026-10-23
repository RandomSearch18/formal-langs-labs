grammar postfix;

expr: INT | expr WS expr WS OPERATOR;

OPERATOR: [-/+*];
INT: [+-]* [0-9]+;

WS: [ \n\t\r];