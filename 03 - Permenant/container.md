---
cssclasses:
  - center-images
  - center-titles
---
Tags:  #docker

# Container

- `size` :  The amount of data that's used for the writable layer of each container,
- `virtual size` : the amount of data used for the read-only image data used by the container plus the container's writable layer size. Multiple containers may share some or all read-only image data. Two containers started from the same image share 100% of the read-only data, while two containers with different images which have layers in common share those common layers. Therefore, you can't just total the virtual sizes. This over-estimates the total disk usage by a potentially non-trivial amount.
- The total disk space used by all of the running containers on disk is some combination of each container's size and the virtual size values. If multiple containers started from the same exact image, the total size on disk for these containers would be SUM (size of containers) plus one image size (virtual size - size).
