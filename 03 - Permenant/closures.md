---
created: "[[2025-09-26]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang

# closures
	
A closure is a function that references variables from outside its own function body. The function may access and assign to the referenced variables.

```go
func concatter() func(string) string {
	doc := ""
	return func(word string) string {
		doc += word + " "
		return doc
	}
}

func main(){
	function := concatter()
	string := function("Hi")
	fmt.Printf("%s\n", string)
}

```

---
## References
