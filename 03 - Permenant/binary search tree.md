---
cssclasses:
  - center-images
created: Sunday 2nd November 2025 15:48:52
---
Tags: #tree, #algo 

# binary search tree

All nodes to the left must be less than or equal to the current node, and all nodes to the right must be greater than the current node.

### Searching in BST
Finding a value in a BST is similar to binary search on an array: compare the current node's value, then recursively search left if the target is smaller, or right if the target is larger, until the value is found or a null node is reached.

##### What algorithmic characteristic does a Binary Search Tree share with Quick sort?
- Both Binary Search Trees and Quick sort use a pivot point and divide values into sections: values less than the pivot on one side, and values greater than the pivot on the other side.

Still a binary tree, but with an **ordering property**:
- Left child’s value < Parent’s value
- Right child’s value > Parent’s value  
    This must hold **recursively** for every subtree.

### For what ? 
- Ordered for efficient searching, insertion, and deletion.
- Used for **searching and sorting** — like a sorted dynamic dataset.  
Order-first, structure follows that order.

left < parent < right — valid BST

---
## References

![[binary search tree.png]]

[[delete operation in BST]]