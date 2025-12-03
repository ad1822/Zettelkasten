---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
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
