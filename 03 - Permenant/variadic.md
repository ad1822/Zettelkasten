---
cssclasses:
  - center-images
  - center-titles
---
Created: Thursday 25th September 2025 00:27:47
Tags: #golang 

# variadic

use `...` as a parameter of function, as a value, for printing, for arrays, slices

```go
func printthis(num ...int){
	for i:= 0; i < len(num); i++{
		// do whatever with i
	}
}
```
#### Spread Operator

The spread operator allows us to pass a slice into a variadic function. The spread operator consists of three dots following the slice in the function call.

```
names := []string{"bob", "sue", "alice"}
printStrings(names...)
```
---
## References

--- [[append]]
