grammar aexp_simple;

aexp:
	num
	| '(' aexp ')'
	| aexp '+' aexp
	| aexp '*' aexp
	| aexp '-' aexp
	| '-' aexp
	| '+' aexp;

num: INT | INT '.' INT;
// real: INT '.' INT;

INT: [0-9]+;

WS: [ \n\t\r] -> skip;