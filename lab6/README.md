# Lab 6 – Kubernetes Fundamentals with Minikube

## Description
This lab demonstrates the fundamentals of Kubernetes using Minikube. A multi-tier application was deployed consisting of:
- Frontend tier (nginx)
- API tier (httpbin)
- Cache tier (Redis)
- Database tier (PostgreSQL with persistent storage)

## Deployment Requirements
- Docker
- Minikube
- kubectl
- Linux or WSL 2 environment

## Application Architecture

| Tier | Image | Port | Kubernetes Object |
|------|-------|------|-------------------|
| Frontend | nginx:alpine | 80 | Deployment + NodePort Service |
| API | kennethreitz/httpbin | 80 | Deployment + ClusterIP Service |
| Cache | redis:7-alpine | 6379 | Deployment + ClusterIP Service |
| Database | postgres:16-alpine | 5432 | StatefulSet + Headless Service + PVC |

## How to Deploy

```bash
# Start Minikube
minikube start --driver=docker

# Apply all manifests
kubectl apply -f k8s/
How to Access the Application
bash
# Get the URL for the frontend service
minikube service frontend-service --url
Open the URL in your browser to see the nginx welcome page.

How to Scale the Application
bash
# Scale frontend to 5 replicas
kubectl scale deployment frontend-deployment --replicas=5

# Scale frontend back to 2 replicas
kubectl scale deployment frontend-deployment --replicas=2
How to Perform a Rolling Update
bash
# Update image
kubectl set image deployment/frontend-deployment nginx=nginx:1.27-alpine

# Check rollout status
kubectl rollout status deployment/frontend-deployment

# Rollback if needed
kubectl rollout undo deployment/frontend-deployment
How to Test Persistence
bash
# Create data in PostgreSQL
kubectl exec -it postgres-0 -- psql -U postgres -c "CREATE TABLE demo (id serial primary key, note text); INSERT INTO demo (note) VALUES ('lab6 test row');"

# Delete the pod
kubectl delete pod postgres-0

# Verify data still exists
kubectl exec -it postgres-0 -- psql -U postgres -c "SELECT * FROM demo;"
How to Clean Up
bash
# Delete all resources
kubectl delete -f k8s/

# Stop Minikube
minikube stop
Features Demonstrated
✅ Self-healing (pods automatically recreate)

✅ Scaling up and down

✅ Rolling updates and rollbacks

✅ Service discovery (ClusterIP services)

✅ Persistent storage (StatefulSet with PVC)

✅ Observability (metrics-server)

✅ Troubleshooting (broken pod with ImagePullBackOff)

Checkpoint Questions
The answers to all 9 checkpoint questions are provided in answers.md.

Screenshots
All required screenshots are available in the screenshots/ folder.

Author
CIT-24-01-0065

text

---

### Step 5: Paste it into the terminal

Right-click → **Paste** OR press `Ctrl + Shift + V`

---

### Step 6: Save and exit

1. Press `Ctrl + X`
2. Press `Y`
3. Press `Enter`

---

### Step 7: Push to GitHub

```bash
git add lab6/README.md
git commit -m "Add complete README.md for Lab 6"
git push origin main
