# J1 Helpdesk Agent
Self-hosted AI helpdesk with multi-platform ticketing, email-to-ticket support, and an admin dashboard that tracks live cost savings.

## Stack
- Hermes Agent (AI orchestration)
- llama.cpp server (local LLM, 64k context)
- osTicket adapter (REST API)
- SQLite (ticket state + memory)
- Admin dashboard (HTML, cost tracker)

## Quick Start
1. Place configs in `/opt/hermes/config.yaml` and `/opt/llama.cpp/models/your-model.gguf`
2. Install `llama-cpp-server.service`
3. Run `memory_setup.py` to init SQLite
4. Open `admin/admin-dashboard.html`

## Repo layout
- `helpdesk-agent-tools/` — core wrappers + systemd units + Hermes config
- `helpdesk-agent-diagram-guide.html` — architecture guide
- `admin/admin-dashboard.html` — admin cost/usage dashboard
- `README.md` — this file

## License
MIT
