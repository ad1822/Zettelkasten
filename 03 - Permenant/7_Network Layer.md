---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 7_Network Layer
---

### **MAC Addresses & Limitations**
1. **Function on LANs**:
   - Nodes communicate using **physical MAC addresses**.
   - Switches learn MAC addresses of connected devices to forward frames efficiently.

2. **Scalability Issues**:
   - MAC addresses are **globally unique** but **not hierarchically organized**
   - No way to locate a MAC address geographically → **unsuitable for long-distance communication**.
   - ARP (Address Resolution Protocol) only works within a **single network segment**.

---

### **Network Layer & IP Addresses**
- **Solution to Scaling**: The **Internet Protocol (IP)** and **IP addresses**.
  - IP addresses are **logical**, hierarchical, and enable routing across networks.
  - IP datagrams are encapsulated inside **Ethernet frames** (payload section).

---

### **Key Takeaways**
1. **IP Address**:
   - Identifies devices logically for **inter-network communication**.
2. **IP Datagram**:
   - Encapsulated in Ethernet frame payloads.
3. **IP Header Fields**:
   - Contains structured metadata for routing, fragmentation, and delivery.

---
