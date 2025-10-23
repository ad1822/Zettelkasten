---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Kubernetes

![[kubernetes.png]]

- Open Source container orchestration tool.
- Pods are the smallest unit of k8s. Typically running one or more container. Group containers that need to work closely.
- For managing pods, k8s uses a central control panel that overseas everything. There are some several parts of control panel.
- API server is the front end of k8s that takes your commands and tell cluster what to do.
- Scheduler determines which machine or node in the cluster should run a new pod based on resource availability. 
- control manager ensures that the desired state you define is constantly maintained.
- etcd or hcd is a distributed key value store that keeps track of the current state of the cluster. 
