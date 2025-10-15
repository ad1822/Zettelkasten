---
cssclasses:
  - center-images
  - center-titles
---
Created: Thursday 25th September 2025 00:33:52
Tags: #golang 

# append

If the underlying array is not large enough, append() will create a new underlying array and point the returned slice to it.

Notice that append() is variadic, the following are all valid:

```go
slice = append(slice, oneThing)
slice = append(slice, firstThing, secondThing)
slice = append(slice, anotherSlice...)
```
---
## References
