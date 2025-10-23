---
cssclasses:
  - center-images
  - center-titles
---
Tags: #aws

---

# **AWS Storage Services Comparison**

| **Block Storage**       | **Object Storage**      | **File Storage**        |
|-------------------------|-------------------------|-------------------------|
| **EC2, EBS**            | **S3**                  | **EFS, FSx**           |
| Non-persistent (Instance Store) or persistent (EBS) | Highly durable (11x9s) | Shared file system |
| Low-latency access      | High latency            | Low-to-moderate latency |
| Attached to a single EC2 instance | Globally accessible via API | Mountable across multiple EC2/on-premises |
| Same AZ as EC2 (EBS)    | Regional scope          | Regional scope (EFS)    |
| Use cases: Boot volumes, databases, SAP/Oracle | Use cases: Backups, media, logs, archives | Use cases: Web serving, big data, shared directories |

---

## **EBS (Elastic Block Storage)**
- **Type**: Block storage (data stored in fixed-size blocks).
- **Attachment**: Must be attached to an EC2 instance in the same AZ.
- **Protocols**: Accessed via iSCSI, SCSI, or NVMe (for io1/io2/gp3).
- **Performance Metrics**:
  - **IOPS**: Ranges from 500 (gp2) to 256,000 (io2 Block Express).
  - **Throughput**: Up to 4,000 MB/s (gp3, io2).
  - **Latency**: Sub-millisecond (for high-performance volumes).

![[EBSarchitecture.png]]

### **Use Cases**:
- Boot volumes for EC2.
- Relational (MySQL, PostgreSQL) & NoSQL (MongoDB) databases.
- Data warehousing (ETL processes).
- Enterprise apps (SAP, Oracle ERP).

### **Limitations**:
- Cannot be shared across multiple EC2 instances (without EBS Multi-Attach).
- Snapshots required for cross-AZ/region replication.

---

## **S3 (Simple Storage Service)**
- **Type**: Object storage (flat structure, metadata-driven).
- **Access**: REST/HTTP API (GET/PUT/DELETE).
- **Durability**: 99.999999999% (11x9s).
- **Availability**: 99.99% (Standard), 99.9% (Infrequent Access).
- **Performance**:
  - **Throughput**: Scales to thousands of requests/sec.
  - **Latency**: High (milliseconds to seconds).

![[S3Architecture.png]]

### **Use Cases**:
- Static website hosting.
- Backup & archival (S3 Glacier).
- Big data lakes (Athena, Redshift Spectrum).
- Media storage (images, videos).
- Log storage (CloudTrail, ELB logs).

### **Limitations**:
- Not suitable for real-time database storage.
- No file system hierarchy (uses prefixes instead of folders).

---

## **EFS (Elastic File System) & FSx**
- **Type**: Shared file storage (POSIX-compliant).
- **Protocols**: NFS (EFS), SMB (FSx for Windows), Lustre (FSx for HPC).
- **Performance**:
  - **IOPS**: Bursting (EFS) or provisioned (FSx).
  - **Throughput**: Up to 10+ GB/s (FSx Lustre).
  - **Latency**: Low (EFS) to ultra-low (FSx Lustre).

![[EFSArchitecture.png]]

### **Use Cases**:
- Shared home directories.
- Web serving (shared CMS storage).
- Big data & analytics (shared datasets).
- Lift-and-shift enterprise apps.

### **Limitations**:
- Higher cost than EBS for small-scale deployments.
- Requires mounting (not natively accessible like S3).

---

## **Performance Comparison**
| **Metric**      | **EBS**               | **S3**                | **EFS**               |
|----------------|-----------------------|-----------------------|-----------------------|
| **IOPS**       | Up to 256K (io2)      | N/A (object-based)    | Bursting (scales)     |
| **Throughput** | Up to 4,000 MB/s      | Unlimited (scales)    | Up to 10+ GB/s (FSx)  |
| **Latency**    | Sub-ms (io1/io2)      | High (ms to sec)      | Low (ms)              |

---

### **Key Takeaways**
1. **EBS** → Best for single-instance, low-latency workloads (DBs, boot volumes).
2. **S3** → Best for scalable, durable storage (backups, media, logs).
3. **EFS/FSx** → Best for shared file systems (multi-EC2, on-premises).

Would you like me to add any specific details (e.g., pricing, security, or lifecycle policies)?
