grammar aexp_simple;

aexp:
	NUM
	| '(' aexp ')'
	| aexp '+' aexp
	| aexp '*' aexp
	| aexp '-' aexp
	| '-' aexp
	| '+' aexp;

NUM: INT | REAL;
INT: [0-9]+;
REAL: [0-9]+ '.' [0-9]+;
WS: [ \n\t\r] -> skip;