---
cssclasses:
  - center-images
  - center-titles
---
Tags: #js, #nodejs

### Concurrency VS Parallelism


### Await group


## Channels
- Go's concurrency model, which is built around goroutines and channels

```go
ch := make(chat ints)
```

- It’s like a queue where one goroutine can `send` a value, and another can `receive` it.

1. Receive from channel

```go
value := <- ch
```

- You're waiting to receive a value from the channel  `ch`

2. Sent to channel

```go
ch <- 42
```

- You're sending the value  `42` into the channel  `ch`

```go

for {
    select {
    case task := <-taskQueue:
        task() // run the received function
    }
}
```

- Here, We're polling  `taskQueue` and running any incoming tasks
## Mutex
