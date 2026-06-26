# Visitor Counter - Docker Application

## Deployment Requirements
- Docker Engine (version 20.10 or higher)
- Linux or WSL 2 environment

## Application Description
This is a simple visitor counter web application built with Docker.

## Network and Volume Details
- **Network:** app-network – a custom bridge network
- **Volume:** redis-data – a named volume for Redis data

## Container Configuration
| Container | Image | Port | Purpose |
|-----------|-------|------|---------|
| web-app | visitor-counter | 5000 | Serves web interface |
| redis | redis:alpine | 6379 | Stores visitor count |

## Instructions
### Prepare
```bash
./prepare-app.sh
```

### Start
```bash
./start-app.sh
```
The app will be available at: http://localhost:5000

### Stop
```bash
./stop-app.sh
```

### Remove
```bash
./remove-app.sh
```
