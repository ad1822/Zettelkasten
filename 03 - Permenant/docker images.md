---
cssclasses:
  - center-images
  - center-titles
---
Tags:  #docker

# Docker Images

![[docker image.png]]



- https://docs.docker.com/reference/cli/docker/image/
- https://chatgpt.com/c/676bd8d0-ebd0-8005-845c-aedc687f4b22F



- Docker image is built up from a series of layers. Each layer represents an instruction in the image's Dockerfile. Each layer except the very last one is read-only. 

- [x] https://docs.docker.com/build/building/best-practices/ ✅ 2025-10-23
- [x] https://docs.docker.com/build/building/multi-stage/
	 ✅ 2025-10-23
- The layers are stacked on top of each other.
- When you create a new container, you add a new writable layer on top of the underlying layers. This layer is often called the "container layer". All changes made to the running container, such as writing new files, modifying existing files, and deleting files, are written to this thin writable container layer.


### Container Vs Image

- An image is the **Top writable layer**.
-  All writes to the container that add new or modify existing data are stored in this writable layer. When the container is deleted, the writable layer is also deleted. The underlying image remains unchanged.
- Because each container has its own writable container layer, and all changes are stored in this container layer, multiple containers can share access to the same underlying image and yet have their own data state.
