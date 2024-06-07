open Calc

let test_as_float =
  let test ~name expression ~expected =
    ( Printf.sprintf "as_float(%s)" name,
      `Quick,
      fun () ->
        let got = Cli.as_float expression in
        Alcotest.check
          (Alcotest.float Stdlib.epsilon_float)
          __LOC__ expected got )
  in
  [
    test ~name:"int" (VInt 2) ~expected:2.;
    test ~name:"float" (VFloat 3.5) ~expected:3.5;
  ]

let suite = [ ("as_float", test_as_float) ]
let () = Alcotest.run __FILE__ suite
