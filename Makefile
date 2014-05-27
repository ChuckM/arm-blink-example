#
# Trivial blink example using the ARM Embedded Toolchain
# Chuck McManis (cmcmanis@mcmanis.com)
#
all:	blink.elf blink.ld

CFLAGS = -mcpu=cortex-m4 -mthumb

startup.o: startup.s
	arm-none-eabi-as $(CFLAGS) -o startup.o startup.s

blink.elf:	blink.c startup.o
	arm-none-eabi-gcc $(CFLAGS) -g -o blink.elf -Wl,-T,blink.ld,-Map,blink.map blink.c startup.o

clean:
	rm blink.elf startup.o blink.map
