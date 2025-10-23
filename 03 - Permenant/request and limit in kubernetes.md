---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Request And Limit

## Overview
Resource requests and limits are critical for managing compute resources (CPU and memory) in Kubernetes. They ensure that Pods have the necessary resources to run efficiently while preventing resource exhaustion on nodes.

## Key Concepts

### 1. **Resource Requests**
   - **Definition**: The minimum amount of CPU or memory that a Pod is guaranteed to receive.
   - **Purpose**: Used by the Kubernetes scheduler to decide which node can accommodate the Pod.
   - **Example**: A Pod with a CPU request of `500m` (500 millicores) will be scheduled on a node with at least `500m` of available CPU.

### 2. **Resource Limits**
   - **Definition**: The maximum amount of CPU or memory that a Pod is allowed to use.
   - **Purpose**: Prevents a Pod from consuming excessive resources, which could starve other Pods on the same node.
   - **Example**: A Pod with a memory limit of `1Gi` will be terminated if it tries to use more than 1 gigabyte of memory.

### 3. **Quality of Service (QoS) Classes**
   - Kubernetes assigns a QoS class to each Pod based on its resource requests and limits:
     - **Guaranteed**: Requests and limits are set and equal for both CPU and memory.
     - **Burstable**: Requests are set, but limits are either not set or higher than requests.
     - **BestEffort**: No requests or limits are set.

### 4. **Resource Units**
   - **CPU**: Measured in millicores (e.g., `500m` = 0.5 CPU cores).
   - **Memory**: Measured in bytes (e.g., `1Gi` = 1 gibibyte, `512Mi` = 512 mebibytes).

## How It Works

### 1. **Scheduling**
   - The Kubernetes scheduler uses resource requests to determine which node has sufficient resources to run the Pod.
   - If a node cannot meet the Pod's requests, the Pod remains in a pending state.

### 2. **Resource Enforcement**
   - The kubelet enforces resource limits on each node.
   - If a Pod exceeds its CPU limit, it may be throttled.
   - If a Pod exceeds its memory limit, it may be terminated (OOMKilled).

### 3. **QoS Class Impact**
   - **Guaranteed**: Highest priority, least likely to be evicted.
   - **Burstable**: Medium priority, may be evicted under resource pressure.
   - **BestEffort**: Lowest priority, most likely to be evicted.

## Example: Setting Requests and Limits

### Pod Definition with Requests and Limits
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: app-container
    image: nginx
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
```

### Explanation

- **Requests**: The Pod is guaranteed `64Mi` of memory and `250m` of CPU.   
- **Limits**: The Pod is not allowed to use more than `128Mi` of memory or `500m` of CPU.
## Best Practices

### 1. **Set Realistic Requests and Limits**

- Base requests and limits on actual usage metrics (e.g., from monitoring tools like Prometheus).
- Avoid over-provisioning or under-provisioning.
### 2. **Monitor and Adjust**

- Use tools like `kubectl top` or monitoring solutions to track resource usage.
- Adjust requests and limits as application requirements change.

### 3. **Use Horizontal Pod Autoscaler (HPA)**

- Combine resource requests with HPA to automatically scale Pods based on CPU or memory usage.
### 4. **Avoid BestEffort Pods**

- Always set at least resource requests to ensure predictable scheduling and performance.
