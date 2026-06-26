#!/bin/bash

echo "Running app ..."

# Start Redis container with persistent volume
docker run -d \
    --name redis \
    --network app-network \
    -v redis-data:/data \
    --restart unless-stopped \
    redis:alpine

# Start the web app container
docker run -d \
    --name web-app \
    --network app-network \
    -p 5000:5000 \
    --restart unless-stopped \
    visitor-counter

echo "The app is available at http://localhost:5000"
