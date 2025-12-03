---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-27]]"
---
Tags: #golang 

# concurrency vs parallelism

This is the most intersting topic, that I've ever learned in programming after pointer stuff haha

So, Ability of program to make mutliple threads or use cores of cpu

Often through rapid switching between tasks on a single processor, or by running tasks simultaneously on multiple processors (parallelism)

##### Single-Core Systems:

On a single processor, the system rapidly switches between different tasks (time-sharing or context switching), giving each task a small time slice to execute. This creates the illusion that multiple tasks are running simultaneously. 
##### Multi-Core Systems: 

In a multi-core system, concurrency can also involve parallel execution, where multiple tasks or threads genuinely run at the exact same time on different processor cores. 

We can use `go` keyword infront of function to run concurrent function

```go
go func(){
	fmt.Printf("This is a concurrent function")
}()
```

---
## References

![[concurrency vs parallelism.png]]

--- [[channels]]
