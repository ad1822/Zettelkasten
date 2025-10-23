---
cssclasses:
  - center-images
  - center-titles
---
Tags: #aws

# VPC

- Virtual Firewall for EC2 instances
- Blocks all traffic except the ports, protocols and sources you specify
- You define Rules which are inbound and outbound
- Rules are stateful
- Enables you to use multiple layers of security.
- Logically Isolated from other VPCs

![[vpc.png]]

#### Subnet
- **Range of IP** addresses that divide a  VPC.
- Can be Public or Private.



### Reserved IP addresses of Subnet

![[Reserved IP addresses of Subnet.png]]



### Route Tables
- Contains a set of rules that can configure to direct network traffic from your subnet
- Each route specifies a destination and a target.


![[route table.png]]

### VPC sharing 
- Enables customers to share subnets with other AWS accounts  
![[Pasted image 20241029171511.png]]

### VPC peering 
 - Connect VPCs 


![[vpc peering.png]]




![[security groups vs network acls.png]]



Sure! Here's the simplest explanation of AWS networking basics:

### 1. **VPC (Virtual Private Cloud)**
   - Think of it as your **own private section of AWS cloud** where you can place servers (EC2), databases (RDS), etc.
   - It's like a **virtual data center** inside AWS.

### 2. **Subnets**
   - A VPC is divided into smaller networks called **subnets**.
   - **Public Subnet**: Resources here can directly talk to the internet (e.g., a web server).
   - **Private Subnet**: Resources here **cannot** directly access the internet (e.g., a database). They need a **NAT Gateway** to go online.

### 3. **Internet Gateway (IGW)**
   - A door between your **VPC and the internet**.
   - Only **public subnets** use this to allow internet access.

### 4. **Route Tables**
   - Like a **roadmap** telling traffic where to go.
   - Example:
     - For a **public subnet**, the route table says:  
       `Internet traffic (0.0.0.0/0) → Internet Gateway`.
     - For a **private subnet**, the route table may say:  
       `Local traffic → stays in VPC` (no direct internet access).

### 5. **NAT Gateway (for Private Subnets)**
   - Allows **private subnet** resources (like databases) to access the internet **only for updates/downloads** but blocks the internet from reaching them.
   - Example: A database in a private subnet can download security patches but remains hidden from hackers.

### 6. **Security Groups (Firewall for EC2)**
   - Acts like a **bouncer** for your servers.
   - Controls **inbound & outbound traffic** to EC2 instances.
   - Example: Only allow **HTTP (port 80)** for a web server.

### 7. **NACLs (Network Access Control Lists)**
   - A **second layer of firewall** at the **subnet level**.
   - Works like a **basic traffic filter** (allow/deny rules).
   - Less precise than Security Groups.

### **Simple Example: Web App in AWS**
- **Public Subnet**:  
  - EC2 (Web Server) → Connected to **Internet Gateway** → Users access it via the web.
- **Private Subnet**:  
  - Database (RDS) → **No internet access**, but can fetch updates via **NAT Gateway**.
- **Security Group**: Only allows HTTP (port 80) to the web server.
- **NACL**: Blocks bad IPs at the subnet level.

### **Summary**
| Component       | What It Does |
|----------------|-------------|
| **VPC** | Your private cloud space in AWS. |
| **Subnet** | Divides VPC into public/private networks. |
| **Internet Gateway** | Lets public subnets talk to the internet. |
| **NAT Gateway** | Lets private subnets access the internet safely. |
| **Route Table** | Decides where traffic goes (like a GPS). |
| **Security Group** | Firewall for EC2 (instance-level). |
| **NACL** | Extra subnet-level firewall (optional). |

This is a simplified version—AWS networking has more details, but this covers the basics! 🚀
