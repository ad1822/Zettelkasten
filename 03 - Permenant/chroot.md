---
cssclasses:
  - center-images
  - center-titles
---
Tags: #docker, #containergo

# chroot

- Changes the root directory for a current running process. 
- where processes are limited to accessing only files within the new root directory
- Unix command that changes the root directory for a process and its children.
- It creates a confined environment that isolates the process from the rest of the system.

## How it's works

- each process has a current working directory known as the root directory (/). By using the ‘chroot’ command, you can change this root directory for a specific process and its children, effectively isolating them from the rest of the system. This means that the process cannot access files or directories outside of this new root, providing an added layer of security and control.
![[chrootWorks.png]]

## Use Case

- **Security** - Chroot can be used to restrict access to a service or filesystem. For example, it can be used to restrict a remote user's view of other users' data.
- **System maintenance** - Chroot can be used to rescue a system that won't boot.
- **Software testing and development** - Chroot can be used to test and debug software.
- **Running legacy software** - Chroot can be used to run legacy software.
