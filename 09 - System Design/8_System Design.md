---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# 8_System Design

Caching is a critical technique for improving performance, reducing latency, and decreasing load on backend systems in distributed architectures. Below is a structured breakdown of caching strategies, challenges, and best practices.

---

## **1. What is Caching?**
Caching stores frequently accessed data in **fast-access storage** (memory) to avoid repeated expensive computations or database queries.

### **Key Benefits:**
✔ **Reduces latency** (faster responses)  
✔ **Lowers database load** (fewer repeated queries)  
✔ **Improves scalability** (handles more requests with the same resources)  

### **Where Caching is Used:**
- Web applications (HTTP caching, CDNs)  
- Databases (query caching)  
- Microservices (distributed caching)  
- APIs (response caching)  

---

## **2. Types of Caching in Distributed Systems**

### **A. Client-Side Caching**
- **Browser Cache**: Stores static assets (JS, CSS, images) locally.  
- **Mobile/Desktop Apps**: Cache API responses to reduce network calls.  

### **B. Server-Side Caching**
| Type                               | Description                            | Example                                     |
| ---------------------------------- | -------------------------------------- | ------------------------------------------- |
| **In-Memory Cache**                | Stores data in RAM (fastest access)    | Redis, Memcached                            |
| **Database Cache**                 | Caches query results                   | MySQL Query Cache, MongoDB WiredTiger Cache |
| **CDN (Content Delivery Network)** | Caches static/dynamic content globally | Cloudflare, Akamai                          |

### **C. Distributed Caching**
- **Shared cache cluster** accessible by multiple services.  
- Examples: **Redis Cluster, Hazelcast, Apache Ignite**  

---

## **3. Common Caching Strategies**

### **A. Cache-Aside (Lazy Loading)**
- **How it works**:  
  1. App checks cache → if data exists (**cache hit**), return it.  
  2. If not (**cache miss**), fetch from DB → store in cache.  
- **Best for**: Read-heavy workloads.  
- **Example**:  
  ```python
  def get_user(user_id):
      user = cache.get(user_id)
      if not user:
          user = db.query("SELECT * FROM users WHERE id = ?", user_id)
          cache.set(user_id, user)
      return user
  ```

### **B. Write-Through Cache**
- **How it works**:  
  - Every write goes **through the cache** → then to DB.  
- **Best for**: Systems needing strong consistency.  
- **Example**:  
  ```python
  def update_user(user):
      cache.set(user.id, user)  # Update cache
      db.update(user)           # Then update DB
  ```

### **C. Write-Behind (Write-Back)**
- **How it works**:  
  - Writes go to cache first → DB is updated **asynchronously**.  
- **Best for**: High-write throughput (e.g., logging, analytics).  
- **Risk**: Data loss if cache crashes before DB write.  

### **D. Read-Through Cache**
- **How it works**:  
  - Cache **automatically** loads data from DB on a miss.  
- **Best for**: Apps with predictable access patterns.  

### **E. Time-to-Live (TTL)**
- **How it works**:  
  - Cached data **expires after a set time**.  
- **Best for**: Data that changes periodically (e.g., stock prices).  

---

## **4. Cache Eviction Policies**
When cache is full, which data gets removed?  

| Policy | Description | Use Case |
|--------|-------------|----------|
| **LRU (Least Recently Used)** | Evicts oldest unused data | General-purpose caching |
| **LFU (Least Frequently Used)** | Evicts least accessed data | Specialized caching (e.g., trending content) |
| **FIFO (First-In-First-Out)** | Evicts oldest data regardless of usage | Simple caching needs |
| **Random Replacement** | Randomly evicts entries | Low-overhead systems |

---

## **5. Challenges in Distributed Caching**

### **A. Cache Invalidation**
- **Problem**: Stale data when DB updates but cache doesn’t.  
- **Solutions**:  
  - **TTL expiration** (simplest but not real-time).  
  - **Pub/Sub invalidation** (e.g., Redis keyspace notifications).  
  - **Write-through caching** (ensures cache & DB sync).  

### **B. Cache Penetration (Cache Miss Storm)**
- **Problem**: Too many requests miss cache → overload DB.  
- **Solution**:  
  - **Cache warm-up** (preload cache at startup).  
  - **Bloom filters** (quickly check if data exists before querying).  

### **C. Cache Stampede (Thundering Herd)**
- **Problem**: Multiple requests **simultaneously** miss cache → all query DB.  
- **Solution**:  
  - **Locking** (only one request fetches data, others wait).  
  - **Background refresh** (update cache before expiry).  

### **D. Cache Consistency**
- **Problem**: Different caches show different values.  
- **Solution**:  
  - **Eventual consistency** (accept temporary mismatches).  
  - **Strong consistency** (use distributed locks or transactions).  

---

## **6. Popular Caching Tools**
| Tool                          | Best For                 | Key Feature                                |
| ----------------------------- | ------------------------ | ------------------------------------------ |
| **Redis**                     | General-purpose caching  | In-memory, supports pub/sub, Lua scripting |
| **Memcached**                 | Simple key-value caching | Multi-threaded, ultra-fast                 |
| **Hazelcast**                 | Distributed caching      | Auto-scaling, in-memory data grid          |
| **CDNs (Cloudflare, Akamai)** | Static/dynamic content   | Global edge caching                        |

---

## **7. Best Practices**
✅ **Use multi-level caching** (e.g., browser → CDN → Redis → DB).  
✅ **Monitor cache hit/miss ratio** (aim for >90% hit rate).  
✅ **Set appropriate TTLs** (balance freshness vs. performance).  
✅ **Shard caches** if single cache becomes a bottleneck.  

---

## **8. When Not to Use Caching?**
❌ **Frequently changing data** (high invalidation overhead).  
❌ **Security-sensitive data** (unless encrypted).  
❌ **Very small datasets** (DB may be fast enough).  

---

### **Final Thoughts**
Caching is **essential** for high-performance distributed systems but requires careful tuning. The right strategy depends on:  
- **Read vs. write patterns**  
- **Consistency needs**  
- **Scalability requirements**  
