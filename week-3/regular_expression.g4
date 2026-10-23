grammar regular_expression;

expr:
	'E'
	| 'e'
	| LETTER
	| expr '|' expr
	| '(' expr ')'
	| expr '*'
	| expr expr;

LETTER: [ab];