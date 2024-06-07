type op = Add | Mul | Div [@@deriving show]

type expr =
  | Int of int
  | Float of float
  | Ident of string
  | Op of op * expr * expr
  | Call of string * expr
[@@deriving show]
