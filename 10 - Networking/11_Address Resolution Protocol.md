---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 11_Address Resolution Protocol

### **Address Resolution Protocol (`ARP`) Notes**

#### **Purpose of ARP**
- Maps **IP addresses (Network Layer)** to **MAC addresses (Data Link Layer)**  
- Required to encapsulate an **IP datagram** into an **Ethernet frame** (which needs a destination MAC address).  

---

### **How ARP Works**
1. **Check ARP Table**  
   - A device checks its **local ARP table** (cache) for the MAC address of the destination IP.  
   - If found → Proceeds to send the frame.  
   - If **not found** → Initiates an **ARP request**.  

2. **ARP Request (Broadcast)**  
   - A **broadcast message** (sent to `FF:FF:FF:FF:FF:FF`) asks:  
     *"Who has IP **10.20.30.40**? Tell me your MAC address!"*  
   - All devices on the **local network** receive this request.  

3. **ARP Response (Unicast)**  
   - Only the device with **10.20.30.40** replies with its **MAC address**.  
   - The original sender updates its **ARP table** with this mapping.  

4. **Frame Transmission**  
   - The sender now knows the **destination MAC** and can complete the Ethernet frame.  

---

### **Key Concepts**
- **ARP Table (Cache)**  
  - Stores **IP-to-MAC mappings** temporarily.  
  - Entries **expire after a short time** (to handle network changes).  

- **Broadcast vs. Unicast**  
  - **ARP Request** = **Broadcast** (sent to all devices).  
  - **ARP Reply** = **Unicast** (sent only to the requester).  

- **Limitations**  
  - ARP only works within the **same local network** (cannot resolve MACs across routers).  
  - For remote networks, **routers** handle forwarding via their own MAC.  

---

### **Example Workflow**
| Step | Action | Details |
|------|--------|---------|
| 1 | Device wants to send to **10.20.30.40** | Checks ARP table. |
| 2 | No entry → **ARP Request** | Broadcast: *"Who has 10.20.30.40?"* |
| 3 | Correct device replies | *"I have 10.20.30.40, my MAC is AA:BB:CC:DD:EE:FF"* |
| 4 | Sender updates ARP table | Stores `10.20.30.40 → AA:BB:CC:DD:EE:FF` |
| 5 | Frame sent successfully | Uses the resolved MAC. |

---

### **Why ARP Matters**
- **Efficiency**: Avoids constant broadcasts by caching MAC addresses.  
- **Dynamic Networks**: Expiring entries adapt to changes (e.g., new devices, IP reassignments).  
- **Fundamental for Ethernet**: IP relies on MAC addresses for local delivery.  
