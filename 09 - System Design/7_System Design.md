---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# 7_System Design

## **1. What is Database Sharding?**
Database sharding is a **horizontal partitioning** technique that splits a large database into smaller, faster, more manageable pieces called **shards**. Each shard is an independent database that holds a subset of the total data.

### **Key Idea:**
- Instead of storing all data in a single database, distribute it across multiple machines.
- Improves **scalability, performance, and fault tolerance**.

---

## **2. Why Sharding? (Problems it Solves)**
| Problem | Without Sharding | With Sharding |
|---------|----------------|--------------|
| **Scalability** | Single server hits CPU/memory limits | Distributes load across multiple servers |
| **Performance** | Slow queries due to large dataset | Faster queries (smaller datasets per shard) |
| **High Availability** | Single point of failure | Failure in one shard doesn’t crash entire system |
| **Geographical Distribution** | High latency for global users | Shards can be placed closer to users |

---

## **3. How Sharding Works (With Diagram)**
### **Before Sharding (Single Database)**
```
┌─────────────────────────────────┐
│        Monolithic Database      │
│                                 │
│  ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐│
│  │User1│ │User2│ │User3│ │User4││
│  └─────┘ └─────┘ └─────┘ └─────┘│
│                                 │
└─────────────────────────────────┘
```

- All data stored in one database → **Bottleneck under heavy load**.

### **After Sharding (Distributed Shards)**

```
┌─────────────┐   ┌─────────────┐   ┌─────────────┐
│   Shard 1   │   │   Shard 2   │   │   Shard 3   │
│  (Users A-M)│   │  (Users N-R)│   │  (Users S-Z)│
│ ┌─────┐     │   │     ┌─────┐ │   │     ┌─────┐ │
│ │User1│     │   │     │User2│ │   │     │User3│ │
│ └─────┘     │   │     └─────┘ │   │     └─────┘ │
└─────────────┘   └─────────────┘   └─────────────┘
```

- Data is **split by a sharding key** (e.g., user ID, geographic location).
- Each shard operates independently.

---

## **4. Sharding Strategies (With Examples)**
### **A. Range-Based Sharding**
- Splits data based on a **range of values** (e.g., dates, IDs).
- Example:  
  - Shard 1: `User IDs 1-1000`  
  - Shard 2: `User IDs 1001-2000`  

✅ **Pros**: Simple to implement.  
❌ **Cons**: Can lead to **uneven distribution** (hotspots).  

### **B. Hash-Based Sharding**
- Uses a **hash function** (e.g., `user_id % 3`) to assign data to shards.
- Example:  
  - `hash("User123") % 3 = Shard 2`  

✅ **Pros**: Even data distribution.  
❌ **Cons**: Hard to **reshard** (adding new shards requires rehashing).  

### **C. Directory-Based Sharding**
- Uses a **lookup table** to track which shard holds which data.
- Example:  
  ```
  Lookup Table:
  "User1" → Shard 1  
  "User2" → Shard 2  
  ```
✅ **Pros**: Flexible, easy to modify sharding rules.  
❌ **Cons**: Extra overhead to maintain lookup service.  

### **D. Geographic Sharding**
- Data is split by **location** (e.g., US users → Shard 1, EU users → Shard 2).  
✅ **Pros**: Reduces latency for global users.  
❌ **Cons**: Complex to manage.  

---

## **5. Challenges of Sharding**
| Challenge | Solution |
|-----------|----------|
| **Joins Across Shards** | Denormalize data or use application-side joins. |
| **Transactions Spanning Shards** | Use **Saga pattern** or eventual consistency. |
| **Rebalancing Shards** | Use **consistent hashing** to minimize data movement. |
| **Increased Complexity** | Use tools like **Vitess, MongoDB Sharding, or Citus (PostgreSQL)**. |

---

## **6. When to Use Sharding?**
✅ **Use Sharding When:**  
- Your database is too large for a single machine.  
- You need **horizontal scalability** (not just vertical scaling).  
- Read/write throughput is bottlenecked.  

❌ **Avoid Sharding If:**  
- Your dataset fits in a single server.  
- You can solve performance issues with **caching, indexing, or read replicas**.  

---

## **7. Real-World Examples**
- **MongoDB**: Auto-sharding with config servers.  
- **PostgreSQL**: Sharding via Citus extension.  
- **Google Spanner**: Globally distributed sharded database.  

---

## **8. Sharding vs. Partitioning vs. Replication**
| Technique | Description |
|-----------|------------|
| **Sharding** | Splits data **across different machines**. |
| **Partitioning** | Splits data **within the same machine** (e.g., by table). |
| **Replication** | Copies data to **multiple machines** for redundancy. |

---

### **Final Thoughts**
Sharding is a **powerful but complex** technique for scaling databases. It works best when:  
✔ You’ve exhausted vertical scaling options.  
✔ You need **high write scalability**.  
✔ You’re prepared to handle distributed systems challenges.  
