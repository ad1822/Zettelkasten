---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 16_DHCP

### **How DHCP Works Without an Existing Network Configuration**
1. **DHCP Discovery (DORA Process)**:
   - The process is often called **DORA** (Discover, Offer, Request, Acknowledgment).
   - Since the client has no IP initially, it uses **broadcast** communication (via `255.255.255.255` and `0.0.0.0`).

2. **Layer-by-Layer Communication**:
   - **Application Layer (DHCP)**: Handles IP assignment logic.
   - **Transport Layer (UDP)**: DHCP uses **UDP ports 67 (server) and 68 (client)** because it doesn’t require the reliability of TCP.
   - **Network Layer (IP)**: Since the client lacks an IP, it uses:
     - Source IP: `0.0.0.0` (no IP yet).
     - Destination IP: `255.255.255.255` (broadcast to all devices on the LAN).
   - **Data Link Layer (MAC)**: The client includes its **MAC address** in DHCP messages so the server knows where to respond.

3. **Why Broadcast?**
   - The client doesn’t know the DHCP server’s IP (or even if one exists).
   - Broadcast ensures the message reaches all devices, including any DHCP servers.

4. **DHCP Offer & Lease**:
   - The server reserves an IP and sends a **DHCP Offer** (also broadcast, since the client still lacks an IP).
   - The client may receive multiple offers (if multiple DHCP servers exist) but typically accepts the first one.
   - The **DHCP ACK** finalizes the lease, providing:
     - Assigned IP address.
     - Subnet mask.
     - Default gateway.
     - DNS servers.
     - Lease duration (after which the client must renew).

5. **Lease Renewal & Release**:
   - Before the lease expires, the client sends a **DHCP Request** to renew.
   - If the client disconnects, it may send a **DHCP Release** to free the IP.

### **Why This Works Without a Pre-Configured Network Layer**
- DHCP operates **before** the client has an IP, so it relies on:
  - **Broadcast IP (`255.255.255.255`)** to reach all devices.
  - **MAC addressing** (Data Link Layer) to identify the client.
  - **UDP** (Transport Layer) for lightweight communication without needing a connection.

### **Key Takeaways**
- DHCP is **application-layer** but depends on lower layers (UDP, IP, MAC) to function.
- It solves the "chicken-and-egg" problem of needing an IP to communicate but needing communication to get an IP by using **broadcast** and **MAC addressing**.
- The **lease mechanism** ensures IPs are reused efficiently.
