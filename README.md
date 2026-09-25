# Linux Server Manager

A practical Linux/DevOps toolkit for inspecting server health, managing configuration backups, and demonstrating reliable administration workflows.

## Features

- Print an operating-system and resource summary.
- Check disk usage against a configurable threshold.
- Verify whether a systemd service is active.
- Archive selected configuration files safely.
- Run automated shell checks before merging changes.

## Project structure

```text
config/                  Example project configuration
docs/                    Installation, configuration, and troubleshooting docs
scripts/                 Linux administration scripts
tests/                   Lightweight test suite
.github/                 Pull Request template
```

## Quick start

```bash
git clone <repository-url>
cd linux-server-manager
chmod +x scripts/*.sh tests/*.sh
./scripts/system_info.sh
./tests/test_scripts.sh
```

## Development workflow

The stable code lives on `main`. Every change starts in a short-lived branch
named `feature/<topic>`, `docs/<topic>`, or `fix/<topic>`. A contributor opens a
Pull Request, explains the change and testing, responds to review feedback, and
merges only after approval and successful tests.

## Branching strategy

- `main`: stable, reviewed versions only.
- `feature/*`: new functionality.
- `fix/*`: bug fixes.
- `docs/*`: documentation-only changes.

Remove short-lived feature branches after the Pull Request is merged and
verified to keep the repository easy to navigate.

## Contribution process

1. Update `main` and create a focused branch.
2. Make small, meaningful commits using imperative messages.
3. Run `./tests/test_scripts.sh`.
4. Push the branch and open a Pull Request using the template.
5. Address review comments and request approval.
6. Merge without rewriting shared history.

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for the detailed process.

## Testing process

Run the following from the repository root:

```bash
./tests/test_scripts.sh
```

The suite checks shell syntax, expected command output, threshold validation,
and error handling. Tests must pass before a Pull Request is merged.

## Troubleshooting process

1. Reproduce the problem and record the exact command and output.
2. Inspect recent changes with `git log --oneline` and `git blame`.
3. Run the test suite and check permissions and dependencies.
4. Apply a fix on a separate branch and document the result.
5. Revert the problematic commit when a safe forward fix is not available.

See [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for common problems.

## Security

The scripts avoid `eval`, quote variables, validate user input, and do not store
credentials. Review backup contents and permissions before using them on a
production server.
