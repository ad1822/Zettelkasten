---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-09-23]]"
---
Tags: #golang 

# fmt package

Implemnts formatted I/O with functions analogous to C's printf and scanf. The format 'verbs' are derived from C's but are simpler.

```
%v	the value in a default format
	when printing structs, the plus flag (%+v) adds field names
	
%#v	a Go-syntax representation of the value
	(floating-point infinities and NaNs print as ±Inf and NaN)
	
%T	a Go-syntax representation of the type of the value

%%	a literal percent sign; consumes no value

%t	the word true or false

%c the character represented by the corresponding Unicode code point

%s	the uninterpreted bytes of the string or slice

%p	base 16 notation, with leading 0x
The %b, %d, %o, %x and %X verbs also work with pointers,
formatting the value exactly as if it were an integer.

%d   integer value

%s   string

%p   address of variable
```

- `fmt.Printf()` - Prints a formatted string to *standard out*
- `fmt.Sprintf()` - **Returns** a formatted string


---
## References

https://pkg.go.dev/fmt
--- [[sprintf]]
