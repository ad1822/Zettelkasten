---
cssclasses:
  - center-images
  - center-titles
---
Tags: #aws

# **Cloud Computing**  

## **1. Scaling**  
### **Vertical Scaling (Scale-Up)**  
- **Definition**: Increase the capacity of a single machine (e.g., CPU, RAM, storage).  
- **Pros**:  
  - Simple to implement (no architectural changes).  
  - Suitable for applications not designed for distributed systems.  
- **Cons**:  
  - Limited by hardware constraints (max CPU/RAM).  
  - Higher cost (premium for high-end hardware).  
  - Single point of failure.  

### **Horizontal Scaling (Scale-Out)**  
- **Definition**: Add more machines/nodes to distribute the workload.  
- **Pros**:  
  - Cost-effective (commodity hardware).  
  - High availability (no single point of failure).  
  - Elasticity (can scale dynamically).  
- **Cons**:  
  - Requires distributed system design (e.g., stateless apps, shared storage).  
  - Load balancing needed.  

### **Auto Scaling**  
- **Definition**: Automatically adjusts resources based on traffic (e.g., AWS Auto Scaling, Kubernetes HPA).  
- **Use Cases**:  
  - Handling unpredictable traffic spikes.  
  - Cost optimization (scale down during low demand).  
- **Components**:  
  - Scaling policies (CPU/memory-based, schedule-based).  
  - Health checks (replace unhealthy instances).  

---

## **2. Load Balancing**  
- **Purpose**: Distributes incoming traffic across multiple servers to improve responsiveness and availability.  
- **Types**:  
  - **Application Load Balancer (ALB)**: Routes based on HTTP/HTTPS content (Layer 7).  
  - **Network Load Balancer (NLB)**: Handles TCP/UDP traffic (Layer 4).  
  - **Global Load Balancer (GLB)**: Distributes traffic across regions (e.g., AWS Global Accelerator).  
- **Key Features**:  
  - Health checks (removes failed instances).  
  - SSL termination (offloads encryption).  
  - Session persistence (stickiness).  

---

## **3. Serverless Computing**  
### **AWS Lambda & Serverless Models**  
- **Definition**: Run code without managing servers; cloud provider handles scaling, patching, and provisioning.  
- **Use Cases**:  
  - Event-driven processing (e.g., file uploads, API calls).  
  - Short-lived, stateless functions.  
- **Pros**:  
  - No server management.  
  - Pay-per-execution pricing.  
  - Automatic scaling.  
- **Cons**:  
  - Cold start latency.  
  - Limited execution time (~15 mins in AWS Lambda).  
  - Vendor lock-in risk.  

### **Serverless Services**  
- **Compute**: AWS Lambda, Azure Functions, Google Cloud Functions.  
- **Storage**: AWS S3, Google Cloud Storage.  
- **Databases**: DynamoDB, Firestore (NoSQL, auto-scaling).  

---

## **4. Event-Driven Architecture (EDA)**  
- **Definition**: Systems where components communicate via events (asynchronous messaging).  
- **Key Concepts**:  
  - **Event Producers**: Services that emit events (e.g., user actions, IoT sensors).  
  - **Event Consumers**: Services that react to events.  
  - **Event Broker**: Middleware that routes events (e.g., AWS EventBridge, Kafka).  
- **Pros**:  
  - Loose coupling (services don’t need direct API calls).  
  - Scalability (events can be processed in parallel).  
  - Real-time processing.  
- **Use Cases**:  
  - Microservices communication.  
  - Real-time analytics (e.g., fraud detection).  
  - IoT data processing.  

---

## **5. Additional Key Topics**  
### **Containers & Kubernetes**  
- **Containers**: Lightweight, portable runtime environments (e.g., Docker).  
- **Kubernetes (K8s)**: Orchestrates containerized apps (auto-scaling, self-healing).  

### **Microservices**  
- **Definition**: Break apps into small, independent services.  
- **Pros**:  
  - Easier scaling per component.  
  - Faster deployments.  
- **Cons**:  
  - Increased complexity (service discovery, monitoring).  

### **Cloud Storage Types**  
- **Block Storage (EBS, Azure Disk)**: For databases/VMs.  
- **Object Storage (S3, Blob Storage)**: For files, backups.  
- **File Storage (EFS, Azure Files)**: Shared file systems.  

### **Security & Compliance**  
- **Shared Responsibility Model**:  
  - **Cloud Provider**: Secures infrastructure.  
  - **Customer**: Secures data & access.  
- **IAM (Identity & Access Management)**: Role-based permissions.  
- **Encryption**: Data-at-rest (AES-256) & in-transit (TLS).  

### **Multi-Cloud & Hybrid Cloud**  
- **Multi-Cloud**: Using multiple providers (e.g., AWS + Azure).  
- **Hybrid Cloud**: Mix of on-premises + cloud (e.g., AWS Outposts).  
