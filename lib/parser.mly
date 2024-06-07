%token Eof
%token<int> Int;
%token<float> Float;
%token<string> Ident;
%token Plus
%token Star
%start<Ast.exp> main;

%left Plus
%left Star

%{ open Ast %}

%%

main: expr Eof { $1 }

expr:
| Int { Int $1 }
| Float { Float $1 }
| Ident { Ident $1 }
| expr Plus expr { Op (Add, $1, $3) }
| expr Star expr { Op (Mul, $1, $3) }

%%
