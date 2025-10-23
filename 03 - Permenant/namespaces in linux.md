---
cssclasses:
  - center-images
  - center-titles
---
Tags: #docker, #containergo

# Namespaces

## Overview
Linux namespaces are a feature of the Linux kernel that isolates and virtualizes system resources for a collection of processes. Namespaces allow processes to have different views of the system, such as different process IDs, network interfaces, or file system mounts. This isolation is fundamental to containerization technologies like Docker and Kubernetes.

## Types of Namespaces

### 1. **PID Namespace (Process ID Namespace)**
   - Isolates process IDs.
   - Processes in different PID namespaces can have the same PID.
   - The first process in a PID namespace has PID 1 and is treated as the "init" process.
   - Example: Containers have their own PID namespace, so processes inside the container start with PID 1.

### 2. **Mount Namespace (mnt)**
   - Isolates the set of mounted file systems.
   - Processes in different mount namespaces can have different views of the file system hierarchy.
   - Example: A container can have its own root file system (`/`) independent of the host.

### 3. **UTS Namespace (Unix Timesharing System Namespace)**
   - Isolates hostname and domain name.
   - Allows containers to have their own hostname distinct from the host system.
   - Example: A container can have a hostname like `mycontainer` while the host system has a different hostname.

### 4. **IPC Namespace (Inter-Process Communication Namespace)**
   - Isolates inter-process communication resources, such as message queues, semaphores, and shared memory.
   - Processes in different IPC namespaces cannot communicate using these resources.
   - Example: Two containers cannot share the same shared memory segment.

### 5. **Network Namespace (net)**
   - Isolates network interfaces, IP addresses, routing tables, and port numbers.
   - Each network namespace has its own virtual network stack.
   - Example: A container can have its own `lo` (loopback) interface and private IP address.

### 6. **User Namespace (user)**
   - Isolates user and group IDs.
   - Allows a process to have root privileges within its namespace without having root privileges on the host system.
   - Example: A container can run as root inside the container but map to a non-root user on the host.

### 7. **Cgroup Namespace (cgroup)**
   - Isolates the view of control groups (cgroups).
   - Hides the host's cgroup hierarchy from processes in the namespace.
   - Example: A container sees only its own cgroup hierarchy, not the host's.

## Key Commands and Tools

### `unshare`
- Creates new namespaces and runs a program in them.
- Example: `unshare --pid --fork --mount-proc bash` creates a new PID and mount namespace.

### `nsenter`
- Enters an existing namespace.
- Example: `nsenter --target <PID> --mount --pid` enters the mount and PID namespaces of a process.

### `ip netns`
- Manages network namespaces.
- Example: `ip netns add mynetns` creates a new network namespace.

### `lsns`
- Lists namespaces.
- Example: `lsns` shows all namespaces on the system.

## Use Cases
- **Containerization**: Namespaces are the backbone of container technologies like Docker, LXC, and Kubernetes.
- **Security**: Isolating processes reduces the attack surface.
- **Testing**: Namespaces allow creating isolated environments for testing software.

## Example: Creating a New PID Namespace


```bash
# Create a new PID namespace and run a shell
sudo unshare --pid --fork --mount-proc bash

# Inside the new namespace, the shell has PID 1
echo $$
