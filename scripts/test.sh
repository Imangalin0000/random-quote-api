#!/usr/bin/env bash
set -euo pipefail

export PORT="${PORT:-8080}"
BASE_URL="http://localhost:${PORT}"

python3 app.py &
SERVER_PID=$!
trap 'kill "$SERVER_PID" 2>/dev/null || true' EXIT

for _ in $(seq 1 30); do
    if curl -s -f "${BASE_URL}/healthz" > /dev/null; then
        break
    fi
    sleep 1
done

passed=0
total=3

for path in / /healthz /quote; do
    if curl -s -f "${BASE_URL}${path}" > /dev/null; then
        passed=$((passed + 1))
    fi
done

echo "TESTS: ${passed}/${total}"

if [ "$passed" -eq "$total" ]; then
    exit 0
else
    exit 1
fi
