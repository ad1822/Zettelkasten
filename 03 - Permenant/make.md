---
created: "[[04 - Daily/2025-09-25]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# make

We can create a new slice using the make function

```go
buf := make([]int,5, 10) // type, len, capacity

// the capacity argument is usually omitted and defaults to the length
buf := make([]int, 5)
```

Slices Created with make will be filled with the zero value of the type.


---
## References
