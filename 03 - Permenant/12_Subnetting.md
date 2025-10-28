---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# 12_Subnetting


Subnetting breaks a large network into smaller, manageable **subnetworks (subnets)** to improve efficiency, security, and routing.

---

### **Why Subnetting?**
1. **Class A Networks Are Too Large**  
   - Example: `9.0.0.0` (Class A) has **16.7 million IPs**—impossible for one router to handle.  
   - Subnetting splits it into smaller groups (e.g., `9.1.0.0`, `9.2.0.0`).  

2. **Better Traffic Control**  
   - Isolates broadcast domains (reduces unnecessary traffic).  
   - Improves security (e.g., separates departments: HR, Finance).  

3. **Optimized Routing**  
   - Gateway routers only need to manage their own subnet.  

---

### **How Subnetting Works**
#### **1. Subnet Masks**  
- Extends the **Network ID** by "borrowing" bits from the **Host ID**.  
- Written like:  
  - `255.255.0.0` (Class B default)  
  - `255.255.255.0` (Class C default)  
  - Or in **CIDR notation**: `/24` = `255.255.255.0`  

#### **2. Splitting a Network**  
- Example: Turn `9.0.0.0/8` (Class A) into **subnets**:  
  - Use a **subnet mask** of `255.255.0.0` → `/16`  
  - Now:  
    - `9.1.0.0/16` (Subnet 1)  
    - `9.2.0.0/16` (Subnet 2)  
    - Each supports **65,536 hosts** (better than 16.7M!).  

#### **3. Gateway Routers**  
- Each subnet has its own **gateway router** for entry/exit.  

---

### **CIDR (Classless Inter-Domain Routing)**
- Replaces rigid **Class A/B/C** system.  
- Allows **flexible subnet sizes** (e.g., `/26`, `/28`).  
- Example:  
  - `192.168.1.0/26` = **64 IPs per subnet** (instead of fixed 256 in Class C).  

---

### **Binary Basics for Subnetting**
1. **Subnet Mask in Binary**  
   - `255.255.255.0` = `11111111.11111111.11111111.00000000`  
   - The `1`s = **Network** bits | `0`s = **Host** bits.  

2. **Calculating Subnets**  
   - Need **2 borrowed bits**? → `2² = 4 subnets`.  
   - Need **6 host bits**? → `2⁶ - 2 = 62 usable hosts` (subtract network & broadcast).  

---

### **Common Subnetting Issues in IT**
- **Incorrect Mask**: Devices can’t communicate if masks don’t match.  
- **IP Overlap**: Two subnets with the same range cause conflicts.  
- **Broadcast Storms**: Too-large subnets create unnecessary traffic.  

---

### **Key Takeaways**
| Concept            | Purpose                  | Example                    |
| ------------------ | ------------------------ | -------------------------- |
| **Subnetting**     | Split big networks       | `9.0.0.0/8` → `9.1.0.0/16` |
| **Subnet Mask**    | Define Network/Host bits | `255.255.255.0` = `/24`    |
| **CIDR**           | Flexible subnet sizes    | `192.168.1.0/26` (64 IPs)  |
| **Gateway Router** | Manages subnet traffic   | Each subnet has its own.   |



### **Network ID, Subnet ID, and Host ID**

#### **1. The Three Key Components**
- **Network ID**: Identifies the **large network** (e.g., `9.0.0.0` for Class A).  
- **Subnet ID**: Further divides the network into **smaller subnets** (borrowed from host bits).  
- **Host ID**: Identifies **individual devices** within a subnet.  

**Example**:  
IP: `9.100.100.100`  
- **Network ID**: `9.0.0.0` (Class A, first octet).  
- **Subnet ID**: Next **16 bits** (if subnet mask is `255.255.0.0`).  
- **Host ID**: Last **8 bits** (if subnet mask is `255.255.255.0`).  

---

#### **2. Subnet Masks Demystified**
- A **32-bit number** (like an IP) that defines:  
  - **1s**: Network + Subnet bits (ignore for host ID).  
  - **0s**: Host bits (keep for host ID).  

**Common Subnet Masks**:  

| Subnet Mask (Decimal) | Binary | CIDR Notation | Usable Hosts |
|-----------------------|--------|---------------|--------------|
| `255.255.255.0`       | `/24`  | 24 ones       | 254 (256-2)  |
| `255.255.255.128`     | `/25`  | 25 ones       | 126 (128-2)  |
| `255.255.255.224`     | `/27`  | 27 ones       | 30 (32-2)    |

**Why Subtract 2?**  
- `0`: Network address (reserved).  
- `255` (or all 1s in host bits): Broadcast address.  

---

#### **3. Calculating Subnet IDs (Binary Method)**

**Example**: `9.100.100.100/27` (Subnet Mask = `255.255.255.224`)  
1. **Convert to Binary**:  
   - IP: `00001001.01100100.01100100.01100100`  
   - Mask: `11111111.11111111.11111111.11100000` (27 ones)  
2. **Apply Mask**:  
   - **Network + Subnet ID**: First 27 bits = `9.100.100.96`  
   - **Host ID**: Last 5 bits = `000100` (4 in decimal).  
3. **Subnet Range**:  
   - **Usable Hosts**: `9.100.100.97` to `9.100.100.126` (30 hosts).  

---

#### **4. CIDR Notation (Flexible Subnetting)**
- **Replaces Classful Addressing**: Allows masks like `/27` (not just `/8`, `/16`, `/24`).  
- **Example**:  
  - `192.168.1.0/26` = 64 total IPs (62 usable).  
  - `10.0.0.0/20` = 4,096 IPs (4,094 usable).  

---

#### **5. Key Takeaways**
| Concept         | Purpose                              | Example                    |
| --------------- | ------------------------------------ | -------------------------- |
| **Network ID**  | Identifies the main network          | `9.0.0.0` (Class A)        |
| **Subnet ID**   | Splits network into smaller parts    | `9.100.100.96/27`          |
| **Host ID**     | Identifies devices in a subnet       | Last 5 bits (`000100` = 4) |
| **Subnet Mask** | Defines Network/Subnet vs. Host bits | `255.255.255.224` = `/27`  |

---

#### **6. Practical Implications**

- **Routing Efficiency**: Smaller subnets reduce broadcast traffic.  
- **Security**: Isolate departments (e.g., HR vs. Engineering).  
- **Address Conservation**: Avoid wasting IPs (e.g., use `/27` instead of `/24` for small offices).  

**Common Pitfalls**:  
- Overlapping subnets (e.g., `192.168.1.0/24` and `192.168.1.128/25`).  
- Incorrect mask configuration (e.g., assigning `255.255.255.0` to a `/27` subnet).  

---

