---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# errors

Error is an interface
Go programs express errors with error values. An Error is any type that implements the simple built-in error interface:

```go
type error interface {
    Error() string
}
```

When something can go wrong in a function, that function should return an error as its last return value. Any code that calls a function that can return an error should handle errors by testing whether the error is nil.

---
## References

--- [[nil]]
