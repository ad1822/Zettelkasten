---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

## Overview
A **Service** in Kubernetes is an abstraction that defines a logical set of Pods and a policy to access them. Services enable network access to a set of Pods, providing stable IP addresses, DNS names, and load balancing. They are essential for enabling communication between different components of an application, both within and outside the cluster.

![[k8sServices-1.png]]

## Key Concepts

### 1. **What is a Service?**
- A Service provides a stable endpoint (IP address and port) to access a group of Pods.
- It decouples the frontend from the backend, allowing Pods to be replaced or scaled without affecting the application.
- Services use labels and selectors to identify the Pods they manage.

### 2. **Service Types**
Kubernetes supports several types of Services, each serving different use cases:

#### a. **ClusterIP**
- The default Service type.
- Exposes the Service on an internal IP address within the cluster.
- Only accessible from within the cluster.

#### b. **NodePort**
- Exposes the Service on a static port on each node's IP address.
- Accessible from outside the cluster using `<NodeIP>:<NodePort>`.
- Automatically creates a ClusterIP Service as well.

#### c. **LoadBalancer**
- Exposes the Service externally using a cloud provider's load balancer.
- Automatically creates a NodePort and ClusterIP Service.
- Ideal for public-facing applications.

#### d. **ExternalName**
- Maps the Service to an external DNS name (e.g., a service outside the cluster).
- Does not use selectors or forward traffic to Pods.

### 3. **Service Discovery**
- Services are discoverable within the cluster using DNS.
- Each Service gets a DNS name in the format `<service-name>.<namespace>.svc.cluster.local`.
- Pods can communicate with Services using their DNS names.

### 4. **Load Balancing**
- Services distribute traffic evenly across all backend Pods.
- They use kube-proxy to implement load balancing at the network layer.

### 5. **Service Specifications (YAML)**
- Services are defined using a YAML or JSON manifest file. Below is an example of a Service specification:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: ClusterIP
```
 
- Key fields:  
    - `apiVersion`: The Kubernetes API version (e.g., `v1`).
    - `kind`: The type of resource (e.g., `Service`).
    - `metadata`: Information about the Service, such as its name and labels.
    - `spec`: The desired state of the Service.
        - `selector`: Defines which Pods the Service targets using labels.
        - `ports`: Specifies the ports exposed by the Service.
            - `protocol`: The protocol used (e.g., TCP, UDP).
            - `port`: The port exposed by the Service.
            - `targetPort`: The port on the Pods to which traffic is forwarded.
        - `type`: The type of Service (e.g., ClusterIP, NodePort, LoadBalancer).

### 6. **Headless Service**

- A headless Service does not allocate a ClusterIP.    
- It is used for stateful applications where direct access to individual Pods is required.
- DNS resolution returns the IP addresses of the Pods instead of a single Service IP.

### 7. **Use Cases for Services**

- Exposing applications to other Pods within the cluster (ClusterIP).
- Exposing applications to external users (NodePort, LoadBalancer).
- Connecting to external services (ExternalName).
- Managing communication between microservices.
### 8. **Best Practices**

- Use meaningful labels and selectors to manage Services and Pods effectively.
- Use ClusterIP for internal communication and LoadBalancer for external access.
- Avoid using NodePort unless necessary, as it exposes a port on every node.
- Use headless Services for stateful applications that require direct Pod access.
