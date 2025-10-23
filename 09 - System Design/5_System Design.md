---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# 5_System Design

![[Message_Queue.png]]

---

### Message Queues & Asynchronous Processing  
A **message queue** acts as a temporary buffer between message producers (senders) and consumers (receivers), enabling:  
- **Decoupling**: Producers can continue operating even if the consumer is busy, offline, or fails.  
- **Asynchronous processing**: Producers submit tasks without waiting for immediate processing, improving efficiency.  
- **Resilience**: Messages persist in the queue until successfully processed, mitigating service outages.  

#### Key Components:  
1. **Producer**: An application that creates and sends messages to the queue.  
2. **Queue**: A FIFO (First-In-First-Out) structure holding messages until retrieval.  
3. **Consumer**: An application that processes messages from the queue at its own pace.  

#### Benefits:  
- **Scalability**: Handle workload spikes by queueing excess requests.  
- **Fault tolerance**: Survives consumer crashes; messages remain for retry.  
- **Non-blocking operations**: Producers avoid delays caused by slow consumers.  

Example: A web server queues user uploads for background processing, ensuring responsiveness even during heavy loads.  

---
### **Message Queue Architecture & How It Works**  

## **1. Core Components**  

| Component       | Role |
|----------------|------|
| **Producer** | Creates and sends messages to the queue (e.g., a web server submitting orders). |
| **Message Queue** | Temporarily stores messages in order (FIFO or priority-based). |
| **Consumer** | Retrieves and processes messages (e.g., a payment service handling transactions). |
| **Broker (Optional)** | Manages queues (e.g., RabbitMQ, Kafka, AWS SQS). |

---

## **2. How It Works: Step-by-Step**  

### **Step 1: Producer Sends a Message**  
- An application (producer) publishes a message to the queue.  
- Example: An e-commerce app sends an order request:  
  ```json
  { "order_id": 123, "user_id": 456, "items": […] }
  ```  

### **Step 2: Queue Stores the Message**  
- The message is stored in the queue until a consumer is ready.  
- The queue ensures **durability** (messages survive crashes).  

### **Step 3: Consumer Processes the Message**  
- A worker service (consumer) fetches the message and processes it.  
- Example: An inventory service updates stock after receiving the order.  

### **Step 4: Acknowledgment (ACK) / Retry on Failure**  
- If processing succeeds → Consumer sends **ACK** → Message is removed.  
- If processing fails → Message stays (or goes to a **dead-letter queue** for retry later).  

---

## **3. Common Message Queue Architectures**  

### **A. Point-to-Point (Queue Model)**  
- **One producer → One queue → One consumer.**  
- Each message is processed by **only one consumer**.  
- Example: Order processing in e-commerce.  

### **B. Publish/Subscribe (Pub-Sub Model)**  
- **One producer → Topic → Multiple subscribers.**  
- Each message is broadcast to **all interested consumers**.  
- Example: Real-time notifications (e.g., stock price updates).  

### **C. Distributed Event Streaming (e.g., Kafka)**  
- Messages are stored in a **log** and retained for a period.  
- Multiple consumers can read at their own pace.  
- Example: Log processing, real-time analytics.  

---

## **4. Benefits of Message Queues**  
✅ **Decoupling** – Producers & consumers work independently.  
✅ **Scalability** – Handle traffic spikes by queueing requests.  
✅ **Fault Tolerance** – Survives crashes with persistent messages.  
✅ **Load Balancing** – Distribute work across multiple consumers.  
✅ **Asynchronous Processing** – Avoid blocking the producer.  

---

## **5. Popular Message Queue Systems**  
| System       | Best For | Model |
|-------------|---------|-------|
| **RabbitMQ** | General-purpose tasks | Queue & Pub-Sub |
| **Apache Kafka** | High-throughput event streaming | Distributed log |
| **AWS SQS** | Serverless, cloud-based queues | FIFO/Standard Queue |
| **Redis Streams** | Real-time, low-latency messaging | Pub-Sub |

---

### **Real-World Example: Order Processing**  
1. **Producer**: User places an order → Web app sends it to the queue.  
2. **Queue**: Holds the order until the payment service is ready.  
3. **Consumer**: Payment service processes the order → Sends confirmation.  

If the payment service crashes, the order stays in the queue for retry.  

---
