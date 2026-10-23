grammar ExprNames;

expr:
	INT								# Atom
	| '(' inner = expr ')'			# Brackets
	| left = expr '*' right = expr	# Mult
	| left = expr '+' right = expr	# Add
	| left = expr '-' right = expr	# Sub;

INT: [0-9]+;
WS: [ \n\t\r]+ -> skip;