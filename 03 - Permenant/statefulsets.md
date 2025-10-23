---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Topic: StatefulSets

## Overview
A **StatefulSet** is a Kubernetes resource used to manage stateful applications. Unlike Deployments, which are designed for stateless applications, StatefulSets provide guarantees about the ordering and uniqueness of Pods. They are ideal for applications that require stable network identities, persistent storage, and ordered deployment and scaling.

## Key Concepts

### 1. **What is a StatefulSet?**
- A StatefulSet manages the deployment and scaling of a set of Pods with unique, stable identities.
- Each Pod in a StatefulSet has a unique, persistent identifier (e.g., `web-0`, `web-1`, `web-2`) that is maintained across rescheduling.
- StatefulSets are used for applications that require:
  - Stable, unique network identifiers.
  - Stable, persistent storage.
  - Ordered, graceful deployment and scaling.

### 2. **StatefulSet vs. Deployment**
- **Deployment**: Used for stateless applications. Pods are interchangeable, and there is no guarantee of ordering or uniqueness.
- **StatefulSet**: Used for stateful applications. Pods are not interchangeable, and they have stable identities and storage.

### 3. **Stable Network Identity**
- Each Pod in a StatefulSet gets a unique hostname based on its ordinal index (e.g., `web-0`, `web-1`).
- The Pods are reachable via a stable network identity, even if they are rescheduled to a different node.

### 4. **Stable Persistent Storage**
- StatefulSets use **PersistentVolumeClaims (PVCs)** to provide stable storage for each Pod.
- When a Pod is rescheduled, it retains its associated storage, ensuring data persistence.

### 5. **Ordered Deployment and Scaling**
- Pods in a StatefulSet are created and deleted in a strict order (e.g., `web-0`, then `web-1`, then `web-2`).
- Scaling up or down follows the same order, ensuring predictable behavior.

### 6. **Pod Management Policy**
- StatefulSets support two Pod management policies:
  - **OrderedReady**: Pods are created and deleted in order (default).
  - **Parallel**: Pods are created and deleted in parallel, without waiting for the previous Pod to be ready.

### 7. **Headless Service**
- StatefulSets are typically used with a **headless Service** (a Service without a cluster IP).
- The headless Service allows direct access to individual Pods using their stable network identities.

### 8. **StatefulSet Specifications (YAML)**
- StatefulSets are defined using a YAML or JSON manifest file. Below is an example of a StatefulSet specification:

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: web
spec:
  serviceName: "nginx"
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.19
        ports:
        - containerPort: 80
          name: web
        volumeMounts:
        - name: www
          mountPath: /usr/share/nginx/html
  volumeClaimTemplates:
  - metadata:
      name: www
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
```

### 9. **Use Cases for StatefulSets**

- Databases (e.g., MySQL, PostgreSQL, MongoDB).    
- Distributed systems (e.g., Kafka, Zookeeper, Elasticsearch).
- Applications requiring stable network identities and persistent storage.
### 10. **Best Practices**

- Use a headless Service to manage network identities for StatefulSet Pods.
- Define `volumeClaimTemplates` to provide persistent storage for each Pod.
- Use `OrderedReady` Pod management for applications that require strict ordering.
- Monitor and back up persistent storage to prevent data loss.
