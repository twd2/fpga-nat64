SECTIONS
{
    RAM_BASE = 0x80000000;
    ENTRY(_entrypoint)
    ASSERT(_entrypoint == RAM_BASE, "Error: entrypoint should be at RAM_BASE.")

    . = RAM_BASE;
    .text.entrypoint :
    {
        *(.text.entrypoint)
    }
    . = RAM_BASE + 0x10;
    .stack :
    {
        *(.stack)
    }
    . = RAM_BASE + 0x400;
    .text.bootloader.start :
    {
        *(.text.bootloader.start)
    }
    .text.bootloader :
    {
        *(.text.bootloader)
        *(.rodata.bootloader)
    }
    .data.bootloader :
    {
        *(.data.bootloader)
        *(.bss.bootloader)
    }
    . = RAM_BASE + 0x800;
    .text.start :
    {
        *(.text.start)
    }
    .text :
    {
        *(.text*)
        *(.rodata*)
        *(.srodata*)
    }
    _text_end = .;
    .data :
    {
        *(.data*)
        *(.sdata*)
    }
    _bss_begin = .;
    .bss :
    {
        *(.bss*)
        *(.sbss*)
    }
    _bss_end = .;
    /DISCARD/ :
    {
        *(.note.gnu.build-id)
    }
}
