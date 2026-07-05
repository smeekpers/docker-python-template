# Build stage
FROM python:3.11-slim as builder
WORKDIR /tmp
COPY requirements.txt requirements-dev.txt .
RUN pip install --user --no-cache-dir -r requirements.txt -r requirements-dev.txt

# Development stage
FROM python:3.11-slim as development
WORKDIR /app
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    procps && \
    rm -rf /var/lib/apt/lists/*
COPY --from=builder /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH
COPY . .
CMD ["sleep", "infinity"]

# Production stage
FROM python:3.11-slim as production
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt
COPY . .
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
