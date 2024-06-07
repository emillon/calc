let info = Cmdliner.Cmd.info "calc"

let eval_lb ~debug_ast lb =
  try
    let expr = Parser.main Lexer.token lb in
    if debug_ast then Format.eprintf "[debug] %a\n" Ast.pp_expr expr;
    let v = Eval.eval expr in
    Printf.printf "%s\n" (Eval.value_to_string v)
  with Parser.Error ->
    Printf.printf "parse error near character %d" lb.lex_curr_pos

let repl ~debug_ast =
  while true do
    Printf.printf ">> %!";
    let lb = Lexing.from_channel Stdlib.stdin in
    eval_lb ~debug_ast lb
  done

let term =
  let open Cmdliner.Term.Syntax in
  let+ expr_opt =
    let open Cmdliner.Arg in
    value & opt (some string) None & info [ "e" ]
  and+ debug_ast =
    let open Cmdliner.Arg in
    value & flag & info [ "debug-ast" ]
  in
  match expr_opt with
  | Some s -> eval_lb ~debug_ast (Lexing.from_string s)
  | None -> repl ~debug_ast

let cmd = Cmdliner.Cmd.v info term
let main () = Cmdliner.Cmd.eval cmd |> Stdlib.exit
