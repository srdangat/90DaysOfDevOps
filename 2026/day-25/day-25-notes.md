# Day 25 – Git Reset vs Revert & Branching Strategies

## Challenge Tasks

### Task 1: Git Reset — Hands-On
1. Make 3 commits in your practice repo (commit A, B, C)

    ![image](images/task1.1.png)


2. Use `git reset --soft` to go back one commit — what happens to the changes?
    - You will see file.txt is "modified" and already in the staging area.Your changes from Commit C are still there and ready to be committed again.

    ![image](images/task1.2.png)


3. Re-commit, then use `git reset --mixed` to go back one commit — what happens now?
    - You will see file.txt is "modified" but not staged.The changes from Commit C are still in the file, but Git isn't tracking them for a commit yet.

    ![image](images/task1.3.png)


4. Re-commit, then use `git reset --hard` to go back one commit — what happens this time?
    - It will say "working tree clean.

    ![image](images/task1.4.png)


5. Answer in your notes:
   - What is the difference between `--soft`, `--mixed`, and `--hard`?

        - `--soft` : move HEAD,keep changes staged.
        - `--mixed`: move HEAD,unstage changes.
        - `--hard` : move HEAD,discard all changes.

   - Which one is destructive and why?

        - `--hard` is destructive because it permanently discards all uncommitted changes in your staging area and working directory.

   - When would you use each one?

        - `--soft`   : when you want to undo a commit but keep changes staged,for example to edit the commit message.
        - ``--mixed``: when you want to undo a commit and unstage changes,so you can modify them before recommitting.
        - ``--reset``: when you want to completely remove commits and all changes.


   - Should you ever use `git reset` on commits that are already pushed?

        - No,once commits are pushed,others may have already pulled and worked on them,so resetting them can cause confusion and conflicts.



---

### Task 2: Git Revert — Hands-On
1. Make 3 commits (commit X, Y, Z)
2. Revert commit Y (the middle one) — what happens?
3. Check `git log` — is commit Y still in the history?

    - Commit Y is still in the history.A new commit was added.

    ![image](images/task2.png)


4. Answer in your notes:
   - How is `git revert` different from `git reset`?

        - `git revert`: Creates a new commit that undoes changes from a previous commit.Keeps original commit in history
        - `git reset` : Can rewrite history.Moves the branch pointer to an earlier commit


   - Why is revert considered **safer** than reset for shared branches?

        - `git revert` does not rewrite history.

   - When would you use revert vs reset?
        - `git revert`: On branches that are already pushed/shared.To undo a commit without breaking history.
        - `git reset` : When you want to rewrite history or completely remove commits

---

### Task 3: Reset vs Revert — Summary


| | `git reset` | `git revert` |
|---|---|---|
| What it does | Can rewrite history.Moves the branch pointer to an earlier commit | Creates a new commit that undoes changes from a previous commit.Keeps original commit in history |
| Removes commit from history? | Yes | No |
| Safe for shared/pushed branches? | No | Yes |
| When to use | When you want to rewrite history or completely remove commits | On branches that are already pushed/shared.To undo a commit without breaking history |

---