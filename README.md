# Dune Training

The training materials are here: https://github.com/emillon/calc

You are expected to work in the `main` branch. Exercises consist of making
incremental changes to the project. We recommend creating one commit per
exercise.

Each task is in a branch named `task-X`. Proposed solutions are in a branch
called `sol`. The solution to `task-X` is tagged as `sol-X` in branch `sol`.
Task branches are chained together (i.e. `task-N` has parent `task-(N-1)`). If
you find an issue in the task descriptions, file an issue or a patch against the
relevant branch, if you find an issue in the solutions, that can go to the `sol`
branch.

Start by doing `git cherry-pick calc` and `git cherry-pick task-0`

## Task #0: Initial Set-Up

`calc`: an OCaml command-line calculator :1234: :desert: :camel:

The project can be built by typing `dune build` and launched using `dune exec
calc`. Initially, only addition is supported and anything else triggers an
exception terminating the execution.

The project's sources organization is flat, everything is in the root folder.
* `dune-project`: administrative stanzas and project name
* `dune`: targets exposed by the project's folder
* `calc.ml`: the main business logic of the app
* `ast.ml`: the type of arithmetic expression recognized
* `lexer.mll`: lexing specification, using [`ocamllex`](https://ocaml.org/manual/5.2/lexyacc.html)
* `parser.mly`: parsing grammar rules, using [Menhir](https://gallium.inria.fr/~fpottier/menhir/)
* `flake.nix` and `flake.lock` Nix flake set-up

Next, go `git cherry-pick task-1`
