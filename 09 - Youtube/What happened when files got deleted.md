---
cssclasses:
  - center-images
  - center-titles
created: "[[../03 - Permenant/04 - Daily/2025-11-17]]"
---
Tags: #linux 

# What happened when files got deleted

![[IMG_20251117_092642.jpg]]

- File Storage Basics Your computer's storage drives are divided into **addressable units** called **sectors on HDDs** or **pages on SSDs**, each with a unique address.
- Operating systems group these into blocks. Files are broken into **chunks and written across** these blocks.
- The file system keeps an index or map, linking file names to the specific blocks where their data is stored, using pointers.
- The *Deletion Process* When a file is deleted (even from the recycle bin/trash), the operating system doesn't erase the data. Instead, it **updates the file system's metadata**, removing the pointer to that file from the index and marking those blocks as "free space".
- The actual data remains on the drive until it is overwritten. This is why "delete is not destroy".
- True Data Destruction For data to be truly destroyed, it must be **overwritten by new files or deliberately by secure erase** tools that write zeros or random patterns over the blocks.

![[IMG_20251117_092724.jpg]]
- On SSDs, the **TRIM** command tells the drive to erase blocks in the background. Modern systems often use **crypto erase, where data is automatically encrypted; deleting or changing the encryption key makes the data unreadable,** even if it physically remains on the drive.
- The most extreme method is physically destroying the drive.

![[IMG_20251117_092706.jpg]]
- **Data Recovery** Because deletion only removes pointers, the data often lingers on the drive, making recovery possible. 
- On HDDs, recovery tools can scan for blocks without pointers but still containing readable data.
- On SSDs, recovery is trickier due to TRIM and wear leveling, but can sometimes still be achieved if blocks haven't been erased yet. Forensic investigators use these principles to recover data from unallocated blocks or old system snapshots.




---
## References
![](https://youtu.be/cicSnyzm1AQ?si=c6lLfrZgw4XqXUpj)



