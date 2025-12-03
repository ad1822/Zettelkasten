---
created: "[[04 - Daily/2025-10-16]]"
cssclasses:
  - center-images
  - center-titles
---
Tags: #golang 


# Time complexity of every function in go and c++

| Operation / Data Structure       | Go Function / Type               | Time Complexity    | Space Complexity  | C++ Equivalent                        | Time Complexity | Space Complexity  |
| -------------------------------- | -------------------------------- | ------------------ | ----------------- | ------------------------------------- | --------------- | ----------------- |
| **Array / Slice Access**         | `arr[i]`                         | O(1)               | O(1)              | `vector[i]`                           | O(1)            | O(1)              |
| **Append (Amortized)**           | `append(slice, x)`               | O(1)*              | O(n) when resized | `vector.push_back(x)`                 | O(1)*           | O(n) when resized |
| **Append (Worst Case)**          | `append(slice, x)` (resize)      | O(n)               | O(n)              | `vector.push_back(x)` (resize)        | O(n)            | O(n)              |
| **Insert at Index**              | Slice insertion                  | O(n)               | O(n)              | `vector.insert(pos, x)`               | O(n)            | O(n)              |
| **Delete from Middle**           | Slice remove via append/subslice | O(n)               | O(n)              | `vector.erase(pos)`                   | O(n)            | O(n)              |
| **Map Lookup**                   | `m[key]`                         | O(1) average       | O(n)              | `unordered_map[key]`                  | O(1) average    | O(n)              |
| **Map Insert**                   | `m[key] = val`                   | O(1) average       | O(n)              | `unordered_map.insert({k,v})`         | O(1) average    | O(n)              |
| **Map Delete**                   | `delete(m, key)`                 | O(1) average       | O(n)              | `unordered_map.erase(key)`            | O(1) average    | O(n)              |
| **Map Iteration**                | `for k,v := range m`             | O(n)               | O(1)              | range on `unordered_map`              | O(n)            | O(1)              |
| **Sorted Map Lookup**            | —                                | —                  | —                 | `map[key]` (RB tree)                  | O(log n)        | O(n)              |
| **Sorted Map Insert/Delete**     | —                                | —                  | —                 | `map.insert()` / `erase()`            | O(log n)        | O(n)              |
| **String Length**                | `len(str)`                       | O(1)               | O(1)              | `str.size()`                          | O(1)            | O(1)              |
| **String Concatenation**         | `s1 + s2`                        | O(len(s1)+len(s2)) | O(n)              | `s1 + s2`                             | O(n)            | O(n)              |
| **Iteration (Array/Slice)**      | `for _, v := range slice`        | O(n)               | O(1)              | `for (auto x : vec)`                  | O(n)            | O(1)              |
| **Stack Push/Pop**               | slice-based stack                | O(1) amortized     | O(n)              | `stack.push()` / `.pop()`             | O(1)            | O(n)              |
| **Queue Push/Pop**               | slice or list-based              | O(1) amortized     | O(n)              | `queue.push()` / `.pop()`             | O(1)            | O(n)              |
| **Set Insert/Delete**            | map-based set (`map[T]struct{}`) | O(1) avg           | O(n)              | `unordered_set.insert()` / `.erase()` | O(1) avg        | O(n)              |
| **Heap Push/Pop**                | `heap.Push/Pop` (container/heap) | O(log n)           | O(n)              | `priority_queue.push()/pop()`         | O(log n)        | O(n)              |
| **Copy Slice**                   | `copy(dst, src)`                 | O(n)               | O(n)              | `std::copy()`                         | O(n)            | O(n)              |
| **Sort**                         | `sort.Slice()`                   | O(n log n)         | O(log n)          | `std::sort()`                         | O(n log n)      | O(log n)          |
| **Search (sorted)**              | `sort.Search()`                  | O(log n)           | O(1)              | `binary_search()`                     | O(log n)        | O(1)              |
| **Iteration (Map)**              | `range m`                        | O(n)               | O(1)              | `for(auto&p:unordered_map)`           | O(n)            | O(1)              |
| **Memory Growth (Slice/Vector)** | Doubling strategy                | Amortized O(1)     | O(n)              | Doubling strategy                     | Amortized O(1)  | O(n)              |

---
