---
created: "[[04 - Daily/2025-09-23]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 


# passing by value vs reference

There are two ways to use variables in program
1. Passing by Value
2. Passing by Reference
## Passing by Value

```go
x := 5
y := x
```

So, in this. there are two variables x, y. y will use to value of x and make an other memory allocation for that. 

## Passing by Reference

```go
x := 5
y := &x
```

In this, y will use address of x which is written by `&x`, And If we want to access a data of y, we can use `*y`


**In pass by value, a copy of the value is made in memory, and any changes affect only the copy, not the original.
In pass by reference, a pointer to the original value is used, so changes directly affect the original memory, which also reduces memory usage since no full copy is made.**

---
## References

![[value vs reference]]
