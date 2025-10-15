---
cssclasses:
  - center-images
  - center-titles
---
Created: Tuesday 23rd September 2025 16:38:30
Tags: #golang 

# types of variables

- Integers, uints, floats, and complex numbers all have type sizes.
- Signed Integers (No Decimal)

```go
int  int8  int16  int32  int64
```

- Unsigned Integers (Whole Numbers/No Decimal)
- "uint" stands for "unsigned integer".

```go
uint uint8 uint16 uint32 uint64 uintptr
```

- Signed Decimal Numbers

```
float32 float64
```

- Complex Numbers (a Complex Number Has a Real and Imaginary Part)

```
complex64 complex128
```

```go
rune  // alias for int32
byte // alias for uint8
```
###  What's the Deal With the Sizes?

The size (8, 16, 32, 64, 128, etc) represents how many `bits` in memory will be used to store the variable. The "default" int and uint types refer to their respective 32 or 64-bit sizes depending on the environment of the user.

The "standard" sizes that should be used unless you have a specific performance need (e.g. using less memory) are:

    int
    uint
    float64
    complex128
### Converting Between Types

```go
temperatureFloat := 88.26
temperatureInt := int64(temperatureFloat)
```

---
## References

[[declaring variables]]
