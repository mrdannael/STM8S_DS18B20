   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  15                     	bsct
  16  0000               _check:
  17  0000 00            	dc.b	0
  58                     ; 28 u8 RESET_PULSE(void)
  58                     ; 29 {
  60                     	switch	.text
  61  0000               _RESET_PULSE:
  63  0000 89            	pushw	x
  64       00000002      OFST:	set	2
  67                     ; 31 	OW_LOW();
  69  0001 721d5005      	bres	20485,#6
  70                     ; 32 	DELAY_US(DELAY_480US);
  72  0005 ae0a00        	ldw	x,#2560
  74  0008               L6: 
  75  0008 5a             decw X 
  76  0009 26fd           jrne L6 
  77  000b 9d             nop
  79                     ; 33 	OW_HIGH();
  82  000c 721c5005      	bset	20485,#6
  83                     ; 34 	DELAY_US(DELAY_15US);
  85  0010 ae0050        	ldw	x,#80
  87  0013               L01: 
  88  0013 5a             decw X 
  89  0014 26fd           jrne L01 
  90  0016 9d             nop
  92                     ; 35 	if(OW_READ()) { i = 1; } else { i = 0; }
  95  0017 c65006        	ld	a,20486
  96  001a a540          	bcp	a,#64
  97  001c 2700          	jreq	L72
 101  001e               L72:
 104                     ; 36 	DELAY_US(DELAY_480US);
 106  001e ae0a00        	ldw	x,#2560
 108  0021               L21: 
 109  0021 5a             decw X 
 110  0022 26fd           jrne L21 
 111  0024 9d             nop
 113                     ; 37 	if(OW_READ()) { i = 1; } else { i = 0; }
 116  0025 c65006        	ld	a,20486
 117  0028 a540          	bcp	a,#64
 118  002a 2707          	jreq	L33
 121  002c ae0001        	ldw	x,#1
 122  002f 1f01          	ldw	(OFST-1,sp),x
 124  0031 2003          	jra	L53
 125  0033               L33:
 128  0033 5f            	clrw	x
 129  0034 1f01          	ldw	(OFST-1,sp),x
 130  0036               L53:
 131                     ; 38 	return i;
 133  0036 7b02          	ld	a,(OFST+0,sp)
 136  0038 85            	popw	x
 137  0039 81            	ret
 180                     ; 41 void WRITE_BYTE(u8 data)
 180                     ; 42 {
 181                     	switch	.text
 182  003a               _WRITE_BYTE:
 184  003a 88            	push	a
 185  003b 88            	push	a
 186       00000001      OFST:	set	1
 189                     ; 44   for(i=0; i<8; i++)
 191  003c 0f01          	clr	(OFST+0,sp)
 192  003e               L16:
 193                     ; 46     if(data & 0x01)
 195  003e 7b02          	ld	a,(OFST+1,sp)
 196  0040 a501          	bcp	a,#1
 197  0042 2718          	jreq	L76
 198                     ; 48       OW_LOW();               /* master - drive bus low */
 200  0044 721d5005      	bres	20485,#6
 201                     ; 49       DELAY_US(DELAY_6US);    /* master - wait 6us (A-5,6,15) */
 203  0048 ae0020        	ldw	x,#32
 205  004b               L61: 
 206  004b 5a             decw X 
 207  004c 26fd           jrne L61 
 208  004e 9d             nop
 210                     ; 50       OW_HIGH();              /* master - release bus */
 213  004f 721c5005      	bset	20485,#6
 214                     ; 51       DELAY_US(DELAY_64US);   /* master - wait 64us (B-59,64,N/A) */
 216  0053 ae0155        	ldw	x,#341
 218  0056               L02: 
 219  0056 5a             decw X 
 220  0057 26fd           jrne L02 
 221  0059 9d             nop
 225  005a 2016          	jra	L17
 226  005c               L76:
 227                     ; 55       OW_LOW();                /* master - drive bus low */
 229  005c 721d5005      	bres	20485,#6
 230                     ; 56       DELAY_US(DELAY_60US);    /* master - wait 60us (C-60,60,120) */
 232  0060 ae0140        	ldw	x,#320
 234  0063               L22: 
 235  0063 5a             decw X 
 236  0064 26fd           jrne L22 
 237  0066 9d             nop
 239                     ; 57       OW_HIGH();               /* master - release bus */
 242  0067 721c5005      	bset	20485,#6
 243                     ; 58       DELAY_US(DELAY_10US);    /* master - wait 10us (D-8,10,N/A) */
 245  006b ae0035        	ldw	x,#53
 247  006e               L42: 
 248  006e 5a             decw X 
 249  006f 26fd           jrne L42 
 250  0071 9d             nop
 252  0072               L17:
 253                     ; 60     data >>= 1;
 255  0072 0402          	srl	(OFST+1,sp)
 256                     ; 44   for(i=0; i<8; i++)
 258  0074 0c01          	inc	(OFST+0,sp)
 261  0076 7b01          	ld	a,(OFST+0,sp)
 262  0078 a108          	cp	a,#8
 263  007a 25c2          	jrult	L16
 264                     ; 62 }
 267  007c 85            	popw	x
 268  007d 81            	ret
 312                     ; 63 u8 READ_BYTE(void)
 312                     ; 64 {
 313                     	switch	.text
 314  007e               _READ_BYTE:
 316  007e 89            	pushw	x
 317       00000002      OFST:	set	2
 320                     ; 66   u8 result = 0;
 322  007f 0f02          	clr	(OFST+0,sp)
 323                     ; 68   for(i=0; i<8; i++)
 325  0081 0f01          	clr	(OFST-1,sp)
 326  0083               L511:
 327                     ; 70     result >>= 1;
 329  0083 0402          	srl	(OFST+0,sp)
 330                     ; 71     OW_LOW();                 /* master - drive bus low */
 332  0085 721d5005      	bres	20485,#6
 333                     ; 72     DELAY_US(DELAY_6US);      /* master - wait 6us (A-5,6,15) */
 335  0089 ae0020        	ldw	x,#32
 337  008c               L03: 
 338  008c 5a             decw X 
 339  008d 26fd           jrne L03 
 340  008f 9d             nop
 342                     ; 73     OW_HIGH();                /* master - release bus */
 345  0090 721c5005      	bset	20485,#6
 346                     ; 74     DELAY_US(DELAY_9US);      /* master - wait 9us (E-5,9,12) */
 348  0094 ae0030        	ldw	x,#48
 350  0097               L23: 
 351  0097 5a             decw X 
 352  0098 26fd           jrne L23 
 353  009a 9d             nop
 355                     ; 75     if(OW_READ())  result |= 0x80;
 358  009b c65006        	ld	a,20486
 359  009e a540          	bcp	a,#64
 360  00a0 2706          	jreq	L321
 363  00a2 7b02          	ld	a,(OFST+0,sp)
 364  00a4 aa80          	or	a,#128
 365  00a6 6b02          	ld	(OFST+0,sp),a
 366  00a8               L321:
 367                     ; 76     DELAY_US(DELAY_55US);     /* master - wait 55us (F-50,55,N/A) */
 369  00a8 ae0125        	ldw	x,#293
 371  00ab               L43: 
 372  00ab 5a             decw X 
 373  00ac 26fd           jrne L43 
 374  00ae 9d             nop
 376                     ; 68   for(i=0; i<8; i++)
 379  00af 0c01          	inc	(OFST-1,sp)
 382  00b1 7b01          	ld	a,(OFST-1,sp)
 383  00b3 a108          	cp	a,#8
 384  00b5 25cc          	jrult	L511
 385                     ; 78   return (result);
 387  00b7 7b02          	ld	a,(OFST+0,sp)
 390  00b9 85            	popw	x
 391  00ba 81            	ret
 438                     ; 82 u8 READ_ID(u8 *ROM_ID)
 438                     ; 83 {
 439                     	switch	.text
 440  00bb               _READ_ID:
 442  00bb 89            	pushw	x
 443  00bc 89            	pushw	x
 444       00000002      OFST:	set	2
 447                     ; 86 	if(!RESET_PULSE()) return 0;
 449  00bd cd0000        	call	_RESET_PULSE
 451  00c0 4d            	tnz	a
 452  00c1 2603          	jrne	L741
 455  00c3 4f            	clr	a
 457  00c4 2020          	jra	L04
 458  00c6               L741:
 459                     ; 87 	WRITE_BYTE(READ_ROM);
 461  00c6 a633          	ld	a,#51
 462  00c8 cd003a        	call	_WRITE_BYTE
 464                     ; 88 	for(i=0;i<8;i++)
 466  00cb 5f            	clrw	x
 467  00cc 1f01          	ldw	(OFST-1,sp),x
 468  00ce               L151:
 469                     ; 90 		ROM_ID[i] = READ_BYTE();
 471  00ce adae          	call	_READ_BYTE
 473  00d0 1e03          	ldw	x,(OFST+1,sp)
 474  00d2 72fb01        	addw	x,(OFST-1,sp)
 475  00d5 f7            	ld	(x),a
 476                     ; 88 	for(i=0;i<8;i++)
 478  00d6 1e01          	ldw	x,(OFST-1,sp)
 479  00d8 1c0001        	addw	x,#1
 480  00db 1f01          	ldw	(OFST-1,sp),x
 483  00dd 1e01          	ldw	x,(OFST-1,sp)
 484  00df a30008        	cpw	x,#8
 485  00e2 25ea          	jrult	L151
 486                     ; 92 	return 1;
 488  00e4 a601          	ld	a,#1
 490  00e6               L04:
 492  00e6 5b04          	addw	sp,#4
 493  00e8 81            	ret
 528                     ; 95 void pause(void)
 528                     ; 96 {
 529                     	switch	.text
 530  00e9               _pause:
 532  00e9 89            	pushw	x
 533       00000002      OFST:	set	2
 536                     ; 98 	for(i=0;i<30000;i++) _asm("nop");
 538  00ea 5f            	clrw	x
 539  00eb 1f01          	ldw	(OFST-1,sp),x
 540  00ed               L571:
 544  00ed 9d            nop
 548  00ee 1e01          	ldw	x,(OFST-1,sp)
 549  00f0 1c0001        	addw	x,#1
 550  00f3 1f01          	ldw	(OFST-1,sp),x
 553  00f5 1e01          	ldw	x,(OFST-1,sp)
 554  00f7 a37530        	cpw	x,#30000
 555  00fa 25f1          	jrult	L571
 556                     ; 99 }
 559  00fc 85            	popw	x
 560  00fd 81            	ret
 589                     ; 101 void setup(void)
 589                     ; 102 {
 590                     	switch	.text
 591  00fe               _setup:
 595                     ; 103 	GPIO_Init(GPIOD, GPIO_PIN_0,GPIO_MODE_OUT_OD_LOW_SLOW);
 597  00fe 4b80          	push	#128
 598  0100 4b01          	push	#1
 599  0102 ae500f        	ldw	x,#20495
 600  0105 cd0000        	call	_GPIO_Init
 602  0108 85            	popw	x
 603                     ; 104 	GPIO_Init(GPIOB, GPIO_PIN_6,GPIO_MODE_IN_FL_NO_IT);
 605  0109 4b00          	push	#0
 606  010b 4b40          	push	#64
 607  010d ae5005        	ldw	x,#20485
 608  0110 cd0000        	call	_GPIO_Init
 610  0113 85            	popw	x
 611                     ; 105 	check = RESET_PULSE();
 613  0114 cd0000        	call	_RESET_PULSE
 615  0117 b700          	ld	_check,a
 616                     ; 106 	sukces = READ_ID(ROM_ID);
 618  0119 ae0001        	ldw	x,#_ROM_ID
 619  011c ad9d          	call	_READ_ID
 621  011e b700          	ld	_sukces,a
 622                     ; 107 }
 625  0120 81            	ret
 652                     ; 109 main()
 652                     ; 110 {
 653                     	switch	.text
 654  0121               _main:
 658                     ; 111 	setup();
 660  0121 addb          	call	_setup
 662  0123               L322:
 663                     ; 114 		pause();
 665  0123 adc4          	call	_pause
 667                     ; 115 		GPIO_WriteHigh(GPIOD,GPIO_PIN_0);
 669  0125 4b01          	push	#1
 670  0127 ae500f        	ldw	x,#20495
 671  012a cd0000        	call	_GPIO_WriteHigh
 673  012d 84            	pop	a
 674                     ; 116 		pause();
 676  012e adb9          	call	_pause
 678                     ; 117 		GPIO_WriteLow(GPIOD,GPIO_PIN_0);
 680  0130 4b01          	push	#1
 681  0132 ae500f        	ldw	x,#20495
 682  0135 cd0000        	call	_GPIO_WriteLow
 684  0138 84            	pop	a
 686  0139 20e8          	jra	L322
 729                     	xdef	_main
 730                     	xdef	_setup
 731                     	xdef	_pause
 732                     	xdef	_READ_ID
 733                     	xdef	_READ_BYTE
 734                     	xdef	_WRITE_BYTE
 735                     	xdef	_RESET_PULSE
 736                     	switch	.ubsct
 737  0000               _sukces:
 738  0000 00            	ds.b	1
 739                     	xdef	_sukces
 740  0001               _ROM_ID:
 741  0001 000000000000  	ds.b	8
 742                     	xdef	_ROM_ID
 743                     	xdef	_check
 744                     	xref	_GPIO_WriteLow
 745                     	xref	_GPIO_WriteHigh
 746                     	xref	_GPIO_Init
 766                     	end
