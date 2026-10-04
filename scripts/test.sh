#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8080}"
BASE_URL="http://localhost:${PORT}"

passed=0
total=3

if curl -s -f "${BASE_URL}/" > /dev/null; then
    ((passed++))
fi

if curl -s -f "${BASE_URL}/healthz" > /dev/null; then
    ((passed++))
fi

if curl -s -f "${BASE_URL}/quote" > /dev/null; then
    ((passed++))
fi

echo "TESTS: ${passed}/${total}"

if [ "$passed" -eq "$total" ]; then
    exit 0
else
    exit 1
fi
