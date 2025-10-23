---
cssclasses:
  - center-images
  - center-titles
---
Tags: #js, #nodejs

- A request can be divided into CPU work and I/O work
- Servers handle requests using threads, which each independently handle requests
- Nonblocking I/O allows a thread to suspend a request while it's performing IO work on a different request
- Non-blocking I/O allows nodejs to efficiently handle IO-heavy workloads with only one 


- JavaScript uses a **call stack** to keep track to function execution. So, when function is called, it's added to the stack. And when function returns, it's removed from the stack

- Nodejs just runs on a single tread, but uses an event-driven non-blocking IO model. This allows it to handle multiple concurrent connections efficiently without getting stuck waiting for slow task. By using event loop and background worker threads
- Libuv - C++ library powers nodejs enabling its asynchronous event-driven architecture, handling IO operations efficiently

![[Pasted image 20250731172054.png]]
