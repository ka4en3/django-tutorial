# Makefile for Django Polls Project

PROJECT_NAME=mysite

# Default target
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build           - Build Docker images"
	@echo "  make up              - Run dev environment (docker-compose.dev.yml)"
	@echo "  make up-prod         - Run prod environment (docker-compose.prod.yml)"
	@echo "  make down            - Stop containers"
	@echo "  make migrate         - Run Django migrations"
	@echo "  make createsuperuser - Create Django superuser"
	@echo "  make logs            - Tail logs"
	@echo "  make shell           - Open Django shell"
	@echo "  make dbshell         - Open Postgres psql inside db container"

# Build images
.PHONY: build
build:
	docker compose -f docker-compose.dev.yml build

# Run dev environment
.PHONY: up
up:
	docker compose -f docker-compose.dev.yml up

# Run prod environment
.PHONY: up-prod
up-prod:
	docker compose -f docker-compose.prod.yml up -d

# Stop containers
.PHONY: down
down:
	docker compose -f docker-compose.dev.yml down
	docker compose -f docker-compose.prod.yml down || true

# Run Django migrations
.PHONY: migrate
migrate:
	docker compose -f docker-compose.dev.yml run --rm web python manage.py migrate

# Create Django superuser
.PHONY: createsuperuser
createsuperuser:
	docker compose -f docker-compose.dev.yml run --rm web python manage.py createsuperuser

# Tail logs
.PHONY: logs
logs:
	docker compose -f docker-compose.dev.yml logs -f web

# Django shell
.PHONY: shell
shell:
	docker compose -f docker-compose.dev.yml run --rm web python manage.py shell

# Postgres shell
.PHONY: dbshell
dbshell:
	docker compose -f docker-compose.dev.yml exec db psql -U $$POSTGRES_USER -d $$POSTGRES_DB
