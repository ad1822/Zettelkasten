---
cssclasses:
  - center-images
  - center-titles
created: "[[2025-12-03]]"
---
Tags: #gogrep 

# gogrep algorithm roadmap

Do the **hybrid grep**:  
your own fast substring search **plus** a small custom regex engine with limited features.

Naive-only is too basic.  
Full-blown PCRE clone is overkill.  
This middle path is exactly the “not basic, not too advanced” zone.

I’ll define it precisely so there’s no fuzziness.

---

## 1. Literal search: implement a real algorithm, not naive

You should:

- Implement **Boyer–Moore–Horspool (BMH)** for substring search.
    
- Do **not** use:
    
    - `strings.Contains`
        
    - `strings.Index`
        
    - `regexp`
        

You are allowed to use basic language stuff: slices, loops, `len`, etc.

BMH is a proper algorithm:

- Precompute a skip-table from the pattern.
    
- While scanning the text, you compare from the end of the pattern and jump ahead using the table.
    
- In practice, it’s much faster than naive and simpler than full Boyer–Moore or KMP.
    

This alone already puts you above “toy project” level.

---

## 2. Mini-regex engine: small, focused subset

Then layer a **small regex engine** on top of that. Not full regex, just a tight subset:

Support:

- Literals: `abc`
    
- Dot: `.`
    
- Quantifiers (on a single char or dot):
    
    - `a*`
        
    - `a+`
        
    - `a?`
        
- Character classes:
    
    - `[abc]`
        
    - `[a-z]`
        
- Escapes for `.` `[` `]` `*` `+` `?` if you want: `\.` `\*` etc.
    

Do **not** support (on purpose):

- Alternation: `a|b`
    
- Grouping: `(ab)`
    
- Backreferences: `\1`
    
- Lookahead/lookbehind
    
- Fancy Unicode categories
    

That keeps it in the “decently hard, but not insane” range.

Engine design:

- Tokenizer: pattern → tokens.
    
- Simple parser: build an AST with:
    
    - Concatenation
        
    - Repetition (for `*`, `+`, `?`)
        
    - Character class nodes
        
- Compile AST to an **NFA using Thompson’s construction**.
    
- NFA simulation to match against a line.
    

This makes you touch real theory (automata, grammars, NFAs) but you’re not drowning in edge cases.

---

## 3. Glue it into a grep-like tool

Build a CLI tool with:

- Input: pattern + files (or stdin).
    
- Behavior:
    
    - If pattern has no regex meta chars → use your **BMH** literal matcher.
        
    - If pattern has `. * + ? [ ]` → route to your **regex engine**.
        
- Flags:
    
    - `-n` line numbers
        
    - `-v` invert match
        
    - `-c` count matches
        
    - maybe `-i` for case-insensitive (you can implement by normalizing case yourself, no stdlib magic search)
        

All searching is done using your own code, no Go search/regex helpers.

---

## 4. Why this is the right difficulty

Not basic because:

- You implement a real search algorithm (BMH), not “for loop with if”.
    
- You implement a real regex engine with tokenizer → parser → NFA → simulator.
    

Not too advanced because:

- You are not doing full-PCRE, no alternation, no capturing groups, no backrefs.
    
- Parser can be very simple: concatenation + postfix operators.
    
- NFA-based regex is conceptually clean and doesn’t need crazy optimizations.
    

This project forces you to understand:

- How “search” is more than just `contains`.
    
- How patterns become machines (NFA) and machines run on text.
    
- How tools like `grep` choose different paths depending on the pattern.
    

That’s a serious, respectable middle-ground build.


---
## References
