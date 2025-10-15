---
cssclasses:
  - center-images
  - center-titles
---
Created: Wednesday 24th September 2025 00:31:37
Tags: #golang 

# struct

Collection type that contain other types
Key-Value pairs (same as python dictonaries)

represent structured data

```go
type car struct {
	brand      string
	model      string
	doors      int
	mileage    int
}

type vehical struct {
	car car
}
```
---
## References

--- [[nested struct]]
--- [[anonymous struct]]
--- [[embedded struct]]
--- [[struct methods]]
--- [[memory layout]]
--- [[empty struct]]

![[passing value and reference in struct]]


--- [[struct vs interface]]

![[struct pointer]]