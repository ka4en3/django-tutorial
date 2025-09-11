# Django Polls Project (Production-Ready)

This repository contains a simple production-ready version of the classic Django *Polls* tutorial project, adapted following best practices and core principles of the **12 Factor App** methodology.

## Features

- Django based project (`polls` app)
- PostgreSQL as database (with fallback to SQLite for dev)
- Configurable via environment variables (`.env`)
- Dockerized with multi-environment support (dev & prod)
- Gunicorn + WhiteNoise for production-ready serving
- Makefile for common developer workflows
- Logging to stdout for containerized environments

## Requirements

- Docker & Docker Compose

## Quickstart

### 1. Clone the repository
```bash
git clone https://github.com/ka4en3/django-tutorial.git
cd mysite
```

### 2. Configure environment variables
Copy the provided example environment file:
```bash
cp .env.example .env
```
Update values (especially `SECRET_KEY`, DB credentials, etc.) as needed.

For production, use `.env.prod.example`.

### 3. Start in development mode
```bash
make up
```
This will:
- Build Docker images
- Start Postgres and Django dev server
- Mount source code for hot reload

### 4. Apply migrations & create superuser
```bash
make migrate
make createsuperuser
```

### 5. Visit

- [http://localhost:8000/admin](http://localhost:8000/admin)

- [http://localhost:8000/polls](http://localhost:8000/polls)

### 6. Stop services
```bash
make down
```

## Production Deployment

Build and run with the production Docker Compose file:
```bash
make up-prod
```
This runs Django via **Gunicorn** with:
- Static files served by WhiteNoise
- Logging sent to stdout
- Postgres in a dedicated container

## Common Commands

```bash
make build           # Build docker images
make up              # Run dev environment
make up-prod         # Run prod environment
make down            # Stop containers
make migrate         # Run Django migrations
make createsuperuser # Create Django superuser
make logs            # Tail logs
```

## Database

- Development: PostgreSQL container, port `5432` exposed
- Production: PostgreSQL container, no external port exposed
- Credentials configured via `.env` / `.env.prod.example`

## Logging

- Logs are streamed to `stdout`
- Adjust log level via `LOG_LEVEL` env var

## Static Files

- Handled by [WhiteNoise](http://whitenoise.evans.io/en/stable/)
- Collected into `/staticfiles`

## Healthcheck

Production docker-compose includes a healthcheck for both `web` and `db` services.

## License

MIT License © ka4en3

