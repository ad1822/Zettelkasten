---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Storage

- Kubernetes volumes provide a way for containers in a pods to access and share data via the filesystem. There are different kinds of volumes that you can use for different  purposes.  

### Problems without Volumes
1. Data Persistence : 
- Once a running container crashes or is stopped, the container state is not saved so all of the files that were created or modified during the lifetime of the container are lost. During a crash, kubectl restarts the container with a clean state.

2. Shared Storage : 
- Another problem occurs when multiple containers are running in a Pod and need to share files. It can be challenging to setup and access a shared filesystem across all of the container.

### How Volumes works
- Kubernetes supports many types of volumes. A [Pod](https://kubernetes.io/docs/concepts/workloads/pods/) can use any number of volume types simultaneously. [Ephemeral volume](https://kubernetes.io/docs/concepts/storage/ephemeral-volumes/) types have a lifetime of a pod, but [persistent volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) exist beyond the lifetime of a pod. When a pod ceases to exist, Kubernetes destroys ephemeral volumes; however, Kubernetes does not destroy persistent volumes. For any kind of volume in a given pod, data is preserved across container restarts.
- At its core, a volume is a directory, possible with some data in it. which is accessible to the containers in a pod. How that directory comes to be, the medium that backs it, and the contents of it are determined by the particular volumes type used.
- To use a volume, specify the volumes to provide for the Pod in `.spec.volumes` and declare where to mount those volumes into containers in `.spec.containers[*].volumeMounts`.

### ConfigMap
- A ConfigMap provides a way to inject configuration data into pods. The data stored in a ConfigMap can be referenced in a volume of type `configMap` and then consumed by containerized applications running in a pod.
