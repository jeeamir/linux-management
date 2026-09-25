# Installation

## Requirements

- Linux with Bash 4 or newer
- Git
- Standard tools: `df`, `awk`, `tar`, `hostname`, and `uname`
- systemd for the service-status command

## Install

```bash
git clone <repository-url>
cd linux-server-manager
chmod +x scripts/*.sh tests/*.sh
cp config/server-manager.conf.example config/server-manager.conf
./tests/test_scripts.sh
```

Run scripts as an unprivileged user whenever possible. Root permissions may be
needed to read protected configuration files or inspect certain services.

