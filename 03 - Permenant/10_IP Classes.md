---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 10_IP Classes
### **IP Address Classes**
IP addresses are divided into **network ID** and **host ID**. The **address class system** defines how IP space is allocated.

#### **Primary Address Classes**
| Class | Network ID     | Host ID       | First Bits (Binary) | First Octet (Decimal) | Hosts per Network |
| ----- | -------------- | ------------- | ------------------- | --------------------- | ----------------- |
| **A** | First octet    | Last 3 octets | `0`                 | **0–127**             | 16,777,216 (2²⁴)  |
| **B** | First 2 octets | Last 2 octets | `10`                | **128–191**           | 65,536 (2¹⁶)      |
| **C** | First 3 octets | Last octet    | `110`               | **192–223**           | 256 (2⁸)          |

![[../02 - Literature/10_IP Classes.png]]

#### **Additional Classes**
- **Class D** (Multicast):  
  - First bits: `1110`  
  - First octet: **224–239**  
  - Used for sending data to multiple hosts at once.  
- **Class E** (Reserved/Experimental):  
  - First bits: `1111`  
  - First octet: **240–255**  
  - Not assigned for public use; testing only.  

#### **Key Points**
- **Class A**: Large networks (e.g., IBM owns `9.x.x.x`).  
- **Class B**: Medium-sized networks.  
- **Class C**: Small networks.  
- **Modern Replacement**: CIDR (Classless Inter-Domain Routing) is now more common, but classful addressing is still foundational.  

#### **Quick Identification**
- **0–127** → Class A  
- **128–191** → Class B  
- **192–223** → Class C  
- **224–239** → Class D (Multicast)  
- **240–255** → Class E (Reserved)  
