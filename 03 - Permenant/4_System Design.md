---
cssclasses:
  - center-images
  - center-titles
---
Tags: #system-design

# 4_System Design

# Consistent Hashing
### Traditional Hashing Limitations:
- In standard hashing, objects are mapped to a fixed search space, and requests are routed to corresponding nodes. However, this approach becomes inefficient when nodes are added or removed, as it requires rehashing most keys, leading to significant data redistribution.

### Consistent Hashing Solution:
- Consistent hashing addresses this by mapping both servers and requests onto a shared key space (often represented as a ring). Each request is assigned to the nearest server in a clockwise (or counter-clockwise) direction. This ensures that:

- Only a minimal subset of keys needs remapping when nodes join or leave.

- The system maintains high flexibility and scalability.

- Servers store relevant request data, enabling efficient load distribution while minimizing disruptions during topology changes.
