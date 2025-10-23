---
cssclasses:
  - center-images
  - center-titles
---
Tags: #docker, #containergo

# Linux System Calls

## Overview
- **System Call**: A fundamental interface between an application and the Linux kernel.
- **Purpose**: Allows user-space applications to interact with hardware or system resources by requesting privileged operations from the kernel.
- **Mechanism**: Applications invoke system calls to perform tasks such as file operations, process management, device interaction, and network communication.

### Key Concepts
- System calls are the bridge between user-space applications and the kernel.
- Applications typically use **library wrapper functions** (e.g., from glibc) to invoke system calls rather than calling them directly.
- The kernel executes the requested operation and returns the result to the application.

---

## How Linux System Calls Work
1. **User-Space Preparation**:
   - The application prepares arguments (e.g., file path, buffer size) and invokes a library wrapper function (e.g., `open()`, `read()`).
2. **Transition to Kernel-Space**:
   - The library function copies arguments into the **system call table** (a memory buffer) and triggers a **trap** (software interrupt) to switch from user-space to kernel-space.
3. **Kernel Execution**:
   - The kernel identifies the system call using a unique number (e.g., `sys_open`) and executes the requested operation.
4. **Return to User-Space**:
   - The kernel returns the result (e.g., file descriptor, status code) to the application via the system call's return value.

---

## Types of System Calls

### 1. **Process Management System Calls**
   - Used to create, manage, and terminate processes.
   - Examples:
     - **fork()**: Creates a new process (child) that is a copy of the calling process (parent).
     - **exec()**: Replaces the current process image with a new program.
     - **wait()**: Suspends the calling process until a child process terminates.
     - **exit()**: Terminates the current process and returns a status code to the parent process.

### 2. **File Management System Calls**
   - Used to perform operations on files and directories.
   - Examples:
     - **open()**: Opens a file and returns a file descriptor.
     - **read()**: Reads data from a file into a buffer.
     - **write()**: Writes data from a buffer to a file.
     - **close()**: Closes a file descriptor.
     - **mkdir()**: Creates a new directory.
     - **rmdir()**: Removes an empty directory.

### 3. **Device Management System Calls**
   - Used to interact with hardware devices.
   - Examples:
     - **read()**: Reads data from a device into a buffer.
     - **write()**: Writes data from a buffer to a device.
     - **ioctl()**: Configures or controls a device.
     - **select()**: Monitors multiple file descriptors for I/O activity.

### 4. **Network Management System Calls**
   - Used for network communication and resource management.
   - Examples:
     - **socket()**: Creates a network socket for communication.
     - **connect()**: Establishes a connection to a remote endpoint.
     - **send()**: Sends data over a network connection.
     - **recv()**: Receives data from a network connection.

### 5. **System Information System Calls**
   - Used to retrieve or modify system-related information.
   - Examples:
     - **getpid()**: Returns the process ID of the calling process.
     - **getuid()**: Returns the user ID of the calling process.
     - **gethostname()**: Retrieves the hostname of the system.
     - **sysinfo()**: Returns system statistics (e.g., memory usage, process count).

---

## System Calls vs. Library Wrapper Functions
- **System Calls**: Low-level functions provided by the kernel.
- **Library Wrapper Functions**: Higher-level functions provided by libraries like glibc to simplify system call invocation.
- Example:
  - The `chdir()` function in glibc is a wrapper for the `chdir` system call.
  - Applications typically use the wrapper function instead of invoking the system call directly.

---

## Importance of System Calls
- **Privileged Operations**: Enable user-space applications to perform tasks that require kernel privileges (e.g., accessing hardware).
- **Security**: Ensure controlled and safe access to system resources.
- **Standardization**: Provide a consistent interface for applications to interact with the kernel, enhancing compatibility and portability.

---

## Example: Using System Calls in C
```c
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
    // Open a file using the open() system call
    int fd = open("example.txt", O_RDONLY);
    if (fd == -1) {
        perror("open");
        return 1;
    }

    // Read from the file using the read() system call
    char buffer[100];
    ssize_t bytesRead = read(fd, buffer, sizeof(buffer) - 1);
    if (bytesRead == -1) {
        perror("read");
        close(fd);
        return 1;
    }

    // Null-terminate the buffer and print the content
    buffer[bytesRead] = '\0';
    printf("File content: %s\n", buffer);

    // Close the file using the close() system call
    close(fd);
    return 0;
}


![[Syscalls.png]]



![[UserSpace&Kernal.png]]

![[SyscallsWorkFlow.png]]

- It all starts with a user-space API Call
- When Application calls function like read() or write(), These functions are part of standard libraries like glibc (GNU C library) that provides an abstraction or wrapper for system calls
- The library function triggers a trap instruction which switches the CPU from user mode to kernel mode by flipping mode bit in CPU.
