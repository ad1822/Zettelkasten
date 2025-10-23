---
cssclasses:
  - center-images
  - center-titles
---
Tags: #js, #nodejs

- Started as a purely interpreted lang. in the early browsers. but modern JS engines like V8 (Chrome), SpiderMonkey (Firefox), and JavaScriptCore (Safari) have evolved into hybrid interpreters + compilers (JIT) for better performance

### How JS runs (V8 Engine)
#### 1. Parsing
- JS source code is parsed into tokens and then into as AST.
#### 2. Interpreter (Ignition)
- The AST is converted into bytecode. A fast interpreter called Ignition starts executing this bytecode immediately
#### 3. Profiler (Runtime Optimizer)
- While running, the engine identifies "hot code" (frequently used functions / loops)
#### 4. JIT Compilation (Turbofan)
- Hot code is passed to Turbofan, which compiles it to optimized machine code for better performance
#### 5. Deoptimization
- If assumptions made during optimization break, V8 can fall back to interpreted bytecode


### JIT (Just-In-Time)

- Just-in-time (JIT) compilation is ==a method used to improve the performance of interpreted programming languages by compiling code during program execution, rather than before==
- This dynamic compilation approach combines aspects of both interpretation and ahead-of-time (AOT) compilation, allowing for optimized execution based on runtime information.

| Trait               | Interpreted Lang (JS, Python)           |
| ------------------- | --------------------------------------- |
| Portability         | High – runs anywhere with interpreter   |
| Execution Speed     | Slower than compiled (unless JIT helps) |
| Runtime Flexibility | High – dynamic typing, eval, etc.       |
| Debugging           | Easier – line-by-line execution         |
| Compilation Step    | Optional or JIT (not AOT)               |


### Keywords
- ECMAScript

![[Pasted image 20250801161955.png]]
