FROM python:3.9-slim
WORKDIR /app
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    redis-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
ENV REDIS_HOST=localhost
CMD service redis-server start && flask run --host=0.0.0.0
