---
cssclasses:
  - center-images
  - center-titles
---
Tags: #linux

# Swap

- Swap space in linux is used when the amount of physical memory (RAM) is full. If the system needs more memory resources and the physical memory is full, inactive pages in memory are moved to the swap space. Swap space is a portion of a hard disk drive (HDD) that is used for virtual memory.
- Having swap space ensures that whenever your system runs low on physical memory, it can move some of the data to the swap, freeing up RAM space, but this comes with performance implications as disk-based storage is slower than RAM.
- In the context of disks and filesystems, the swap space can live in two places:

1. In its own dedicated partition.
2. In a regular file within an existing filesystem.
