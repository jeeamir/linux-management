# Troubleshooting

## Permission denied

Ensure the files are executable with `chmod +x scripts/*.sh tests/*.sh`. Use
elevated privileges only when the target resource requires them.

## `systemctl` is not available

The service checker targets systemd-based Linux distributions. It will not run
on macOS, containers without systemd, or distributions using another init
system.

## Disk check returns exit code 1

Exit code `1` means usage is at or above the threshold. Free disk space or run
the script with a suitable threshold. Exit code `2` means the input is invalid.

## Find a regression

```bash
git log --oneline --decorate --graph --all
git blame path/to/file
git show <commit>
```

If one complete commit introduced the problem and later work must be retained,
create a new branch and use `git revert <bad-commit>`. This preserves the audit
trail and is safer than rewriting shared history.

## Incident escalation

Record the command, output and affected server before escalating an incident to another administrator.