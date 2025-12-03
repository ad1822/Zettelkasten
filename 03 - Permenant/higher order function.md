---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-26]]"
---
Tags: #golang 

# higher order function

higher-order function is a function that can take other functions as arguments or return a function as its result

```go
func add(a, b int) int {
	return a + b
}
func doSomeThing(a, b, c int, sum func(int, int) int) int {
	return sum(sum(a, b), c)
}
```

Here, `func(int,int) int` is a first class function. because it store in memory like a variable
`func doSomeThing()` is a higher order function function. because it takes other function as a argument and returns a function as a return value


---
## References
