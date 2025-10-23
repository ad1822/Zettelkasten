---
cssclasses:
  - center-images
  - center-titles
---
Tags:  #docker

# Docker


- Containers run on a container host
- ... via Container (Docker) Engine.
- Containers only run an APP & Libraries / Runtime Env
- Share the container HOST OS 
- Lightweight - Can be densely packed and started / restarted quickly
- Can be impacted by other container   
- Problem of shipping software is solved by containerization 


### Docker Objects

#### Images
- An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization. For example, you may build an image which is based on the ***ubuntu*** image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

- You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a ***Dockerfile*** with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a ***Dockerfile*** creates a layer in the image. When you change the ***Dockerfile*** and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.


#### Containers
- A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.
- By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container's network, storage, or other underlying subsystems are from other containers or from the host machine.
- A container is defined by its image as well as any configuration options you provide to it when you create or start it. When a container is removed, any changes to its state that aren't stored in persistent storage disappear.
- Docker uses a technology called `namespaces` to provide the isolated workspace called the container.



- [x] https://chatgpt.com/c/676e873f-a7d0-8005-8d4d-488a670dff2f ✅ 2025-10-23
