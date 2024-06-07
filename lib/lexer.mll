let space = [' ']+

let digit = ['0'-'9']

let letter = ['a'-'z']

let ident = letter (letter | digit)+

rule token = parse
    | eof { Parser.Eof }
    | space { token lexbuf }
    | '\n' { Parser.Eof }
    | '+' { Parser.Plus }
    | '*' { Parser.Star }
    | '(' { Parser.Lpar }
    | ')' { Parser.Rpar }
    | '/' { Parser.Slash }
    | digit+ { Parser.Int (int_of_string (Lexing.lexeme lexbuf)) }
    | digit+ '.' digit+ { Parser.Float (float_of_string (Lexing.lexeme lexbuf)) }
    | ident { Parser.Ident (Lexing.lexeme lexbuf) }
