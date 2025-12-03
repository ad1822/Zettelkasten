---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# anonymous function

Anonymous functions are true to form in that they have no name. They're useful when defining a function that will only be used once or to create a quick closure.

```go
func conversions(converter func(int) int, x, y, z int) (int, int, int) {
	convertedX := converter(x)
	convertedY := converter(y)
	convertedZ := converter(z)
	return convertedX, convertedY, convertedZ
}
```
---
## References
