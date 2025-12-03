---
created: "[[04 - Daily/2025-09-24]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 

# nil

In Go, `nil` is the **zero value for pointers, interfaces, maps,
slices, channels and function types**, representing an *uninitialized*
value.

`nil` doesn't mean some "undefined" state, it's a proper value in
itself. An object in Go is `nil` simply if and only if it's value is
`nil`, which it can only be if it's of one of the aforementioned
types.

An `error` is an interface, so `nil` is a valid value for one, unlike
for a `string`. For obvious reasons a `nil` error represents *no
error*.

---
