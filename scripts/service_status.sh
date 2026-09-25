#!/usr/bin/env bash
set -euo pipefail

service_name="${1:-}"

if [[ -z "$service_name" ]]; then
  echo "Usage: $0 <service-name>"
  exit 2
fi

if ! command -v systemctl >/dev/null 2>&1; then
  echo "Error: systemctl is not available."
  exit 3
fi

if systemctl is-active --quiet "$service_name"; then
  echo "OK: $service_name is active."
else
  echo "CRITICAL: $service_name is not active."
  exit 1
fi