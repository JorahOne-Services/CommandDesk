<div align="center">
  <img src="https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white">
  <img src="https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black">
  <img src="https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white">
  <img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white">
</div>

<br>

<div align="center">
  <h1>CommandDesk</h1>
  <p><strong>Self-Hosted AI Helpdesk Agent</strong></p>
  <p>Multi-platform ticketing, email-to-ticket, AI auto-response, and cost tracking.</p>
  <p>
    <a href="#features">Features</a> •
    <a href="#quick-start">Quick Start</a> •
    <a href="#architecture">Architecture</a> •
    <a href="#contributing">Contributing</a>
  </p>
</div>

---

## Screenshot

![CommandDesk Dashboard](docs/screenshot.png)
*AI-powered helpdesk dashboard with ticket management and cost tracking.*

## Features

- **Multi-Platform Ticketing** — Support for email, web, and API ticket submissions.
- **Email-to-Ticket** — Automatically convert emails to helpdesk tickets.
- **AI Auto-Response** — GPT-powered intelligent ticket responses and suggestions.
- **Cost Tracking** — Track AI API usage costs per ticket and agent.
- **SLA Management** — Define and monitor service level agreements.
- **Agent Dashboard** — Real-time ticket queue and performance metrics.
- **Knowledge Base** — Built-in knowledge base for common issues.
- **FastAPI Backend** — Async Python backend with WebSocket updates.
- **Docker Compose** — One-command production deployment.

## Quick Start

```bash
git clone https://github.com/OneByJorah/CommandDesk.git
cd CommandDesk

cp .env.example .env  # Configure AI and email settings
docker compose up -d
```

Open **http://localhost:8000** in your browser.

### Local Development

```bash
# Backend
cd backend
pip install -r requirements.txt
uvicorn main:app --reload --port 8000

# Frontend
cd frontend
npm install
npm run dev
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `8000` | Backend API port |
| `DATABASE_URL` | `sqlite:///commanddesk.db` | Database connection string |
| `OPENAI_API_KEY` | *(empty)* | OpenAI API key for AI responses |
| `SMTP_HOST` | — | Email server for ticket ingestion |
| `SMTP_PORT` | `587` | Email server port |
| `SMTP_USER` | — | Email username |
| `SMTP_PASS` | — | Email password |
| `COST_PER_1K_TOKENS` | `0.02` | Cost per 1K tokens for tracking |

## Architecture

```
Browser (React) ──API/WebSocket──▶ FastAPI Backend ──▶ SQLite
                                        │
                                        ├──▶ OpenAI GPT (Auto-Response)
                                        ├──▶ SMTP (Email Integration)
                                        ├──▶ Ticket Engine
                                        ├──▶ SLA Monitor
                                        └──▶ Cost Tracker
```

## Tech Stack

- **Backend**: FastAPI (Python 3.10+), SQLAlchemy
- **Frontend**: React 18 (TypeScript)
- **AI**: OpenAI GPT for intelligent responses
- **Email**: SMTP integration for email-to-ticket
- **Database**: SQLite (default), PostgreSQL (production)
- **Deployment**: Docker Compose

## Project Structure

```
CommandDesk/
├── backend/
│   ├── main.py              # FastAPI application
│   ├── routers/
│   │   ├── tickets.py       # Ticket management
│   │   ├── agents.py        # Agent management
│   │   ├── knowledge.py     # Knowledge base
│   │   └── analytics.py     # Cost and performance analytics
│   ├── services/
│   │   ├── ai_responder.py  # OpenAI integration
│   │   ├── email_handler.py # Email-to-ticket conversion
│   │   ├── sla_monitor.py   # SLA tracking
│   │   └── cost_tracker.py  # API cost tracking
│   └── models.py            # Database models
├── frontend/
│   ├── src/
│   │   ├── components/      # React components
│   │   └── pages/           # Dashboard pages
│   └── package.json
├── docker-compose.yml       # Docker deployment
└── .env.example             # Configuration template
```

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/tickets` | GET/POST | Manage tickets |
| `/api/tickets/{id}` | GET/PUT | Get/update ticket |
| `/api/tickets/{id}/respond` | POST | AI auto-response |
| `/api/agents` | GET | List helpdesk agents |
| `/api/knowledge` | GET/POST | Knowledge base |
| `/api/analytics/costs` | GET | Cost analytics |
| `/api/analytics/performance` | GET | Agent performance |

## Ticket Statuses

| Status | Description |
|--------|-------------|
| `open` | New ticket awaiting response |
| `in_progress` | Being handled by an agent |
| `waiting` | Awaiting customer response |
| `resolved` | Issue resolved |
| `closed` | Ticket archived |

## Contributing

Contributions are welcome. Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for community standards.

## Security

For security concerns, see [SECURITY.md](SECURITY.md). Please report vulnerabilities to **info@jorahone.com** — do not use public issues.

## License

MIT © Jhonattan L. Jimenez

---

<div align="center">
  <p>AI-powered self-hosted helpdesk system.</p>
  <p><a href="https://github.com/OneByJorah">@OneByJorah</a></p>
</div>
