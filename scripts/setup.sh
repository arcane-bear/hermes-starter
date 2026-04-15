#!/usr/bin/env bash
set -euo pipefail

MODEL="${OLLAMA_MODEL:-hermes3:8b}"
OLLAMA_URL="${OLLAMA_BASE_URL:-http://localhost:11434}"

echo "==> Waiting for Ollama to be ready..."
until curl -sf "$OLLAMA_URL/api/tags" > /dev/null 2>&1; do
  sleep 2
done
echo "==> Ollama is up."

echo "==> Pulling model: $MODEL (this may take a while on first run)..."
curl -sf "$OLLAMA_URL/api/pull" -d "{\"name\": \"$MODEL\"}" | while read -r line; do
  status=$(echo "$line" | grep -o '"status":"[^"]*"' | head -1 | cut -d'"' -f4)
  [ -n "$status" ] && echo "    $status"
done

echo "==> Model $MODEL is ready."
echo "==> Hermes agent should be available at http://localhost:${AGENT_PORT:-8080}"
