---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 8_IP

---

### **IP Address Basics**
1. **Structure**:
   - **32-bit number**, divided into **4 octets** (e.g., `12.34.56.78`).
   - Each octet is **8 bits**, represented in **decimal (0–255)**.
     - **Invalid example**: `123.456.789.100` (octets > 255).
   - Format: **Dotted decimal notation** (e.g., `192.168.1.1`).

2. **Hierarchical Design**:
   - Assigned in **large blocks to organizations** (e.g., IBM owns all IPs starting with `9.x.x.x`).
   - Enables **efficient routing**:  
     - A router sending to `90.0.0.1` only needs to know how to reach IBM’s network; IBM handles the rest.

---

### **IP vs. MAC Addresses**
| **IP Address**                             | **MAC Address**                 |
| ------------------------------------------ | ------------------------------- |
| Logical (assigned to networks)             | Physical (burned into hardware) |
| Hierarchical (routable)                    | Flat (non-routable)             |
| Changes with network (e.g., home vs. café) | Stays the same globally         |

---

### **IP Assignment**
1. **Dynamic IP**:
   - Automatically assigned via **DHCP** (Dynamic Host Configuration Protocol).
   - Common for **client devices** (laptops, phones).
   - Temporary (can change).

2. **Static IP**:
   - Manually configured.
   - Used for **servers/network devices** (e.g., web servers, routers).
   - Permanent (unless changed).

---

### **Key Takeaways**
- IP addresses are **logical, hierarchical, and scalable** (unlike MAC addresses).
- **DHCP** simplifies IP assignment for clients.
- **Subnetting** (covered later) optimizes IP allocation within networks.

---
---

### **The Evolution from Classful Addressing to CIDR**

#### **1. Problems with Classful Addressing**
- **Rigid Network Sizes**:  
  - **Class A**: 16.7M hosts (too large).  
  - **Class B**: 65K hosts (still too large for most).  
  - **Class C**: 254 hosts (too small for many businesses).  
- **Inefficient Routing**:  
  - Companies needing >254 hosts had to use **multiple Class C networks**, bloating routing tables.  
  - Example: A company with 500 hosts needed **2 Class C networks** (2 entries in routing tables).  

---

#### **2. CIDR (Classless Inter-Domain Routing)**
- **Flexible Network Sizes**:  
  - Abandons **Class A/B/C** restrictions.  
  - Uses **arbitrary subnet masks** (e.g., `/23`, `/27`).  
- **Combined Network + Subnet ID**:  
  - No separate "subnet ID"—just a **single prefix length** (e.g., `/24`).  
- **CIDR Notation**:  
  - `192.168.1.0/24` = `255.255.255.0`.  
  - `10.0.0.0/23` = `255.255.254.0`.  

---

#### **3. Key Benefits of CIDR**
| Feature | Classful Addressing | CIDR |
|---------|---------------------|------|
| **Network Sizes** | Fixed (A/B/C) | Flexible (e.g., `/23`, `/27`) |
| **Routing Efficiency** | Bloated tables (multiple Class C entries) | Aggregated routes (e.g., single `/23` instead of two `/24`s) |
| **Host Efficiency** | Wasted IPs (e.g., Class B for 1K hosts) | Precise sizing (e.g., `/22` = 1,022 hosts) |

**Example**:  
- A company needs **500 hosts**:  
  - **Classful**: Two Class C networks (`/24`) = **508 hosts** (but 2 routing entries).  
  - **CIDR**: One `/23` network = **510 hosts** (1 routing entry).  

---

#### **4. How CIDR Works**
1. **Demarcation with Subnet Masks**:  
   - The **prefix length** (e.g., `/23`) defines the network portion.  
   - The remaining bits are for hosts.  
2. **Route Aggregation**:  
   - ISPs advertise **contiguous blocks** (e.g., `192.168.0.0/22`) instead of individual `/24` networks.  
   - Reduces global routing table size.  

**Binary Example**:  
- `10.0.0.0/23` = `00001010.00000000.0000000**0**`  
  - **Network**: First 23 bits.  
  - **Hosts**: Last 9 bits (512 total, 510 usable).  

---

#### **5. Why Subtract 2 Hosts?**  
- **Network Address**: First IP (e.g., `192.168.1.0`).  
- **Broadcast Address**: Last IP (e.g., `192.168.1.255`).  
- **Usable Hosts**: `Total IPs - 2`.  

**CIDR Efficiency**:  
- Two `/24` networks: `254 + 254 = 508` hosts.  
- One `/23` network: `510` hosts (+2 extra, fewer routing entries).  

---

#### **6. Real-World Impact**  
- **IPv4 Conservation**: Delayed exhaustion by reducing waste.  
- **Simplified Routing**: Faster lookups with aggregated routes.  
- **Enterprise Networks**: Custom-sized subnets (e.g., `/25` for small departments).  

---

#### **7. Key Takeaways**  
1. **CIDR replaced classful addressing** to fix rigid sizes and routing inefficiency.  
2. **Slash notation (`/XX`)** defines the network portion flexibly.  
3. **Route aggregation** reduces global routing tables.  
4. **Always subtract 2** for usable hosts (network + broadcast addresses).  
