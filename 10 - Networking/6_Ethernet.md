---
cssclasses:
  - center-images
  - center-titles
---
Tags: #network

# Ethernet: The Foundation of Local Area Networks  

Ethernet is the most widely used protocol for sending data across individual network links. Operating at the **data link layer (Layer 2)** of the OSI model, Ethernet provides a crucial abstraction layer, allowing higher-level protocols to communicate without needing to worry about the underlying physical hardware.  

## Key Functions of Ethernet  
1. **Hardware Abstraction** – Shields upper layers from the complexities of the physical layer (e.g., copper cables, fiber optics, or wireless signals).  
2. **Reliable Data Transmission** – Ensures data is properly formatted and transmitted between devices on the same local network segment.  
3. **Collision Handling** – Manages simultaneous data transmissions to prevent corruption.  

## Collision Avoidance: CSMA/CD  
Since early Ethernet networks used a shared communication medium (like coaxial cables), simultaneous transmissions could cause **electrical signal collisions**, corrupting data. To solve this, Ethernet introduced:  

### **Carrier Sense Multiple Access with Collision Detection (CSMA/CD)**  
- **Carrier Sense** – Devices listen to the network before transmitting.  
- **Multiple Access** – All devices share the same communication channel.  
- **Collision Detection** – If two devices transmit simultaneously, they detect the collision, stop transmission, and wait a random backoff period before retrying.  

While modern **full-duplex Ethernet (switched networks)** eliminates collisions, CSMA/CD was foundational in early Ethernet (half-duplex) networks.  

## MAC Addressing: Identifying Devices  
Every network interface has a **Media Access Control (MAC) address**, a **48-bit (6-byte) globally unique identifier**, usually written in hexadecimal (e.g., `00:1A:2B:3C:4D:5E`).  

### Structure of a MAC Address  
- **First 3 octets (OUI)** – **Organizationally Unique Identifier**, assigned by the IEEE to manufacturers (e.g., `00:1A:2B` might belong to Intel).  
- **Last 3 octets** – Assigned by the manufacturer, ensuring no two devices have the same MAC address.  

### Role in Ethernet Frames  
Ethernet frames include:  
- **Source MAC** – Who sent the data.  
- **Destination MAC** – Who should receive it.  

This ensures data reaches the correct device within a local network segment.  

## Conclusion  
Ethernet remains the backbone of wired LANs due to its simplicity, scalability, and efficiency. By handling collisions (via CSMA/CD) and using MAC addressing, it provides a robust way for devices to communicate over shared or dedicated links. While modern advancements (like switches and full-duplex connections) have reduced reliance on collision detection, the core principles of Ethernet continue to influence networking today.  

Would you like a deeper dive into Ethernet frame structure or modern Ethernet variants (like Gigabit & 10G Ethernet)?



https://www.coursera.org/learn/computer-networking/supplement/bqkYv/glossary-terms-from-course-2-module-1
