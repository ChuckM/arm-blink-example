#
# Trivial blink example using the ARM Embedded Toolchain
# Chuck McManis (cmcmanis@mcmanis.com)
#
all:	blink.elf blink.ld

CFLAGS = -mcpu=cortex-m4 -mthumb -g
LDFLAGS = -T blink.ld -Map blink.map

all:	blink.elf blink.hex

startup.o: startup_ARMCM4.S
	arm-none-eabi-as $(CFLAGS) -o startup.o $<

blink.o: blink.c
	arm-none-eabi-gcc $(CFLAGS) -c blink.c

blink.elf:	blink.o blink.c startup.o
	arm-none-eabi-ld $(LDFLAGS) -o blink.elf blink.o startup.o

blink.hex: blink.elf
	arm-none-eabi-objcopy -Oihex $< $@

clean:
	rm *.o blink.elf blink.map blink.hex
