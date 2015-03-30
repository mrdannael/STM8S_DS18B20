#ifndef _DELAY_H_
#define _DELAY_H_

#include "config.h"

#define DELAY_480US (u16)2560
#define DELAY_70US  (u16)373
#define DELAY_410US (u16)2187
#define DELAY_100US (u16)534 // lub 533
#define DELAY_6US   (u8)32
#define DELAY_2US   (u8)10
#define DELAY_64US  (u16)341
#define DELAY_60US  (u16)320
#define DELAY_10US  (u8)53
#define DELAY_15US  (u8)80
#define DELAY_9US   (u8)48
#define DELAY_55US  (u16)293
#define DELAY_80US  (u16)426

#define I2C_DELAY      (u8)6       /* 1uS - 5.33 */
#define SCL_SDA_DELAY  (u8)8  

#define SPI_CS_LOW_DELAY  (u8)12   /* 2uS */

void delay_ms(u16);


#define DELAY_US( loops ) _asm("$N: \n decw X \n jrne $L \n nop", (u16)loops);

#endif
