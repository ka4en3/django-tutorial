# Use an official slim Python runtime as a parent image
FROM python:3.10-slim

# Do not write .pyc files and do not buffer stdout/stderr (for Docker logs)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies needed to build some wheels (e.g., Psycopg)
# Keep --no-install-recommends to reduce image size
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching in docker layer
COPY requirements.txt .

# Install Python deps
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app

# Create an unprivileged user and transfer ownership
RUN useradd --create-home appuser \
    && chown -R appuser:appuser /app

USER appuser

# Expose port for the container
ENV PORT=8000
EXPOSE ${PORT}

# Copy entrypoint script and make executable
COPY --chmod=755 ./entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# Default command (can be overridden in docker-compose)
CMD ["/entrypoint.sh", "gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3", "--log-file", "-"]
