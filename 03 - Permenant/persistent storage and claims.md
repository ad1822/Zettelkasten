---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Persistent Storage and Claims

## Overview
In Kubernetes, **Persistent Storage** ensures that data persists beyond the lifecycle of a pod. Containers are ephemeral, meaning their local storage is tied to the pod's lifecycle. Persistent Storage allows data to survive pod restarts, failures, or rescheduling.

To manage persistent storage, Kubernetes uses **Persistent Volumes (PVs)** and **Persistent Volume Claims (PVCs)**.

---

## Key Concepts

### 1. Persistent Volume (PV)
- A **Persistent Volume (PV)** is a piece of storage provisioned in the cluster.
- It can be dynamically provisioned by the cluster or manually created by an administrator.
- PVs are independent of pods and have a lifecycle separate from the pods that use them.
- Examples of storage backends: NFS, AWS EBS, GCP Persistent Disks, Azure Disks, Ceph, etc.

#### PV Attributes:
- **Capacity**: Size of the storage (e.g., 10Gi).
- **Access Modes**: Defines how the volume can be accessed:
  - `ReadWriteOnce (RWO)`: Read-write by a single node.
  - `ReadOnlyMany (ROX)`: Read-only by multiple nodes.
  - `ReadWriteMany (RWX)`: Read-write by multiple nodes.
- **Reclaim Policy**: What happens to the PV when the PVC is deleted:
  - `Retain`: Keeps the PV and its data.
  - `Delete`: Deletes the PV and its data.
  - `Recycle`: Deprecated; deletes data and makes the PV available for reuse.

---

### 2. Persistent Volume Claim (PVC)
- A **Persistent Volume Claim (PVC)** is a request for storage by a user or application.
- It specifies the size, access modes, and storage class required.
- Kubernetes binds the PVC to an available PV that matches the criteria.

#### PVC Attributes:
- **Storage Class**: Defines the type of storage (e.g., SSD, HDD).
- **Access Modes**: Same as PV (RWO, ROX, RWX).
- **Resources**: Requests a specific amount of storage (e.g., 5Gi).

---

### 3. Storage Class (SC)
- A **Storage Class** defines the "class" of storage (e.g., fast SSD, slow HDD).
- It enables dynamic provisioning of PVs.
- Administrators can define multiple storage classes to offer different types of storage.

#### Key Parameters:
- `provisioner`: The storage backend (e.g., AWS EBS, GCP Persistent Disk).
- `reclaimPolicy`: Determines what happens to the PV when the PVC is deleted.
- `volumeBindingMode`: Controls when PV binding occurs (`Immediate` or `WaitForFirstConsumer`).

---

## How PVs and PVCs Work Together
1. **Admin Provisions PVs**:
   - The cluster administrator creates PVs manually or sets up a storage class for dynamic provisioning.
2. **User Creates PVC**:
   - The user creates a PVC with specific requirements (e.g., size, access mode).
3. **Kubernetes Binds PVC to PV**:
   - Kubernetes finds a PV that matches the PVC's requirements and binds them.
4. **Pod Uses PVC**:
   - The pod references the PVC in its volume configuration, and the PVC provides access to the PV.

---

## Example YAML Definitions

### Persistent Volume (PV)
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: manual
  hostPath:
    path: /mnt/data
```
### Persistent Volume Claim (PVC)

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
  storageClassName: manual
```

### Pod Using PVC

```
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
    - name: my-container
      image: nginx
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: my-storage
  volumes:
    - name: my-storage
      persistentVolumeClaim:
        claimName: my-pvc
```

## Dynamic Provisioning

- Dynamic provisioning eliminates the need for administrators to manually create PVs.
- When a PVC is created, Kubernetes automatically provisions a PV based on the specified storage class.

```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast
provisioner: kubernetes.io/aws-ebs
parameters:
  type: gp2
reclaimPolicy: Delete
volumeBindingMode: Immediate
```

## Use Cases

1. **Stateful Applications**: Databases (e.g., MySQL, PostgreSQL) require persistent storage to retain data.
2. **Shared Storage**: Applications that need shared access to files (e.g., NFS, RWX volumes).
3. **Backup and Restore**: Persistent storage is essential for backup solutions.

---

## Best Practices

1. **Use Dynamic Provisioning**: Reduces administrative overhead.  
2. **Define Resource Requests**: Always specify storage requests in PVCs to avoid over-provisioning.
3. **Monitor Storage Usage**: Use tools like Prometheus or Kubernetes Metrics Server to monitor PV and PVC usage.
4. **Backup Data**: Regularly back up data stored in PVs to avoid data loss.

---

## Common Issues

1. **Pending PVCs**: PVCs remain pending if no matching PV is available. 
2. **Storage Class Mismatch**: Ensure the PVC specifies the correct storage class.
3. **Access Mode Mismatch**: Ensure the PVC's access mode matches the PV's capabilities.

---

## Summary

- **Persistent Volumes (PVs)**: Represent physical storage resources.    
- **Persistent Volume Claims (PVCs)**: Requests for storage by users or applications.
- **Storage Classes**: Enable dynamic provisioning and define storage types.
- Persistent storage is critical for stateful applications and ensures data durability in Kubernetes.
