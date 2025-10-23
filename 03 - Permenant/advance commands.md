---
cssclasses:
  - center-images
  - center-titles
---
Tags: #linux

# Advance Commands

```ls
df -h
Filesystem      Size  Used Avail Use% Mounted on
dev              12G     0   12G   0% /dev
run              12G  1.9M   12G   1% /run
efivarfs        268K  208K   56K  79% /sys/firmware/efi/efivars
/dev/nvme0n1p6   69G   48G   18G  73% /
tmpfs            12G  708K   12G   1% /dev/shm
tmpfs            12G  4.0K   12G   1% /tmp
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
/dev/nvme0n1p6   69G   48G   18G  73% /home
/dev/nvme0n1p7  1.3G  235M  1.1G  19% /boot
tmpfs           1.0M     0  1.0M   0% /run/credentials/getty@tty2.service
tmpfs           2.4G   44M  2.3G   2% /run/user/1000
```

```bash
>  systemctl --type=service
>  systemctl status
```
