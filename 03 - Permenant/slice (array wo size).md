---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# slice (array w/o size)

Array is mutute in go,  So can't modify

```go
numbers := []int{1,2,3,4,5}

func passArray(a []int) []int {
	return []int{1, 2, 3, 4, 5}
}

n = append(n[:1], n[2:]...) // Remove a value from slice

```

`lowIndex` is inclusive and `highIndex` is an exclusive

If a function takes a slice argument, any changes it makes to the elements of the slice will be visible to the caller, analogous to passing a pointer (we'll cover pointers later) to the underlying array

from my understanding, slices aren't array or like an array. It's pointer of underlaying array.  So, when we make a slice, behind the hood, it make an array and give that address to our pointer

---
## References

--- [[make]]
--- [[variadic]]
--- [[append]]

--- ![[array and slice functionally in memory]]
--- [[Array]]
