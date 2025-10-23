---
cssclasses:
  - center-images
  - center-titles
---
Tags: #docker, #containergo

## Layered architecture

- A container is composed of multiple branches. In docker’s terminology, branches are also known as layers. A sandbox of a container is composed of one or more image layers and a container layer. Container layer is writable, image layers are read-only.


- Union file system works on top of the other file-systems. It gives a single coherent and unified view to files and directories of separate file-system. In other words, it mounts multiple directories to a single root. It is more of a mounting mechanism than a file system.

![[UnionFS.png]]

## Overview
- **UnionFS** is a type of **union mount filesystem** that allows files and directories from multiple separate filesystems (called branches) to be combined into a single, unified filesystem.
- It creates a **stacked filesystem** where directories from different branches are overlaid, and the topmost branch takes precedence.
- UnionFS is commonly used in containerization (e.g., Docker) and live CD/USB systems to provide a writable layer over a read-only base filesystem.

---

## Key Concepts
1. **Branches**:
   - UnionFS combines multiple directories (branches) into a single unified view.
   - Each branch can be read-only or read-write.
   - The order of branches determines precedence (higher branches override lower ones).

2. **Layers**:
   - UnionFS works in layers, where each layer represents a branch.
   - Changes are typically written to the topmost writable layer.

3. **Copy-on-Write (CoW)**:
   - When a file in a lower (read-only) branch is modified, UnionFS creates a copy of the file in the topmost writable branch.
   - This ensures that the original file remains unchanged.

4. **Unified View**:
   - UnionFS presents a single, unified filesystem view to the user, hiding the underlying branches.

---

## How UnionFS Works
1. **Branch Hierarchy**:
   - UnionFS stacks multiple branches in a specific order.
   - For example:
     ```
     Top Branch (Writable): /upper
     Lower Branch (Read-Only): /lower
     ```
   - The unified view will show files from both `/upper` and `/lower`, with `/upper` taking precedence.

2. **File Access**:
   - When a file is accessed, UnionFS searches through the branches in order:
     - If the file exists in the top branch, it is used.
     - If not, UnionFS looks in the lower branches.

3. **File Modification**:
   - If a file in a lower (read-only) branch is modified, UnionFS creates a copy in the top (writable) branch.
   - This is known as **Copy-on-Write (CoW)**.

4. **Directory Merging**:
   - Directories from all branches are merged into a single view.
   - If a directory exists in multiple branches, their contents are combined.

---

## Use Cases
1. **Containerization**:
   - UnionFS is used in Docker and other container technologies to create layered images.
   - The base image is read-only, and changes are written to a writable layer on top.

2. **Live CD/USB**:
   - Live systems use UnionFS to overlay a writable filesystem (e.g., RAM disk) on top of a read-only CD/USB filesystem.

3. **System Snapshots**:
   - UnionFS can be used to create snapshots of a filesystem by overlaying a writable layer on top of a read-only snapshot.

4. **Testing and Development**:
   - Developers can use UnionFS to test changes without modifying the original filesystem.

---

## Advantages of UnionFS

1. **Efficiency**:
    
    - Only modified files are copied, saving disk space.
        
2. **Flexibility**:
    
    - Combines multiple filesystems into a single view.
        
3. **Isolation**:
    
    - Changes in the upper layer do not affect the lower layers.
        
4. **Compatibility**:
    
    - Works with most Linux filesystems (e.g., ext4, XFS).


## Alternatives to UnionFS

1. **OverlayFS**:
    
    - A modern alternative to UnionFS, included in the Linux kernel since version 3.18.
        
    - Used by Docker as the default storage driver.
        
2. **AUFS (Another Union File System)**:
    
    - Another union filesystem used in older versions of Docker.
        
3. **Btrfs**:
    
    - A copy-on-write filesystem with built-in support for snapshots and subvolumes.
        

---
