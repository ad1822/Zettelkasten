---
cssclasses:
  - center-images
  - center-titles
---
Created: Wednesday 24th September 2025 01:06:50
Tags: #golang 

# anonymous struct

An anonymous struct is just like a normal struct, but it is defined without a name and therefore cannot be referenced elsewhere in the code.

```go
myCar := struct {
  brand string
  model string
} {
  brand: "Toyota",
  model: "Camry",
}
```
---
## References

https://blog.boot.dev/golang/anonymous-structs-golang/
