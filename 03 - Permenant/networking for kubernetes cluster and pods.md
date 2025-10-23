---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# Networking

## Overview
Kubernetes networking is a fundamental aspect of cluster operations, enabling communication between Pods, Services, and external systems. Pod-to-Pod communication is essential for microservices architectures, where applications are distributed across multiple Pods.

## Key Concepts

### 1. **Kubernetes Networking Model**
   - **IP-per-Pod Model**: Every Pod in Kubernetes is assigned a unique IP address. This IP is reachable from all other Pods in the cluster, regardless of the node they are running on.
   - **Flat Network**: Kubernetes assumes that Pods can communicate with each other directly without NAT (Network Address Translation).

### 2. **Container Network Interface (CNI)**
   - Kubernetes relies on CNI plugins to implement networking. Popular CNI plugins include Calico, Flannel, Weave, and Cilium.
   - CNI plugins handle IP address assignment, routing, and network policies.

### 3. **Pod-to-Pod Communication**
   - **Intra-Node Communication**: Pods on the same node communicate using a virtual network interface (e.g., `veth` pairs) and a bridge (e.g., `cni0`).
   - **Inter-Node Communication**: Pods on different nodes communicate through overlay networks (e.g., VXLAN) or routing rules configured by the CNI plugin.

### 4. **Service Networking**
   - **ClusterIP**: A virtual IP assigned to a Service, enabling internal communication within the cluster.
   - **kube-proxy**: A component that implements Service networking by setting up iptables or IPVS rules to route traffic to the correct Pods.

### 5. **Network Policies**
   - Network Policies allow you to control traffic flow between Pods. They act as firewalls, defining which Pods can communicate with each other.
   - Example: Restrict traffic between namespaces or allow only specific Pods to access a database.

## How It Works

### 1. **Pod IP Assignment**
   - When a Pod is created, the CNI plugin assigns it an IP address from the cluster's CIDR range.
   - The IP is associated with the Pod's network namespace.

### 2. **Intra-Node Communication**
   - Pods on the same node communicate through a virtual Ethernet device (`veth`) connected to a bridge (`cni0`).
   - The bridge forwards traffic between Pods on the same node.

### 3. **Inter-Node Communication**
   - For Pods on different nodes, the CNI plugin sets up routing rules or overlay networks (e.g., VXLAN) to ensure traffic is forwarded correctly.
   - The node's network interface handles traffic between nodes.

### 4. **Service Discovery**
   - Kubernetes DNS (CoreDNS) resolves Service names to ClusterIPs.
   - `kube-proxy` ensures traffic to the ClusterIP is forwarded to the appropriate Pods.

### 5. **Network Policies**
   - Network Policies are enforced by CNI plugins that support them (e.g., Calico, Cilium).
   - Policies are defined using YAML and specify allowed ingress/egress traffic.

## Example: Pod-to-Pod Communication

### Scenario
- Pod A (IP: `10.244.1.2`) needs to communicate with Pod B (IP: `10.244.2.3`).
- Pod A and Pod B are on different nodes.

### Steps
1. Pod A sends a packet to Pod B's IP (`10.244.2.3`).
2. The packet is routed through the node's network interface.
3. The CNI plugin ensures the packet is forwarded to the correct node using overlay networking or routing rules.
4. The destination node receives the packet and forwards it to Pod B.

## Tools and Commands
- **`kubectl get pods -o wide`**: View Pod IPs and nodes.
- **`kubectl describe pod <pod-name>`**: Inspect Pod networking details.
- **`kubectl get networkpolicies`**: List Network Policies.

## Best Practices
- Use Network Policies to enforce security and restrict unnecessary traffic.
- Choose a CNI plugin that aligns with your cluster's requirements (e.g., performance, security).
- Monitor network performance and troubleshoot using tools like `tcpdump` or `cilium monitor`.

---
