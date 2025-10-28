---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 18_VPN

## **1. Introduction to VPNs**  
Businesses need to secure their networks to protect proprietary information and restrict access to authorized users. Common security measures include:  
- **Firewalls**  
- **Network Address Translation (NAT)**  
- **Non-routable (private) IP address spaces**  

However, employees often need remote access to company resources while working from home or traveling. **VPNs (Virtual Private Networks)** solve this problem by extending a private network securely over a public connection.  

---

## **2. What is a VPN?**  
A **VPN** is a **tunneling protocol** that creates a secure, encrypted connection between a remote user and a private network.  

### **Key Features of VPNs:**  
- **Extends a private network** over a public one (e.g., the internet).  
- **Encrypts data** to prevent eavesdropping.  
- **Provides a virtual interface** with an IP from the private network.  
- **Uses strict authentication** (often with **two-factor authentication**).  

---

## **3. How VPNs Work**  

### **A. VPN Tunneling**  
When a user connects to a VPN:  
1. A **secure tunnel** is established between the user’s device and the company’s VPN server.  
2. The user’s device gets a **virtual IP address** matching the company’s private network.  
3. All traffic sent through this tunnel is **encrypted**.  

### **B. Data Transmission Process**  
1. **Outgoing Traffic (User → Company Network):**  
   - The original packet (application, transport, and network layers) is **encrypted**.  
   - This encrypted payload is wrapped inside a **new packet** (with new headers).  
   - Sent over the internet to the VPN server.  

2. **At the VPN Server:**  
   - Outer layers (data link, transport, etc.) are stripped away.  
   - The payload is **decrypted**, revealing the original packet.  
   - The packet is forwarded to the internal company network.  

3. **Incoming Traffic (Company Network → User):**  
   - The process happens in reverse.  
   - The VPN server encrypts the response and sends it back through the tunnel.  

### **Diagram: VPN Data Flow**  
```  
[User Device]  
   ↓ (Encrypts data)  
[Internet]  
   ↓  
[VPN Server]  
   ↓ (Decrypts & forwards)  
[Company Private Network]  
```  

---

## **4. Types of VPNs**  

### **A. Remote Access VPN**  
- Used by **individual employees** to connect to a company network remotely.  
- Example: An employee working from home uses a **VPN client** to access internal files.  

### **B. Site-to-Site VPN**  
- Connects **entire office networks** over the internet.  
- Example: A company with offices in **New York and London** links them securely.  

### **Diagram: Site-to-Site VPN**  
```  
[Office A LAN] ↔ [VPN Gateway]  
                   ↓  
                [Internet]  
                   ↓  
[Office B LAN] ↔ [VPN Gateway]  
```  

---

## **5. VPN Security & Authentication**  
- **Encryption:** Ensures data cannot be intercepted.  
- **Two-Factor Authentication (2FA):** Requires:  
  1. Username & password  
  2. A **time-based token** (from an app or hardware device)  
- **Strict Access Controls:** Only authorized users can connect.  

---

## **6. Key Takeaways**  
✔ VPNs **extend private networks securely** over public ones.  
✔ They use **encrypted tunnels** to protect data.  
✔ Two main types: **Remote Access VPNs** and **Site-to-Site VPNs**.  
✔ **Authentication** (often 2FA) ensures only authorized access.  
✔ VPNs are **not a single protocol**—different implementations exist (e.g., OpenVPN, IPsec, WireGuard).  

---

### **Summary Table: VPN Features**  
| **Feature**          | **Description** |  
|----------------------|----------------|  
| **Tunneling** | Encapsulates private network traffic inside a secure tunnel. |  
| **Encryption** | Protects data from eavesdropping. |  
| **Virtual IP** | Assigns an IP from the private network to the remote user. |  
| **Authentication** | Uses strong methods like 2FA to verify users. |  
| **Remote Access** | Allows employees to work securely from anywhere. |  
| **Site-to-Site** | Connects multiple office locations securely. |  

