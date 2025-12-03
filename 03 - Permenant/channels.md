---
created: "[[04 - Daily/2025-09-27]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# channels

Channels are a typed, *thread-safe queue / pipes*. Channels allow **different goroutines to communicate** with each other.
- synchronization mechanism with a built-in queue
- Understand like this, channels are basically slice or map but for go routines
- So different _go routines_ can share data between each other

```go
ch := make(chan int)

// Send data to channel
ch <- 69 // Sender Side

// Receive data from channel
// Receiver Side
data := <- ch // Data :  69
```

Sender `(ch <- v)` holds out a value.
Receiver `(<-ch)` holds out an empty hand.
Until both sides meet, nothing happens. Both are stuck waiting.
If only the sender exists and nobody calls `<-ch`, that sender blocks forever.
If only the receiver exists and nobody does `ch <- v`, the receiver blocks forever.
We can't use one value, more than one time. Because If we add data in channel and receiver receive that data, now that value discard from channel

---
## References

--- [[buffered channels]]
