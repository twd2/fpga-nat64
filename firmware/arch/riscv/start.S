.section .text.entrypoint, "ax", @progbits
.global _entrypoint
_entrypoint:
    j _start

.section .text.start, "ax", @progbits
.global _start
_start:
    la t0, trap_entry
    csrw mtvec, t0
    la sp, _end_of_stack - 0x10
    j start

.section .text.bootloader.start, "ax", @progbits
.global enter_bootloader
enter_bootloader:
    la sp, _end_of_stack - 0x10
    j bootloader

.section .text
.balign 8
trap_entry:
    # reuse main stack now
    la sp, _end_of_stack - 0x10
    call trap_handler
    j enter_bootloader

.section .stack
_stack:
    .space 0x3f0
_end_of_stack:
