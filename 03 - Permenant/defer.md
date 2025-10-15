---
cssclasses:
  - center-images
  - center-titles
---
Created: Friday 26th September 2025 10:15:24
Tags: #golang 

# defer

allows a function to be executed automatically just before its enclosing function returns

The deferred call's arguments are evaluated immediately, but the function call is not executed until the surrounding function returns.

Deferred functions are typically used to clean up resources that are no longer being used. Often to close database connections, file handlers and the like.

```go
func GetUsername(dstName, srcName string) (username string, err error) {
	// Open a connection to a database
	conn, _ := db.Open(srcName)

	// Close the connection *anywhere* the GetUsername function returns
	defer conn.Close()

	username, err = db.FetchUser()
	if err != nil {
		// The defer statement is auto-executed if we return here
		return "", err
	}
	// The defer statement is auto-executed if we return here
	return username, nil
}
```

---
## References
