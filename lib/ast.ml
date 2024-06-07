type op = Add | Mul

type exp =
  | Int of int
  | Float of float
  | Ident of string
  | Op of op * exp * exp
