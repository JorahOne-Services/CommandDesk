# J1 Helpdesk Agent

<p align="center">
  <strong>Self-hosted AI helpdesk with multi-platform ticketing, email-to-ticket, and a live cost-tracking admin dashboard.</strong><br>
  100% local and free. Compatible with Hermes Agent and the broader agent-skills ecosystem.
</p>

## Stack
- Hermes Agent (AI orchestration)
- llama.cpp server (local LLM, 64k context)
- osTicket / Zammad / email adapters via registry
- SQLite (ticket state + memory)
- Admin dashboard (HTML, cost tracker)

## Self-hosted addons
- `compose/docker-compose.selfhosted.yml` — STT, TTS, browser automation, honcho
- `compose/docker-compose.knowledge.yml` — SearXNG search, Mathesar DB UI
- `compose/docker-compose.wiki.yml` — Outline wiki
- `compose/docker-compose.ci.yml` — CI validation
- `compose/docker-compose.yml` — main app service

## Quick Start
1. Place configs in `/opt/hermes/config.yaml` and `/opt/llama.cpp/models/your-model.gguf`
2. Install `llama-cpp-server.service`
3. Run `memory_setup.py` to init SQLite
4. Open `admin/admin-dashboard.html`

## Repo layout
- `ticket_platforms/` — registry + adapters (osTicket, Zammad, email)
- `skills/manifest.yaml` — agent skill manifest
- `helpdesk-agent-diagram-guide.html` — architecture guide
- `admin/admin-dashboard.html` — admin cost/usage dashboard
- `compose/` — all self-hosted container stacks

## License
MIT
