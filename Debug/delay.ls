   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  55                     ; 11 void delay_ms(u16 n_ms)
  55                     ; 12 {
  57                     	switch	.text
  58  0000               _delay_ms:
  60  0000 89            	pushw	x
  61       00000000      OFST:	set	0
  64                     ; 14   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
  66  0001 ae0501        	ldw	x,#1281
  67  0004 cd0000        	call	_CLK_PeripheralClockConfig
  69                     ; 17   TIM2->PSCR = 6;
  71  0007 3506530c      	mov	21260,#6
  72                     ; 20   TIM2->ARRH = 0;
  74  000b 725f530d      	clr	21261
  75                     ; 21   TIM2->ARRL = 250;
  77  000f 35fa530e      	mov	21262,#250
  78                     ; 25   TIM2->CNTRH = 0;
  80  0013 725f530a      	clr	21258
  81                     ; 26   TIM2->CNTRL = 2;
  83  0017 3502530b      	mov	21259,#2
  84                     ; 29   TIM2->SR1 &= (u8)(~0x01);
  86  001b 72115302      	bres	21250,#0
  87                     ; 32   TIM2->CR1 |= 0x01;
  89  001f 72105300      	bset	21248,#0
  91  0023 200b          	jra	L13
  92  0025               L73:
  93                     ; 36     while((TIM2->SR1 & 0x01) == 0) ;
  95  0025 c65302        	ld	a,21250
  96  0028 a501          	bcp	a,#1
  97  002a 27f9          	jreq	L73
  98                     ; 37     TIM2->SR1 &= (u8)(~0x01);
 100  002c 72115302      	bres	21250,#0
 101  0030               L13:
 102                     ; 34   while(n_ms--)
 104  0030 1e01          	ldw	x,(OFST+1,sp)
 105  0032 1d0001        	subw	x,#1
 106  0035 1f01          	ldw	(OFST+1,sp),x
 107  0037 1c0001        	addw	x,#1
 108  003a a30000        	cpw	x,#0
 109  003d 26e6          	jrne	L73
 110                     ; 41   TIM2->CR1 &= (u8)(~0x01);
 112  003f 72115300      	bres	21248,#0
 113                     ; 42   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
 115  0043 ae0500        	ldw	x,#1280
 116  0046 cd0000        	call	_CLK_PeripheralClockConfig
 118                     ; 43 }
 121  0049 85            	popw	x
 122  004a 81            	ret
 156                     ; 51 void delay_10us(u8 n_10us)
 156                     ; 52 {
 157                     	switch	.text
 158  004b               _delay_10us:
 160  004b 88            	push	a
 161       00000000      OFST:	set	0
 164                     ; 54   TIM2->CNTRH = 0;
 166  004c 725f530a      	clr	21258
 167                     ; 55   TIM2->CNTRL = 10;
 169  0050 350a530b      	mov	21259,#10
 170                     ; 58   TIM2->SR1 &= (u8)(~0x01);
 172  0054 72115302      	bres	21250,#0
 173                     ; 61   TIM2->CR1 |= 0x01;
 175  0058 72105300      	bset	21248,#0
 177  005c 200b          	jra	L36
 178  005e               L17:
 179                     ; 65     while((TIM2->SR1 & 0x01) == 0) ;
 181  005e c65302        	ld	a,21250
 182  0061 a501          	bcp	a,#1
 183  0063 27f9          	jreq	L17
 184                     ; 66     TIM2->SR1 &= 0xFE;
 186  0065 72115302      	bres	21250,#0
 187  0069               L36:
 188                     ; 63   while(n_10us--)
 190  0069 7b01          	ld	a,(OFST+1,sp)
 191  006b 0a01          	dec	(OFST+1,sp)
 192  006d 4d            	tnz	a
 193  006e 26ee          	jrne	L17
 194                     ; 69   TIM2->CR1 &= 0xFE;
 196  0070 72115300      	bres	21248,#0
 197                     ; 70 }
 200  0074 84            	pop	a
 201  0075 81            	ret
 214                     	xdef	_delay_10us
 215                     	xdef	_delay_ms
 216                     	xref	_CLK_PeripheralClockConfig
 235                     	end
