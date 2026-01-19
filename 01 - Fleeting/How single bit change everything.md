---
cssclasses:
  - center-images
  - center-titles
created: "[[2026-01-18]]"
---
Tags: #linux 

# How single bit change everything

- Every computer processor has a specific set of actions in can perform called the instruction set of the processor
- If we want to give one software more control of the system than another software we can define a subset of special instructions that not all processes can use, Also called as *Privileged instructions*
- Common approach to do that is to use a *special one-bit register* that can hold *1 or 0*, This register is called the *mode bit*
- If *mode bit* value is 1 (*kernel mode*), processor is said to be running in *privileged* mode, so it can execute any instruction in the instruction set including *privileged instruction*
- If value is set to *0*, processor runs in *restricted mode* (*user mode*), can't execute privileged instructions
- *how and who change to mode bit value and when*


#### Kernel Mode (mode bit 1)
- Kernel can directly interact with *IO devices* like hard drive, CPU, memory and peripherals such as monitors and keyboard
- Direct manipulation of these devices requires privileged instructions, Meaning the CPU can only do it while running in kernel mode


### User mode (mode bit 0)
- Move data
- Copy data
- Arithmetic Operations
- Floating Point Operations
- Bitwise Operations
- Condition
- Loops

### APIs / System Calls
- Allow user programs to access hardware resources
- Operating systems provide a set of functions in the form of a library


---
## References

![](https://www.youtube.com/watch?v=H4SDPLiUnv4&t=2s)
