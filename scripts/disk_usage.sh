#!/usr/bin/env bash
set -euo pipefail

threshold="${1:-80}"
mount_point="${2:-/}"

if ! [[ "$threshold" =~ ^[0-9]+$ ]] || (( threshold < 1 || threshold > 100 )); then
  echo "Error: threshold must be an integer from 1 to 100."
  exit 2
fi

usage=$(df -P "$mount_point" | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

echo "Disk usage: ${usage}%"

if (( usage >= threshold )); then
  echo "CRITICAL: disk usage exceeded ${threshold}%"
  exit 1
fi

echo "OK: disk usage is below ${threshold}%"