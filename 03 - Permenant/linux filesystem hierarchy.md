---
cssclasses:
  - center-images
  - center-titles
---
Tags: #linux

# Linux Filesystem Hierarchy

## Key Directories and Their Functions

### `/usr` - User System Resources
The `/usr` directory contains user-level programs, libraries, and documentation that are not essential for booting the system but are required during normal system operation.

#### Structure of `/usr`
- **`/usr/bin`**:  
  Contains user-level binaries (executables) not required for booting but used in everyday operations (e.g., `cp`, `grep`, `vim`, `gcc`).
  
- **`/usr/sbin`**:  
  Contains system binaries primarily for system administration (e.g., `fdisk`, `apache2`, `iptables`). Not needed for booting, but important for system management.
  
- **`/usr/lib`**:  
  Stores shared libraries used by binaries in `/usr/bin` and `/usr/sbin`, including architecture-specific shared files.
  
- **`/usr/local`**:  
  Intended for user-installed software or manually compiled applications. Contains subdirectories like `bin`, `lib`, etc., mirroring `/usr` itself.
  
- **`/usr/share`**:  
  Holds architecture-independent data, such as documentation, icons, localization files, man pages, default configurations, fonts, etc.
  
- **`/usr/include`**:  
  Contains header files for C/C++ development. These are necessary for compiling programs and include files like `stdio.h` and `stdlib.h`.
  
- **`/usr/src`**:  
  Source code for software and kernel development. This is where kernel source code resides if installed.
  
- **`/usr/games`**:  
  Binaries for games (traditionally). Not commonly used in modern systems.
  
- **`/usr/libexec`** (Optional):  
  Contains helper programs for other binaries. These are typically not meant for direct user execution.
  
- **`/usr/man` or `/usr/share/man`**:  
  Stores manual pages (`man pages`) for system commands and applications.

---

### Other Important Directories

#### `/bin` - Essential User Binaries
Contains essential command binaries that are required for system booting and single-user mode (e.g., `ls`, `cp`, `mv`).

#### `/sbin` - System Binaries
Contains essential system binaries for administration (e.g., `fsck`, `reboot`). Used for system repair and recovery tasks.Only Executable for Super User (root)

#### `/etc` - Configuration Files
Contains all configuration files and scripts for the system (e.g., `passwd`, `hostname`). System-wide configuration information is stored here.

#### `/boot` - Boot Loader Files
Contains files required for the boot process, including the kernel itself (`vmlinuz`), bootloader files (GRUB), and other essential data for booting.

#### `/var` - Variable Data Files
Contains data that is expected to continually change as the system is running, such as:
  - Log files (`/var/log`),
  - Spools (like print jobs in `/var/spool`),
  - Lock files (`/var/lock`).

#### `/dev` - Device Files
Stores device nodes that represent hardware and peripherals (e.g., `/dev/sda1`, `/dev/null`).

#### `/home` - User Home Directories
Contains personal directories for each user, where personal files and settings are stored (e.g., `/home/user`).

#### `/lib` - Essential Libraries
Contains shared libraries required by the binaries in `/bin` and `/sbin`. These libraries are critical for basic system functionality.

#### `/opt` - Optional Software
Reserved for installing optional software packages. It is typically used for software that is not managed by the system's package manager.

#### `/tmp` - Temporary Files
Stores temporary files created by applications and processes. Files here are often deleted at boot or periodically to free up space.

#### `/mnt` and `/media` - Mount Points
- **`/mnt`**: Temporary mount point for external filesystems (manually mounted by the user).
- **`/media`**: Mount points for removable media such as USB drives, CDs, and DVDs. Often populated automatically when media is inserted.

---

### Key Relationships

- **`/usr` vs `/`**:  
  - `/bin`, `/sbin`, and `/lib` in the root (`/`) contain essential files for booting the system and repairing it in single-user mode.
  - `/usr/bin`, `/usr/sbin`, and `/usr/lib` contain additional applications and libraries that are not needed for booting but are used once the system is fully operational.

- **`/usr/local`**:  
  - Used for storing programs installed by the user that are not managed by the system's package manager. It mirrors the `/usr` structure, allowing users to install software without affecting the base system.

---

## Summary
The Linux filesystem is organized into several key directories, each serving a specific role. The `/usr` directory is particularly important for user-level programs, libraries, and documentation, whereas `/bin`, `/sbin`, and `/lib` contain essential system files. Understanding this hierarchy is crucial for system administration and efficient use of Linux.


![[Pasted image 20240912214836.png]]
