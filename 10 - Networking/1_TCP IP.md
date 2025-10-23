---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network



---
# **5-Layer Hybrid Network Model**  

### **1. Physical Layer** *(OSI Layer 1)*  

- **Function**: Transmits raw **bits** (0s and 1s) over a physical medium.  
- **Components**:  
  - Cables (Ethernet, fiber optics)  
  - Connectors (RJ45, USB)  
  - Hubs, Repeaters  
- **Protocols/Standards**:  
  - Ethernet (IEEE 802.3)  
  - Wi-Fi (IEEE 802.11)  
  - USB, Bluetooth  

---

### **2. Data Link Layer** *(OSI Layer 2)*  

- **Function**: Ensures **error-free communication** between devices on the **same network**.  
- **Key Concepts**:  
  - **MAC Addressing** (e.g., `00:1A:2B:3C:4D:5E`)  
  - **Switches** (forward frames based on MAC addresses)  
  - **Ethernet (wired) & Wi-Fi (wireless)**  
- **Data Unit**: **Frames**  
- **Protocols**:  
  - Ethernet (IEEE 802.3)  
  - Wi-Fi (IEEE 802.11)  
  - ARP (Address Resolution Protocol)  

---

### **3. Network Layer** *(OSI Layer 3 / TCP/IP Internet Layer)*  
- **Function**: **Routes packets** between different networks using **IP addresses**.  
- **Key Concepts**:  
  - **IP Addressing** (IPv4: `192.168.1.1`, IPv6: `2001:0db8:85a3::`)  
  - **Routers** (forward packets across networks)  
  - **Subnetting & Routing Tables**  
- **Protocols**:  
  - **IP (Internet Protocol)**  
  - **ICMP** (ping, traceroute)  
  - **BGP, OSPF** (Routing protocols)  

---

### **4. Transport Layer** *(OSI Layer 4 / TCP/IP Transport Layer)*  

- **Function**: Ensures **reliable** (or fast) **end-to-end** communication.  
- **Key Protocols**:  
  - **TCP (Transmission Control Protocol)**  
    - Reliable, connection-oriented (used for web, email, file transfers).  
    - Handles **flow control, error recovery, and sequencing**.  
  - **UDP (User Datagram Protocol)**  
    - Unreliable but fast (used for video streaming, VoIP, gaming).  
- **Port Numbers** (e.g., `80` for HTTP, `443` for HTTPS).  

---

### **5. Application Layer** *(OSI Layers 5-7 / TCP/IP Application Layer)*  

- **Function**: Provides **network services** directly to applications.  
- **Key Protocols**:  
  - **HTTP/HTTPS** (Web browsing)  
  - **SMTP, POP3, IMAP** (Email)  
  - **DNS** (Domain Name System)  
  - **FTP, SSH** (File transfer)  
  - **DHCP** (Automatic IP assignment)  

---

### **Comparison with TCP/IP & OSI Models**  
| **5-Layer Model** | **TCP/IP Model** | **OSI Model** |  
|-------------------|------------------|---------------|  
| Physical | (Not separate) | Physical (L1) |  
| Data Link | Network Access | Data Link (L2) |  
| Network | Internet | Network (L3) |  
| Transport | Transport | Transport (L4) |  
| Application | Application | Session (L5) + Presentation (L6) + Application (L7) |  



- The physical layer is the delivery truck and the roads.
- The data link layer is how the delivery trucks get from one intersection to
the next over and over.
- The network layer identifies which roads need to be taken to to get from
address A to address B.
- The transport layer ensures that delivery driver knows how to knock on
your door to tell you your package has arrived,
- The application layer is the contents of the package itself.
