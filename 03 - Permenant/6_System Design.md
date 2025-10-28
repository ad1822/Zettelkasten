---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# 6_System Design

## **1. Monolithic Architecture**  

A monolithic application is built as a **single, unified unit** where all components (UI, business logic, database access) are tightly coupled and deployed together.  

### **Diagram**  

```
┌─────────────────────────────────────────────────────┐
│                   MONOLITHIC APP                    │
│                                                     │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │    User     │  │   Orders    │  │  Inventory  │  │
│  │  Interface  │  │  Service    │  │  Service    │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
│                                                     │
│  ┌───────────────────────────────────────────────┐  │
│  │                  Database                    │  │
│  └───────────────────────────────────────────────┘  │
│                                                     │
└─────────────────────────────────────────────────────┘
```

- All components run in **one process**.  
- **Single codebase** and **shared database**.  
- Scaling requires **duplicating the entire app**.  
- Use a local calls for **interaction**.

### **Pros ✅**  
✔ **Simple to develop & deploy** (single codebase).  
✔ **Easier testing** (end-to-end tests in one place).  
✔ **No cross-service communication overhead**.  

### **Cons ❌**  
❌ **Hard to scale** (must scale the entire app, not just busy modules).  
❌ **Tight coupling** – A bug in one module can crash the whole system.  
❌ **Slower development** – Large teams work on the same codebase, leading to conflicts.  
❌ **Difficult to adopt new technologies** (must upgrade everything at once).  

---

## **2. Microservices Architecture**  

Microservices break an application into **small, independent services**, each running in its own process and communicating via APIs (often HTTP/REST or message queues).  

### **Diagram**  
```
┌─────────────┐  ┌─────────────┐  ┌─────────────┐
│   User      │  │   Orders    │  │  Inventory  │
│  Service    │  │  Service    │  │  Service    │
└──────┬──────┘  └──────┬──────┘  └──────┬──────┘
       │                │                │
       ▼                ▼                ▼
┌───────────────────────────────────────────────┐
│               API Gateway / Load Balancer     │
└───────────────────────────────────────────────┘
       ▲                ▲                ▲
       │                │                │
┌──────┴──────┐  ┌──────┴──────┐  ┌──────┴──────┐
│  Auth DB    │  │  Orders DB  │  │  Inventory  │
│             │  │             │  │    DB       │
└─────────────┘  └─────────────┘  └─────────────┘
```

- Each service has **its own database** (or schema).  
- Services communicate via **APIs or message queues** (e.g., REST, gRPC, Kafka).  
- **Independent scaling & deployment**.  
- Use **network calls** for **interaction**.
- microservices design are created using Domain driven design which also maps to the actual business function.
### **Pros ✅**  
✔ **Scalability** – Scale only the services under heavy load.  
✔ **Fault isolation** – One service crashing doesn’t bring down the whole system.  
✔ **Flexibility** – Different services can use different tech stacks (Node.js, Python, Go).  
✔ **Faster development** – Teams work independently on different services.  

### **Cons ❌**  
❌ **Complexity** – Requires service discovery, load balancing, distributed logging.  
❌ **Network overhead** – Inter-service calls introduce latency.  
❌ **Harder testing** – End-to-end tests require mocking multiple services.  
❌ **Data consistency** – Requires **distributed transactions** (Saga pattern, eventual consistency).  

---

## **3. When to Use Which?**  

| Factor                | Monolithic | Microservices |
| --------------------- | ---------- | ------------- |
| **Team Size**         | Small      | Large         |
| **Scalability Needs** | Low        | High          |
| **Deployment Speed**  | Simple     | Complex       |
| **Tech Flexibility**  | Limited    | High          |
| **Fault Tolerance**   | Low        | High          |

### **Choose Monolithic If:**  
- You’re a small team building an MVP.  
- You don’t need high scalability yet.  
- You want simple deployment & testing.  

### **Choose Microservices If:**  
- You have multiple teams working independently.  
- You need to scale specific components.  
- You want to use different technologies per service.  

---

## **4. Real-World Examples**  
- **Monolith**: Early-stage startups (e.g., first version of Facebook, Shopify).  
- **Microservices**: Netflix, Uber, Amazon (scalability & independent deployments).  

---

