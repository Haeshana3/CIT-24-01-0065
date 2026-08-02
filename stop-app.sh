#!/bin/bash

echo "Stopping app ..."

docker stop web-app redis 2>/dev/null || true

echo "App stopped. Data preserved in redis-data volume."
echo "Run ./start-app.sh to restart."
