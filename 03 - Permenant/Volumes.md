---
cssclasses:
  - center-images
  - center-titles
---
Tags:  #docker

# Volumes

- Volumes are persistent data stores for containers, created and managed by Docker.
- When you create a volume, it's stored within a directory on the Docker host. When you mount the volume into a container, this directory is what's mounted into the container. This is similar to the way that bind mounts work, except that volumes are managed by Docker and are isolated from the core functionality of the host machine.
- Can't access files of Volumes from Host.
- Volumes are often a better choice than writing data directly to a container, because a volume doesn't increase the size of the containers using it.
- Using a volume is also faster; writing into a container's writable layer requires a storage driver to manage the filesystem. The storage driver provides a union filesystem, using the Linux kernel. This extra abstraction reduces performance as compared to using volumes, which write directly to the host filesystem.
