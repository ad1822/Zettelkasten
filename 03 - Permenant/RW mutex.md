---
cssclasses:
  - center-images
  - center-titles
---
Created: Sunday 28th September 2025 16:31:26
Tags: #golang 

# RW mutex

The sync.RWMutex also has these methods for concurrent reads:
`RLock()`
`RUnlock()`

The `sync.RWMutex` improves performance in read-intensive processes. Multiple goroutines can safely read from the map simultaneously, as many `RLock()` calls can occur at the same time. However, only one goroutine can hold a `Lock()`, and during this time, all `RLock()` operations are blocked.



---
## References
