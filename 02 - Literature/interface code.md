---
cssclasses:
  - center-images
  - center-titles
created: "[[../03 - Permenant/04 - Daily/2025-09-24]]"
---
Tags: #golang , #code

# interface code

```go
type shape interface {
	area() float64
	perimeter() float64
}

type square struct {
	side float64
}

func (s square) area() float64 {
	return s.side * s.side
}

func (s square) perimeter() float64 {
	return 4 * s.side
}

type rect struct {
	length, width float64
}

func (r rect) area() float64 {
	return r.length * r.width
}

func (r rect) perimeter() float64 {
	return 2 * r.length * (2 * r.width)
}

func printData(s shape) {
	fmt.Println(s)
	fmt.Println(s.area())
	fmt.Println(s.perimeter())
}
```
---
