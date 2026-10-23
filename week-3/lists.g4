grammar lists;

list: '[' list_item ']' | '[' ']';
list_item: expression | expression ',' list_item;
expression: INT | list;

INT: [0-9]+ | '0x' [0-9A-F]+;
WS: [ \n\t\r] -> skip;