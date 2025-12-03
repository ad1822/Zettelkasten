---
cssclasses:
  - center-images
  - center-titles
created: "[[04 - Daily/2025-11-03]]"
---
Tags: #tree, #algo 

# delete operation in BST

When you delete a node that has **two children**, you can replace it with either:

1. **It's in order predecessor** — the **largest element in its left subtree**
2. **It's in order successor** — the **smallest element in its right subtree**

Both are _valid_. Which one you choose depends on design choice and consistency.  
Let’s break it down logically.

---

### 1. In order Predecessor (Largest from Left Subtree)

- You move one step left, then all the way right.
- The predecessor will always be **smaller than the node**, but **larger than everything else in the left subtree**.
- After replacement, you recursively delete that predecessor node from the left subtree.

**When to prefer:**

- You conceptually think “pull from the left to fill the gap”.
- Or, if you want the tree to “shift left” slightly after deletions.
- Some implementations use this because it fits naturally with _descending-order_ operations.

---

### In order Successor (Smallest from Right Subtree)

- You move one-step right, then all the way left.
- The successor will always be **larger than the node**, but **smaller than everything else in the right subtree**.
- After replacement, you recursively delete that successor node from the right subtree.

**When to prefer:**

- Most implementations use this because it’s _symmetric_ with insertion (which typically adds to the right for greater values).
- It keeps the tree slightly “right-balanced” when deletions happen uniformly.

---

### 3. Which one should _you_ pick?

There’s **no functional difference** in the resulting BST property — both produce a valid BST.  
However, **for consistency**, pick one and stick with it throughout your implementation.

If you want a rule of thumb:

> Use **in order successor (min of right)** unless you have a reason to prefer the opposite.

---

### 4. Why consistency matters

Switching between the two heuristics randomly can lead to subtle balance differences.  
While still a valid BST, it may cause **skew patterns** depending on your data distribution.
