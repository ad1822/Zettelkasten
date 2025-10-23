---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Canary Deployment in Kubernetes

Canary deployment is a strategy used to roll out updates to a small subset of users or servers before making them available to the entire infrastructure. This approach helps minimize the risk of introducing a new version of an application by gradually exposing it to a limited audience. If the new version performs well, it can be rolled out to the rest of the infrastructure. If issues are detected, the rollout can be halted, and the previous version can be restored.

In Kubernetes, Canary deployment is typically implemented using a combination of **Deployments**, **Services**, and **Ingress** resources. The idea is to run two versions of an application simultaneously: the **stable version** and the **canary version**. Traffic is then split between these two versions, with the majority of traffic going to the stable version and a small percentage directed to the canary version.

---

## How Canary Deployment Works in Kubernetes

1. **Stable Version Deployment**: The existing version of the application is deployed and serves the majority of the traffic.
2. **Canary Version Deployment**: A new version of the application is deployed alongside the stable version, but it only receives a small percentage of the traffic.
3. **Traffic Splitting**: Traffic is split between the stable and canary versions using Kubernetes features like **Service** and **Ingress** or tools like **Istio** or **NGINX Ingress Controller**.
4. **Monitoring and Validation**: The canary version is monitored for performance, errors, and other metrics. If it performs well, the rollout is expanded. If issues are detected, the rollout is halted or rolled back.

---

## Steps to Implement Canary Deployment in Kubernetes

### 1. Deploy the Stable Version

Create a Deployment for the stable version of your application and expose it using a Service.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: stable-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
      version: stable
  template:
    metadata:
      labels:
        app: my-app
        version: stable
    spec:
      containers:
      - name: my-app
        image: my-app:stable
        ports:
        - containerPort: 80

---

apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80

```

### 2. Deploy the Canary Version

Create a Deployment for the canary version of your application. This version will run alongside the stable version but with fewer replicas.

```yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: canary-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: my-app
      version: canary
  template:
    metadata:
      labels:
        app: my-app
        version: canary
    spec:
      containers:
      - name: my-app
        image: my-app:canary
        ports:
        - containerPort: 80


```



### 4. Monitor the Canary Version

Use monitoring tools like **Prometheus**, **Grafana**, or **Kubernetes Metrics Server** to monitor the performance of the canary version. Key metrics to monitor include:

- Error rates
- Latency
- CPU and memory usage
- Request rates

---

### 5. Rollout or Rollback

- **If the canary version performs well**: Gradually increase the traffic to the canary version by adjusting the traffic-splitting configuration. Eventually, replace the stable version with the canary version.    
- **If the canary version has issues**: Roll back by directing all traffic to the stable version and fixing the issues in the canary version.
---

## Advantages of Canary Deployment

1. **Risk Mitigation**: Limits the impact of potential bugs or issues by exposing them to a small subset of users. 
2. **Gradual Rollout**: Allows for controlled and gradual rollout of new features.
3. **Real-World Testing**: Enables testing of new versions in a production environment with real traffic.
4. **Easy Rollback**: Simplifies the process of rolling back to the previous version if issues arise.

---

## Challenges of Canary Deployment

1. **Complexity**: Requires careful configuration of traffic splitting and monitoring.  
2. **Resource Overhead**: Running multiple versions of an application simultaneously can increase resource usage.
3. **Tooling Dependency**: Often relies on external tools like Istio or NGINX Ingress Controller for advanced traffic management.

---

## Tools for Canary Deployment in Kubernetes

1. **Istio**: A service mesh that provides advanced traffic management features for canary deployments.
2. **NGINX Ingress Controller**: Supports canary deployments through annotations.
3. **Flagger**: A Kubernetes operator that automates canary deployments  using Istio, NGINX, or other service meshes.
4. **Argo Rollouts**: A Kubernetes controller that supports advanced deployment strategies like canary and blue-green deployments.
