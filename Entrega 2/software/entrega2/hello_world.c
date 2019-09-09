#include <stdio.h>
#include "system.h"
#include <unistd.h>
#include <alt_types.h>
#include <io.h> /* Leiutura e escrita no Avalon */
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"

int n = 0;
volatile int counter, edge_capture;
volatile int ledflag = 0;

void init_pio();

int main() {
	init_pio();

	unsigned int *p_sw = (unsigned int *)(0x11020);

	printf("Embarcados++ \n");
	while (1) {
		counter += (n*4)+1;
		if (counter > 2500000) {
			counter = 0;

			if (ledflag == 0) {
				ledflag = 0xFF;
			} else {
				ledflag = 0;
			}

			  IOWR_32DIRECT(PIO_0_BASE, 0, ledflag);

		}
	}

	return 0;
}


/*******************************************************************
 * static void handle_button_interrupts( void* context, alt_u32 id)*
 *                                                                 *
 * Handle interrupts from the buttons.                             *
 * This interrupt event is triggered by a button/switch press.     *
 * This handler sets *context to the value read from the button    *
 * edge capture register.  The button edge capture register        *
 * is then cleared and normal program execution resumes.           *
 * The value stored in *context is used to control program flow    *
 * in the rest of this program's routines.                         *
 ******************************************************************/

void handle_button_interrupts(void* context, alt_u32 id) {
	/* Cast context to edge_capture's type. It is important that this be
	 * declared volatile to avoid unwanted compiler optimization.
	 */
	volatile int* edge_capture_ptr = (volatile int*) context;
	/* Store the value in the Button's edge capture register in *context. */
	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(PIO_1_BASE);

	n = IORD_ALTERA_AVALON_PIO_DATA(PIO_1_BASE);

	/* Reset the Button's edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_1_BASE, 0);
}

/* Initialize the pio. */

void init_pio() {
/* Recast the edge_capture pointer to match the alt_irq_register() function
 * prototype. */
void* edge_capture_ptr = (void*) &edge_capture;
/* Enable first four interrupts. */
IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_1_BASE, 0xf);
/* Reset the edge capture register. */
IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_1_BASE, 0x0);
/* Register the interrupt handler. */
alt_irq_register(PIO_1_IRQ, edge_capture_ptr, handle_button_interrupts);
}

#if defined(MAIN1)
int main()
{
volatile int in, out;
while (1)
{
	in = IORD_ALTERA_AVALON_PIO_DATA(PIO_1A_BASE);
	out = in;
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_1A_BASE, out);
}
}
#endif

