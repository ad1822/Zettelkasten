---
cssclasses:
  - center-images
  - center-titles
---
Created: Friday 26th September 2025 10:03:48
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
