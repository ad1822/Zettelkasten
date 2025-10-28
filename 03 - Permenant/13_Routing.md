---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 13_Routing

### **Routing Fundamentals: How Data Travels Across Networks**

#### **1. What is Routing?**
- **Purpose**: Forward data packets between networks to reach their destination.  
- **Key Device**: **Router** (has at least 2 network interfaces).  
- **Core Principle**: Routers use **routing tables** to determine the best path for packets.  

---

#### **2. How Routing Works (Step-by-Step)**  
1. **Packet Reception**:  
   - A router receives a packet on one of its interfaces.  
2. **Destination IP Check**:  
   - Examines the packet’s **destination IP** (e.g., `10.0.0.10`).  
3. **Routing Table Lookup**:  
   - Checks its **routing table** to find the best path to the destination network.  
4. **Packet Forwarding**:  
   - Sends the packet out the interface closest to the destination.  

**Example**:  
- **Network A**: `192.168.1.0/24` → Router interface: `192.168.1.1`.  
- **Network B**: `10.0.0.0/24` → Router interface: `10.0.0.254`.  
- A packet from `192.168.1.100` to `10.0.0.10` is forwarded by the router to Network B.  

---

#### **3. Routing Tables**  
- **Purpose**: Stores paths to other networks.  
- **Entries Include**:  
  - **Destination Network** (e.g., `10.0.0.0/24`).  
  - **Next Hop** (IP of the next router).  
  - **Interface** (Which router port to use).  
  - **Metric** (Cost of the path, used to choose the best route).  

**Example Routing Table**:  

| Destination Network | Next Hop    | Interface | Metric |
|---------------------|-------------|-----------|--------|
| `10.0.0.0/24`       | Directly Connected | eth1 | 0      |
| `172.16.1.0/23`     | `10.0.0.1`  | eth1      | 1      |

---

#### **4. Multi-Hop Routing (Complex Example)**  
- **Network C**: `172.16.1.0/23` → New router with IP `10.0.0.1` (Network B) and `172.16.1.1` (Network C).  
- **Path**:  
  - `192.168.1.100` → Router 1 (`192.168.1.1`) → Router 2 (`10.0.0.1`) → `172.16.1.100`.  
- **Key Insight**:  
  - Each router only needs to know the **next hop**, not the entire path.  

---

#### **5. Routing Protocols**  
- **Purpose**: Routers dynamically share routing info to update tables.  
- **Common Protocols**:  
  - **RIP (Routing Information Protocol)**: Simple, uses hop count.  
  - **OSPF (Open Shortest Path First)**: Faster, uses link-state algorithms.  
  - **BGP (Border Gateway Protocol)**: Used by ISPs for Internet-scale routing.  

---

#### **6. Non-Routable Address Space (RFC 1918)**  
- **Purpose**: Private IPs for local networks (not routed on the Internet).  
- **Ranges**:  
  - `10.0.0.0/8` (Class A).  
  - `172.16.0.0/12` (Class B).  
  - `192.168.0.0/16` (Class C).  
- **NAT (Network Address Translation)**: Allows private IPs to access the Internet via a public IP.  

---

#### **7. RFC System: The Backbone of the Internet**  
- **RFC (Request for Comments)**: Documents defining Internet standards (e.g., RFC 1918 for private IPs).  
- **Role**: Ensures interoperability across global networks.  

---

#### **8. Key Takeaways**  
1. **Routers forward packets** based on **destination IP** and **routing tables**.  
2. **Routing tables** list paths to networks + next hops.  
3. **Multi-hop routing** is how data crosses the Internet.  
4. **Private IPs** (`10.x.x.x`, `172.16.x.x`, `192.168.x.x`) are non-routable globally.  
5. **Routing protocols** (RIP, OSPF, BGP) automate path selection.  

**Why This Matters for IT Support**:  
- Troubleshooting connectivity often involves checking:  
  - Routing tables (`route print` on Windows, `ip route` on Linux).  
  - Default gateways (is the router reachable?).  
  - NAT/firewall issues (can private IPs reach the Internet?).  

---

#### **9. Real-World Analogy**  
- **Routing = Postal System**:  
  - Each router is a **post office** that forwards mail (packets) based on ZIP codes (IPs).  
  - Routing tables are like **mail sorting guides**.  
  - Private IPs are like **internal office mail** (not sent externally).  




---

### **Routing Tables 

#### **1. What is a Routing Table?**
- A router's "map" that determines where to forward packets.  
- Used by all networked devices (including your computer).  
- Originally, routers were just **computers with two network interfaces** and manual tables.  

---

#### **2. Core Components of a Routing Table**

![[13_Routing.png]]

| Column                  | Purpose                                           | Example                                          |
| ----------------------- | ------------------------------------------------- | ------------------------------------------------ |
| **Destination Network** | Defines known networks (IP + subnet mask).        | `192.168.1.0/24` or `10.0.0.0` + `255.255.255.0` |
| **Next Hop**            | IP of the next router (or "directly connected").  | `192.168.1.254` or `Direct`                      |
| **Total Hops (Metric)** | Number of routers to cross (lower = better path). | `0` (local), `1`, `15`                           |
| **Interface**           | Which router port to use for forwarding.          | `eth0`, `WAN`, `LAN`                             |

---

#### **3. How Routing Tables Work**

1. **Packet Arrival**: Router checks the packet’s **destination IP**.  
2. **Lookup**: Compares the IP against the **Destination Network** column.  
   - If no match, uses the **default route** (catch-all, often `0.0.0.0/0`).  
3. **Forwarding**: Sends the packet to the **Next Hop** via the specified **Interface**.  

**Example**:  
- Packet to `172.16.1.100` → Router checks table → Finds `172.16.1.0/23` → Forwards to `10.0.0.1` (Next Hop) via `eth1`.  

---

#### **4. Key Concepts**
- **Default Route**: Handles unknown destinations (e.g., Internet traffic).  
  - Example: `0.0.0.0/0` → Next Hop: ISP’s router.  
- **Directly Connected Networks**: No "Next Hop" needed (local networks).  
- **Metrics**:  
  - **Hops**: Number of routers to cross.  
  - **Bandwidth/Delay**: Advanced metrics (e.g., OSPF uses cost).  

---

#### **5. Dynamic vs. Static Routing Tables**
| Type        | How It Works                                                 | Use Case                             |
| ----------- | ------------------------------------------------------------ | ------------------------------------ |
| **Static**  | Manually configured.                                         | Small networks (e.g., home routers). |
| **Dynamic** | Updated automatically by routing protocols (RIP, OSPF, BGP). | Large networks (e.g., Internet).     |

---

#### **6. Real-World Complexity**
- **Internet Core Routers**: Millions of entries (e.g., full BGP tables).  
- **Path Changes**: Routes update dynamically if a link fails or congestion occurs.  

---

#### **7. Practical Commands**

- **Windows**: `route print`  
- **Linux/macOS**: `ip route` or `netstat -rn`  

**Sample Output**:  
```bash
Destination     Gateway         Genmask         Interface  
192.168.1.0    0.0.0.0        255.255.255.0   eth0  
0.0.0.0        192.168.1.1    0.0.0.0         eth0
```

---

#### **8. Why This Matters for IT Support**
- **Troubleshooting**:  
  - Verify routes with `ip route`.  
  - Check if the default gateway is correct.  
- **Security**: Misconfigured tables can cause loops or blackholes.  

---

#### **9. Key Takeaways**
1. Routing tables are **packet-forwarding guides** for routers.  
2. Entries include **destination networks**, **next hops**, and **interfaces**.  
3. **Dynamic routing protocols** keep tables updated in real-time.  
4. The **default route** handles traffic to unknown networks (e.g., Internet).  
