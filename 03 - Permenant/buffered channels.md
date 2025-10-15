---
cssclasses:
  - center-images
  - center-titles
---
Created: Saturday 27th September 2025 22:48:06
Tags: #golang 

# buffered channels

**Sized buffer**
Buffered channels allow sending without immediate receivers (up to buffer capacity)

```go
bf := make(chan int, 5)
```

A buffer allows the channel to hold a fixed number of values before sending blocks. This means sending on a buffered channel only blocks when the buffer is full, and receiving blocks only when the buffer is empty.

---
## References
--- [[select]]
--- [[mutex]]