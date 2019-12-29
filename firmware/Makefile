ARCH=riscv
HAL=fpga
PREFIX=riscv64-unknown-linux-gnu-
GCC=$(PREFIX)gcc
OBJCOPY=$(PREFIX)objcopy
OBJDUMP=$(PREFIX)objdump

DEFINES=-DPRINTF_DISABLE_SUPPORT_FLOAT -DPRINTF_DISABLE_SUPPORT_EXPONENTIAL \
        -DPRINTF_DISABLE_SUPPORT_LONG_LONG \
        -DTRANSLATE_UDP -DTRANSLATE_TCP
CFLAGS=-fno-builtin -nostdlib -static -Wl,--gc-sections,--print-gc-sections -O2 -Wall \
       -I./arch/$(ARCH)/ -I./hal/$(HAL)/ -I. $(DEFINES)

-include Makefile.config

ifeq ($(ARCH), amd64)
	PREFIX =
	#CFLAGS += -no-pie -fno-PIC
endif

ifeq ($(ARCH), riscv)
	CFLAGS += -mcmodel=medany
endif

HEADERS=$(wildcard *.h) $(wildcard arch/$(ARCH)/*.h) $(wildcard hal/$(HAL)/*.h)
SOURCES=$(wildcard *.c *.S) $(wildcard arch/$(ARCH)/*.c arch/$(ARCH)/*.S) \
        $(wildcard hal/$(HAL)/*.c hal/$(HAL)/*.S)
OBJECTS=$(patsubst %.c,%.o,$(wildcard *.c)) $(patsubst %.S,%.o,$(wildcard *.S)) \
        $(patsubst %.c,%.o,$(wildcard arch/$(ARCH)/*.c)) $(patsubst %.S,%.o,$(wildcard arch/$(ARCH)/*.S)) \
        $(patsubst %.c,%.o,$(wildcard hal/$(HAL)/*.c)) $(patsubst %.S,%.o,$(wildcard hal/$(HAL)/*.S))

.PHONY: all
all: $(OBJECTS) firmware.elf firmware.bin firmware.coe

.PHONY: asm
asm: firmware.elf
	$(OBJDUMP) -xd $< | vi -

%.o: %.c $(HEADERS)
	$(GCC) $(CFLAGS) -c $< -o $@

%.o: %.S $(HEADERS)
	$(GCC) $(CFLAGS) -c $< -o $@

%.elf: $(OBJECTS) linker.ld
	$(GCC) -Tlinker.ld $(CFLAGS) $^ -o $@

%.bin: %.elf
	$(OBJCOPY) -S --adjust-vma -0x80000000 -O binary $< $@

%.coe: %.bin
	python3 bin2coe.py $< $@

.PHONY: clean
clean:
	-rm *.o *.elf *.bin *.coe arch/*/*.o hal/*/*.o
