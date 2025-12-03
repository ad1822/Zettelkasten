---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-23]]"
---
Tags:  #golang 

# Memory management

Unlike c, rust memory management is manual, In go case. It sits between vm and manual way.

Go compiler includes a small amount of code for memory management with compilation of code, Extra code is called as `go runtime`. So it's not heavy as `jvm` and not light like `c, rust`

`java` uses a virtual machine to interpret bytecode at runtime and typically allocates more on the heap.

One of the purposes of the Go runtime is to clean up unused memory at runtime. It includes a garbage collector that automatically frees up memory that's no longer in use.

---
## References

https://storage.googleapis.com/qvault-webapp-dynamic-assets/lesson_videos/go-memory.mp4
