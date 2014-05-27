#
# Trivial blink example using the ARM Embedded Toolchain
# Chuck McManis (cmcmanis@mcmanis.com)
#
all:	blink.elf blink.ld

CFLAGS = -mcpu=cortex-m4 -mthumb -g
LDFLAGS = -Wl,-T,blink.ld,-Map,blink.map

all:	blink.elf

startup.o: startup_ARMCM4.S
	arm-none-eabi-as $(CFLAGS) -o startup.o $<

blink.o: blink.c
	arm-none-eabi-gcc $(CFLAGS) -c blink.c

blink.elf:	blink.o blink.c startup.o
	arm-none-eabi-gcc $(LDFLAGS) -o blink.elf blink.o startup.o

clean:
	rm *.o blink.elf blink.map
