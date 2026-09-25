# Assignment 2 evidence guide

Capture a screenshot after every numbered step. Keep the terminal prompt,
command, and result visible. Replace `<github-user>` with the real account.

1. Show the local repository: `git status`.
2. Show configuration: `git config --local --list`.
3. Show files: `find . -maxdepth 2 -type f | sort`.
4. Show history and branches: `git log --oneline --graph --decorate --all`.
5. Create an empty GitHub repository named `linux-server-manager`.
6. Connect it: `git remote add origin https://github.com/<github-user>/linux-server-manager.git`.
7. Publish main: `git push -u origin main`.
8. Push each unmerged feature branch and open multiple Pull Requests.
9. In every PR, write what changed, why, and how it was tested.
10. Ask a teammate to leave a specific review comment on one PR.
11. Make the requested change, push it, then ask for approval.
12. Merge approved PRs and show the stable `main` branch.
13. Show the conflict-resolution merge and explain that both branches edited
    the same README line; the final text kept the useful parts of both changes.
14. Show the recovery pair in the log. Explain that `git revert` created a new
    commit that undid the incorrect change without deleting later history.
15. Run `./tests/test_scripts.sh` and capture the passing result.

## Defence summary

The project uses short-lived feature branches so unfinished work does not enter
`main`. Pull Requests provide discussion, review, and a test record. A merge
conflict was resolved by inspecting both variants and combining the intended
content. An incorrect threshold change was recovered with `git revert`, which
preserved the complete history.

