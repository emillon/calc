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
