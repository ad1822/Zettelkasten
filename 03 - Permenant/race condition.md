---
created: "[[04 - Daily/2025-09-28]]"
cssclasses:
  - center-images
  - center-titles
---
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
