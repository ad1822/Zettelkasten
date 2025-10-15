---
cssclasses:
  - center-images
  - center-titles
---
Created: Sunday 28th September 2025 23:38:21
Tags: #golang 

# race condition

A race condition happens when the output of a program depends on the timing or order of thread execution.

It usually occurs when multiple threads access a shared resource without proper synchronization.

```go
counter := 0

go func() { counter++ }()
go func() { counter++ }()
```

---
## References
