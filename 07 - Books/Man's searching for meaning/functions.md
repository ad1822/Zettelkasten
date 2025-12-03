---
cssclasses:
  - center-images
  - center-titles
created: "[[../../03 - Permenant/04 - Daily/2025-09-23]]"
---
Tags: #golang 

# functions

Use as a normal function. 
But Function in go can returns a mutliple values

```go
func doSum(a,b int)(int, error) {
	sum := a + b
	return sum, err
}
```

we can catch those value like this, and If we don't want to use value, Use `_`

In Go, the blank identifier isn't just a convention; it's a real language feature that completely discards the value.

```go
sum, __ := doSum()
```


---
## References

--- [[passing by value vs reference]]
--- [[early returns]]
--- [[first-class function]]
--- [[anonymous function]]
--- [[higher order function]]
--- [[currying function]]
--- [[defer]]
