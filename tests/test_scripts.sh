#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
failures=0

pass() { printf 'PASS: %s\n' "$1"; }
fail() { printf 'FAIL: %s\n' "$1" >&2; failures=$((failures + 1)); }

for script in "$repo_root"/scripts/*.sh; do
  if bash -n "$script"; then
    pass "syntax $(basename "$script")"
  else
    fail "syntax $(basename "$script")"
  fi
done

if "$repo_root/scripts/system_info.sh" | grep -q '^Hostname:'; then
  pass 'system information includes hostname'
else
  fail 'system information includes hostname'
fi

if "$repo_root/scripts/disk_usage.sh" 101 >/dev/null 2>&1; then
  fail 'invalid threshold is rejected'
else
  status=$?
  if [[ "$status" -eq 2 ]]; then
    pass 'invalid threshold is rejected'
  else
    fail 'invalid threshold returns exit code 2'
  fi
fi

if "$repo_root/scripts/service_status.sh" >/dev/null 2>&1; then
  fail 'missing service name is rejected'
else
  status=$?
  if [[ "$status" -eq 2 ]]; then
    pass 'missing service name is rejected'
  else
    fail 'missing service name returns exit code 2'
  fi
fi

if (( failures > 0 )); then
  printf '%s test(s) failed.\n' "$failures" >&2
  exit 1
fi

printf 'All tests passed.\n'

