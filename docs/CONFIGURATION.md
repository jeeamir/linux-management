# Configuration

The example configuration is stored at
`config/server-manager.conf.example`. Copy it to
`config/server-manager.conf`; that local file should not contain secrets and
must not be committed.

| Setting | Purpose | Default |
| --- | --- | --- |
| `DISK_THRESHOLD` | Percentage that triggers an alert | `80` |
| `DEFAULT_MOUNT_POINT` | Filesystem to inspect | `/` |
| `DEFAULT_SERVICE` | systemd unit to check | `sshd` |
| `BACKUP_SOURCE` | Directory to archive | `/etc` |
| `BACKUP_DIRECTORY` | Destination for archives | `/var/backups/server-manager` |

Command-line arguments take precedence over these documented defaults. Never
store passwords, API keys, or private keys in the repository.

