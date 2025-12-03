---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-28]]"
---
Tags: #golang 

# mutex

Allow us to lock and unlock an access of data
Ensures that which go rountines can access a data at which time

`sync.mutex` is a go library for mutex
`.Lock()`
`.Unlock()` 
We can protect a block of code by surrounding it with a call to Lock and Unlock as shown on the protected() function below.

It's good practice to structure the protected code within a function so that defer can be used to ensure that we never forget to unlock the mutex.

```go
func protected(){
    mu.Lock()
    defer mu.Unlock()
    // the rest of the function is protected
    // any other calls to `mu.Lock()` will block
}
```

Suppose, there are two go routines that are accessing and modifing a same variable. Now, if both are doing this at a same time, our variable could be corrupt or return a wrong unexpected value. Instead of that, Mutex allows us to block, unblock access of variable.
So, If one goroutine is accessing our variable, it will block that for another goroutine and another goroutine would wait to unblock that. So by doing this, our variable would return an expected value after operations

---
## References

--- [[RW mutex]]
