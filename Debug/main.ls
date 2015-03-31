   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  55                     ; 27 u8 RESET_PULSE(void)
  55                     ; 28 {
  57                     	switch	.text
  58  0000               _RESET_PULSE:
  60  0000 89            	pushw	x
  61       00000002      OFST:	set	2
  64                     ; 30 	OW_LOW();
  66  0001 721d5005      	bres	20485,#6
  67                     ; 31 	DELAY_US(DELAY_480US);
  69  0005 ae0a00        	ldw	x,#2560
  71  0008               L6: 
  72  0008 5a             decw X 
  73  0009 26fd           jrne L6 
  74  000b 9d             nop
  76                     ; 32 	OW_HIGH();
  79  000c 721c5005      	bset	20485,#6
  80                     ; 33 	DELAY_US(DELAY_15US);
  82  0010 ae0050        	ldw	x,#80
  84  0013               L01: 
  85  0013 5a             decw X 
  86  0014 26fd           jrne L01 
  87  0016 9d             nop
  89                     ; 34 	if(OW_READ()) { i = 1; } else { i = 0; }
  92  0017 c65006        	ld	a,20486
  93  001a a540          	bcp	a,#64
  94  001c 2700          	jreq	L72
  98  001e               L72:
 101                     ; 35 	DELAY_US(DELAY_480US);
 103  001e ae0a00        	ldw	x,#2560
 105  0021               L21: 
 106  0021 5a             decw X 
 107  0022 26fd           jrne L21 
 108  0024 9d             nop
 110                     ; 36 	if(OW_READ()) { i = 1; } else { i = 0; }
 113  0025 c65006        	ld	a,20486
 114  0028 a540          	bcp	a,#64
 115  002a 2707          	jreq	L33
 118  002c ae0001        	ldw	x,#1
 119  002f 1f01          	ldw	(OFST-1,sp),x
 121  0031 2003          	jra	L53
 122  0033               L33:
 125  0033 5f            	clrw	x
 126  0034 1f01          	ldw	(OFST-1,sp),x
 127  0036               L53:
 128                     ; 37 	return i;
 130  0036 7b02          	ld	a,(OFST+0,sp)
 133  0038 85            	popw	x
 134  0039 81            	ret
 177                     ; 40 void WRITE_BYTE(u8 data)
 177                     ; 41 {
 178                     	switch	.text
 179  003a               _WRITE_BYTE:
 181  003a 88            	push	a
 182  003b 88            	push	a
 183       00000001      OFST:	set	1
 186                     ; 43   for(i=0; i<8; i++)
 188  003c 0f01          	clr	(OFST+0,sp)
 189  003e               L16:
 190                     ; 45     if(data & 0x01)
 192  003e 7b02          	ld	a,(OFST+1,sp)
 193  0040 a501          	bcp	a,#1
 194  0042 2718          	jreq	L76
 195                     ; 47       OW_LOW();               /* master - drive bus low */
 197  0044 721d5005      	bres	20485,#6
 198                     ; 48       DELAY_US(DELAY_6US);    /* master - wait 6us (A-5,6,15) */
 200  0048 ae0020        	ldw	x,#32
 202  004b               L61: 
 203  004b 5a             decw X 
 204  004c 26fd           jrne L61 
 205  004e 9d             nop
 207                     ; 49       OW_HIGH();              /* master - release bus */
 210  004f 721c5005      	bset	20485,#6
 211                     ; 50       DELAY_US(DELAY_64US);   /* master - wait 64us (B-59,64,N/A) */
 213  0053 ae0155        	ldw	x,#341
 215  0056               L02: 
 216  0056 5a             decw X 
 217  0057 26fd           jrne L02 
 218  0059 9d             nop
 222  005a 2016          	jra	L17
 223  005c               L76:
 224                     ; 54       OW_LOW();                /* master - drive bus low */
 226  005c 721d5005      	bres	20485,#6
 227                     ; 55       DELAY_US(DELAY_60US);    /* master - wait 60us (C-60,60,120) */
 229  0060 ae0140        	ldw	x,#320
 231  0063               L22: 
 232  0063 5a             decw X 
 233  0064 26fd           jrne L22 
 234  0066 9d             nop
 236                     ; 56       OW_HIGH();               /* master - release bus */
 239  0067 721c5005      	bset	20485,#6
 240                     ; 57       DELAY_US(DELAY_10US);    /* master - wait 10us (D-8,10,N/A) */
 242  006b ae0035        	ldw	x,#53
 244  006e               L42: 
 245  006e 5a             decw X 
 246  006f 26fd           jrne L42 
 247  0071 9d             nop
 249  0072               L17:
 250                     ; 59     data >>= 1;
 252  0072 0402          	srl	(OFST+1,sp)
 253                     ; 43   for(i=0; i<8; i++)
 255  0074 0c01          	inc	(OFST+0,sp)
 258  0076 7b01          	ld	a,(OFST+0,sp)
 259  0078 a108          	cp	a,#8
 260  007a 25c2          	jrult	L16
 261                     ; 61 }
 264  007c 85            	popw	x
 265  007d 81            	ret
 309                     ; 62 u8 READ_BYTE(void)
 309                     ; 63 {
 310                     	switch	.text
 311  007e               _READ_BYTE:
 313  007e 89            	pushw	x
 314       00000002      OFST:	set	2
 317                     ; 65   u8 result = 0;
 319  007f 0f02          	clr	(OFST+0,sp)
 320                     ; 67   for(i=0; i<8; i++)
 322  0081 0f01          	clr	(OFST-1,sp)
 323  0083               L511:
 324                     ; 69     result >>= 1;
 326  0083 0402          	srl	(OFST+0,sp)
 327                     ; 70     OW_LOW();                 /* master - drive bus low */
 329  0085 721d5005      	bres	20485,#6
 330                     ; 71     DELAY_US(DELAY_6US);      /* master - wait 6us (A-5,6,15) */
 332  0089 ae0020        	ldw	x,#32
 334  008c               L03: 
 335  008c 5a             decw X 
 336  008d 26fd           jrne L03 
 337  008f 9d             nop
 339                     ; 72     OW_HIGH();                /* master - release bus */
 342  0090 721c5005      	bset	20485,#6
 343                     ; 73     DELAY_US(DELAY_9US);      /* master - wait 9us (E-5,9,12) */
 345  0094 ae0030        	ldw	x,#48
 347  0097               L23: 
 348  0097 5a             decw X 
 349  0098 26fd           jrne L23 
 350  009a 9d             nop
 352                     ; 74     if(OW_READ())  result |= 0x80;
 355  009b c65006        	ld	a,20486
 356  009e a540          	bcp	a,#64
 357  00a0 2706          	jreq	L321
 360  00a2 7b02          	ld	a,(OFST+0,sp)
 361  00a4 aa80          	or	a,#128
 362  00a6 6b02          	ld	(OFST+0,sp),a
 363  00a8               L321:
 364                     ; 75     DELAY_US(DELAY_55US);     /* master - wait 55us (F-50,55,N/A) */
 366  00a8 ae0125        	ldw	x,#293
 368  00ab               L43: 
 369  00ab 5a             decw X 
 370  00ac 26fd           jrne L43 
 371  00ae 9d             nop
 373                     ; 67   for(i=0; i<8; i++)
 376  00af 0c01          	inc	(OFST-1,sp)
 379  00b1 7b01          	ld	a,(OFST-1,sp)
 380  00b3 a108          	cp	a,#8
 381  00b5 25cc          	jrult	L511
 382                     ; 77   return (result);
 384  00b7 7b02          	ld	a,(OFST+0,sp)
 387  00b9 85            	popw	x
 388  00ba 81            	ret
 435                     ; 81 u8 READ_ID(u8 *ROM_ID)
 435                     ; 82 {
 436                     	switch	.text
 437  00bb               _READ_ID:
 439  00bb 89            	pushw	x
 440  00bc 89            	pushw	x
 441       00000002      OFST:	set	2
 444                     ; 85 	if(!RESET_PULSE()) return 0;
 446  00bd cd0000        	call	_RESET_PULSE
 448  00c0 4d            	tnz	a
 449  00c1 2603          	jrne	L741
 452  00c3 4f            	clr	a
 454  00c4 2020          	jra	L04
 455  00c6               L741:
 456                     ; 86 	WRITE_BYTE(READ_ROM);
 458  00c6 a633          	ld	a,#51
 459  00c8 cd003a        	call	_WRITE_BYTE
 461                     ; 87 	for(i=0;i<8;i++)
 463  00cb 5f            	clrw	x
 464  00cc 1f01          	ldw	(OFST-1,sp),x
 465  00ce               L151:
 466                     ; 89 		ROM_ID[i] = READ_BYTE();
 468  00ce adae          	call	_READ_BYTE
 470  00d0 1e03          	ldw	x,(OFST+1,sp)
 471  00d2 72fb01        	addw	x,(OFST-1,sp)
 472  00d5 f7            	ld	(x),a
 473                     ; 87 	for(i=0;i<8;i++)
 475  00d6 1e01          	ldw	x,(OFST-1,sp)
 476  00d8 1c0001        	addw	x,#1
 477  00db 1f01          	ldw	(OFST-1,sp),x
 480  00dd 1e01          	ldw	x,(OFST-1,sp)
 481  00df a30008        	cpw	x,#8
 482  00e2 25ea          	jrult	L151
 483                     ; 91 	return 1;
 485  00e4 a601          	ld	a,#1
 487  00e6               L04:
 489  00e6 5b04          	addw	sp,#4
 490  00e8 81            	ret
 525                     ; 95 void pause(void)
 525                     ; 96 {
 526                     	switch	.text
 527  00e9               _pause:
 529  00e9 89            	pushw	x
 530       00000002      OFST:	set	2
 533                     ; 98 	for(i=0;i<30000;i++) _asm("nop");
 535  00ea 5f            	clrw	x
 536  00eb 1f01          	ldw	(OFST-1,sp),x
 537  00ed               L571:
 541  00ed 9d            nop
 545  00ee 1e01          	ldw	x,(OFST-1,sp)
 546  00f0 1c0001        	addw	x,#1
 547  00f3 1f01          	ldw	(OFST-1,sp),x
 550  00f5 1e01          	ldw	x,(OFST-1,sp)
 551  00f7 a37530        	cpw	x,#30000
 552  00fa 25f1          	jrult	L571
 553                     ; 99 }
 556  00fc 85            	popw	x
 557  00fd 81            	ret
 589                     ; 101 void setup(void)
 589                     ; 102 { CLK_DeInit();
 590                     	switch	.text
 591  00fe               _setup:
 597  00fe cd0000        	call	_CLK_DeInit
 599                     ; 103   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 601  0101 a680          	ld	a,#128
 602  0103 cd0000        	call	_CLK_SYSCLKConfig
 604                     ; 104   CLK->ECKR |= 0x01;   /* HSEEN: High speed external crystal oscillator enable */
 606  0106 721050c1      	bset	20673,#0
 608  010a               L512:
 609                     ; 105   while(!(CLK->ECKR & 0x02));  /* HSERDY: High speed external crystal oscillator ready, waint until HSE ready */
 611  010a c650c1        	ld	a,20673
 612  010d a502          	bcp	a,#2
 613  010f 27f9          	jreq	L512
 614                     ; 106   CLK->SWCR |= 0x02;   /* set SWEN bit: Switch start/stop */
 616  0111 721250c5      	bset	20677,#1
 617                     ; 107   CLK->SWR = 0xB4;     /* HSE selected as master clock source */
 619  0115 35b450c4      	mov	20676,#180
 621  0119               L522:
 622                     ; 108   while(CLK->SWCR & 0x01);   /* wait until switch busy: SWBSY = 1 */
 624  0119 c650c5        	ld	a,20677
 625  011c a501          	bcp	a,#1
 626  011e 26f9          	jrne	L522
 627                     ; 111   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);   /* 8bit: for implementing delays */
 629  0120 ae0401        	ldw	x,#1025
 630  0123 cd0000        	call	_CLK_PeripheralClockConfig
 632                     ; 114 	GPIO_Init(GPIOD, GPIO_PIN_0,GPIO_MODE_OUT_OD_LOW_SLOW);
 634  0126 4b80          	push	#128
 635  0128 4b01          	push	#1
 636  012a ae500f        	ldw	x,#20495
 637  012d cd0000        	call	_GPIO_Init
 639  0130 85            	popw	x
 640                     ; 115 	GPIO_Init(ONEWIREBUS_PORT, ONEWIREBUS_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);
 642  0131 4bb0          	push	#176
 643  0133 4b40          	push	#64
 644  0135 ae5005        	ldw	x,#20485
 645  0138 cd0000        	call	_GPIO_Init
 647  013b 85            	popw	x
 648                     ; 118   TIM4_DeInit();
 650  013c cd0000        	call	_TIM4_DeInit
 652                     ; 119   TIM4_TimeBaseInit(TIM4_PRESCALER_128, 250);                 /* 2MS overflow interval - 500Hz*/
 654  013f ae07fa        	ldw	x,#2042
 655  0142 cd0000        	call	_TIM4_TimeBaseInit
 657                     ; 120   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 659  0145 ae0101        	ldw	x,#257
 660  0148 cd0000        	call	_TIM4_ITConfig
 662                     ; 121   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 664  014b a601          	ld	a,#1
 665  014d cd0000        	call	_TIM4_ClearITPendingBit
 667                     ; 122   TIM4_Cmd(ENABLE);
 669  0150 a601          	ld	a,#1
 670  0152 cd0000        	call	_TIM4_Cmd
 672                     ; 124 }
 675  0155 81            	ret
 702                     ; 126 main()
 702                     ; 127 {
 703                     	switch	.text
 704  0156               _main:
 708                     ; 129 setup();
 710  0156 ada6          	call	_setup
 712  0158               L142:
 713                     ; 132 		RESET_PULSE();
 715  0158 cd0000        	call	_RESET_PULSE
 717                     ; 133 		READ_ID(ROM_ID);
 719  015b ae0001        	ldw	x,#_ROM_ID
 720  015e cd00bb        	call	_READ_ID
 723  0161 20f5          	jra	L142
 757                     	xdef	_main
 758                     	xdef	_setup
 759                     	xdef	_pause
 760                     	xdef	_READ_ID
 761                     	xdef	_READ_BYTE
 762                     	xdef	_WRITE_BYTE
 763                     	xdef	_RESET_PULSE
 764                     	switch	.ubsct
 765  0000               _sukces:
 766  0000 00            	ds.b	1
 767                     	xdef	_sukces
 768  0001               _ROM_ID:
 769  0001 000000000000  	ds.b	8
 770                     	xdef	_ROM_ID
 771                     	xref	_TIM4_ClearITPendingBit
 772                     	xref	_TIM4_ITConfig
 773                     	xref	_TIM4_Cmd
 774                     	xref	_TIM4_TimeBaseInit
 775                     	xref	_TIM4_DeInit
 776                     	xref	_GPIO_Init
 777                     	xref	_CLK_SYSCLKConfig
 778                     	xref	_CLK_PeripheralClockConfig
 779                     	xref	_CLK_DeInit
 799                     	end
