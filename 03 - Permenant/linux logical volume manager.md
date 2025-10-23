---
cssclasses:
  - center-images
  - center-titles
---
Tags: #linux

# Linux Logical Volume Manager

- The Linux Logical Volume Manager (LVM) is a device mapper framework that provides logical volume management for the Linux kernel. It was created to ease disk management, allowing for the use of abstracted storage devices, known as logical volumes, instead of using physical storage devices directly.
- LVM is extremely flexible, and features include resizing volumes, mirroring volumes across multiple physical disks, and moving volumes between disks without needing to power down.
- LVM works on 3 levels: Physical Volumes (PVs), Volume Groups (VGs), and Logical Volumes (LVs).
	- PVs are the actual disks or partitions.
	- VGs combine PVs into a single storage pool.
	- LVs carve out portions from the VG to be used by the system


```
pvcreate /dev/sdb1
vgcreate my-vg /dev/sdb1
lvcreate -L 10G my-vg -n my-lv
```


