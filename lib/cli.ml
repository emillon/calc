type value = VInt of int | VFloat of float

let value_to_string = function
  | VInt n -> string_of_int n
  | VFloat f -> Printf.sprintf "%.6g" f

let rec eval = function
  | Ast.Int n -> VInt n
  | Float f -> VFloat f
  | Ident "pi" -> VFloat (2. *. Stdlib.acos 0.)
  | Ident _ -> failwith "unknown ident"
  | Add (a, b) -> (
      match (eval a, eval b) with
      | VInt na, VInt nb -> VInt (na + nb)
      | VFloat fa, VFloat fb -> VFloat (fa +. fb)
      | VInt na, VFloat fb -> VFloat (float na +. fb)
      | VFloat fa, VInt nb -> VFloat (fa +. float nb))

let info = Cmdliner.Cmd.info "calc"

let eval_lb lb =
  try
    let expr = Parser.main Lexer.token lb in
    let v = eval expr in
    Printf.printf "%s\n" (value_to_string v)
  with Parser.Error ->
    Printf.printf "parse error near character %d" lb.lex_curr_pos

let repl () =
  while true do
    Printf.printf ">> %!";
    let lb = Lexing.from_channel Stdlib.stdin in
    eval_lb lb
  done

let term =
  let open Cmdliner.Term.Syntax in
  let+ expr_opt =
    let open Cmdliner.Arg in
    value & opt (some string) None & info [ "e" ]
  in
  match expr_opt with
  | Some s -> eval_lb (Lexing.from_string s)
  | None -> repl ()

let cmd = Cmdliner.Cmd.v info term
let main () = Cmdliner.Cmd.eval cmd |> Stdlib.exit
