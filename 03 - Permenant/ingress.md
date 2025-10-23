---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Ingress

## Overview
Kubernetes provides several ways to expose applications to external traffic. While Services like **NodePort** and **LoadBalancer** can be used, **Ingress** is a more advanced and flexible solution for managing external access. Ingress allows you to define rules for routing HTTP/HTTPS traffic to Services within the cluster.

## Key Concepts

### 1. **Methods for External Access**
There are several ways to expose applications externally in Kubernetes:

#### a. **NodePort**
- Exposes the Service on a static port on each node's IP address.
- Accessible externally using `<NodeIP>:<NodePort>`.
- Not ideal for production due to manual management of node IPs and ports.

#### b. **LoadBalancer**
- Exposes the Service externally using a cloud provider's load balancer.
- Automatically assigns an external IP address.
- Suitable for production but can be expensive and limited to cloud environments.

#### c. **Ingress**
- A more advanced and flexible way to manage external access.
- Uses an **Ingress Controller** to route HTTP/HTTPS traffic to Services based on rules.
- Supports features like SSL/TLS termination, path-based routing, and virtual hosting.

### 2. **What is Ingress?**
- Ingress is an API object that manages external access to Services in a cluster.
- It acts as a layer 7 (HTTP/HTTPS) load balancer, providing features like:
  - Host-based routing.
  - Path-based routing.
  - SSL/TLS termination.
- Requires an **Ingress Controller** to implement the Ingress rules.

### 3. **Ingress Controller**
- An Ingress Controller is a component that fulfills the Ingress rules.
- Popular Ingress Controllers include:
  - **NGINX Ingress Controller**
  - **Traefik**
  - **HAProxy**
  - **AWS ALB Ingress Controller**
- The Ingress Controller is responsible for:
  - Listening for incoming traffic.
  - Routing traffic based on Ingress rules.
  - Terminating SSL/TLS.

### 4. **Ingress Rules**
- Ingress rules define how external traffic should be routed to Services.
- Rules are based on:
  - **Host**: The domain name (e.g., `example.com`).
  - **Path**: The URL path (e.g., `/api`).
  - **Backend**: The Service and port to which traffic should be forwarded.

### 5. **SSL/TLS Termination**
- Ingress supports SSL/TLS termination, allowing you to secure traffic with HTTPS.
- Certificates can be managed manually or automatically using tools like **Cert-Manager**.

### 6. **Ingress Specifications (YAML)**
- Ingress resources are defined using a YAML or JSON manifest file. Below is an example of an Ingress specification:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  tls:
    - hosts:
        - example.com
      secretName: example-tls
  rules:
    - host: example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web-service
                port:
                  number: 80
