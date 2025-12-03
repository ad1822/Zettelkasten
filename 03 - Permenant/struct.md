---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-24]]"
---
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