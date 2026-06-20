.PHONY: help setup start stop restart logs clean test

# Default target
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# ═══════════════════════════════════════════════════
# Setup
# ═══════════════════════════════════════════════════

setup: ## One-time setup
	@echo "🚀 Running setup..."
	./scripts/setup.sh

# ═══════════════════════════════════════════════════
# Docker Commands
# ═══════════════════════════════════════════════════

start: ## Start all services
	docker compose up -d
	@echo "✅ Services started. Dashboard: http://localhost/dashboard/"

start-infra: ## Start only infrastructure (no agents)
	docker compose up -d postgres redis chroma searxng n8n nginx
	@echo "✅ Infrastructure started."

start-agents: ## Start agent services
	docker compose up -d llama helpdesk-agent admin-agent
	@echo "✅ Agents started."

stop: ## Stop all services
	docker compose down
	@echo "⏹️ Services stopped."

restart: ## Restart all services
	docker compose restart

rebuild: ## Rebuild and restart
	docker compose down
	docker compose build --no-cache
	docker compose up -d

# ═══════════════════════════════════════════════════
# Logs
# ═══════════════════════════════════════════════════

logs: ## View all logs
	docker compose logs -f --tail=100

logs-agent: ## View helpdesk agent logs
	docker compose logs -f helpdesk-agent --tail=50

logs-admin: ## View admin agent logs
	docker compose logs -f admin-agent --tail=50

logs-llama: ## View llama.cpp logs
	docker compose logs -f llama --tail=50

logs-whatsapp: ## View WhatsApp webhook logs
	docker compose logs -f whatsapp-webhook --tail=50

# ═══════════════════════════════════════════════════
# Maintenance
# ═══════════════════════════════════════════════════

index-kb: ## Index knowledge base into ChromaDB
	docker compose exec helpdesk-agent python3 scripts/index_kb.py

health: ## Check service health
	@echo "=== Service Health ==="
	@curl -sf http://localhost:8080/health | python3 -m json.tool 2>/dev/null || echo "Helpdesk Agent: DOWN"
	@curl -sf http://localhost:8082/health | python3 -m json.tool 2>/dev/null || echo "Admin Agent: DOWN"
	@curl -sf http://localhost:8081/health | python3 -m json.tool 2>/dev/null || echo "llama.cpp: DOWN"
	@curl -sf http://localhost:8000/api/v1/heartbeat | python3 -m json.tool 2>/dev/null || echo "ChromaDB: DOWN"
	@curl -sf http://localhost:8888/search?q=test | python3 -c "import sys,json; print('SearXNG: OK')" 2>/dev/null || echo "SearXNG: DOWN"
	@curl -sf http://localhost:5678/healthz | python3 -c "print('n8n: OK')" 2>/dev/null || echo "n8n: DOWN"

clean: ## Remove all containers and volumes
	docker compose down -v --remove-orphans
	@echo "Cleaned up."

clean-data: ## Remove all data (DANGEROUS)
	docker compose down -v --remove-orphans
	docker volume prune -f
	@echo "All data removed."

# ═══════════════════════════════════════════════════
# Development
# ═══════════════════════════════════════════════════

dev: ## Start in development mode (with overrides)
	docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d

shell: ## Open shell in helpdesk agent container
	docker compose exec helpdesk-agent /bin/bash

psql: ## Open PostgreSQL shell
	docker compose exec postgres psql -U helpdesk -d helpdesk

redis-cli: ## Open Redis CLI
	docker compose exec redis redis-cli -a $(shell grep REDIS_PASSWORD .env | cut -d= -f2)

test-api: ## Test helpdesk agent API
	@echo "=== Testing Helpdesk Agent ==="
	curl -s http://localhost:8080/health | python3 -m json.tool
	@echo ""
	@echo "=== Sending test message ==="
	curl -s -X POST http://localhost:8080/chat \
		-H "Content-Type: application/json" \
		-d '{"user_id": "test@example.com", "message": "Hello, I need help"}' | python3 -m json.tool
