---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# empty struct

Used in go as an `unary` value

```go
// anonymous empty struct type
empty := struct{}{}

// named empty struct type
type emptyStruct struct{}
empty := emptyStruct{}
```

The cool thing about empty structs is that they're the smallest possible type in Go: they take up zero bytes of memory.

![[empty struct.png]]

---
## References
