/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "delay.h"

/* ROM COMMANDS */
#define SEARCH_ROM         (u8)0XF0
#define READ_ROM           (u8)0x33
#define MATCH_ROM          (u8)0x55
#define SKIP_ROM           (u8)0xCC
#define ALARM_SEARCH       (u8)0XEC
/* FUNCTION COMMANDS */
#define CONVERT_T          (u8)0x44
#define WRITE_SCRATCHPAD   (u8)0x4E
#define READ_SCRATCHPAD    (u8)0xBE
#define COPY_SCRATCHPAD    (u8)0X48
#define RECALL_EE          (u8)0XB8
#define READ_POWER_SUPPLY  (u8)0XB4

u8 ROM_ID[8];
u8 sukces;

// Wysylanie sygnalu reset i oczekiwanie na zgloszenie obecnosci przez urzadzenie
u8 RESET_PULSE(void)
{
	unsigned int i;
	OW_LOW();
	DELAY_US(DELAY_480US);
	OW_HIGH();
	DELAY_US(DELAY_15US);
	if(OW_READ()) { i = 1; } else { i = 0; }
	DELAY_US(DELAY_480US);
	if(OW_READ()) { i = 1; } else { i = 0; }
	return i;
}

void WRITE_BYTE(u8 data)
{
  u8 i;
  for(i=0; i<8; i++)
  {
    if(data & 0x01)
    { /* write '1' */
      OW_LOW();               /* master - drive bus low */
      DELAY_US(DELAY_6US);    /* master - wait 6us (A-5,6,15) */
      OW_HIGH();              /* master - release bus */
      DELAY_US(DELAY_64US);   /* master - wait 64us (B-59,64,N/A) */
    }
    else
    { /* write '0' */
      OW_LOW();                /* master - drive bus low */
      DELAY_US(DELAY_60US);    /* master - wait 60us (C-60,60,120) */
      OW_HIGH();               /* master - release bus */
      DELAY_US(DELAY_10US);    /* master - wait 10us (D-8,10,N/A) */
    }
    data >>= 1;
  }
}
u8 READ_BYTE(void)
{
  u8 i;
  u8 result = 0;

  for(i=0; i<8; i++)
  {
    result >>= 1;
    OW_LOW();                 /* master - drive bus low */
    DELAY_US(DELAY_6US);      /* master - wait 6us (A-5,6,15) */
    OW_HIGH();                /* master - release bus */
    DELAY_US(DELAY_9US);      /* master - wait 9us (E-5,9,12) */
    if(OW_READ())  result |= 0x80;
    DELAY_US(DELAY_55US);     /* master - wait 55us (F-50,55,N/A) */
  }
  return (result);
}


u8 READ_ID(u8 *ROM_ID)
{
	s16 tmp;
	unsigned int i;
	if(!RESET_PULSE()) return 0;
	WRITE_BYTE(READ_ROM);
	for(i=0;i<8;i++)
	{
		ROM_ID[i] = READ_BYTE();
	}
	return 1;
}


void pause(void)
{
	unsigned int i;
	for(i=0;i<30000;i++) _asm("nop");
}

void setup(void)
{ CLK_DeInit();
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  CLK->ECKR |= 0x01;   /* HSEEN: High speed external crystal oscillator enable */
  while(!(CLK->ECKR & 0x02));  /* HSERDY: High speed external crystal oscillator ready, waint until HSE ready */
  CLK->SWCR |= 0x02;   /* set SWEN bit: Switch start/stop */
  CLK->SWR = 0xB4;     /* HSE selected as master clock source */
  while(CLK->SWCR & 0x01);   /* wait until switch busy: SWBSY = 1 */
	/* Enable peripheral clock */
  //CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);   /* 8bit: for implementing delays */
	
	
	GPIO_Init(GPIOD, GPIO_PIN_0,GPIO_MODE_OUT_OD_LOW_SLOW);
	GPIO_Init(ONEWIREBUS_PORT, ONEWIREBUS_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);
	
	/* TIMER4 configuration */
  TIM4_DeInit();
  TIM4_TimeBaseInit(TIM4_PRESCALER_128, 250);                 /* 2MS overflow interval - 500Hz*/
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  TIM4_Cmd(ENABLE);
	
}

main()
{

setup();
	while (1)
	{	
		RESET_PULSE();
		READ_ID(ROM_ID);
	}
}