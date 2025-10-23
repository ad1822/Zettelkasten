---
cssclasses:
  - center-images
  - center-titles
---
Tags: #docker

# docker's architecture
- Uses a client-server 
- The docker client and daemon can run on the same system
- OR connect a docker client to a remote docker daemon


- Docker client and daemon communicate using REST API, over UNIX sockets or a network interface.
- Another docker client is Docker Compose, that lets you work with applications consisting of a set of containers.


![[docker's architecture.png]]

### Docker Daemon
- The Docker daemon listens for Docker API requests and managers Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manger Docker service.
### Docker Client
- The Docker client is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to ***docked***, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

#### Docker Registries
- A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker looks for images on Docker Hub by default. You can even run your own private registry.
- When you use the ***docker pull*** commands, Docker pulls the required images from your configured registry. When you use the ***docker push*** command, Docker pushed your image to your configured registry.
