---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# System Design Primer

# APIs

---

### **1. SOAP (Simple Object Access Protocol)**

- **XML-based protocol**
- Used in **older enterprise applications**
- Built-in **error handling and security** (WS-\* standards)
- Operates over HTTP, SMTP, etc.

---

### **2. RESTful API (Representational State Transfer)**

- **Resource-based**, stateless
- Uses **HTTP methods** (GET, POST, etc.)
- **Synchronous communication**
- Widely used in **web servers and public APIs**

---

### **3. GraphQL (Query Language for APIs)**

- Client specifies **exact data needed**
- Reduces **over-fetching and under-fetching**
- Ideal for **mobile and frontend apps**
- Flexible and efficient for dynamic data needs

---

### **4. gRPC (Google Remote Procedure Call)**

- High-performance API for **microservices**
- Uses **Protocol Buffers (binary)** instead of JSON
- **Synchronous and fast** over HTTP/2
- Supports **streaming** and **code generation**

---

### **5. WebSocket**

- **Full-duplex, bi-directional communication** over TCP
- Ideal for **low-latency, real-time** use cases
- Used in **chats, games, live updates**

---

### **6. Webhook**

- **Asynchronous** communication
- Server sends **events to client** when triggered
- Common in **event-driven architectures**
- Lightweight and easy to integrate

### Based on Use Case/ Exposure

1. Open APIs
2. Internal APIs
3. Partner APIs
4. Composite APIs

### Streaming APIs

1. Server-Sent Events (SSE)

- Server pushed data to client

2. Kafka/ Event Steaming

- Publish-Subscribe Model
- Microservices, Logs, etc

---

# Microservices

- In monolithic arch, All of your app's code and functionalities lives in single codebase and runs as a single process.

- Code split into small, independent services
- Each service handles a specific business logic functions

- Services can be developed, deployed, and scaled independently.
- Failure in one service doesn't crash the whole system.

- Service Independence
- API communication : Typically REST or gRPC

  - Eg. Kafka works on TCP , and TCP-based protocol, which is Binary protocol over TCP.
  - REST (HTTP, synchronous)
  - gRPC (HTTP/2, binary, synchronous)
  - Kafka / RabbitMQ (TCP, asynchronous messaging)

- Database Isolation
  - Event service manages its own databases
  - No direct database sharing between services
- Independent Scaling
  - Scale only the services that need it
  - More efficient than scaling a whole molith

#### For interview:

- Service Discovery
- Data Consistency
- Fault Isolation

# Relational Database

- A relational database oragizes data into tables, which look a lot like spreadsheets.
- It's all about **Consistency** and **structure**.

- It's for:

  - Data Intergrity:
    - No weird duplicates or orphaned records thanks to constraints like primary and foreign keys
  - Powerful Querying:
    - SQL allows you to filter, join, and analyze data with ease.
  - ACID properties:
    - Transactions are guaranteed to be Atomicitiy, Consistent, Isolated, and Durable.
    - **Atomicitiy** : Each Transaction is all or nothing (0 or 1).
    - **Consistency** : Any transaction will bring the database from one valid state to another
    - **Isolation** : Executing transactions concurrently has the same results as if the transactions were executed serially
    - **Durability** : Once a transaction has been committed, it will remain so

- Data is organized into tables, and relationshps between those tables are defined through keys

### Techniques to scale a Relational Databases

### **1. Master-Slave Replication**

- The master serves reads and writes, Replication writes to one or more slaves, which serve only reads.
- Slave can also replicate to additional slaves replication to additional slaves in a tree-like fashion.
  If Master goes offline, the system can continue to operate in read-only mode until a slave in promoted to a master or a new master is provisioned.

### **2. Master-Master Replication**

- Both masters serve reads and writes and coordinate with each other on writes. If either master goes down, the system can continue to operate with both reads and writes

- Need a load balancer
- Most Master-Master systemss are either loosely consistent (violating ACID) or have increased write latency due to synchronization.

##### Disadvantages of Replication

- Potential for loss of data if the master fails before any newly written data can be replicated to other nodes.
- Writes are replayed to the read replicas. If there are a lot of writes, the read replicas can get bogged down with replaying writes and can't do as many reads.
- More read slaves. more you have to replicates, which leads to greated replication lag.
- Writing to the master can spawn multiple threads to write in parallel, whereas read replicas only support writing sequentially with a single thread.
- Replication adds more hardware and additional complexity.

### **3. Fedaration:**

- Fedaration (or Functional Partitionaing) splits up databases by function.
- Resulting in less read and write traffic to each database and therefore less replication lag
- Smaller databases result in more data that can fit in memory, which in turn results in more cache hits due to improved cache locality. With no single central master serializing writes you can write in parallel, increasing throughput.

##### Disadvantages of Fedaration

- Schema requires huge functions or tables.
- More complexity
- Joining data from two databases is more complex with a server link.
- More hardware

### **4. Sharding**

- Distributes data across different databases such that each databases can only manage a subset of the data.

- Sharding results in less read and write traffic, less replication, and more cache hits.
- Index size is also reduced, which improves performance with faster queries.
- If one shard goes down, the other shards are still operational, although you'll want to add some form of replication to avoid data loss. Like federation, there is no single central master serializing writes, allowing you to write in parallel with increased throughput.

##### Disadvantages of Sharding

- Update your application logic to work with shards, which could result in complex SQL queries.
- Joining data from multiple shards is more complex.
- Sharding adds more hardware and complexity.

### **5. Denormalization**

- Attempts to improve read performance at the expense of some write performance.
- Redundant copies of the data are written in multiple tables to avoid expensive joins.
- **Materialized Views**
- Might circumvent the need for such complex joins.

##### Disadvantages of Denormalization

- Data is duplicated.
- constraints can help redundant copies of information stay in sync, which increase complexity of the database design.
- A Denormalization database under heavy write load might perform worse that its normalized counterpart.

### Some tips for RDBMS

- Use `CHAR` instead of `VARCHAR` for fixed-length fields.
- Use `TEXT` for large blocks
- Use `INT` for large number up to 4 billion.
- Use `DECIMAL` for currency to avoid floating point representation errors.
- Avoid storing large `BLOBS`, store the location of where to get the object instead.
- `VARCHAR(255)` is the largest number of characters that can be counted in an 8 bit number, often maximizing the use of a byte in some RDBMS.
- Set the `NOT NULL`` constraint where applicable to improve search performance.

### Use good indices

- Columns that you are querying (SELECT, GROUP BY, ORDER BY, JOIN) could be faster with indices.
- Indices are usually represented as self-balancing B-tree that keeps data sorted and allows searches, sequential access, insertions, and deletions in logarithmic time.
- Placing an index can keep the data in memory, requiring more space.
- Writes could also be slower since the index also needs to be updated.
- When loading large amounts of data, it might be faster to disable indices, load the data, then rebuild the indices.

### Partition tables

- Break up a table by putting hot spots in a separate table to help keep it in memory.

### Tune the query cache

- This could lead to some performance issue

##### Main Components

- Tables:
  - Tables as the basic building blocks. Each tables represents an entity
  - Rows hold the actual data.
- Primary Keys:
  - A unique identifier for each row.
  - Unique ID
- Foreign Key:
  - A reference to a primary key in another table, creating relationshps.

##### Relationshps

- One to One
- One to Many
- Many to Many

# NoSQL Database

- Datastore as a key-value pair, document store, wide column store, or a graph database.
- Most NoSQL stores lack true `ACID` transactions and favor `eventual Consistency`.
- `BASE` is often used to describe the properties of NoSQL databases.

#### `CAP` theorem

- **Consistency** : Every read receives the most recent write or an error
- **Availability** : Every request receives a response, without guarantee that it contains the most recent version of the information
- **Partition Tolerance**: The system continues to operate despite arbitrary partitioning due to network failures.

- `BASE` chooses Availability over Consistency
- **Basically Available** : The system guarantees Availability
- **Soft State** : The state of the system may change over time, even without input.
- **Eventual Consistency** : the system will become consistent over a period of time, given that the system doesn't receive input during that period.

- Designed to handle unstructured data, can scale horizontally to manage massive amounts of it.
- Gives the flexibility to store and retrieve this data without forcing it into a predefined schema.

- Perfect when:
  - Schema Flexibility
    - Data changes frequently, or don't know its structure
  - High Scalability:
    - Needs to handle massive amounts of traffic and data
  - No Complex Relationshps:
    - You don't need complex relationships between data

### Types of NoSQL:

**1. Key-Value Store**:

- Abstraction of **Hash Table**

- Store generally allows for 0(1) reads and writes and is often backend by memory of SSD.
- Data stores can maintain keys in lexicographic order, allowing efficient retrieval of key ranges.
- Key-value stores can allow for storing of metadata with a value.

**2. Document Store**:

- Abstraction of **key-value store with documents stored as value**

- A document store is centered around documents (XML, JSON, binary, etc), where a document stores all information for a given object. Document stores provide APIs or a query language to query based on the internal structure of the document itself.
- Based on the underlying implementation, documents are organized by collections, tags, metadata, or directories. Although documents can be organized or grouped together, documents may have fields that are completely different from each other.

**3. Wide column store**:

Abstraction: nested map ColumnFamily<RowKey, Columns<ColKey, Value, Timestamp>>

![alt text](Images/wide-column-store.png)

- A wide column store's basic unit of data is a column (name/value pair). A column can be grouped in column families (analogous to a SQL table). Super column families further group column families. You can access each column independently with a row key, and columns with the same row key form a row. Each value contains a timestamp for versioning and for conflict resolution.
- Google introduced Bigtable as the first wide column store, which influenced the open-source HBase often-used in the Hadoop ecosystem, and Cassandra from Facebook. Stores such as BigTable, HBase, and Cassandra maintain keys in lexicographic order, allowing efficient retrieval of selective key ranges.
- Wide column stores offer high availability and high scalability. They are often used for very large data sets.

## **4. Graph Database**:

Abstraction: graph

![alt text](Images/graph-store.png)

- In a graph database, each node is a record and each arc is a relationship between two nodes. Graph databases are optimized to represent complex relationships with many foreign keys or many-to-many relationships.
- Graphs databases offer high performance for data models with complex relationships, such as a social network. They are relatively new and are not yet widely-used; it might be more difficult to find development tools and resources. Many graphs can only be accessed with REST APIs.

#### Reasons for SQL:

- Structured data
- Strict schema
- Relational data
- Need for complex joins
- Transactions
- Clear patterns for scaling
- More established: developers, community, code, tools, etc
- Lookups by index are very fast

Reasons for NoSQL:

- Semi-structured data
- Dynamic or flexible schema
- Non-relational data
- No need for complex joins
- Store many TB (or PB) of data
- Very data intensive workload
- Very high throughput for IOPS

- MongoDB (Document Store)
- Redis (Key-Value Store)
  - In-memory key-value store designed for speed.
- Apache Cassandra (Column-Family Store)
- Amazon DynamoDB (Key-Value/ Document Store)

### Object Storage

- Where there is large amount of data, and mostly unstructured data. This storage takes place.
- Organizes data as object, rather that file or blocks.
  Each Object includes:

  - Data: This file or blob, such as image or video
  - Metadata: Descriptive information about the object, like its size, content type, or access permissions
  - Unique Identifier: A globally unique key to locate and retrieve the object.

- This design makes object storage highly scalable, cost-effective, and ideal for handling
  unstructured data. Unlike hierarchical file systems, object storage is flat, with no
  directories or folders - it’s all about storing and retrieving objects using their unique keys.

- Data as Object: File is stored as an Object
- Flat Storage Architecture:
  - No folders or hierarchies
  - Objects are stored in "container" or "buckets"
- RESTful APIs
- Scalability
- Durability and Redundancy

##### For Interview:

- https://leetcode.com/discuss/post/3823497/dbms-cheatsheet-for-interviews-30-questi-wnci/
- Why NoSQL over SQL

---

# Caching

- Improves page load times
- Can reduce the load on your servers and databases.
- Databases often benefit from a uniform distribution of reads and writes across its partitions. Popular items can skew the distribution, causing bottlenecks. Putting a cache in front of a database can help absorb uneven loads and spikes in traffic.

## Types of Caching

#### Client Caching

- Caches can be located on the client side (OS or browser)

#### CDN caching

#### Web Server caching

- `Reverse proxies` and caches such as `Varnish` can serve static and dynamic content directly.
- Web servers can also cache requests, returning responses without having to contact application servers.

#### Database caching

- Your database usually includes some level of caching in a default configuration, optimized for a generic use case. Tweaking these settings for specific usage patterns can further boost performance.

#### Application caching

- In-memory caches such as Memcached and Redis are key-value stores between your application and your data storage. Since the data is held in RAM, it is much faster than typical databases where data is stored on disk. RAM is more limited than disk, so cache invalidation algorithms such as least recently used (LRU) can help invalidate 'cold' entries and keep 'hot' data in RAM.

Redis has the following additional features:

- Persistence option
- Built-in data structures such as sorted sets and lists

There are multiple levels you can cache that fall into two general categories: database queries and objects:

- Row level
- Query-level
- Fully-formed serializable objects
- Fully-rendered HTML

Generally, you should try to avoid file-based caching, as it makes cloning and auto-scaling more difficult.

#### Caching at the database query level

- Whenever you query the database, hash the query as a key and store the result to the cache. This approach suffers from expiration issues:

  - Hard to delete a cached result with complex queries
  - If one piece of data changes such as a table cell, you need to delete all cached queries that might include the changed cell.

#### Caching at the object level

- Remove the object from cache if its underlying data has changed
- Allows for asynchronous processing


#### When to update the cache

##### 1. Cache-aside
##### 2. Write-through
##### 3. Write-Behind
##### 4. Refresh-ahead

### Implementation

- Categorized based on where the data is stored
- Caching systems can also be categorized based on where the cache is located within the architecture.

### 1. In-memory Caches

- Store data in RAM, providing extremely fast access.
- Low latency
- Volatile Storage: Data is lost if cache is restarted
- Ex. Redis, Memcached

### 2. Disk-Based Caches

- Store data on persistent storage like hard drives or SSDs, offering slower but more durable caching
- Data persists through restarts, making it ideal for long-term storage of cacheable data.
- Slower than in-memory caches due to disk I/O latency
- Ex. Varnish Cache, browser caches

### 3. Client-Side Caches

- Store data on the user's device (browser or app)
- Reduces server communication by caching data locally
- Specific to individual users, enabling faster response for their repeated requests.
- Mostly for static assets like CSS, Images, for user-specific content
- Ex. Browser Cache, LocalStorage, IndexedDB

### 4. Server-Side Caches

- Store data on or near the server, shared across all users and requests.
- Reduces load on backend systems like databases and APIs
- Optimize performance for high-traffic applications by serving shared data quickly
- For frequently accessed data that is consistent across users, such as API responses, product pages, or popular posts
- Redis, CDNs, NGINX cache

##### For Interview:

- When to remove items from cache:

  - An eviction policy is a set of rules that determines which data to remove from the cache when it reaches its capacity
  - Some policies are:
    - LRU (Least Recently Used)
    - FIFO
    - LFU (Least frequently Used)

- How to keep cache data up to date:

  - An **Invalidation Strategy** is a set of rules that determines how and when cached data is marked as state or removed to keep it consistent with the source data
  - Some policies are: - Time-To-Live (TTL) : Data is removed after a pre-set expiration time. - Event-Based Invalidation: The cache is cleared or updated when the
    underlying data is updated.
  - Manual Invalidation: Cache entries are explicitly removed or refreshed by the application

- How to store data in the cache:

  - A cache write strategy is a set of rules that determines how and when data is written to the cache to ensure it is available for future requests.
  - Some common cache write strategies are:
    - Write-Through: Data is written to the cache and the underlying database simultaneously, keeping them in sync.
    - Write-Behind: Data is first written to the cache and then asynchronously written to the database, improving write performance.
    - Write-Around: Data is written directly to the database and added to the cache only when it is read, reducing cache pollution for infrequently accessed data.

---

# Asynchronism

![[asynchronism.png]]

- Help reduce request times for exprensivce operations that would otherwise be performed in-line. They can also help by doing time-comsuming work in advance, such as periodic aggregation of data.

#### Message Queues
- Receive, hold and deliver messages. 
- If workflow is too slow, then :
	- An application publishes a job to the queue, then notifies the user of job status
	- A worker picks up the job from the queue, processes it, then signals the job is complete

#### Task Queues
- Receive tasks and their related data, runs them, then delivers their results. They can support scheduling and can be used to run computationally-intensive jobs in the background.
#### Back Pressure
- If queues start to grow significantly, the queue size can become larger that memory, resulting in cache misses, disk reads, and even slower performance.
- Can help by limiting the queue size, thereby maintaining a high throughput rate and good response times for jobs already in the queue

---

# Communication

![[communication.png]]

## HTTP (Hypertext Transfer Protocol)

- Method for encoding and transporting data between a client and server. 
- Request/ Response protocol
- HTTP is self-contained, allowing requests and response to flow through many intermediate routers and servers that perform load balancing, caching, encryption, and compression
- An Application protocol relying on lower-level protocol such as UDP and TCP

## TCP (Transmission Control Protocol)

- Connection-oriented protocol over an IP Network
- Connection is established and terminate using a hankshake
- More reliable that UDP
- Guaranteed to react the destination in the original order and without corruption throught:
	- Sequence numbers and checksum fields for each packets
	- Acknowledgemenet packets and automatic retranmission
- Implements flow control and congestion control

## UDP (User Datagram Protocol)

- Connectionless 
- Datagrams are guaranteed only at the datagram level
- Might reach their distination out of order or not at all
- UDP does not support congestion control
- Can broadcast, sending datagrams to all devices on the subneet
- Useful with DHCP because the client has not yet received an IP address
- Less reliable but works well in real time use cases such as  VoIP, Video Chat, Streaming

## RPC (Remote Procedure Call)

![[RPC.png]]

- A client causes a procedure to execute on a different address space, usually a remote server
- The procedure is coded as if it were a local procedure call, abstracting away the details of how to communicate with the server from the client program. Remote calls are usually slower and less reliable than local calls so it is helpful to distinguish RPC calls from local calls. Popular RPC frameworks include [Protobuf](https://developers.google.com/protocol-buffers/), [Thrift](https://thrift.apache.org/), and [Avro](https://avro.apache.org/docs/current/).

RPC is a request-response protocol:

- **Client program** - Calls the client stub procedure. The parameters are pushed onto the stack like a local procedure call.
- **Client stub procedure** - Marshals (packs) procedure id and arguments into a request message.
- **Client communication module** - OS sends the message from the client to the server.
- **Server communication module** - OS passes the incoming packets to the server stub procedure.
- **Server stub procedure** - Unmarshalls the results, calls the server procedure matching the procedure id and passes the given arguments.
- The server response repeats the steps above in reverse order

- Often used for performance reasons with internal communication, as you can hand-craft native calls to better fit your use cases
- Tightly coupled to the service implementation
- Can be difficult to debug RPC

## REST (Representational State Transfer)

- Client/Server Model
- All communication must be stateless and cacheable

- Four Qualities of a RESTful interface:
	- Identify Resources (URI in HTTP)
	- Change with representations (Verbs in HTTP)
	- Self-descriptive error message (Status response in HTTP)
	- HATEOAS (HTML interface for HTTP)
- Focused on exposing data
- Minimizes the coupling between client/server and is often used for public HTTP APIs
- More generic and uniform method of exposing resources through URIs


---

# Some High Level Topic

## Performance vs Scalability

- If you have a performance problem, Your system is slow for a single user.
- But If you have a scalability problem, Your system is fast for single user but not for under heavy load.

## Latency vs Throughput

- Latency is the time required to perform some action or to produce some result
	- Units like hours, seconds, nanoseconds or clock periods

- Throughput is the number of such actions or results per unit of time
	- The term "Memory bandwidth" is sometimes used to specify the throughput of memory systems

- We should aim for maximal throughput with acceptable latency

## Availability vs Consistency

**Consistency** : Every read receives the most recent write or an error
**Availability** : Every request receives a response, without guaratee that it contains the most recent version of the information
**Partition Tolerance** : The system continues to operate despitee arbitraray partitioning due to network failures

_Networks aren't reliable, so you'll need to support partition tolerance. You'll need to make a software tradeoff between consistency and availability._

#### CP - Consistency and Partition tolerance
- Waiting for a response from the partitioned node might result in a timeout error. CP is a good choice if your business needs require atomic reads and writes
#### AP - Availability and Partition tolerance
- Response return the most readily available version of the data available on any node, which might not be the latest. Writes might take some time to propagate when the partition is resolved.
- AP is a good choice if the business needs to allow for [eventual consistency](https://github.com/donnemartin/system-design-primer/?tab=readme-ov-file#eventual-consistency) or when the system needs to continue working despite external errors.

### Consistency patterns

- With multiple copies of the same data, we are faced with options on how to synchronize them so clients have a consistent view of the data. Recall the definition of consistency from the [CAP theorem](https://github.com/donnemartin/system-design-primer/?tab=readme-ov-file#cap-theorem) - Every read receives the most recent write or an error.

#### Weak Consistency

- After a write, reads may or may not see it. A best effort approach is taken
- Seen in systems such as memcached
- Weak Consistency works well in real time use cases such as VoIP, Video Chat, and realtime multiplayer games

#### Eventual Consistency

- After a write, reads will eventually see it, Data is replicated asynchronously
- Seen in systems such as DNS and Email.
- Works well in highly available systems

#### Strong Consistency

- After a write, Reads will see it. Data in replicated synchronously
- Seen in file systems and RDBMSes
- Works well in systems that need transactions

## Availability Patterns

- Two complementrary patterns to support high availability

#### Fail-Over
##### Active-Passive
- Hearbeats are sent between the active and the passive server on standby
- If the heartbeat is interrupted, the passive server takes over the active's IP address and resume service
- The length of downtime is determined by whether the passive server is already running in 'hot' standby or whether it needs to start up from 'cold' standby. Only the active server handles traffic.
- Failover can also be referred to as _master-slave failover_ 

##### Active-active
- both servers are managing traffic, spreading the load between them
- If servers are public-facing, the DNS would need to know about the public IPs of both servers
- If they are internal-facing, application logic would need to know both servers
- Failover can also be referred to as _master-master failover_

#### Replication

##### Master-Slave
##### Master-Master

---

# DNS (Domain Name System)

![[DNS.png]]

- Translates a domain name such as *www.google.com* in to IP Address like *8.8.8.8*
- Hierarchical, with a few authoritative servers at the top level
- Your router or ISP provides information about which DNS servers to contact when doing a lookup.
- Lower level DNS servers cache mappings, which could become stale due to DNS propagation delays
- DNS results can also be cached by your browser or OS for a certain period of time, it's call TTL(Time to Live)

#### Types of DNS

- `NS` record (name server) - Specifies the DNS servers for domain/ subdomain
- `PX` 

- `PTR` - Referred to as reverse-lookup pointer records. PTR records are used to search names of domains based on IP addresses

- `TXT` - A type of DNS that stores text-based information. It's primarily used to verify the ownership of a domain as well as hold SPF (Sender Policy Framework)

- `MX` record (mail exchange) - Specifies the mail servers for accepting messages
	- Maps a domain name and connects them with message transfer agents
	- A mail server is responsible for managing the reception of emails ,and preference values are assigned

- `A` Record (address) - Points a name to an IP address

- `AAAA` Record - Same purpose as `A`, but that hostnames are mapped to an IPv6 address vice an IPv4

- `CNAME` (canonial) - Alias for domains, Points a name to another name or `CNAME` or to an `A` record

#### Disadvantages

- Slight delay, although mitigated by caching ..
- Could be complex and is generally managed by gov., ISPs, and large companies
- DNS services have recently come under _DDos attach_, preventing users from accessing websites such as Twitter without knowing it's IP.

---

# Content Delivery Network (CDN)

- Globally distributed network of proxy servers
- Serving content from locations closer to the user.
- Static files such as HTML / CSS / JS, photos, and videos are served from CDN, although some CDNs such as Amazon's CloudFront support dynamic content. 
- This site's DNS resolution will tell clients which server to contact
- Improved performance in two ways:
	- Users receive content from data centers close to them
	- Your servers do not have to serve requests that the CDN fulfills

#### Push CDNs

- Receive new content whenever changes occur on servers
- We can configure when content expires and when it is updated
- Content is uploaded only when it is new or changed, minimizing traffic, but maximizing storage

#### Pull CDNs

- Grab new content from server when the first user requests the content
- You leave the content on server and rewrite URLs to point to the CDNs
- Slower request until the content is cached on the CDN
- TTL determines how long content is cached.
- Minimize storage space on the CDN, but can create redundant traffic if files expire and are pulled before they have actually changed
- Sites with heavy traffic works well

---

# Load Balancing

- Distribute incoming client requests to computing resources such as application servers and databases
- Effective at:
	- Preventing requests from going to unhealty servers
	- Preventing overloading resources
	- Helping to eliminate a single point of failure
- Additional benefits like:
	- SSL termination: Decrypt incoming requests and encrypt server responses so backend servers do not have to perform these potentially expensive operations
	- Removes the need to install [X.509 certificates](https://en.wikipedia.org/wiki/X.509) on each server
	- Session persistence: Issue cookies and route a specific client's requests to same instance if the web apps do not keep track of sessions
- Various metrics like:
	- Random
	- Least loaded
	- Session/ Cookies
	- Round Robin or Weighted Rount Robin
	- Layer 4
		- Look at info at the *Transport layer* to decide how to distribute requests
		- Involves the source, destination IP addresses, ports in the header, not contain of packet
		- Forward network packets to and from the upstream server, performing NAT
	- Layer 7
		- Look at the *Application layer* to decide
		- Involve contents of the header, message, and cookies
		- Terminate network traffic, reads the message, makes a load-balancing decision, then opens a connection to the selected server

#### Horizontal Scaling

- Improving performance and availability
- Scaling out using commodity machines is more cost efficient and results in higher availability than scaling up a single server on more expensive hardware, called **Vertical Scaling**.
- It is also easier to hire for talent working on commodity hardware than it is for specialized enterprise systems.
###### Disadvantages
- Introduces complexity and involves cloning servers
	- Servers should be stateless: they **should not** contain any user-related data like sessions or profile pictures
	- Sessions can be stored in a centralized data store such as a database or cache like redis, memcached
- Downstream servers such as caches and databases need to handle more simultaneous connections as upstream servers scale out
## Disadvantage

- Can become a performance bottlenech if it doesn't have enough resources of if it is not configured properly
- Help eliminate a single point of failure results in increase complexity
- A single load balancer is a single point of failure, configuring multiple load balancers further increases complexity.

---

# Reverse Proxy

- Web server that centralizes internal services and provides unifies interfaces to the public
- Requests from clients are forwarded to a server that can fulfill it before the reverse proxy return the server's response to the client

- Additional Benefits:
	- **Increased security** - Hide information about backend servers, blacklist IPs, limit number of connections per client\
	- **Increased scalability and flexibility** - Clients only see the reverse proxy's IP, allowing you to scale servers or change their configuration
	- **SSL termination**
	- **Compression** - Compress server responses
	- **Caching** - Return the response for cached requests
	- **Static content** - Serve static content directly
    - HTML/CSS/JS
    - Photos
    - Videos
    - Etc
### Disadvantages

- Increased complexity
- Single point of failure, configuing multiple reverse proxies further increases complexity

---
# Application Layer

- Separating out the web layer from the application layer (knows as platform layer) allows you to scale and configure both layers independently
- Adding a new API results in adding application web servers
- Workers in the application layer also help enable <u>asynchromism</u>

#### Microservices

- Independently deployable, small, modular services
- Each services runs a unique process and communicates through a well-defined lightweight mechanism to serve a business goal

#### Service Discovery

- Systems such as Consul, Etcd, and Zookeeper can help services find each other by keeping track of registered names, addresses, and ports
- Both Consul and Etcd have a built in [key-value store](https://github.com/donnemartin/system-design-primer/#key-value-store) that can be useful for storing config values and other shared data.

#### Disadvantages

- Adding an application layer with loosely coupled services requires a different approach from an architectural, operations, and process viewport 
- Microservices can add complexity in terms of deployment and operations
