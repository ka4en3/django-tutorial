#!/bin/sh
# Exit immediately if a command exits with a non-zero status.
set -e

# Run database migrations and collectstatic on container start.
# This pattern is simple and convenient, but in production teams sometimes run
# migrations as a separate step in CI/CD to avoid noisy deployments.
echo "Starting entrypoint: migrate and collectstatic"

# Apply database migrations
python manage.py migrate --noinput

# Collect static files to STATIC_ROOT
python manage.py collectstatic --noinput

# Execute the passed CMD (e.g. gunicorn ...)
exec "$@"
