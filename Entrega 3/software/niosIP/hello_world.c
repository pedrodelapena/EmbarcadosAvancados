#include <stdio.h>
#include "system.h"
#include <alt_types.h>
#include <io.h> /* Leiutura e escrita no Avalon */

//#define SIM


#define PERIPHERAL_LED_0_BASE 0x11040

// LED Peripheral
#define REG_DATA_OFFSET 1

int PS2_init(unsigned int BASE){
	unsigned int led = 0;
	unsigned int *p_base = (unsigned int *) BASE;
	unsigned int *p_led = (unsigned int *) PERIPHERAL_LED_0_BASE;
	uint t = *(p_base + 4);
	if(*(p_base + 4) != 0xAAAA5555)
		return 0;
	*(p_base + 1) = 1;

	*(p_led+REG_DATA_OFFSET) = 0x2;
	return 1;
}

int PS2_halt(unsigned int BASE){
	unsigned int *p_base = (unsigned int *) BASE;
	unsigned int *p_led = (unsigned int *) PERIPHERAL_LED_0_BASE;
	*(p_base + 1) = 0;
	*(p_led + REG_DATA_OFFSET) = 0x3;
	return 0;
}

int PS2_read_clickLeft(unsigned int BASE){
	unsigned int *p_base = (unsigned int *) BASE;

	return (*(p_base + 1) & 0x1);
}

int main(void){
  unsigned int led = 0;
  unsigned int *p_led = (unsigned int *) PERIPHERAL_LED_0_BASE;

  //*(p_led+REG_DATA_OFFSET) = 0x3;


  PS2_init(0x11000);

  usleep(5000000);

  while(1){
      if (led < 3){
          *(p_led+REG_DATA_OFFSET) = (0x1 << led++);

          int left = PS2_read_clickLeft(0x11000);
          if (left == 1){
        	  int count = 0;
        	  while (count < 2){
        		  *(p_led + REG_DATA_OFFSET) = 0x1;
        		  usleep(50000);
        		  count++;
        	  }

          }

          int a = *(p_led+3);
#ifndef SIM
          usleep(50000); // remover durante a simulação
#endif
      }
      else{
          led = 0;
      }
  };

  PS2_halt(0x11000);

  return 0;
}
