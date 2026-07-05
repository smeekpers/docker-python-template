FROM python:3.12-slim

WORKDIR /workspace

FROM python:3.11-slim

WORKDIR /app

# Install OS packages
RUN apt-get update && \    
    apt-get install -y \
    git \
    curl \        
    wget \        
    vim \        
    procps && \
rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
COPY requirements-dev.txt .

RUN pip install --no-cache-dir \
    -r requirements.txt \
    -r requirements-dev.txt

COPY . .

CMD ["python", "app/main.py"]
