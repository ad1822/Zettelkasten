---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-11-04]]"
---
Tags: #algo, #tree, #heap 

# Min heap

- the top value must be the smallest, and every node's children must be larger than or equal to the parent node

```
arr[i] <= arr[2*i + 1]   (if left exists)
arr[i] <= arr[2*i + 2]   (if right exists)
```

###### Heapify Operations in Min Heap:
- **Heavily-Up (for insertion)**: When a new element is added, it's initially placed at the end of the array. If it's smaller than its parent, it's swapped upwards until it's no longer smaller than its parent, or it reaches the root.
- **Heavily-Down (for deletion/extraction)**: When the minimum element (root) is removed, the last element of the heap is moved to the root. This element is then swapped downwards with its smallest child until it's no longer larger than its children, or it becomes a leaf node.
###### Example of a Min Heap (array representation):
`[1, 3, 6, 7, 8, 9, 10]`

This represents a tree where:
- 1 is the root
- Children of 1 are 3 and 6
- Children of 3 are 7 and 8
- Children of 6 are 9 and 10
