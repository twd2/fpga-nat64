.section .text.entrypoint, "ax", @progbits
.global _entrypoint
_entrypoint:
    jmp _start

.section .text.start, "ax", @progbits
.global _start
_start:
    lea _end_of_stack - 0x10(%rip), %rsp
    jmp start

.section .text.bootloader.start, "ax", @progbits
.global enter_bootloader
enter_bootloader:
    lea _end_of_stack - 0x10(%rip), %rsp
    jmp bootloader

.section .stack
_stack:
    .space 0x3f0
_end_of_stack:
