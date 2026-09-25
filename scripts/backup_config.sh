#!/usr/bin/env bash
set -euo pipefail

source_dir="${1:-/etc}"
backup_dir="${2:-./backups}"
timestamp="$(date '+%Y%m%d-%H%M%S')"

if [[ ! -d "$source_dir" ]]; then
  echo "Error: source directory does not exist: $source_dir"
  exit 2
fi

mkdir -p "$backup_dir"
archive="$backup_dir/config-backup-$timestamp.tar.gz"

tar -czf "$archive" \
  -C "$(dirname "$source_dir")" \
  "$(basename "$source_dir")"

chmod 600 "$archive"
echo "Backup created: $archive"