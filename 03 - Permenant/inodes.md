---
cssclasses:
  - center-images
  - center-titles
---
Tags: #linux

# Inodes

- In a Linux filesystem, an inode (index node) is a core concept that representes a filesystem object such as a file or a directory.More specifically, an inode is a data structure that stores critical information about a file except its name and actual data. This information includes the file’s size, owner, access permissions, access times, and more.
- Every file or directory in a Linux filesystem has a unique inode, and each inode is identified by an inode number within its own filesystem. This inode number provides a way of tracking each file, acting as a unique identifier for the Linux operating system.
- Whenever a file is created in Linux, it is automatically assigned an inode that stores its metadata. The structure and storage of inodes are handled by the filesystem, which means the kind and amount of metadata in an inode can differ between filesystems.


An inode (index node) is an entry in this table and there is one for every file. It describes everything about the file, such as:

- File type - regular file, directory, character device, etc
- Owner
- Group
- Access permissions
- Timestamps - mtime (time of last file modification), ctime (time of last attribute change), atime (time of last access)
- Number of hardlinks to the file
- Size of the file
- Number of blocks allocated to the file
- Pointers to the data blocks of the file - most important!


Basically inodes store everything about the file, except the filename and the file itself!


**When are inodes created?**

When a filesystem is created, space for inodes is allocated as well. There are algorithms that take place to determine how much inode space you need depending on the volume of the disk and more. You've probably at some point in your life seen errors for out of disk space issues. Well the same can occur for inodes as well (although less common), you can run out of inodes and therefore be unable to create more files. Remember data storage depends on both the data and the database (inodes).

To see how many inodes are left on your system, use the command **df -i**


**How do inodes locate files?**

We know our data is out there on the disk somewhere, unfortunately it probably wasn't stored sequentially, so we have to use inodes. Inodes point to the actual data blocks of your files. In a typical filesystem (not all work the same), each inode contains 15 pointers, the first 12 pointers point directly to the data blocks. The 13th pointer, points to a block containing pointers to more blocks, the 14th pointer points to another nested block of pointers, and the 15th pointer points yet again to another block of pointers! Confusing, I know! The reason this is done this way is to keep the inode structure the same for every inode, but be able to reference files of different sizes. If you had a small file, you could find it quicker with the first 12 direct pointers, larger files can be found with the nests of pointers. Either way the structure of the inode is the same.
