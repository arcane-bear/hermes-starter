# hermes-starter

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

## Swap the model

Edit `.env` (or export before running):

```bash
OLLAMA_MODEL=hermes3:70b   # or any Ollama-compatible model tag
```

Then re-run `./scripts/setup.sh` to pull the new model.

## Add custom tools

Edit `config/tools.yaml` to define new tools, then restart:

```bash
docker compose restart hermes-agent
```

See the [hermes-agent docs](https://github.com/NousResearch/hermes-agent) for the full tool schema reference.

## Health check

```bash
./scripts/ping.sh
```

## Project structure

```
hermes-starter/
├── docker-compose.yml    # Ollama + hermes-agent services
├── config/
│   ├── agent.yaml        # Agent name, system prompt, model settings
│   └── tools.yaml        # Tool definitions (web search, calculator)
├── scripts/
│   ├── setup.sh          # Pull model & wait for services
│   └── ping.sh           # Quick health check
├── .env.example          # Default environment variables
└── LICENSE               # MIT
```

## Assumptions

> **Note:** This is a starter template, not a fork of hermes-agent. It assumes `nousresearch/hermes-agent` is available as a Docker image. If the image name or configuration format differs in your version, update `docker-compose.yml` and the config files accordingly. Check the [hermes-agent repo](https://github.com/NousResearch/hermes-agent) for the latest setup instructions.

## License

MIT

---

Maintained by Tijo Gaucher · Built with RapidClaw
