---
cssclasses:
  - center-images
  - center-titles
---
Created: Saturday 27th September 2025 14:40:04
Tags: #golang 

# nil pointers

If a pointer points to nothing (the zero value of the pointer type) then dereferencing it will cause a runtime error (a panic) that crashes the program. Generally speaking, whenever you're dealing with pointers you should check if it's nil before trying to dereference it.

---
## References
