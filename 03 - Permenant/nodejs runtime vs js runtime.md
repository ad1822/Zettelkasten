---
cssclasses:
  - center-images
  - center-titles
---
Tags: #js, #nodejs

### ✅ JavaScript Runtime (in general, including browsers and Node.js)

A **JS Runtime** is the full environment that allows JS to run and interact with system/browser.

It includes:

|Component|Description|
|---|---|
|**JS Engine (V8)**|Parses, compiles, and executes JS code.|
|**Call Stack**|Tracks function calls and manages execution flow.|
|**Heap**|Memory allocation space.|
|**Event Loop**|Handles async tasks, scheduling, and execution.|
|**Microtask Queue**|Handles Promises and `queueMicrotask`.|
|**Callback/Task Queue**|Handles `setTimeout`, `setInterval`, I/O, etc.|

---

### ✅ Node.js Runtime (built on V8)

It **extends the JS runtime** with **system-level capabilities** using C/C++ bindings.

It includes everything above, plus:

|Node.js Component|Purpose|
|---|---|
|**libuv**|C library for async I/O, file system, timers, TCP, etc.|
|**Node APIs**|`fs`, `http`, `os`, `process`, `stream`, etc.|
|**Bindings**|Bridges between JS and C++ APIs|
|**Module system**|`require`, `import/export`|
|**Native Addons**|Use C++ to extend Node with native libraries|

---

### So in plain words:

- **V8 handles**: _"Run this JS code"_
    
- **Node.js handles**: _"I want to read/write files, create servers, manage processes using JS"_
    

And the full runtime includes:

- **JS engine (V8) + event loop + libuv + Node-specific modules + queues/stacks**
    

---
