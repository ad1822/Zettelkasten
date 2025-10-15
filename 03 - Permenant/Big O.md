---
cssclasses:
  - center-images
  - center-titles
---
Created: Tuesday 30th September 2025 22:21:25
Tags:  #dsa 

# Big O

Big O is a way to categorize your algorithms time or memory requirements based on input. It is not meant to be an exact measurement

It will not tell you how many CPU cycles it takes, instead it is meant to generalize the growth of your algorithm.

#### how to calculate
- Constants are dropped

	- O(2N) -> O(N) and this makes sense. That is because Big O is meant to describe the upper bound of the algorithm (the growth of the algorithm). The constant eventually becomes irrelevant.
	
```
N = 1, O(10N) = 10, O(N^2) = 1

N = 5, O(10N) = 50, O(N^2) = 25

N = 100, O(10N) = 1,000, O(N^2) = 10,000 // 10x bigger

N = 1000, O(10N) = 10,000, O(N^2) = 1,000,000 // 100x bigger

N = 10000, O(10N) = 100,000, O(N^2) = 100,000,000 // 1000x bigger
```

- For one loop it's O(n), for nested O(n^2)
- If there is thing like n+2 or 2n. Just drop it to n because by time complexity we just have to calculate worst time complexity, and those small operations doesn't matter
- O(1) does not mean, it is doing nothing, that does mean it's doing same thing for all inputs. either it is 1 or 10000, doesn't matter for O(1)


![[Big O.png]]


---
## References
