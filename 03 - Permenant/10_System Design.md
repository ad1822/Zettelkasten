---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# 10_System Design

## **1. What is a CDN?**
A **Content Delivery Network (CDN)** is a globally distributed network of servers that delivers web content (images, videos, HTML/CSS/JS, APIs) to users based on their geographic location.

### **Key Benefits:**
✔ **Faster load times** (reduced latency)  
✔ **Lower bandwidth costs** (reduced origin server load)  
✔ **Improved scalability** (handles traffic spikes)  
✔ **Higher availability** (DDoS protection, failover)  

---

## **2. How a CDN Works**
```
User Request → CDN Edge Server (Closest to User) → 
   → If cached? Return content (HIT)  
   → If not? Fetch from origin → Cache → Deliver (MISS)
```

### **Key Components:**
- **Edge Servers**: Distributed globally (100s of locations).  
- **Origin Server**: Your main web server (only accessed on cache misses).  
- **PoP (Point of Presence)**: CDN node location.  

---

## **3. Types of CDN Caching**
| Type | Description | Example |
|------|-------------|---------|
| **Static CDN** | Caches unchanging files (images, CSS, JS). | Cloudflare, Akamai |
| **Dynamic CDN** | Caches API responses, personalized content. | Fastly, AWS CloudFront |
| **Video CDN** | Optimized for streaming (HLS/DASH). | YouTube, Netflix |

---

## **4. Top CDN Providers**
| Provider | Best For | Key Feature |
|----------|---------|-------------|
| **Cloudflare** | Security + Performance | Free tier, DDoS protection |
| **Akamai** | Enterprise-scale | Largest network (240k+ servers) |
| **AWS CloudFront** | AWS integrations | Lambda@Edge (serverless logic) |
| **Fastly** | Real-time caching | Instant purging, Varnish-based |
| **BunnyCDN** | Affordable | Cheap bandwidth |

---

## **5. CDN Caching Strategies**
### **A. Time-to-Live (TTL)**
- Content expires after a set time (e.g., `Cache-Control: max-age=3600`).  
- Used for: Static assets (JS/CSS).  

### **B. Cache Invalidation**
- **Purge manually**: Clear cache for updated files.  
- **Versioning**: `style-v2.css` forces new cache.  

### **C. Tiered Caching**
- Edge → Regional → Origin (reduces origin load).  

---

## **6. Advanced CDN Features**
- **DDoS Protection** (Cloudflare, Akamai Prolexic)  
- **Web Application Firewall (WAF)**  
- **Image Optimization** (resizing, WebP conversion)  
- **A/B Testing** (Edge-side logic)  

---

## **7. When NOT to Use a CDN?**
❌ **Highly dynamic content** (e.g., real-time stock prices).  
❌ **Small local audiences** (no geographic spread).  
❌ **Strict data sovereignty requirements**.  

---

## **8. CDN vs. Web Server vs. Load Balancer**
| Technology | Role |  
|------------|------|  
| **CDN** | Caches static/dynamic content globally. |  
| **Web Server** | Hosts origin content (Apache, Nginx). |  
| **Load Balancer** | Distributes traffic across servers. |  

---

### **Key Takeaways**
1. CDNs **reduce latency** by serving content from edge locations.  
2. Use **static CDNs** for assets, **dynamic CDNs** for APIs.  
3. Combine with **HTTP caching headers** (`Cache-Control`, `ETag`).  
4. Monitor **cache hit ratio** (aim for >90%).  
