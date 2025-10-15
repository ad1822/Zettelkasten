---
cssclasses:
  - center-images
  - center-titles
---
Created: Sunday 28th September 2025 23:37:55
Tags: #golang 

# thread safe

thread-safe when it can be invoked or accessed concurrently by multiple threads without causing unexpected behavior

As in the multi-threaded context where a program executes several threads simultaneously in a shared address space and each of those threads has access to every other thread's memory, thread-safe functions need to ensure that all those threads behave properly and fulfill their design specifications without unintended interaction

This concept is higlt coupled to mutex, because what mutex do is thread safely of our data by doing lock and unlock operations

---
## References

--- [[race condition]]
--- [[data corruption]]