type value = VInt of int | VFloat of float

let value_to_string = function
  | VInt n -> string_of_int n
  | VFloat f -> Printf.sprintf "%.6g" f

let as_float = function VInt n -> float_of_int n | VFloat f -> f

let eval_number_op f_int f_float va vb =
  match (va, vb) with
  | VInt na, VInt nb -> VInt (f_int na nb)
  | _ ->
      let fa = as_float va in
      let fb = as_float vb in
      VFloat (f_float fa fb)

external log10_c : float -> float = "calc_log10"

let rec eval = function
  | Ast.Int n -> VInt n
  | Float f -> VFloat f
  | Ident "pi" -> VFloat (2. *. Stdlib.acos 0.)
  | Ident _ -> failwith "unknown ident"
  | Op (Add, a, b) -> eval_number_op ( + ) ( +. ) (eval a) (eval b)
  | Op (Mul, a, b) -> eval_number_op ( * ) ( *. ) (eval a) (eval b)
  | Op (Div, a, b) -> eval_number_op ( / ) ( /. ) (eval a) (eval b)
  | Call ("sin", e) -> VFloat (Stdlib.sin (as_float (eval e)))
  | Call ("log10", e) -> VFloat (log10_c (as_float (eval e)))
  | Call _ -> failwith "unknown function"
