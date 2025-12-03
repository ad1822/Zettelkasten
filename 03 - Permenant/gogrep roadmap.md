---
cssclasses:
  - center-images
  - center-titles
created: 2025-12-02
---
Tags: [[04 - Daily/2025-12-02]], #gogrep 

# gogrep roadmap

Good. Let’s turn this into a proper roadmap, not a random hacking session.

Below is a **feature + learning roadmap** from basic → mid-level for building your own `grep` in Go. You can treat it as “phases” or “days” depending on how fast you move.

---

## Phase 0 – Setup and mental model

**Goal:** Understand what you’re cloning and set up the project.

What to build:

- A bare Go CLI skeleton: `mygrep <pattern> <file>`
    

What to learn:

- How real `grep` behaves for simple cases:
    
    - `grep pattern file`
        
    - `echo "text" | grep pattern`
        
- Go basics for CLIs:
    
    - `os.Args`
        
    - `os.Open`, `os.Stdin`
        
    - `bufio.NewScanner` for line-by-line reading
        
- How exit codes work (0 match, 1 no match, >1 error) – you can copy this later.
    

---

## Phase 1 – Tiny grep (literal search only)

**Goal:** First working version, no flags, no regex.

What to build:

- `mygrep pattern file`
    
    - Reads the file line by line
        
    - If `pattern` is a substring of the line, print the line
        
- If `file` is `-` or missing, read from `stdin`
    

What to learn:

- String operations:
    
    - `strings.Contains`
        
- Streaming mindset:
    
    - Don’t load whole file in memory; scan line by line
        
- Basic error handling:
    
    - File not found
        
    - Permission denied
        
    - Handle scanner errors
        

This phase gives you the spine: input → match → output.

---

## Phase 2 – Multiple files and nicer output

**Goal:** Handle more realistic CLI usage.

What to build:

- Support:
    
    - `mygrep pattern file1 file2 file3...`
        
- For multiple files, print in format:
    
    - `file:line`
        
    - Later: `file:lineNumber:line`
        

What to learn:

- Looping over multiple filenames
    
- File metadata:
    
    - Decide “print filename or not” based on number of files (like real `grep`)
        
- Clean function boundaries:
    
    - One function to process a single file
        
    - One loop to orchestrate multiple files
        

This teaches you basic design: don’t cram everything in `main`.

---

## Phase 3 – Core flags (behavioural control)

**Goal:** Implement a few core flags that force you to reason about control flow.

Start with:

- `-n` → show line numbers
    
- `-i` → case-insensitive matching
    
- `-v` → invert match (show non-matching lines)
    
- `-c` → print only count of matching lines per file
    

What to learn:

- Argument parsing:
    
    - Start with manual parsing, then consider `flag` package
        
- Case folding:
    
    - `strings.ToLower` or `strings.EqualFold`
        
- Encapsulation:
    
    - A `Matcher` struct/config that holds:
        
        - pattern
            
        - ignoreCase
            
        - invert
            
        - countOnly
            
- How one flag changes the whole pipeline:
    
    - `-c` means aggregate counts instead of printing lines
        
    - `-v` means your “match” logic flips
        

By the end of this, your tool is already useful.

---

## Phase 4 – Input modes (files, stdin, directories)

**Goal:** Make it behave like a real Unix tool.

What to build:

- Proper stdin support:
    
    - `mygrep pattern` reading from stdin
        
- Directory recursion flag:
    
    - `-r` or `-R` → walk directories and search all regular files
        

What to learn:

- Detecting stdin vs file:
    
    - If no file args → read from stdin
        
- Filesystem APIs:
    
    - `filepath.WalkDir` / `filepath.Walk`
        
    - Skipping directories, symlinks, binary files if you want
        
- Designing options:
    
    - How does `grep` behave with `-r .`?
        
    - How do you avoid searching things like `.git` if you don’t want to?
        

Now you’re in “real-tool” territory, not just toy level.

---

## Phase 5 – Regex using Go’s engine

**Goal:** Move from literal substring search to full regex.

What to build:

- `mygrep -e <pattern> file...` where `<pattern>` is a regex
    
- Or: treat the first argument as regex by default (like grep)
    
- Handle invalid regex with good error messages
    

What to learn:

- Go’s `regexp` package:
    
    - `regexp.Compile`
        
    - `re.MatchString(line)`
        
- Performance basics:
    
    - Compile regex once, reuse for all lines
        
- API design:
    
    - Support both:
        
        - Literal search mode (e.g., `-F` flag)
            
        - Regex mode (default or `-E`)
            

Important mental model: Go’s `regexp` is backtracking, not DFA like real `grep`. Performance will differ; that’s fine. The goal is understanding.

---

## Phase 6 – Small regex subset engine (optional but valuable)

**Goal:** Learn how `grep`-style pattern engines work under the hood.

What to build:

- A minimal custom matcher for a tiny regex subset, for example:
    
    - Literals: `abc`
        
    - Dot: `.`
        
    - Star: `*` meaning “zero or more of previous char”
        
    - Maybe question mark: `?` for “zero or one”
        
- A flag like `--mini-regex` to use your own engine instead of `regexp`
    

What to learn:

- Parsing basics:
    
    - Convert pattern string into a small AST or postfix form
        
- Automata basics:
    
    - NFA (non-deterministic finite automaton) as a conceptual model
        
    - Or simple backtracking matcher you write yourself
        
- Trade-offs:
    
    - Why real grep uses DFA-style engines for performance
        
    - Why backtracking can blow up in worst cases
        

This is where the “understand underlying tool deeply” really happens.

---

## Phase 7 – Performance & concurrency

**Goal:** Think like a systems programmer.

What to build:

- Benchmarks comparing:
    
    - Literal mode vs regex mode
        
    - Your mini engine vs Go’s `regexp`
        
- Optional: concurrent file scanning
    
    - Use goroutines to process files in parallel
        
    - Limit concurrency with a worker pool
        

What to learn:

- `go test -bench` for benchmarks
    
- Profiling:
    
    - `go test -bench . -cpuprofile=cpu.out`
        
    - `go tool pprof`
        
- Concurrency primitives:
    
    - Goroutines
        
    - Channels
        
    - Worker pool pattern
        
- IO performance:
    
    - Effect of using `bufio.Reader`
        
    - Chunk size vs `Scanner`
        

Here you start seeing why tools like `grep` are so fast and what “I/O bound vs CPU bound” really means.

---

## Phase 8 – Polish and UX

**Goal:** Turn it from “student project” to “usable tool”.

What to build:

- `--help` and usage text
    
- Clear error messages on:
    
    - No pattern given
        
    - No files found
        
    - Invalid regex
        
- Exit codes:
    
    - 0 → at least one match
        
    - 1 → no match
        
    - 2 → error (IO / regex / arguments)
        
- Optional:
    
    - `--color` to highlight matches
        
    - `-H` / `-h` for showing/hiding filenames
        

What to learn:

- Designing CLI ergonomics:
    
    - Discoverability, consistency with Unix tools
        
- How small UX decisions make the tool feel “real”
    

---

## Phase 9 – Testing and reliability

**Goal:** Gain confidence it works in edge cases.

What to build:

- Unit tests for core matching logic
    
- Integration tests using:
    
    - Small test files
        
    - Golden output files
        

What to learn:

- `go test` patterns:
    
    - Table-driven tests
        
- Snapshot/golden test idea:
    
    - Given input files + args → expected stdout and exit code
        
- Edge cases:
    
    - Empty files, empty pattern
        
    - Long lines
        
    - Non-UTF-8 bytes (if you decide to care)
        

---

## How to use this roadmap

You don’t need to do every phase to “finish” the project. But the phases are ordered so that each one unlocks a specific concept:

- Phases 1–3 → CLI IO + control flow
    
- Phase 4 → filesystem and streams
    
- Phase 5 → real-world regex usage
    
- Phase 6 → internals and theory
    
- Phase 7 → performance and concurrency thinking
    
- Phase 8–9 → engineering polish
    

By the time you have a mid-level version, you’ll understand not just “how to call grep”, but how to think like the person who wrote it. That’s the real win.


---
## References
