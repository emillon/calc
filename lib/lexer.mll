let space = [' ']+

let digit = ['0'-'9']

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
    | ['a'-'z']+ { Parser.Ident (Lexing.lexeme lexbuf) }
