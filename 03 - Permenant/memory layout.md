---
cssclasses:
  - center-images
  - center-titles
---
Created: Wednesday 24th September 2025 01:16:34
Tags: #golang 

# memory layout

structs sit in memory in a contiguous block, with fields placed one after another as defined in the struct

```go
type stats struct {
	Reach    uint16
	NumPosts uint8
	NumLikes uint8
}
```

![[memory layout.png]]

![[memory wasted layout.png]]

--- [[struct alignment]]

---
## References
