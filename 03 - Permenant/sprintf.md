---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# sprintf

A convenient way to format strings in Go is by using the standard library's fmt.Sprintf() function. It's a string interpolation function, similar to Python's f-strings. The %v substring uses the type's default formatting, which is often what you want.

```go
const name = "Kim"
const age = 22
s := fmt.Sprintf("%v is %v years old.", name, age)
// s = "Kim is 22 years old."
s := fmt.Sprintf("I am %.2f years old", 10.523) // Rounding float value
```


---
## References
