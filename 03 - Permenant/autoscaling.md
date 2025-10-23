---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Autoscaling

## Overview
Autoscaling in Kubernetes allows you to dynamically adjust the number of Pods or nodes in your cluster based on resource usage or custom metrics. This ensures optimal resource utilization, cost efficiency, and application performance.

## Key Concepts

### 1. **Horizontal Pod Autoscaler (HPA)**
   - **Definition**: Automatically scales the number of Pods in a Deployment, ReplicaSet, or StatefulSet based on CPU, memory, or custom metrics.
   - **Purpose**: Ensures that your application can handle increased load by adding more Pods or reducing Pods during low traffic.

### 2. **Vertical Pod Autoscaler (VPA)**
   - **Definition**: Adjusts the resource requests and limits (CPU and memory) of Pods based on historical usage.
   - **Purpose**: Optimizes resource allocation for individual Pods, reducing waste and improving performance.

### 3. **Cluster Autoscaler**
   - **Definition**: Automatically adjusts the size of the Kubernetes cluster by adding or removing nodes.
   - **Purpose**: Ensures that there are enough nodes to schedule Pods while minimizing costs.

### 4. **Metrics for Autoscaling**
   - **CPU and Memory Usage**: Default metrics used by HPA.
   - **Custom Metrics**: Application-specific metrics (e.g., requests per second, queue length) can be used for scaling.
   - **External Metrics**: Metrics from external systems (e.g., cloud provider metrics) can also be used.

## How It Works

### 1. **Horizontal Pod Autoscaler (HPA)**
   - HPA continuously monitors the metrics (e.g., CPU usage) of the target resource (e.g., Deployment).
   - If the metric exceeds the target value, HPA increases the number of Pods.
   - If the metric is below the target value, HPA decreases the number of Pods.

### 2. **Vertical Pod Autoscaler (VPA)**
   - VPA analyzes historical resource usage of Pods.
   - It recommends or automatically updates resource requests and limits for Pods.
   - VPA can also restart Pods to apply new resource settings.

### 3. **Cluster Autoscaler**
   - Cluster Autoscaler monitors unschedulable Pods (Pods that cannot be scheduled due to insufficient resources).
   - It adds nodes to the cluster if there are unschedulable Pods.
   - It removes nodes if they are underutilized for a specified period.

## Example: Horizontal Pod Autoscaler (HPA)

### HPA Definition
```yaml
apiVersion: autoscaling/v2beta2
kind: HorizontalPodAutoscaler
metadata:
  name: example-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: example-deployment
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
```

### Explanation

- **scaleTargetRef**: The target resource to scale (e.g., a Deployment named `example-deployment`).    
- **minReplicas**: The minimum number of Pods (2 in this case).
- **maxReplicas**: The maximum number of Pods (10 in this case).
- **metrics**: The metric to use for scaling (CPU utilization at 50% in this case).

## Best Practices

### 1. **Set Appropriate Metrics**

- Choose metrics that accurately reflect your application's performance (e.g., CPU, memory, or custom metrics).
- Avoid scaling based on metrics that fluctuate frequently.

### 2. **Configure Min and Max Replicas**

- Set `minReplicas` to ensure availability during low traffi. 
- Set `maxReplicas` to prevent excessive scaling and resource consumption.

### 3. **Monitor and Adjust**

- Use monitoring tools (e.g., Prometheus, Grafana) to track autoscaling behavior.
- Adjust HPA, VPA, or Cluster Autoscaler settings based on observed performance.

### 4. **Combine HPA and VPA**

- Use HPA for scaling the number of Pods and VPA for optimizing resource requests and limits.
