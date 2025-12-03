---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-27]]"
---
Tags: #golang 

# nil pointers

If a pointer points to nothing (the zero value of the pointer type) then dereferencing it will cause a runtime error (a panic) that crashes the program. Generally speaking, whenever you're dealing with pointers you should check if it's nil before trying to dereference it.

---
## References
