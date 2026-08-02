# Kubernetes Lab – Checkpoint Answers

## Q1: What is the difference between the control plane and a worker node?

The control plane is like the "brain" of the Kubernetes cluster. It manages everything, including scheduling, scaling, and keeping track of the cluster's state. Worker nodes are like the "workers" that actually run the containers (pods). The control plane tells the worker nodes what to do, and the worker nodes do the work. The control plane doesn't run your apps; it just manages the worker nodes that do.

## Q2: Has the Pod IP changed after recreating it? Why?

Yes, the Pod IP changes every time a pod is recreated. Each new pod gets a brand new IP address because Kubernetes doesn't reuse old IPs for new pods. This happens because pods are meant to be temporary and can be replaced at any time. That's why we use Services in Kubernetes – they give us a stable address that stays the same even when pods change.

## Q3: What happened when you deleted a Pod?

When I deleted the pod, it was removed from the cluster. But since the pod was managed by a Deployment, Kubernetes noticed that the number of running pods didn't match what I wanted (1 replica), so it immediately created a new pod to replace it. The new pod started up quickly, and everything went back to normal within seconds. This is Kubernetes' way of fixing problems automatically, which is called "self-healing."

## Q4: Why can the frontend be scaled independently?

The frontend can be scaled up or down without affecting other services because it connects to them through Services, which act like stable addresses that don't change. The frontend doesn't talk directly to specific pods – it talks to the service names, which automatically route traffic to the right places. Also, the frontend is stateless, meaning any replica can handle any request, so adding or removing replicas doesn't cause problems.

## Q5: What is the difference between port-forward and a Service?

Port-forward is like a temporary tunnel that connects your computer directly to one specific pod. It's useful for testing and debugging, but it only works for that one pod and stops if the pod changes. A Service is a stable, permanent address that automatically spreads traffic across all matching pods. Services work even when pods are replaced or scaled, making them the right choice for production.

## Q6: Why are rolling updates and rollbacks easier in Kubernetes than Docker Compose?

Kubernetes handles updates in a smart way – it updates pods one by one so the app stays available the whole time. If something goes wrong, I can undo the update with one simple command. In Docker Compose, I'd have to stop all containers, pull the new image, and start everything again, which would cause downtime. Kubernetes makes updates much safer and easier to manage.

## Q7: Why do the frontend and API use Deployments while the database uses a StatefulSet?

The frontend and API use Deployments because they are stateless – they don't store any important data and any pod can replace another. The database uses a StatefulSet because it stores important data that needs to be preserved. StatefulSets give each pod a permanent name and storage that stays with it, even if the pod moves or restarts. This is essential for databases that need to keep their data safe.

## Q8: Would the data survive without a PersistentVolumeClaim?

No, the data would be lost if we didn't have a PersistentVolumeClaim (PVC). Without a PVC, the database stores its data inside the container, which gets deleted when the pod is removed. With a PVC, the data is stored in a separate volume that stays around even after the pod is gone. That's why we need PVCs for databases – to make sure we don't lose important data.

## Q9: What status did the broken Pod show?

The broken pod showed `ErrImagePull` and then `ImagePullBackOff`. These statuses mean Kubernetes couldn't download the container image I specified. The image tag I used (`nginx:definitely-not-a-real-tag`) doesn't actually exist on Docker Hub, so Kubernetes tried and failed to pull it, then kept trying with longer delays between attempts. This is a common mistake when the image name is misspelled or doesn't exist.
