---
created: "[[04 - Daily/2025-09-26]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# currying function

Function that takes function as an argument and return another function from that function

```go
func curry(arithmetic func(int, int) int) func(int) int {
	return func(i int) int {
		return arithmetic(i, i)
	}
}

func main(){
	n := curry(add)
	num := n(2)
	fmt.Printf("%d\n", num)
}
```


---
## References
