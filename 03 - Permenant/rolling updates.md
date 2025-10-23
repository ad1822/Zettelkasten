---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Rolling Updates

## Overview
Rolling Update is a deployment strategy in Kubernetes that gradually replaces instances of the old version of an application with the new version. This approach ensures that the application remains available during the update process, minimizing downtime and providing a smooth transition.

---

## Key Concepts

1. **Incremental Replacement**: Pods running the old version are replaced one by one with Pods running the new version.
2. **Controlled Rollout**: Kubernetes ensures that a specified number of Pods are always available during the update.
3. **Rollback Capability**: If the new version has issues, the rollout can be paused or rolled back to the previous version.

---

## Benefits of Rolling Updates

- **Minimal Downtime**: The application remains available during the update process.
- **Gradual Deployment**: Reduces risk by deploying the new version incrementally.
- **Automated Process**: Kubernetes handles the rollout process automatically.
- **Rollback Support**: Easily revert to the previous version if issues arise.

---

## How Rolling Updates Work in Kubernetes

1. **Update the Deployment**:
   - Modify the Deployment's Pod template (e.g., update the container image).
   - Kubernetes detects the change and initiates the rolling update.

2. **Create New Pods**:
   - Kubernetes creates new Pods with the updated version while keeping the old Pods running.

3. **Replace Old Pods**:
   - Kubernetes gradually replaces old Pods with new Pods, ensuring that the desired number of replicas is always available.

4. **Monitor the Rollout**:
   - Use `kubectl rollout status` to monitor the progress of the update.
   - If issues are detected, pause or roll back the update.

5. **Complete the Rollout**:
   - Once all old Pods are replaced, the rolling update is complete.

---

## Example Kubernetes Configuration

### Deployment Definition
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1          # Maximum number of Pods that can be created over the desired number.
      maxUnavailable: 0    # Maximum number of Pods that can be unavailable during the update.
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: app
        image: my-app:v1    # Update this to `my-app:v2` for a rolling update.
        ports:
        - containerPort: 8080
```  

---

## Rolling Update Parameters

- **`maxSurge`**: The maximum number of Pods that can be created over the desired number of replicas during the update.
    
    - Example: If `replicas: 3` and `maxSurge: 1`, Kubernetes can create up to 4 Pods during the update.
        
- **`maxUnavailable`**: The maximum number of Pods that can be unavailable during the update.
    
    - Example: If `replicas: 3` and `maxUnavailable: 1`, at least 2 Pods will remain available during the update.
        


---

## Best Practices

1. **Test Before Deployment**: Ensure the new version is thoroughly tested before rolling it out.
2. **Monitor Metrics**: Monitor application performance and error rates during the rollout.
3. **Use Readiness Probes**: Ensure Pods are ready to serve traffic before they are added to the Service.
4. **Set Appropriate `maxSurge` and `maxUnavailable`**: Balance between deployment speed and application availability.
5. **Automate Rollbacks**: Use CI/CD pipelines to automate rollbacks if issues are detected.

---

## Challenges

- **Resource Usage**: Rolling updates may temporarily increase resource usage due to overlapping old and new Pods.
- **Database Compatibility**: Ensure database schema changes are backward-compatible.
- **Long Rollout Times**: Large deployments may take longer to complete the rollout.
---
