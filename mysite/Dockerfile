# Use official Python image
FROM python:3.10-slim

# Set workdir
WORKDIR /app

# Install build deps for psycopg2
RUN apt-get update \
    && apt-get install -y build-essential libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy only requirements first for better caching
COPY requirements.txt ./
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /app

# Collect static files
ENV PORT=8000
ENV PYTHONUNBUFFERED=1

# Expose port
EXPOSE ${PORT}

# Default command
CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3", "--log-file", "-"]