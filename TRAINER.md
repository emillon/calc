Tag `init` points to an empty commit, it serves as a common first commit for all
branches except `orig`.

This branch `trainer` contains materials that are not relevant to the trainees.
It's starts at `init` and only contains this file.

Branch `orig` contains the initial project as created. It's detached from the
other branches, it has its own first commit.

Branch `sol` is `orig` rebased on top of `init` plus task solution tags `sol-X`
and file `README.md` removed.

One branch per task. Branch `task-X` correspond to task `X` and tag `sol-X`.
Only changes to the file `README.md` are recorded, with one new section at the
bottom per task.

Branch `start` contains a single commit with a basic `README.md` containing
initial instructions.

Branch `main` is initially set to `start`.

Trainees are supposed to work on branch `main`. They record their work as
commits. If they need to start over from scratch, just do `git reset --hard start`.

At start-up, the trainee does two cherry-picks:
* `git cherry-pick calc` to get the initial project material
* `git cherry-pick task-0` to get the `README.md` contents corresponding to the
  initial project set-up

To start the exercises, the trainee needs to do `git cherry-pick task-1`. Once
changes have been performed, they can be recorded as one or several commits.

Comparison with the solution can be done using `git checkout` or `git diff`
against `sol-1`.

Here is an example session:
```
git clone https://github.com/emillon/calc
cd calc
git cherry-pick task-0
git cherry-pick calc
git cherry-pick task-1
git cherry-pick sol-1
git cherry-pick task-2
git cherry-pick sol-2
git cherry-pick task-3
git cherry-pick sol-3
git cherry-pick task-4
git cherry-pick sol-4
```

This creates a log looking like this:
```
1acb120 (HEAD -> main) add floats
3616745 task3: add floats
0fdba25 display errors
e0f900d task 2: display errors
5c4a871 split and test
6888ff7 task 1: split and test
8916c55 task 0: initial set-up
87b90d1 calc
5d8d01a (start) readme
4ef5b59 (tag: init) initial empty commit
```
