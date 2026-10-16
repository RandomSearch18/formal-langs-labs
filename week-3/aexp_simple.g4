grammar aexp_simple;

aexp:
	NUM
	| '(' aexp ')'
	| aexp '+' aexp
	| aexp '*' aexp
	| aexp '-' aexp;

NUM: INT | FLOAT;
INT: [0-9]+;
FLOAT: [0-9]+ '.' [0-9]+;
WS: [ \n\t\r] -> skip;