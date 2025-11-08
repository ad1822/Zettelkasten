---
cssclasses:
  - center-images
  - center-titles
created: Tuesday 4th November 2025 08:04:23
---
Tags: #algo, #tree, #heap

# heap

#### Two types of heap
1. [[Min heap]]
2. [[Max heap]]

- Maintained weak ordering, while other trees and BST maintained strong ordering, where every subtree's value check with parents too. This means that only the parent-child relationship is ordered, not the relationship between siblings or other nodes in different subtrees.
- Always complete or full tree. A complete binary tree is a binary tree in which all levels are completely filled except possibly the last level, and all nodes in the last level are as far left as possible. This property is crucial for efficient array representation.

###### Array Representation of a Heap (0-indexed array):
- **Parent of node at index `i`**: `(i - 1) / 2` (integer division)
- **Left child of node at index `i`**: `2 * i + 1`
- **Right child of node at index `i`**: `2 * i + 2`

###### Common Heap Operations and Time Complexity:
- **Insert**: `O(log n)` - Add a new element and maintain heap property (heapify up).
- **Delete (extract min/max)**: `O(log n)` - Remove the root, replace with last element, and maintain heap property (heapify down).
- **Peek (get min/max)**: `O(1)` - Return the root element without removing it.
- **Build Heap**: `O(n)` - Convert an arbitrary array into a heap.

###### Applications of Heaps:
- **Priority Queues**: Heaps are the most common implementation of priority queues, where elements are retrieved based on their priority.
- **Heapsort**: A comparison-based sorting algorithm that uses a heap data structure. It is an in-place algorithm, but not stable.
- **Graph Algorithms**: Used in algorithms like Dijkstra's shortest path algorithm and Prim's minimum spanning tree algorithm to efficiently retrieve the minimum edge/vertex.
- **Finding k-th smallest/largest element**: Heaps can efficiently find the k-th smallest or largest element in a collection.

###### What is the key characteristic of heap storage in an array?

- Heaps are stored as complete binary trees with no gaps, filling in nodes from left to right, which allows efficient parent-child relationship calculations using mathematical formulas instead of explicit links


---
## References
