#!/bin/bash

echo "Removing app ..."

# Stop and remove containers
docker rm -f web-app redis 2>/dev/null || true

# Remove the custom image
docker rmi visitor-counter 2>/dev/null || true

# Remove the volume
docker volume rm redis-data 2>/dev/null || true

# Remove the network
docker network rm app-network 2>/dev/null || true

echo "App removed successfully!"
