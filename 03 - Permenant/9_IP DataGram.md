---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 9_IP DataGram
---

### **IP Datagram Structure**
#### **1. Header vs. Payload**
- **Header**: Contains metadata for routing and delivery (strictly defined fields).  
- **Payload**: Carries the actual data (e.g., TCP/UDP segment).  


![[IPHeader.png]]
#### **2. Key Header Fields**
| **Field**                 | **Size**     | **Purpose**                                                                   |
| ------------------------- | ------------ | ----------------------------------------------------------------------------- |
| **Version**               | 4 bits       | IP version (IPv4 or IPv6).                                                    |
| **Header Length**         | 4 bits       | Header size (typically **20 bytes** for IPv4).                                |
| **Service Type (QoS)**    | 8 bits       | Prioritizes traffic (e.g., video calls over emails).                          |
| **Total Length**          | 16 bits      | Entire datagram size (max **65,535 bytes**).                                  |
| **Identification**        | 16 bits      | Groups fragmented packets (same ID = same transmission).                      |
| **Flags**                 | 3 bits       | Controls fragmentation (e.g., "Don’t Fragment" flag).                         |
| **Fragmentation Offset**  | 13 bits      | Reorders fragmented packets at the destination.                               |
| **Time to Live (TTL)**    | 8 bits       | Limits router hops (prevents infinite loops; decremented at each hop).        |
| **Protocol**              | 8 bits       | Specifies transport layer protocol (e.g., TCP=6, UDP=17).                     |
| **Header Checksum**       | 16 bits      | Error-checking for the header (recomputed at each router due to TTL changes). |
| **Source/Destination IP** | 32 bits each | Logical addresses for routing.                                                |
| **Options/Padding**       | Variable     | Rarely used (testing); padding ensures header aligns to 32-bit boundaries.    |

---

### **Fragmentation**
- **Why?** Networks have different **Maximum Transmission Unit (MTU)** sizes.  
- **How**: Large datagrams split into smaller fragments; reassembled at destination using:  
  - **Identification field**: Groups fragments.  
  - **Offset field**: Orders fragments correctly.  

---

### **Encapsulation**
- **IP Datagram** = **Payload** of an Ethernet frame.  
- **TCP/UDP Segment** = **Payload** of the IP datagram.  
- **Layered Model**:  
  ```
  Ethernet Frame → [IP Datagram → [TCP/UDP Segment → [Data]]]
  ```

---

### **Key Concepts**
1. **TTL**: Prevents infinite loops (e.g., misconfigured routers).  
2. **QoS**: Prioritizes critical traffic (e.g., VoIP over file downloads).  
3. **Dynamic MTUs**: Fragmentation adapts datagrams to smaller network paths.  

---

### **Example Workflow**
1. **Sender**: Splits data into IP datagrams (if > MTU).  
2. **Routers**: Decrement TTL, recompute checksum, forward fragments.  
3. **Receiver**: Reassembles fragments using ID/offset fields.  

---

