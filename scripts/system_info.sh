#!/usr/bin/env bash
set -euo pipefail

echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -sr)"
echo "Uptime: $(uptime)"

if command -v free >/dev/null 2>&1; then
  echo "=== Memory ==="
  free -h
fi

echo "=== Disk ==="
df -h /