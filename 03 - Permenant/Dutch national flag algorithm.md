---
cssclasses:
  - center-images
  - center-titles
---
Created: Wednesday 1st October 2025 16:20:24
Tags: #dsa , #algo

# Dutch national flag algorithm

So in this, we are actually trying to shink area between mid and high - 1 pointer. 
Using low and high pointer, we are able to do that. 

arr[0….low-1] contains 0. [Extreme left part]
arr[low….mid-1] contains 1.
arr[high+1….n-1] contains 2. [Extreme right part], n = size of the array
The middle part i.e. arr[mid….high] is the unsorted segment. 

![[Dutch national flag algorithm.png]]

![[Dutch national flag algo]]



---
## References

https://leetcode.com/problems/sort-colors/
