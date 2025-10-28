---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# 9_System Design

---  
## **1. What is SPOF?**  
- A **critical component** whose failure crashes the entire system.  
- **Examples**:  
  - A single database server.  
  - A monolithic API gateway.  
  - A centralized load balancer.  

## **2. Strategies to Eliminate SPOF**  

### **A. Redundancy (Replication)**  
- **How**: Deploy **multiple copies** of critical components.  
- **Examples**:  
  - **Database Replication**: Master-slave (PostgreSQL, MySQL) or multi-master (Cassandra).  
  - **Stateless Services**: Run multiple instances behind a load balancer.  
  - **Hardware**: Use redundant power supplies, network paths.  

### **B. Load Balancing**  
- **How**: Distribute traffic across redundant systems.  
- **Tools**:  
  - **NGINX** / **HAProxy** (for HTTP).  
  - **DNS Round Robin** (simple but limited).  
  - **Kubernetes Service Mesh** (automatic LB for microservices).  

### **C. Failover Mechanisms**  
- **Active-Passive**: Backup nodes take over when primary fails (e.g., databases).  
- **Active-Active**: All nodes handle traffic (e.g., stateless microservices).  

### **D. Decentralization**  
- **Avoid**: Centralized components (e.g., single message queue).  
- **Use**:  
  - **Distributed Queues** (Kafka partitions, RabbitMQ clusters).  
  - **Peer-to-Peer Systems** (blockchain, IPFS).  

### **E. Graceful Degradation**  
- **How**: Let non-critical features fail while keeping core system alive.  
- **Example**:  
  - Disable recommendations during high load but keep checkout working.  

## **3. Real-World Examples**  
| System | SPOF Avoidance Technique |  
|--------|--------------------------|  
| **Netflix** | Multi-region deployment (Chaos Monkey for failure testing). |  
| **AWS S3** | Cross-region replication + 99.99% SLA. |  
| **Google Search** | Thousands of redundant servers per data center. |  

## **4. Key Tools & Technologies**  
- **Databases**: MongoDB replica sets, Cassandra ring.  
- **Messaging**: Kafka (partitioned topics), RabbitMQ mirrors.  
- **Infrastructure**: Kubernetes (self-healing pods), Terraform (auto-scaling).  

## **5. Challenges & Tradeoffs**  
- **Cost**: Redundancy increases infrastructure expenses.  
- **Complexity**: Distributed systems are harder to debug.  
- **Consistency**: CAP theorem tradeoffs (e.g., eventual consistency).  

---

### **Summary Checklist to Avoid SPOF**  
✅ **Identify critical components** (databases, load balancers).  
✅ **Add redundancy** (replication, clusters).  
✅ **Automate failover** (health checks, Kubernetes liveness probes).  
✅ **Test failures** (Chaos Engineering, e.g., Netflix Simian Army).  
