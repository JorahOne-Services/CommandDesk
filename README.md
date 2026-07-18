<div align="center">

  <img src="https://raw.githubusercontent.com/OneByJorah/CommandDesk/main/docs/logo.png" alt="CommandDesk Logo" width="120">

  # 🎫 CommandDesk

  **Self-Hosted AI Helpdesk Agent**

  Multi-platform ticketing, email-to-ticket, admin dashboard with live cost tracking

  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![Python 3.10+](https://img.shields.io/badge/Python-3.10+-3776AB?style=flat&logo=python&logoColor=white)](https://www.python.org/)
  [![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=flat&logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
  [![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)](https://www.docker.com/)
  [![AI-Powered](https://img.shields.io/badge/AI-Powered-9B59B6?style=flat&logo=openai&logoColor=white)](https://openai.com/)

  [Features](#-features) • [Quick Start](#-quick-start) • [Architecture](#-architecture) • [API](#-api-reference) • [Contributing](#-contributing)

</div>

---

## 📸 Screenshots

<div align="center">

| Ticket Dashboard | AI Assistant | Cost Tracker |
|------------------|--------------|--------------|
| ![Dashboard](docs/screenshots/dashboard.png) | ![AI](docs/screenshots/ai-assistant.png) | ![Costs](docs/screenshots/costs.png) |

</div>

> 💡 **Tip:** CommandDesk uses AI to automatically categorize, prioritize, and respond to tickets

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🎫 **Multi-Platform Ticketing** | Email, WhatsApp, Telegram, Web |
| 🤖 **AI Auto-Response** | Intelligent ticket routing and responses |
| 📧 **Email-to-Ticket** | Automatic ticket creation from emails |
| 💰 **Cost Tracking** | Real-time AI usage cost monitoring |
| 📊 **Analytics Dashboard** | Ticket metrics and performance stats |
| 🔐 **Role-Based Access** | Admin, Agent, User roles |
| 🐳 **Docker Ready** | One-command deployment |
| 🔌 **Plugin System** | Extend with custom integrations |

---

## 🚀 Quick Start

### Prerequisites

- Docker & Docker Compose
- Git
- SMTP server for email integration (optional)

### Installation

```bash
# Clone the repository
git clone https://github.com/OneByJorah/CommandDesk.git
cd CommandDesk

# Start with Docker
docker compose up -d
```

### Access the Dashboard

Open **http://localhost:8080** in your browser

### Default Credentials

- **Admin:** admin@commanddesk.local / admin
- **Agent:** agent@commanddesk.local / agent

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `CD_PORT` | `8080` | Dashboard port |
| `DATABASE_URL` | `sqlite:///./commanddesk.db` | Database URL |
| `SMTP_HOST` | - | SMTP server |
| `SMTP_PORT` | `587` | SMTP port |
| `OPENAI_API_KEY` | - | OpenAI API key |
| `WHATSAPP_TOKEN` | - | WhatsApp Business API |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     CommandDesk                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌──────────┐      ┌──────────┐      ┌──────────────┐    │
│   │ Browser  │ ───▶ │  Nginx   │ ───▶ │ FastAPI      │    │
│   └──────────┘      └──────────┘      └──────┬───────┘    │
│                                               │             │
│                                   ┌───────────┴──────────┐ │
│                                   │                      │ │
│                        ┌──────────┴──────────┐           │ │
│                        │                     │           │ │
│                        ▼                     ▼           │ │
│                 ┌──────────┐          ┌──────────┐      │ │
│                 │  Ticket  │          │ AI Agent │      │ │
│                 │  Engine  │          │ Gateway  │      │ │
│                 └──────────┘          └──────────┘      │ │
│                                                           │ │
│  ┌─────────────────────────────────────────────────────┐ │ │
│  │              Communication Channels                 │ │ │
│  │  ┌───────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐ │ │ │
│  │  │ Email │  │WhatsApp │  │Telegram │  │   Web   │ │ │ │
│  │  │  SMTP │  │  API    │  │   Bot   │  │  Forms  │ │ │ │
│  │  └───────┘  └─────────┘  └─────────┘  └─────────┘ │ │ │
│  └─────────────────────────────────────────────────────┘ │
│                                                           │
└─────────────────────────────────────────────────────────────┘
```

### Tech Stack

| Component | Technology |
|-----------|------------|
| **Backend** | Python 3.10+, FastAPI, SQLAlchemy |
| **Frontend** | HTML5, CSS3, JavaScript |
| **Database** | SQLite / PostgreSQL |
| **AI/ML** | OpenAI API, LangChain |
| **Integrations** | SMTP, WhatsApp Business, Telegram |
| **Deployment** | Docker Compose |

---

## 📁 Project Structure

```
CommandDesk/
├── backend/                  # FastAPI backend
│   ├── main.py              # Application entry
│   ├── routers/             # API routes
│   │   ├── tickets.py       # Ticket management
│   │   ├── ai.py            # AI agent endpoints
│   │   └── analytics.py     # Analytics & costs
│   ├── services/            # Business logic
│   │   ├── ticket_engine.py # Ticket processing
│   │   ├── ai_agent.py      # AI response agent
│   │   └── channels/        # Communication channels
│   │       ├── email.py     # Email integration
│   │       ├── whatsapp.py  # WhatsApp integration
│   │       └── telegram.py  # Telegram integration
│   └── models/              # Data models
├── frontend/                # Dashboard UI
├── plugins/                 # Plugin system
├── docs/                    # Documentation
│   └── screenshots/         # Dashboard screenshots
├── docker-compose.yml       # Docker deployment
└── requirements.txt         # Python dependencies
```

---

## 🔌 API Reference

### Tickets

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/tickets` | `GET` | List tickets |
| `/api/tickets` | `POST` | Create ticket |
| `/api/tickets/<id>` | `GET` | Get ticket details |
| `/api/tickets/<id>/update` | `PUT` | Update ticket |
| `/api/tickets/<id>/close` | `POST` | Close ticket |

### AI Agent

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/ai/analyze` | `POST` | Analyze ticket with AI |
| `/api/ai/respond` | `POST` | Generate AI response |
| `/api/ai/costs` | `GET` | Get AI usage costs |

### Analytics

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/analytics/overview` | `GET` | Dashboard overview |
| `/api/analytics/tickets` | `GET` | Ticket statistics |
| `/api/analytics/performance` | `GET` | Agent performance |

### Example Usage

```bash
# Create a ticket
curl -X POST http://localhost:8080/api/tickets \
  -H "Content-Type: application/json" \
  -d '{"subject": "Login issue", "body": "Cannot login to my account", "source": "email"}'

# Get AI analysis
curl -X POST http://localhost:8080/api/ai/analyze \
  -H "Content-Type: application/json" \
  -d '{"ticket_id": 123}'

# Get cost summary
curl http://localhost:8080/api/ai/costs?period=30d
```

---

## 🛠️ Development

### Local Development

```bash
# Clone the repository
git clone https://github.com/OneByJorah/CommandDesk.git
cd CommandDesk

# Backend setup
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Start development server
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### Running Tests

```bash
pytest
```

---

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🔒 Security

For security concerns, please see [SECURITY.md](SECURITY.md).

---

## 💬 Support

- 📧 Email: support@jorah.one
- 🐛 Issues: [GitHub Issues](https://github.com/OneByJorah/CommandDesk/issues)
- 📖 Docs: [Documentation](docs/)

---

<div align="center">

  **Built with ❤️ by [Jhonattan L. Jimenez](https://github.com/OneByJorah)**

  [⬆ Back to Top](#-commanddesk)

</div>
