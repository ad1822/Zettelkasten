---
cssclasses:
  - center-images
  - center-titles
---
Tags: #linux

# Booting Linux

- Linux oprating system undergoes when a computer system is powered on. When you switch on your device, the system bootloader is loaded into the main memory from a fixed location to start the main operating system.
- The whole process involves several stages including POST (Power-On Self Test), MBR (Master Boot Record), GRUB (GRand Unified Bootloader), Kernel, Init process, and finally the GUI or command line interface where users interact.
- During this process, vital system checks are executed, hardware is detected, appropriate drivers are loaded, filesystems are mounted, necessary system processes are started, and finally, the user is presented with a login prompt.

```
GRUB_DEFAULT=0
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
```


![[Booting Linux.png]]


### **1. BIOS**

BIOS stands for Basic Input/Output System. In simple terms, the BIOS loads and executes the Master Boot Record (MBR) boot loader.

When you first turn on your computer, the BIOS first performs some integrity checks of the HDD or SSD.

Then, the BIOS searches for, loads, and executes the boot loader program, which can be found in the Master Boot Record (MBR). The MBR is sometimes on a USB stick or CD-ROM such as with a live installation of Linux.

Once the boot loader program is detected, it's then loaded into memory and the BIOS gives control of the system to it.

### **2. MBR**

MBR stands for Master Boot Record, and is responsible for loading and executing the GRUB boot loader.

The MBR is located in the 1st sector of the bootable disk, which is typically `/dev/hda`, or `/dev/sda`, depending on your hardware. The MBR also contains information about GRUB, or LILO in very old systems.

### **3. GRUB**

Sometimes called GNU GRUB, which is short for GNU GRand Unified Bootloader, is the typical boot loader for most modern Linux systems.

The GRUB splash screen is often the first thing you see when you boot your computer. It has a simple menu where you can select some options. If you have multiple kernel images installed, you can use your keyboard to select the one you want your system to boot with. By default, the latest kernel image is selected.

The splash screen will wait a few seconds for you to select and option. If you don't, it will load the default kernel image.

In many systems you can find the GRUB configuration file at `/boot/grub/grub.conf` or `/etc/grub.conf`. Here's an example of a simple `grub.conf`.

### **4. Kernel**

The kernel if often refereed to as the core of any operating system, Linux included. It has complete control over everything in your system.

In this stage of the boot process, the kernel that was selected by GRUB first mounts the root file system that's specified in the `grub.conf` file. Then it executes the `/sbin/init` program, which is always the first program to be executed. You can confirm this with its process id (PID), which should always be 1.

The kernel then establishes a temporary root file system using Initial RAM Disk (initrd) until the real file system is mounted.


### **5. Init**

At this point, your system executes runlevel programs. At one point it would look for an init file, usually found at `/etc/inittab` to decide the Linux run level.

Modern Linux systems use systemd to choose a run level instead. According to [TecMint](https://www.tecmint.com/change-runlevels-targets-in-systemd/), these are the available run levels:

> **Run level 0** is matched by **poweroff.target** (and **runlevel0.target** is a symbolic link to **poweroff.target**).
> 
> **Run level 1** is matched by **rescue.target** (and **runlevel1.target** is a symbolic link to **rescue.target**).
> 
> **Run level** 3 is emulated by **multi-user.target** (and **runlevel3.target** is a symbolic link to **multi-user.target**).
> 
> **Run level 5** is emulated by **graphical.target** (and **runlevel5.target** is a symbolic link to **graphical.target**).
> 
> **Run level 6** is emulated by **reboot.target** (and **runlevel6.target** is a symbolic link to **reboot.target**).
> 
> **Emergency** is matched by **emergency.target**.

systemd will then begin executing runlevel programs.

### **6. Runlevel programs**

Depending on which Linux distribution you have installed, you may be able to see different services getting started. For example, you might catch `starting sendmail …. OK`.

These are known as runlevel programs, and are executed from different directories depending on your run level. Each of the 6 runlevels described above has its own directory:

- Run level 0 – `/etc/rc0.d/`
- Run level 1 – `/etc/rc1.d/`
- Run level 2  – `/etc/rc2.d/`
- Run level 3  – `/etc/rc3.d/`
- Run level 4 – `/etc/rc4.d/`
- Run level 5 – `/etc/rc5.d/`
- Run level 6 – `/etc/rc6.d/`
