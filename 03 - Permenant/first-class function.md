---
cssclasses:
  - center-images
  - center-titles
---
Created: Wednesday 24th September 2025 00:35:42
Tags: #golang 


# first-class function

when functions in that language are treated like any other variable
 
For example, in such a language, a function can be passed as an argument to other functions, can be returned by another function and can be assigned as a value to a variable.

```go
func aggregate(a, b, c int, arithmetic func(int, int) int) int {
  firstResult := arithmetic(a, b)
  secondResult := arithmetic(firstResult, c)
  return secondResult
}
```
---
## References
