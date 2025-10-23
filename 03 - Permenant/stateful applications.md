---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Stateful Applications

## Overview
Stateful applications are applications that require persistent storage, stable network identities, and ordered deployment and scaling. Examples include databases (e.g., MySQL, PostgreSQL), message queues (e.g., Kafka), and distributed systems (e.g., etcd). Kubernetes provides the **StatefulSet** controller to manage stateful applications effectively.

## Key Concepts

### 1. **StatefulSet**
   - **Definition**: A Kubernetes workload API object used to manage stateful applications.
   - **Features**:
     - Stable, unique network identifiers (e.g., `pod-0`, `pod-1`).
     - Persistent storage tied to each Pod.
     - Ordered, graceful deployment and scaling.
     - Ordered, automated rolling updates.

### 2. **Persistent Volume (PV) and Persistent Volume Claim (PVC)**
   - **Persistent Volume (PV)**: A piece of storage in the cluster provisioned by an administrator or dynamically provisioned using a StorageClass.
   - **Persistent Volume Claim (PVC)**: A request for storage by a user. It binds to a PV and provides persistent storage to Pods.

### 3. **Headless Service**
   - **Definition**: A Kubernetes Service without a cluster IP. It is used to control the network domain for StatefulSet Pods.
   - **Purpose**: Provides stable network identities (DNS names) for each Pod in a StatefulSet.

### 4. **Pod Identity**
   - Each Pod in a StatefulSet gets a unique, stable identifier (e.g., `pod-0`, `pod-1`).
   - The identifier remains the same even if the Pod is rescheduled or restarted.

### 5. **Ordered Deployment and Scaling**
   - StatefulSet ensures that Pods are created, updated, and deleted in a specific order (e.g., `pod-0` before `pod-1`).
   - This is critical for applications that require a specific startup sequence (e.g., primary database before replicas).

## How It Works

### 1. **StatefulSet Workflow**
   - A StatefulSet is created with a specified number of replicas.
   - Each Pod in the StatefulSet is created sequentially and assigned a unique, stable identifier.
   - Persistent storage is provisioned for each Pod using PVCs.
   - A Headless Service provides stable network identities for the Pods.

### 2. **Persistent Storage**
   - Each Pod in a StatefulSet gets its own PVC, which binds to a PV.
   - The PVC and PV are tied to the Pod's unique identifier, ensuring that the Pod always gets the same storage, even if it is rescheduled.

### 3. **Network Identity**
   - The Headless Service creates DNS records for each Pod in the StatefulSet.
   - Example: For a StatefulSet named `web`, the Pods will have DNS names like `web-0.web.default.svc.cluster.local`, `web-1.web.default.svc.cluster.local`, etc.

### 4. **Ordered Operations**
   - When scaling up, Pods are created in order (e.g., `pod-0`, then `pod-1`).
   - When scaling down, Pods are deleted in reverse order (e.g., `pod-1`, then `pod-0`).
   - During updates, Pods are updated in order.

## Example: StatefulSet for a Database

### StatefulSet Definition
```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql
spec:
  serviceName: mysql
  replicas: 3
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:5.7
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "password"
        ports:
        - containerPort: 3306
        volumeMounts:
        - name: mysql-data
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-data
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 10Gi
```
## Best Practices

### 1. **Use Persistent Storage**
- Always use PVCs and PVs to ensure data persistence for stateful applications.
### 2. **Configure Resource Requests and Limits**
- Set appropriate resource requests and limits for stateful applications to ensure stable performance.

### 3. **Backup and Restore**
- Regularly back up data from stateful applications to prevent data loss.
- Use tools like Velero for backup and restore operations.

### 4. **Monitor and Scale**
- Monitor resource usage and performance of stateful applications.
- Use StatefulSet's ordered scaling to ensure proper startup and shutdown sequences.
