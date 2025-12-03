---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# struct vs interface

### struct: Defining data structures

`struct` is basically like a class. To encapsulate a data and make instances out of them
also define method in struct like this:

```go
func (s *struct) functionName(){}
```
### interface: Defining behaviour of methods

There is no explicit declaration of intent, no “implements” keyword. They specify a set of methods , but do not implement them.

Interfaces provide a way to specify behavior without actually implementing it

In other words, an interface defines what methods should be implemented by any type that claims to satisfy it.

![[interface code]]

Interface behave like a polymorphism

