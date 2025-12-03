---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-25]]"
---
Tags: #golang 

# map

Provides key-value pair like hashmap in c++. Most used thing that I ever used

```go
num := make(map[string]int)
num["Name"] = 20

ages = map[string]int{
  "John": 37,
  "Mary": 21,
}

```

Time complexity of search in map is `O(1)`, so faster that everything slices , arrays because they have `O(n)`


```go
// Insert an Element
m[key] = elem

// Get an Element
elem = m[key]

//Delete an Element
delete(m, key)

// Check If a Key Exists
elem, ok := m[key]
if ok != true {
	error key doesn't exists
}

// use struct to do some complex tasks
type Key struct {
    Path, Country string
}
hits := make(map[Key]int)
									
```

---
## References

https://go.dev/blog/maps
--- [[range]]
