---
cssclasses:
  - center-images
  - center-titles
---
Created: Friday 26th September 2025 16:47:15
Tags: #golang 

# pointers

When we assign a value to a variable, we are storing that value in a specific location in memory.

**Pointer is a variable that stores the memory address of another variable**
*This means that a pointer "points to" the location of where the data is stored, not the actual data itself.*

```go
myString := "hello"
myStringPtr := &myString
```

---
## References

--- [[nil pointers]]

![[02 - Literature/pointers|pointers]]