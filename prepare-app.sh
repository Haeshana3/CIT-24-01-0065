#!/bin/bash

echo "Preparing app ..."

# Create a Docker network
docker network create app-network 2>/dev/null || true

# Create a persistent volume for Redis data
docker volume create redis-data 2>/dev/null || true

# Build the custom web app image
docker build -t visitor-counter .

echo "App prepared successfully!"
