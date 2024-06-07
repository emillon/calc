%token Eof
%token<int> Int;
%token<float> Float;
%token<string> Ident;
%token Plus
%start<Ast.exp> main;

%left Plus

%{ open Ast %}

%%

main: expr Eof { $1 }

expr:
| Int { Int $1 }
| Float { Float $1 }
| Ident { Ident $1 }
| expr Plus expr { Add ($1, $3) } 

%%
