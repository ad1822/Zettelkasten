---
cssclasses:
  - center-images
  - center-titles
---
Created: Saturday 27th September 2025 14:32:32
Tags: #golang 

# range

This is a very range feature of go

The range form of the for loop iterates over a slice or map.

When ranging over a slice, two values are returned for each iteration. The first is the index, and the second is a copy of the element at that index. 

```go
nums := []int{10,20,30,40,50}
for idx, val := range nums {
	fmt.Printf("%v: %v\n", idx, val)
	// 1:10
}
```

---
## References
