---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-12-02]]"
---
Tags: [[04 - Daily/2025-12-02]], #gogrep 
# gogrep

##### Exit code behavior

Right now you always exit with status 0 unless `log.Fatal` fires.

- 0 → at least one match
- 1 → no matches
- 2 → error
So you should track `matched := false` and set exit code accordingly after processing. Not urgent for now, but keep this in mind early.

---
## References
