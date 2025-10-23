---
cssclasses:
  - center-images
  - center-titles
---
Tags:  #docker

# Namespaces

- Provides layer of isolation
- Feature of the Linux kernel that partitions kernel resources such that one set of processes see one set of resources while another  set of processes sees a different  of resources .
- Tool that brings the new layer of agility and isolation in tech world.


### In Docker 
- Dockers uses namespaces to provide the isolated workspace called the container. 
- When you run a container, Docker creates a  set of namespaces for that container . 
- This means that each container has it owns isolated namespace for processes , network, mount points, and more . 



- The containers is considered as the separate OS because it has its own Namespaces and resources. Although it share the resources from base OS with the help of c-groups but having isolated and own namespaces make its  a OS.
-  Docker's namespace concept transforms the landscape of resource isolation, offering  a more efficient and secure approach to containerization.
