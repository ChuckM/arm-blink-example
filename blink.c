/*
 * Very simple BLINK example for the STM32F4 chip.
 * Minimal setup, just blink.
 * Code: Public Domain
 * Author : Chuck McManis
 */
#include <stdint.h>

#define GPIOD		0x40020C00ul	// from the data sheets
#define GPIOD_MODE	(*(uint32_t *)(GPIOD+0x00ul))
#define GPIOD_TYPE	(*(uint32_t *)(GPIOD+0x04ul))
#define GPIOD_SPEED	(*(uint32_t *)(GPIOD+0x08ul))
#define GPIOD_PUPD	(*(uint32_t *)(GPIOD+0x0aul))
#define GPIOD_IN	(*(uint32_t *)(GPIOD+0x10ul))
#define GPIOD_OUT	(*(uint32_t *)(GPIOD+0x14ul))

#define RCC_BASE	0x40023800ul
#define RCC_ENABLE	(*(uint32_t *)(RCC_BASE + 0x30ul))
#define GPIOD_ENA	0x8

// No exit, just sit and wait
void _exit(int r) {
	while (1) {
		asm("nop");
	}
}

int delay_time = 250000;

void
main() {
	int i;

	RCC_ENABLE = GPIOD_ENA;	// Enable clocks to GPIOD
	GPIOD_MODE = 0x55000000; // Bits 15 - 12 all output
	while (1) {
		GPIOD_OUT = 0xa000;	// two LEDs on
		for (i = 0; i < delay_time; i++) {
			asm("nop");
		}
		GPIOD_OUT = 0x5000; // other two LEDs on
		for (i = 0; i < delay_time; i++) {
			asm("nop");
		}
	}
}	

void 
SystemInit() {
	main();
}
