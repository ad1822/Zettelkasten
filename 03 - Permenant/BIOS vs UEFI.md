---
cssclasses:
  - center-images
  - center-titles
created: "[[2026-01-18]]"
---
Tags: #linux 

# BIOS vs. UEFI

### BIOS (Basic Input/ Output System) (old version)
- Firmware that is built into the computer's motherboard
- Initializes the computer's hardware as the computer is being booted
- then searches for a boot device (optical or storage drive) to boot software, such as an operating system
- The BIOS is stored on the BIOS chip on the motherboard, the BIOS chip is non-volatile
- The BIOS *settings* are stored on the motherboard in the *CMOS* chip, The CMOS chip is volatile (change data), needs constant power to maintain its contents or settings. The *CMOS battery* maintains these settings.
- *CMOS* is built on an *EPROM* (Erasable Programmable Read-Only Memory)
- On modern motherboards, the *CMOS chip* is integrated with the *RTC* on the south bridge chipset

### UEFI (Unified Extensible Firmware Interface) (new version)
- User-friendly, graphical user interface
- Recognizes larger storage drives
- Able to use mouse in the interface
- **Secure Boot**: built-in features that stop any digitally unsigned drives from loading and helps to stop malicious software, such as rootkits
###### UEFI was designed to overcome many limitations of the old BIOS, including:

1. UEFI supports drive sizes up to 9 zettabytes, whereas BIOS only supports 2.2 terabytes.
2. UEFI provides faster boot time.
3. UEFI has discrete driver support, while BIOS has drive support stored in its ROM, so updating BIOS firmware is a bit difficult.
4. UEFI offers security like “Secure Boot”, which prevents the computer from booting from unauthorized/unsigned applications. This helps in preventing rootkits, but also hampers dual-booting, as it treats other OS as unsigned applications. Currently, only Windows and Ubuntu are signed OS (let me know if I am wrong).
5. UEFI runs in 32bit or 64bit mode, whereas BIOS runs in 16bit mode. So UEFI is able to provide a GUI (navigation with mouse) as opposed to BIOS which allows navigation only using the keyboard.


---
## References

![](https://www.youtube.com/watch?v=LGz0Io_dh_I)