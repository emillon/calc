let space = [' ']+

rule token = parse
    | eof { Parser.Eof }
    | space { token lexbuf }
    | '\n' { Parser.Eof }
    | '+' { Parser.Plus }
    | ['0'-'9']+ { Parser.Int (int_of_string (Lexing.lexeme lexbuf)) }
