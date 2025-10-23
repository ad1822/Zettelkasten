---
cssclasses:
  - center-images
  - center-titles
---
Tags: #linux

# File Systems Overview

## FAT (File Allocation Table)
FAT is an older file system that's still widely used for compatibility reasons, especially in USB drives and memory cards.

- **FAT12**: 
  - Used in legacy systems and very small volumes.
  - Supports up to 32 MB partitions.
  
- **FAT16**: 
  - Maximum partition size: 2 GB.
  - Limited to files smaller than 2 GB.
  
- **FAT32**: 
  - Maximum partition size: 2 TB.
  - Maximum file size: 4 GB.
  - Still commonly used for external storage devices.

## NTFS (New Technology File System)
NTFS is the primary file system used by Windows operating systems.

- **Max Volume Size**: 16 exabytes (EB).
- **Max File Size**: Limited by the volume size, typically very large.
- **Features**:
  - Journaling to prevent corruption.
  - File compression and encryption.
  - File and folder permissions for security.
  - Supports very large files and efficient storage management.

## exFAT (Extended File Allocation Table)
exFAT is designed for flash memory devices like USB drives and SD cards.

- **Max Volume Size**: 128 PB (petabytes), though actual limits depend on OS implementations.
- **Max File Size**: 16 exabytes.
- **Features**:
  - Optimized for flash drives and SD cards (especially SDXC).
  - Cross-platform compatibility (Windows, macOS).
  - Handles large files better than FAT32.

## ext (Extended File System)
ext file systems are commonly used on Linux-based operating systems.

- **ext2**: 
  - No journaling (faster but less reliable).
  - Maximum file size: 2 TB.
  - Maximum volume size: 32 TB.
  
- **ext3**: 
  - Adds journaling for improved reliability.
  - Maximum file size: 2 TB.
  - Maximum volume size: 32 TB.

- **ext4**:
  - Default file system for most Linux distributions.
  - Maximum file size: 16 TB.
  - Maximum volume size: 1 EB (exabyte).
  - Backward compatible with ext2 and ext3.

## HFS (Hierarchical File System) and HFS+ (Mac OS Extended)
HFS and HFS+ are file systems used in older versions of macOS.

- **HFS**: 
  - Maximum volume size: 2 TB.
  - Used in early versions of macOS.
  
- **HFS+** (Mac OS Extended):
  - Improved over HFS with support for larger files and better efficiency.
  - Maximum file size: 8 EB.
  - Maximum volume size: 8 EB.
  - Supported journaling and better performance than HFS.

## APFS (Apple File System)
APFS is the modern file system used by Apple devices (macOS, iOS, iPadOS).

- **Max Volume Size**: 8 EB.
- **Max File Size**: Limited by volume size.
- **Features**:
  - Strong encryption support.
  - Space sharing between partitions.
  - Fast cloning of files and directories.
  - Snapshots for quick backups.
  - Improved performance and reliability for SSDs and flash storage.

## Btrfs (B-tree File System)
Btrfs is a modern file system for Linux with advanced features.

- **Max Volume Size**: 16 EB.
- **Max File Size**: 16 EB.
- **Features**:
  - Copy-on-write (COW) functionality.
  - Snapshots and subvolumes.
  - Built-in RAID support.
  - Data deduplication and compression.

## XFS
XFS is a high-performance journaling file system.

- **Max Volume Size**: 8 EB.
- **Max File Size**: 8 EB.
- **Features**:
  - Excellent scalability for large file systems.
  - Suitable for enterprise-level storage solutions.
  - High-performance data management.

## ZFS (Zettabyte File System)
ZFS is a high-end file system known for its data integrity features and scalability.

- **Max Volume Size**: 256 quadrillion zettabytes.
- **Max File Size**: 16 EB.
- **Features**:
  - End-to-end checksumming for data integrity.
  - Snapshots, clones, and replication.
  - Built-in compression and deduplication.
  - RAID-Z for better redundancy and data protection.
