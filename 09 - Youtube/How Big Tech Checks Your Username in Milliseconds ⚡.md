---
title: How Big Tech Checks Your Username in Milliseconds ⚡
channel: ByteMonk
source: https://www.youtube.com/watch?v=_l5Q5kKHtR8
duration: 11:14
---

Tags: #algo, #tries, #system-design

This note summarizes the techniques and data structures used by large-scale platforms like Google, Amazon, and Meta to efficiently check for username availability among billions of users.

### The Challenge

A simple database query to check for a username's existence is not scalable and can lead to performance issues, high latency, and bottlenecks. To solve this, a combination of in-memory data structures, caching, and distributed systems are used.

---

## Data Structures for Username Lookups

### 1. Redis (Hash maps)

Redis is an in-memory key-value store that provides fast lookups.

-   **How it works:** A hash map stores usernames as keys and user IDs or a placeholder flag as values. When a user checks for a username, the system queries the hash map.
-   **Performance:** O(1) time complexity for lookups.
-   **Pros:**
    -   Extremely fast in-memory lookups (cache hit).
    -   Avoids database queries for existing usernames.
-   **Cons:**
    -   Limited by available memory; cannot store billions of usernames in a single instance.
    -   Only supports exact match lookups.

![[redis.png]]

### 2. Tries (Prefix Trees)

Tries are tree-like structures that organize strings by their shared prefixes.

-   **How it works:** Each username is broken down character by character, forming a path in the tree. Shared prefixes reuse the same path, which saves space.
-   **Performance:** O(M) time complexity for lookups, where M is the length of the string. The lookup time is independent of the total number of usernames.
-   **Pros:**
    -   Efficient prefix-based queries.
    -   Ideal for autocomplete and suggesting similar usernames.
    -   Compressed data through shared prefixes.
-   **Cons:**
    -   Can consume a lot of memory if there is not much overlap between usernames.
    -   Compressed tries (like Radix Tries) can be used for optimization.

![[tries.png]]

### 3. B+ Trees

B+ Trees are used for storing and searching large, sorted datasets, especially in traditional databases.

-   **How it works:** B+ Trees keep keys sorted and allow for efficient lookups. They have a high fan-out, meaning each node can store many keys, which keeps the tree shallow.
-   **Performance:** O (log n) time complexity for lookups.
-   **Pros:**
    -   Efficient for range queries (e.g., finding the next available username alphabetically).
    -   No false positives.
    -   Used in many relational and NoSQL databases (e.g., MongoDB, Foundation DB).
-   **Cons:**
    -   Performance can degrade on a single machine as the dataset grows into the billions.
    -   Requires distributed systems like Google Cloud Spanner for horizontal scaling.

![[b+ tree.png]]

### 4. Bloom Filters

Bloom filters are probabilistic data structures that are highly memory-efficient for checking if an item might be in a set.

-   **How it works:** A bloom filter is a bit array. When a username is added, it's hashed multiple times, and each hash sets a corresponding bit in the array. To check a username, it's hashed in the same way. If any of the bits are zero, the username is definitely not in the set. If all bits are one, it's *probably* present.
-   **Performance:** O(k) time complexity, where k is the number of hash functions.
-   **Pros:**
    -   Extremely memory-efficient. (e.g., 1 billion usernames with a 1% false positive rate requires about 1.2 GB of memory).
    -   No false negatives.
    -   Acts as a first line of defense to avoid unnecessary database hits.
-   **Cons:**
    -   Can have false positives.
    -   Cannot delete items.

![[bloom filter.png]]

---

## System Architecture: A Multi-Layered Approach

In real-world systems, these data structures are layered to maximize speed and minimize database load.

1.  **Load Balancer:** User requests are routed to the closest regional data center (global load balancing) and then distributed among backend servers (local load balancing).
2.  **Bloom Filter:** The request first hits a Bloom filter in the application server's memory. If the username is definitely not present, the check stops here.
3.  **Cache (Redis/Geocached):** If the Bloom filter is unsure, the request goes to an in-memory cache. If the username was checked recently, the result is returned instantly.
4.  **Distributed Database:** If it's a cache miss, the query finally hits the distributed database (e.g., Apache Cassandra, Amazon Dynamo DB), which is the authoritative source.

This multi-layered architecture ensures that most lookups are handled by fast, in-memory checks, and only a small fraction of requests hit the database.
![[system.png]]

---

## Comparison

![[comparison.png]]
