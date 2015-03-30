#ifndef _CONFIG_H_
#define _CONFIG_H_

#include "stm8s_conf.h"

/* 1Wire Bus 
PB6: Port B6
*/
#define ONEWIREBUS_PORT   GPIOB
#define ONEWIREBUS_PIN    GPIO_PIN_6

#define OW_LOW()  (ONEWIREBUS_PORT->ODR &= (u8)(~ONEWIREBUS_PIN))   /* drive 1-wire bus low */
#define OW_HIGH() (ONEWIREBUS_PORT->ODR |= ONEWIREBUS_PIN)    /* release 1-wire bus */
#define OW_READ() (u8)(ONEWIREBUS_PORT->IDR & ONEWIREBUS_PIN)     /* read 1-wire bus */

/* Board LED
PD0: Port D0 / Timer 1 - break input / Configurable clock output [AFR5]
*/
#define LED_PORT  GPIOD 
#define LED_PIN   GPIO_PIN_0

#define LED_ON    (LED_PORT->ODR |= LED_PIN)
#define LED_OFF   (LED_PORT->ODR &= (u8)(~LED_PIN))
#define LED_STATE (LED_PORT->IDR & LED_PIN)

#endif