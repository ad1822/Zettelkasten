---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-12-02]]"
---
Tags: [[04 - Daily/2025-12-02]], #gogrep, #golang 
# How to read file for gogrep

So, thing is to read file line by line using buffer or something,

`os.ReadFile()`: this function reads the whole file at once, store it into program's memory and then print. It directly handles `defer file.Close()`and `EOF` thing, So we don't have to manually close file using defer or EOF, But this. operation is heavy for my project.



---
## References
