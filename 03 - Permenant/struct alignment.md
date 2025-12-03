---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-24]]"
---
Tags: #golang 

# struct alignment

Struct alignment refers to the arrangement of struct fields in memory such that each field starts at an address divisible by its alignment requirement. The Go compiler ensures proper alignment to improve performance by minimizing misaligned memory access.

```go
type Example struct {
 A byte // 1 byte
 B int32 // 4 byte
 C byte // 1 byte
}
```
The total size of the struct becomes 12 bytes, even though the fields only require 6 bytes.
All field try to alignment with the largest field's which is 4 byte. 
##### Why does padding exist in go ? 

Padding exists to meet the CPU’s alignment requirements. 
Misaligned memory access can:
1. **Cause performance penalties**: Accessing unaligned memory can lead to additional memory cycles.
2. **Result in undefined behavior**: Although Go abstracts this complexity, misaligned access can cause issues at the hardware level on some platforms.

To ensure efficient memory access, Go automatically adds padding where necessary.

#### Optimizing Struct Layout in Go

Padding can increase the size of structs, especially for memory-sensitive applications. To reduce padding, you can reorder struct fields by size.

```go
type Efficient struct {
    B int32 // 4 bytes
    A byte  // 1 byte
    C byte  // 1 byte
}
```

By grouping fields of similar sizes, you eliminate unnecessary padding. The size of the Efficient struct becomes 8 bytes instead of 12 bytes.

##### Cross-Platform Considerations

In Go, the alignment requirements are platform-dependent:
- On a 32-bit architecture, int requires 4-byte alignment.
- On a 64-bit architecture, int requires 8-byte alignment.

To write portable and efficient code, always verify struct sizes using unsafe.Sizeof.

---
## References

https://medium.com/@praffulmishra/struct-alignment-and-padding-in-go-a-comprehensive-guide-ae928d5a9d5e
