---
cssclasses:
  - center-images
  - center-titles
---
Tags: #kubernetes

# The Kubernetes Network Model

- Each Pod in a cluster gets its own unique cluster-wide IP address.
- A pod has its own private network namespace which is shared by all of the containers within the pod. Processes running in different containers in the same pod can communicate with each other over `localhost`.
- The Pod Network also called as a cluster network handles communication between pods. It ensures that : 
	- All pods can communicate with all other pods, whether they are on the same [node](https://kubernetes.io/docs/concepts/architecture/nodes/) or on different nodes. Pods can communicate with each other directly, without the use of proxies or address translation (NAT).
    
    - On Windows, this rule does not apply to host-network pods.
    
	- Agents on a node (such as system daemons, or kubelet) can communicate with all pods on that node.

- The service API lets you provide a stable IP address or hostname for a service implemented by one or more backend pods, where the individual pods making up the service can change over time.
	- Kubernetes automatically manages [EndpointSlice](https://kubernetes.io/docs/concepts/services-networking/endpoint-slices/) objects to provide information about the pods currently backing a Service.
	- A service proxy implementation monitors the set of Service and EndpointSlice objects, and programs the data plane to route service traffic to its backends, by using operating system or cloud provider APIs to intercept or rewrite packets.

- The [Gateway](https://kubernetes.io/docs/concepts/services-networking/gateway/) API (or its predecessor, [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)) allows you to make Services accessible to clients that are outside the cluster.
	- A simpler, but less-configurable, mechanism for cluster ingress is available via the Service API's [`type: LoadBalancer`](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer), when using a supported [Cloud Provider](https://kubernetes.io/docs/reference/glossary/?all=true#term-cloud-provider).
### Service

- Expose an application running in your cluster behind a single outward-facing endpoint, even when the workload is split across multiple backends.
### Ingress

- Make your HTTP network service available using a protocol-aware configuration mechanism, that understand web concepts like URIs, hostnames, paths, and more. The concept lets you map traffic to different backends based on rules you define via that Kubernetes API.
### Ingress Controllers

- In order for an [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) to work in your cluster, there must be an _ingress controller_ running. You need to select at least one ingress controller and make sure it is set up in your cluster. This page lists common ingress controllers that you can deploy.

### Gateway API

- Gateway API is a family of API kinds that provide dynamic infrastructure provisioning and advanced traffic routing.
### EndpointSlices

- The EndpointSlice API is the mechanism that Kubernetes uses to let your Service scale to handle large numbers of backends, and allows the cluster to update its list of healthy backends efficiently.

### Network Policies

- If you want to control traffic flow at the IP address or port level (OSI layer 3 or 4), NetworkPolicies allow you to specify rules for traffic flow within your cluster, and also between Pods and the outside world. Your cluster must use a network plugin that supports NetworkPolicy enforcement.

### DNS for services and Pods

- Your workload can discover Services within your cluster using DNS; this page explains how that works.

##### [IPv4/IPv6 dual-stack](https://kubernetes.io/docs/concepts/services-networking/dual-stack/)

- Kubernetes lets you configure single-stack IPv4 networking, single-stack IPv6 networking, or dual stack networking with both network families active. This page explains how.

##### [Topology Aware Routing](https://kubernetes.io/docs/concepts/services-networking/topology-aware-routing/)

- _Topology Aware Routing_ provides a mechanism to help keep network traffic within the zone where it originated. Preferring same-zone traffic between Pods in your cluster can help with reliability, performance (network latency and throughput), or cost.
