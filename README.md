# hermes-starter

> Built with [Rapid Claw](https://rapidclaw.dev) — the [open agent deployment platform](https://rapidclaw.dev) for running AI agents in production.

One-command Docker Compose quickstart for running [Nous Research's hermes-agent](https://github.com/NousResearch/hermes-agent) locally with Ollama.

## Quick start

```bash
git clone https://github.com/arcane-bear/hermes-starter.git
cd hermes-starter
cp .env.example .env        # optional: edit defaults
docker compose up -d
./scripts/setup.sh           # pulls the model & waits for readiness
```

The agent API is now running at **http://localhost:8080**.

## What you get

- **Ollama** serving a Hermes-3 model locally (no API keys needed)
- **hermes-agent** wired to Ollama with example tool definitions
- Health checks, restart policies, and volume persistence out of the box

## Learn More

- [Self-Hosting AI Agents with Docker](https://rapidclaw.dev/blog/self-hosting-ai-agents-with-docker) — patterns for containerized agent deployment
- [From Local to Production Agents](https://rapidclaw.dev/blog/from-local-to-production-agents) — scaling your local agent setup with [RapidClaw's infrastructure](https://rapidclaw.dev)
- [RapidClaw Platform Docs](https://rapidclaw.dev/docs) — guides for deploying and managing agent workloads

## License

MIT
