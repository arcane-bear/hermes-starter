#!/usr/bin/env bash
set -euo pipefail

AGENT_URL="http://localhost:${AGENT_PORT:-8080}"
OLLAMA_URL="${OLLAMA_BASE_URL:-http://localhost:11434}"

echo "Checking Ollama..."
if curl -sf "$OLLAMA_URL/api/tags" > /dev/null 2>&1; then
  echo "  Ollama: OK"
else
  echo "  Ollama: UNREACHABLE"
fi

echo "Checking hermes-agent..."
if curl -sf "$AGENT_URL/health" > /dev/null 2>&1; then
  echo "  hermes-agent: OK"
else
  echo "  hermes-agent: UNREACHABLE"
fi
