---
cssclasses:
  - center-images
  - center-titles
created: Tuesday 4th November 2025 08:05:36
---
Tags: #

# Max heap

- Top value (root) is the largest element
- Every node below is smaller or equal to me

###### Heapify Operations in Max Heap:
- **Heapify-Up (for insertion)**: When a new element is added, it's initially placed at the end of the array. If it's larger than its parent, it's swapped upwards until it's no longer larger than its parent or it reaches the root.
- **Heapify-Down (for deletion/extraction)**: When the maximum element (root) is removed, the last element of the heap is moved to the root. This element is then swapped downwards with its largest child until it's no longer smaller than its children or it becomes a leaf node.

###### Example of a Max Heap (array representation):
`[10, 8, 9, 7, 3, 6, 1]`

This represents a tree where:
- 10 is the root
- Children of 10 are 8 and 9
- Children of 8 are 7 and 3
- Children of 9 are 6 and 1

