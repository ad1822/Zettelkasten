---
cssclasses:
  - center-images
  - center-titles
---
Created: Wednesday 24th September 2025 00:53:52
Tags: #golang 


# nested struct

```go
type car struct {
  brand string
  model string
  doors int
  mileage int
  frontWheel wheel
  backWheel wheel
}

type wheel struct {
  radius int
  material string
}

myCar := car{}
myCar.frontWheel.radius = 5
// This works better for readability
myCar := car{
	branch: "This"
	frontWheel = wheel{
		radius: 4	
	}
}
```

---
## References
