   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  43                     ; 52 void TIM2_DeInit(void)
  43                     ; 53 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  55  0004 725f5301      	clr	21249
  56                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  58  0008 725f5303      	clr	21251
  59                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  61  000c 725f5308      	clr	21256
  62                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  64  0010 725f5309      	clr	21257
  65                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  0014 725f5308      	clr	21256
  68                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0018 725f5309      	clr	21257
  71                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5305      	clr	21253
  74                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5306      	clr	21254
  77                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5307      	clr	21255
  80                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530a      	clr	21258
  83                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530b      	clr	21259
  86                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530c      	clr	21260
  89                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530d      	mov	21261,#255
  92                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff530e      	mov	21262,#255
  95                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f530f      	clr	21263
  98                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5310      	clr	21264
 101                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5311      	clr	21265
 104                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5312      	clr	21266
 107                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5313      	clr	21267
 110                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5314      	clr	21268
 113                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 115  0054 725f5302      	clr	21250
 116                     ; 81 }
 119  0058 81            	ret
 287                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 287                     ; 90                         uint16_t TIM2_Period)
 287                     ; 91 {
 288                     	switch	.text
 289  0059               _TIM2_TimeBaseInit:
 291  0059 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 297  005a c7530c        	ld	21260,a
 298                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 300  005d 7b04          	ld	a,(OFST+4,sp)
 301  005f c7530d        	ld	21261,a
 302                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 304  0062 7b05          	ld	a,(OFST+5,sp)
 305  0064 c7530e        	ld	21262,a
 306                     ; 97 }
 309  0067 84            	pop	a
 310  0068 81            	ret
 467                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 467                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 467                     ; 110                   uint16_t TIM2_Pulse,
 467                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 467                     ; 112 {
 468                     	switch	.text
 469  0069               _TIM2_OC1Init:
 471  0069 89            	pushw	x
 472  006a 88            	push	a
 473       00000001      OFST:	set	1
 476                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 478                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 480                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 482                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 484  006b c65308        	ld	a,21256
 485  006e a4fc          	and	a,#252
 486  0070 c75308        	ld	21256,a
 487                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 487                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 489  0073 7b08          	ld	a,(OFST+7,sp)
 490  0075 a402          	and	a,#2
 491  0077 6b01          	ld	(OFST+0,sp),a
 492  0079 9f            	ld	a,xl
 493  007a a401          	and	a,#1
 494  007c 1a01          	or	a,(OFST+0,sp)
 495  007e ca5308        	or	a,21256
 496  0081 c75308        	ld	21256,a
 497                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 497                     ; 126                           (uint8_t)TIM2_OCMode);
 499  0084 c65305        	ld	a,21253
 500  0087 a48f          	and	a,#143
 501  0089 1a02          	or	a,(OFST+1,sp)
 502  008b c75305        	ld	21253,a
 503                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 505  008e 7b06          	ld	a,(OFST+5,sp)
 506  0090 c7530f        	ld	21263,a
 507                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 509  0093 7b07          	ld	a,(OFST+6,sp)
 510  0095 c75310        	ld	21264,a
 511                     ; 131 }
 514  0098 5b03          	addw	sp,#3
 515  009a 81            	ret
 579                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 579                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 579                     ; 144                   uint16_t TIM2_Pulse,
 579                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 579                     ; 146 {
 580                     	switch	.text
 581  009b               _TIM2_OC2Init:
 583  009b 89            	pushw	x
 584  009c 88            	push	a
 585       00000001      OFST:	set	1
 588                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 590                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 592                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 594                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 596  009d c65308        	ld	a,21256
 597  00a0 a4cf          	and	a,#207
 598  00a2 c75308        	ld	21256,a
 599                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 599                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 601  00a5 7b08          	ld	a,(OFST+7,sp)
 602  00a7 a420          	and	a,#32
 603  00a9 6b01          	ld	(OFST+0,sp),a
 604  00ab 9f            	ld	a,xl
 605  00ac a410          	and	a,#16
 606  00ae 1a01          	or	a,(OFST+0,sp)
 607  00b0 ca5308        	or	a,21256
 608  00b3 c75308        	ld	21256,a
 609                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 609                     ; 162                           (uint8_t)TIM2_OCMode);
 611  00b6 c65306        	ld	a,21254
 612  00b9 a48f          	and	a,#143
 613  00bb 1a02          	or	a,(OFST+1,sp)
 614  00bd c75306        	ld	21254,a
 615                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 617  00c0 7b06          	ld	a,(OFST+5,sp)
 618  00c2 c75311        	ld	21265,a
 619                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 621  00c5 7b07          	ld	a,(OFST+6,sp)
 622  00c7 c75312        	ld	21266,a
 623                     ; 168 }
 626  00ca 5b03          	addw	sp,#3
 627  00cc 81            	ret
 691                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 691                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 691                     ; 181                   uint16_t TIM2_Pulse,
 691                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 691                     ; 183 {
 692                     	switch	.text
 693  00cd               _TIM2_OC3Init:
 695  00cd 89            	pushw	x
 696  00ce 88            	push	a
 697       00000001      OFST:	set	1
 700                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 702                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 704                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 706                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 708  00cf c65309        	ld	a,21257
 709  00d2 a4fc          	and	a,#252
 710  00d4 c75309        	ld	21257,a
 711                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 711                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 713  00d7 7b08          	ld	a,(OFST+7,sp)
 714  00d9 a402          	and	a,#2
 715  00db 6b01          	ld	(OFST+0,sp),a
 716  00dd 9f            	ld	a,xl
 717  00de a401          	and	a,#1
 718  00e0 1a01          	or	a,(OFST+0,sp)
 719  00e2 ca5309        	or	a,21257
 720  00e5 c75309        	ld	21257,a
 721                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 721                     ; 196                           (uint8_t)TIM2_OCMode);
 723  00e8 c65307        	ld	a,21255
 724  00eb a48f          	and	a,#143
 725  00ed 1a02          	or	a,(OFST+1,sp)
 726  00ef c75307        	ld	21255,a
 727                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 729  00f2 7b06          	ld	a,(OFST+5,sp)
 730  00f4 c75313        	ld	21267,a
 731                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 733  00f7 7b07          	ld	a,(OFST+6,sp)
 734  00f9 c75314        	ld	21268,a
 735                     ; 201 }
 738  00fc 5b03          	addw	sp,#3
 739  00fe 81            	ret
 932                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 932                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 932                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 932                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 932                     ; 216                  uint8_t TIM2_ICFilter)
 932                     ; 217 {
 933                     	switch	.text
 934  00ff               _TIM2_ICInit:
 936  00ff 89            	pushw	x
 937       00000000      OFST:	set	0
 940                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 942                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 944                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 946                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 948                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 950                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 952  0100 9e            	ld	a,xh
 953  0101 4d            	tnz	a
 954  0102 2614          	jrne	L104
 955                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 955                     ; 229                (uint8_t)TIM2_ICSelection,
 955                     ; 230                (uint8_t)TIM2_ICFilter);
 957  0104 7b07          	ld	a,(OFST+7,sp)
 958  0106 88            	push	a
 959  0107 7b06          	ld	a,(OFST+6,sp)
 960  0109 97            	ld	xl,a
 961  010a 7b03          	ld	a,(OFST+3,sp)
 962  010c 95            	ld	xh,a
 963  010d cd044a        	call	L3_TI1_Config
 965  0110 84            	pop	a
 966                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 968  0111 7b06          	ld	a,(OFST+6,sp)
 969  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 972  0116 202c          	jra	L304
 973  0118               L104:
 974                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 976  0118 7b01          	ld	a,(OFST+1,sp)
 977  011a a101          	cp	a,#1
 978  011c 2614          	jrne	L504
 979                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 979                     ; 239                (uint8_t)TIM2_ICSelection,
 979                     ; 240                (uint8_t)TIM2_ICFilter);
 981  011e 7b07          	ld	a,(OFST+7,sp)
 982  0120 88            	push	a
 983  0121 7b06          	ld	a,(OFST+6,sp)
 984  0123 97            	ld	xl,a
 985  0124 7b03          	ld	a,(OFST+3,sp)
 986  0126 95            	ld	xh,a
 987  0127 cd047a        	call	L5_TI2_Config
 989  012a 84            	pop	a
 990                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 992  012b 7b06          	ld	a,(OFST+6,sp)
 993  012d cd034d        	call	_TIM2_SetIC2Prescaler
 996  0130 2012          	jra	L304
 997  0132               L504:
 998                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 998                     ; 249                (uint8_t)TIM2_ICSelection,
 998                     ; 250                (uint8_t)TIM2_ICFilter);
1000  0132 7b07          	ld	a,(OFST+7,sp)
1001  0134 88            	push	a
1002  0135 7b06          	ld	a,(OFST+6,sp)
1003  0137 97            	ld	xl,a
1004  0138 7b03          	ld	a,(OFST+3,sp)
1005  013a 95            	ld	xh,a
1006  013b cd04aa        	call	L7_TI3_Config
1008  013e 84            	pop	a
1009                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1011  013f 7b06          	ld	a,(OFST+6,sp)
1012  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1014  0144               L304:
1015                     ; 255 }
1018  0144 85            	popw	x
1019  0145 81            	ret
1115                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1115                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1115                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1115                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1115                     ; 270                      uint8_t TIM2_ICFilter)
1115                     ; 271 {
1116                     	switch	.text
1117  0146               _TIM2_PWMIConfig:
1119  0146 89            	pushw	x
1120  0147 89            	pushw	x
1121       00000002      OFST:	set	2
1124                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1126                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1128                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1130                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1132                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1134                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1136                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1138  0148 9f            	ld	a,xl
1139  0149 a144          	cp	a,#68
1140  014b 2706          	jreq	L754
1141                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1143  014d a644          	ld	a,#68
1144  014f 6b01          	ld	(OFST-1,sp),a
1146  0151 2002          	jra	L164
1147  0153               L754:
1148                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1150  0153 0f01          	clr	(OFST-1,sp)
1151  0155               L164:
1152                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1154  0155 7b07          	ld	a,(OFST+5,sp)
1155  0157 a101          	cp	a,#1
1156  0159 2606          	jrne	L364
1157                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1159  015b a602          	ld	a,#2
1160  015d 6b02          	ld	(OFST+0,sp),a
1162  015f 2004          	jra	L564
1163  0161               L364:
1164                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1166  0161 a601          	ld	a,#1
1167  0163 6b02          	ld	(OFST+0,sp),a
1168  0165               L564:
1169                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1171  0165 0d03          	tnz	(OFST+1,sp)
1172  0167 2626          	jrne	L764
1173                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1173                     ; 305                (uint8_t)TIM2_ICFilter);
1175  0169 7b09          	ld	a,(OFST+7,sp)
1176  016b 88            	push	a
1177  016c 7b08          	ld	a,(OFST+6,sp)
1178  016e 97            	ld	xl,a
1179  016f 7b05          	ld	a,(OFST+3,sp)
1180  0171 95            	ld	xh,a
1181  0172 cd044a        	call	L3_TI1_Config
1183  0175 84            	pop	a
1184                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1186  0176 7b08          	ld	a,(OFST+6,sp)
1187  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1189                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1191  017b 7b09          	ld	a,(OFST+7,sp)
1192  017d 88            	push	a
1193  017e 7b03          	ld	a,(OFST+1,sp)
1194  0180 97            	ld	xl,a
1195  0181 7b02          	ld	a,(OFST+0,sp)
1196  0183 95            	ld	xh,a
1197  0184 cd047a        	call	L5_TI2_Config
1199  0187 84            	pop	a
1200                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1202  0188 7b08          	ld	a,(OFST+6,sp)
1203  018a cd034d        	call	_TIM2_SetIC2Prescaler
1206  018d 2024          	jra	L174
1207  018f               L764:
1208                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1208                     ; 320                (uint8_t)TIM2_ICFilter);
1210  018f 7b09          	ld	a,(OFST+7,sp)
1211  0191 88            	push	a
1212  0192 7b08          	ld	a,(OFST+6,sp)
1213  0194 97            	ld	xl,a
1214  0195 7b05          	ld	a,(OFST+3,sp)
1215  0197 95            	ld	xh,a
1216  0198 cd047a        	call	L5_TI2_Config
1218  019b 84            	pop	a
1219                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1221  019c 7b08          	ld	a,(OFST+6,sp)
1222  019e cd034d        	call	_TIM2_SetIC2Prescaler
1224                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1226  01a1 7b09          	ld	a,(OFST+7,sp)
1227  01a3 88            	push	a
1228  01a4 7b03          	ld	a,(OFST+1,sp)
1229  01a6 97            	ld	xl,a
1230  01a7 7b02          	ld	a,(OFST+0,sp)
1231  01a9 95            	ld	xh,a
1232  01aa cd044a        	call	L3_TI1_Config
1234  01ad 84            	pop	a
1235                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1237  01ae 7b08          	ld	a,(OFST+6,sp)
1238  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1240  01b3               L174:
1241                     ; 331 }
1244  01b3 5b04          	addw	sp,#4
1245  01b5 81            	ret
1300                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1300                     ; 340 {
1301                     	switch	.text
1302  01b6               _TIM2_Cmd:
1306                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1308                     ; 345   if (NewState != DISABLE)
1310  01b6 4d            	tnz	a
1311  01b7 2706          	jreq	L125
1312                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1314  01b9 72105300      	bset	21248,#0
1316  01bd 2004          	jra	L325
1317  01bf               L125:
1318                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1320  01bf 72115300      	bres	21248,#0
1321  01c3               L325:
1322                     ; 353 }
1325  01c3 81            	ret
1404                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1404                     ; 369 {
1405                     	switch	.text
1406  01c4               _TIM2_ITConfig:
1408  01c4 89            	pushw	x
1409       00000000      OFST:	set	0
1412                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1414                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1416                     ; 374   if (NewState != DISABLE)
1418  01c5 9f            	ld	a,xl
1419  01c6 4d            	tnz	a
1420  01c7 2709          	jreq	L365
1421                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1423  01c9 9e            	ld	a,xh
1424  01ca ca5301        	or	a,21249
1425  01cd c75301        	ld	21249,a
1427  01d0 2009          	jra	L565
1428  01d2               L365:
1429                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1431  01d2 7b01          	ld	a,(OFST+1,sp)
1432  01d4 43            	cpl	a
1433  01d5 c45301        	and	a,21249
1434  01d8 c75301        	ld	21249,a
1435  01db               L565:
1436                     ; 384 }
1439  01db 85            	popw	x
1440  01dc 81            	ret
1476                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1476                     ; 393 {
1477                     	switch	.text
1478  01dd               _TIM2_UpdateDisableConfig:
1482                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1484                     ; 398   if (NewState != DISABLE)
1486  01dd 4d            	tnz	a
1487  01de 2706          	jreq	L506
1488                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1490  01e0 72125300      	bset	21248,#1
1492  01e4 2004          	jra	L706
1493  01e6               L506:
1494                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1496  01e6 72135300      	bres	21248,#1
1497  01ea               L706:
1498                     ; 406 }
1501  01ea 81            	ret
1559                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1559                     ; 417 {
1560                     	switch	.text
1561  01eb               _TIM2_UpdateRequestConfig:
1565                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1567                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1569  01eb 4d            	tnz	a
1570  01ec 2706          	jreq	L736
1571                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1573  01ee 72145300      	bset	21248,#2
1575  01f2 2004          	jra	L146
1576  01f4               L736:
1577                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1579  01f4 72155300      	bres	21248,#2
1580  01f8               L146:
1581                     ; 430 }
1584  01f8 81            	ret
1641                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1641                     ; 441 {
1642                     	switch	.text
1643  01f9               _TIM2_SelectOnePulseMode:
1647                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1649                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1651  01f9 4d            	tnz	a
1652  01fa 2706          	jreq	L176
1653                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1655  01fc 72165300      	bset	21248,#3
1657  0200 2004          	jra	L376
1658  0202               L176:
1659                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1661  0202 72175300      	bres	21248,#3
1662  0206               L376:
1663                     ; 454 }
1666  0206 81            	ret
1734                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1734                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1734                     ; 486 {
1735                     	switch	.text
1736  0207               _TIM2_PrescalerConfig:
1740                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1742                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1744                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1746  0207 9e            	ld	a,xh
1747  0208 c7530c        	ld	21260,a
1748                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1750  020b 9f            	ld	a,xl
1751  020c c75304        	ld	21252,a
1752                     ; 496 }
1755  020f 81            	ret
1813                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1813                     ; 508 {
1814                     	switch	.text
1815  0210               _TIM2_ForcedOC1Config:
1817  0210 88            	push	a
1818       00000000      OFST:	set	0
1821                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1823                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1823                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1825  0211 c65305        	ld	a,21253
1826  0214 a48f          	and	a,#143
1827  0216 1a01          	or	a,(OFST+1,sp)
1828  0218 c75305        	ld	21253,a
1829                     ; 515 }
1832  021b 84            	pop	a
1833  021c 81            	ret
1869                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1869                     ; 527 {
1870                     	switch	.text
1871  021d               _TIM2_ForcedOC2Config:
1873  021d 88            	push	a
1874       00000000      OFST:	set	0
1877                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1879                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1879                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1881  021e c65306        	ld	a,21254
1882  0221 a48f          	and	a,#143
1883  0223 1a01          	or	a,(OFST+1,sp)
1884  0225 c75306        	ld	21254,a
1885                     ; 534 }
1888  0228 84            	pop	a
1889  0229 81            	ret
1925                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1925                     ; 546 {
1926                     	switch	.text
1927  022a               _TIM2_ForcedOC3Config:
1929  022a 88            	push	a
1930       00000000      OFST:	set	0
1933                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1935                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1935                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1937  022b c65307        	ld	a,21255
1938  022e a48f          	and	a,#143
1939  0230 1a01          	or	a,(OFST+1,sp)
1940  0232 c75307        	ld	21255,a
1941                     ; 553 }
1944  0235 84            	pop	a
1945  0236 81            	ret
1981                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1981                     ; 562 {
1982                     	switch	.text
1983  0237               _TIM2_ARRPreloadConfig:
1987                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1989                     ; 567   if (NewState != DISABLE)
1991  0237 4d            	tnz	a
1992  0238 2706          	jreq	L7201
1993                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1995  023a 721e5300      	bset	21248,#7
1997  023e 2004          	jra	L1301
1998  0240               L7201:
1999                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2001  0240 721f5300      	bres	21248,#7
2002  0244               L1301:
2003                     ; 575 }
2006  0244 81            	ret
2042                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2042                     ; 584 {
2043                     	switch	.text
2044  0245               _TIM2_OC1PreloadConfig:
2048                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2050                     ; 589   if (NewState != DISABLE)
2052  0245 4d            	tnz	a
2053  0246 2706          	jreq	L1501
2054                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2056  0248 72165305      	bset	21253,#3
2058  024c 2004          	jra	L3501
2059  024e               L1501:
2060                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2062  024e 72175305      	bres	21253,#3
2063  0252               L3501:
2064                     ; 597 }
2067  0252 81            	ret
2103                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2103                     ; 606 {
2104                     	switch	.text
2105  0253               _TIM2_OC2PreloadConfig:
2109                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2111                     ; 611   if (NewState != DISABLE)
2113  0253 4d            	tnz	a
2114  0254 2706          	jreq	L3701
2115                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2117  0256 72165306      	bset	21254,#3
2119  025a 2004          	jra	L5701
2120  025c               L3701:
2121                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2123  025c 72175306      	bres	21254,#3
2124  0260               L5701:
2125                     ; 619 }
2128  0260 81            	ret
2164                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2164                     ; 628 {
2165                     	switch	.text
2166  0261               _TIM2_OC3PreloadConfig:
2170                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2172                     ; 633   if (NewState != DISABLE)
2174  0261 4d            	tnz	a
2175  0262 2706          	jreq	L5111
2176                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2178  0264 72165307      	bset	21255,#3
2180  0268 2004          	jra	L7111
2181  026a               L5111:
2182                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2184  026a 72175307      	bres	21255,#3
2185  026e               L7111:
2186                     ; 641 }
2189  026e 81            	ret
2262                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2262                     ; 654 {
2263                     	switch	.text
2264  026f               _TIM2_GenerateEvent:
2268                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2270                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2272  026f c75304        	ld	21252,a
2273                     ; 660 }
2276  0272 81            	ret
2312                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2312                     ; 671 {
2313                     	switch	.text
2314  0273               _TIM2_OC1PolarityConfig:
2318                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2320                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2322  0273 4d            	tnz	a
2323  0274 2706          	jreq	L1711
2324                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2326  0276 72125308      	bset	21256,#1
2328  027a 2004          	jra	L3711
2329  027c               L1711:
2330                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2332  027c 72135308      	bres	21256,#1
2333  0280               L3711:
2334                     ; 684 }
2337  0280 81            	ret
2373                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2373                     ; 695 {
2374                     	switch	.text
2375  0281               _TIM2_OC2PolarityConfig:
2379                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2381                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2383  0281 4d            	tnz	a
2384  0282 2706          	jreq	L3121
2385                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2387  0284 721a5308      	bset	21256,#5
2389  0288 2004          	jra	L5121
2390  028a               L3121:
2391                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2393  028a 721b5308      	bres	21256,#5
2394  028e               L5121:
2395                     ; 708 }
2398  028e 81            	ret
2434                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2434                     ; 719 {
2435                     	switch	.text
2436  028f               _TIM2_OC3PolarityConfig:
2440                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2442                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2444  028f 4d            	tnz	a
2445  0290 2706          	jreq	L5321
2446                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2448  0292 72125309      	bset	21257,#1
2450  0296 2004          	jra	L7321
2451  0298               L5321:
2452                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2454  0298 72135309      	bres	21257,#1
2455  029c               L7321:
2456                     ; 732 }
2459  029c 81            	ret
2504                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2504                     ; 746 {
2505                     	switch	.text
2506  029d               _TIM2_CCxCmd:
2508  029d 89            	pushw	x
2509       00000000      OFST:	set	0
2512                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2514                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2516                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2518  029e 9e            	ld	a,xh
2519  029f 4d            	tnz	a
2520  02a0 2610          	jrne	L3621
2521                     ; 754     if (NewState != DISABLE)
2523  02a2 9f            	ld	a,xl
2524  02a3 4d            	tnz	a
2525  02a4 2706          	jreq	L5621
2526                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2528  02a6 72105308      	bset	21256,#0
2530  02aa 202a          	jra	L1721
2531  02ac               L5621:
2532                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2534  02ac 72115308      	bres	21256,#0
2535  02b0 2024          	jra	L1721
2536  02b2               L3621:
2537                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2539  02b2 7b01          	ld	a,(OFST+1,sp)
2540  02b4 a101          	cp	a,#1
2541  02b6 2610          	jrne	L3721
2542                     ; 767     if (NewState != DISABLE)
2544  02b8 0d02          	tnz	(OFST+2,sp)
2545  02ba 2706          	jreq	L5721
2546                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2548  02bc 72185308      	bset	21256,#4
2550  02c0 2014          	jra	L1721
2551  02c2               L5721:
2552                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2554  02c2 72195308      	bres	21256,#4
2555  02c6 200e          	jra	L1721
2556  02c8               L3721:
2557                     ; 779     if (NewState != DISABLE)
2559  02c8 0d02          	tnz	(OFST+2,sp)
2560  02ca 2706          	jreq	L3031
2561                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2563  02cc 72105309      	bset	21257,#0
2565  02d0 2004          	jra	L1721
2566  02d2               L3031:
2567                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2569  02d2 72115309      	bres	21257,#0
2570  02d6               L1721:
2571                     ; 788 }
2574  02d6 85            	popw	x
2575  02d7 81            	ret
2620                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2620                     ; 811 {
2621                     	switch	.text
2622  02d8               _TIM2_SelectOCxM:
2624  02d8 89            	pushw	x
2625       00000000      OFST:	set	0
2628                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2630                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2632                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2634  02d9 9e            	ld	a,xh
2635  02da 4d            	tnz	a
2636  02db 2610          	jrne	L1331
2637                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2639  02dd 72115308      	bres	21256,#0
2640                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2640                     ; 823                             | (uint8_t)TIM2_OCMode);
2642  02e1 c65305        	ld	a,21253
2643  02e4 a48f          	and	a,#143
2644  02e6 1a02          	or	a,(OFST+2,sp)
2645  02e8 c75305        	ld	21253,a
2647  02eb 2024          	jra	L3331
2648  02ed               L1331:
2649                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2651  02ed 7b01          	ld	a,(OFST+1,sp)
2652  02ef a101          	cp	a,#1
2653  02f1 2610          	jrne	L5331
2654                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2656  02f3 72195308      	bres	21256,#4
2657                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2657                     ; 832                             | (uint8_t)TIM2_OCMode);
2659  02f7 c65306        	ld	a,21254
2660  02fa a48f          	and	a,#143
2661  02fc 1a02          	or	a,(OFST+2,sp)
2662  02fe c75306        	ld	21254,a
2664  0301 200e          	jra	L3331
2665  0303               L5331:
2666                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2668  0303 72115309      	bres	21257,#0
2669                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2669                     ; 841                             | (uint8_t)TIM2_OCMode);
2671  0307 c65307        	ld	a,21255
2672  030a a48f          	and	a,#143
2673  030c 1a02          	or	a,(OFST+2,sp)
2674  030e c75307        	ld	21255,a
2675  0311               L3331:
2676                     ; 843 }
2679  0311 85            	popw	x
2680  0312 81            	ret
2714                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2714                     ; 852 {
2715                     	switch	.text
2716  0313               _TIM2_SetCounter:
2720                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2722  0313 9e            	ld	a,xh
2723  0314 c7530a        	ld	21258,a
2724                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2726  0317 9f            	ld	a,xl
2727  0318 c7530b        	ld	21259,a
2728                     ; 856 }
2731  031b 81            	ret
2765                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2765                     ; 865 {
2766                     	switch	.text
2767  031c               _TIM2_SetAutoreload:
2771                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2773  031c 9e            	ld	a,xh
2774  031d c7530d        	ld	21261,a
2775                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2777  0320 9f            	ld	a,xl
2778  0321 c7530e        	ld	21262,a
2779                     ; 869 }
2782  0324 81            	ret
2816                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2816                     ; 878 {
2817                     	switch	.text
2818  0325               _TIM2_SetCompare1:
2822                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2824  0325 9e            	ld	a,xh
2825  0326 c7530f        	ld	21263,a
2826                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2828  0329 9f            	ld	a,xl
2829  032a c75310        	ld	21264,a
2830                     ; 882 }
2833  032d 81            	ret
2867                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2867                     ; 891 {
2868                     	switch	.text
2869  032e               _TIM2_SetCompare2:
2873                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2875  032e 9e            	ld	a,xh
2876  032f c75311        	ld	21265,a
2877                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2879  0332 9f            	ld	a,xl
2880  0333 c75312        	ld	21266,a
2881                     ; 895 }
2884  0336 81            	ret
2918                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2918                     ; 904 {
2919                     	switch	.text
2920  0337               _TIM2_SetCompare3:
2924                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2926  0337 9e            	ld	a,xh
2927  0338 c75313        	ld	21267,a
2928                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2930  033b 9f            	ld	a,xl
2931  033c c75314        	ld	21268,a
2932                     ; 908 }
2935  033f 81            	ret
2971                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2971                     ; 921 {
2972                     	switch	.text
2973  0340               _TIM2_SetIC1Prescaler:
2975  0340 88            	push	a
2976       00000000      OFST:	set	0
2979                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2981                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2981                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2983  0341 c65305        	ld	a,21253
2984  0344 a4f3          	and	a,#243
2985  0346 1a01          	or	a,(OFST+1,sp)
2986  0348 c75305        	ld	21253,a
2987                     ; 928 }
2990  034b 84            	pop	a
2991  034c 81            	ret
3027                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3027                     ; 941 {
3028                     	switch	.text
3029  034d               _TIM2_SetIC2Prescaler:
3031  034d 88            	push	a
3032       00000000      OFST:	set	0
3035                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3037                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3037                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3039  034e c65306        	ld	a,21254
3040  0351 a4f3          	and	a,#243
3041  0353 1a01          	or	a,(OFST+1,sp)
3042  0355 c75306        	ld	21254,a
3043                     ; 948 }
3046  0358 84            	pop	a
3047  0359 81            	ret
3083                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3083                     ; 961 {
3084                     	switch	.text
3085  035a               _TIM2_SetIC3Prescaler:
3087  035a 88            	push	a
3088       00000000      OFST:	set	0
3091                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3093                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3093                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3095  035b c65307        	ld	a,21255
3096  035e a4f3          	and	a,#243
3097  0360 1a01          	or	a,(OFST+1,sp)
3098  0362 c75307        	ld	21255,a
3099                     ; 968 }
3102  0365 84            	pop	a
3103  0366 81            	ret
3155                     ; 975 uint16_t TIM2_GetCapture1(void)
3155                     ; 976 {
3156                     	switch	.text
3157  0367               _TIM2_GetCapture1:
3159  0367 5204          	subw	sp,#4
3160       00000004      OFST:	set	4
3163                     ; 978   uint16_t tmpccr1 = 0;
3165                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3169                     ; 981   tmpccr1h = TIM2->CCR1H;
3171  0369 c6530f        	ld	a,21263
3172  036c 6b02          	ld	(OFST-2,sp),a
3173                     ; 982   tmpccr1l = TIM2->CCR1L;
3175  036e c65310        	ld	a,21264
3176  0371 6b01          	ld	(OFST-3,sp),a
3177                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3179  0373 7b01          	ld	a,(OFST-3,sp)
3180  0375 5f            	clrw	x
3181  0376 97            	ld	xl,a
3182  0377 1f03          	ldw	(OFST-1,sp),x
3183                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3185  0379 7b02          	ld	a,(OFST-2,sp)
3186  037b 5f            	clrw	x
3187  037c 97            	ld	xl,a
3188  037d 4f            	clr	a
3189  037e 02            	rlwa	x,a
3190  037f 01            	rrwa	x,a
3191  0380 1a04          	or	a,(OFST+0,sp)
3192  0382 01            	rrwa	x,a
3193  0383 1a03          	or	a,(OFST-1,sp)
3194  0385 01            	rrwa	x,a
3195  0386 1f03          	ldw	(OFST-1,sp),x
3196                     ; 987   return (uint16_t)tmpccr1;
3198  0388 1e03          	ldw	x,(OFST-1,sp)
3201  038a 5b04          	addw	sp,#4
3202  038c 81            	ret
3254                     ; 995 uint16_t TIM2_GetCapture2(void)
3254                     ; 996 {
3255                     	switch	.text
3256  038d               _TIM2_GetCapture2:
3258  038d 5204          	subw	sp,#4
3259       00000004      OFST:	set	4
3262                     ; 998   uint16_t tmpccr2 = 0;
3264                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3268                     ; 1001   tmpccr2h = TIM2->CCR2H;
3270  038f c65311        	ld	a,21265
3271  0392 6b02          	ld	(OFST-2,sp),a
3272                     ; 1002   tmpccr2l = TIM2->CCR2L;
3274  0394 c65312        	ld	a,21266
3275  0397 6b01          	ld	(OFST-3,sp),a
3276                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3278  0399 7b01          	ld	a,(OFST-3,sp)
3279  039b 5f            	clrw	x
3280  039c 97            	ld	xl,a
3281  039d 1f03          	ldw	(OFST-1,sp),x
3282                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3284  039f 7b02          	ld	a,(OFST-2,sp)
3285  03a1 5f            	clrw	x
3286  03a2 97            	ld	xl,a
3287  03a3 4f            	clr	a
3288  03a4 02            	rlwa	x,a
3289  03a5 01            	rrwa	x,a
3290  03a6 1a04          	or	a,(OFST+0,sp)
3291  03a8 01            	rrwa	x,a
3292  03a9 1a03          	or	a,(OFST-1,sp)
3293  03ab 01            	rrwa	x,a
3294  03ac 1f03          	ldw	(OFST-1,sp),x
3295                     ; 1007   return (uint16_t)tmpccr2;
3297  03ae 1e03          	ldw	x,(OFST-1,sp)
3300  03b0 5b04          	addw	sp,#4
3301  03b2 81            	ret
3353                     ; 1015 uint16_t TIM2_GetCapture3(void)
3353                     ; 1016 {
3354                     	switch	.text
3355  03b3               _TIM2_GetCapture3:
3357  03b3 5204          	subw	sp,#4
3358       00000004      OFST:	set	4
3361                     ; 1018   uint16_t tmpccr3 = 0;
3363                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3367                     ; 1021   tmpccr3h = TIM2->CCR3H;
3369  03b5 c65313        	ld	a,21267
3370  03b8 6b02          	ld	(OFST-2,sp),a
3371                     ; 1022   tmpccr3l = TIM2->CCR3L;
3373  03ba c65314        	ld	a,21268
3374  03bd 6b01          	ld	(OFST-3,sp),a
3375                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3377  03bf 7b01          	ld	a,(OFST-3,sp)
3378  03c1 5f            	clrw	x
3379  03c2 97            	ld	xl,a
3380  03c3 1f03          	ldw	(OFST-1,sp),x
3381                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3383  03c5 7b02          	ld	a,(OFST-2,sp)
3384  03c7 5f            	clrw	x
3385  03c8 97            	ld	xl,a
3386  03c9 4f            	clr	a
3387  03ca 02            	rlwa	x,a
3388  03cb 01            	rrwa	x,a
3389  03cc 1a04          	or	a,(OFST+0,sp)
3390  03ce 01            	rrwa	x,a
3391  03cf 1a03          	or	a,(OFST-1,sp)
3392  03d1 01            	rrwa	x,a
3393  03d2 1f03          	ldw	(OFST-1,sp),x
3394                     ; 1027   return (uint16_t)tmpccr3;
3396  03d4 1e03          	ldw	x,(OFST-1,sp)
3399  03d6 5b04          	addw	sp,#4
3400  03d8 81            	ret
3434                     ; 1035 uint16_t TIM2_GetCounter(void)
3434                     ; 1036 {
3435                     	switch	.text
3436  03d9               _TIM2_GetCounter:
3438  03d9 89            	pushw	x
3439       00000002      OFST:	set	2
3442                     ; 1037   uint16_t tmpcntr = 0;
3444                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3446  03da c6530a        	ld	a,21258
3447  03dd 5f            	clrw	x
3448  03de 97            	ld	xl,a
3449  03df 4f            	clr	a
3450  03e0 02            	rlwa	x,a
3451  03e1 1f01          	ldw	(OFST-1,sp),x
3452                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3454  03e3 c6530b        	ld	a,21259
3455  03e6 5f            	clrw	x
3456  03e7 97            	ld	xl,a
3457  03e8 01            	rrwa	x,a
3458  03e9 1a02          	or	a,(OFST+0,sp)
3459  03eb 01            	rrwa	x,a
3460  03ec 1a01          	or	a,(OFST-1,sp)
3461  03ee 01            	rrwa	x,a
3464  03ef 5b02          	addw	sp,#2
3465  03f1 81            	ret
3489                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3489                     ; 1050 {
3490                     	switch	.text
3491  03f2               _TIM2_GetPrescaler:
3495                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3497  03f2 c6530c        	ld	a,21260
3500  03f5 81            	ret
3639                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3639                     ; 1069 {
3640                     	switch	.text
3641  03f6               _TIM2_GetFlagStatus:
3643  03f6 89            	pushw	x
3644  03f7 89            	pushw	x
3645       00000002      OFST:	set	2
3648                     ; 1070   FlagStatus bitstatus = RESET;
3650                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3654                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3656                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3658  03f8 9f            	ld	a,xl
3659  03f9 c45302        	and	a,21250
3660  03fc 6b01          	ld	(OFST-1,sp),a
3661                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3663  03fe 7b03          	ld	a,(OFST+1,sp)
3664  0400 6b02          	ld	(OFST+0,sp),a
3665                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3667  0402 c65303        	ld	a,21251
3668  0405 1402          	and	a,(OFST+0,sp)
3669  0407 1a01          	or	a,(OFST-1,sp)
3670  0409 2706          	jreq	L5371
3671                     ; 1081     bitstatus = SET;
3673  040b a601          	ld	a,#1
3674  040d 6b02          	ld	(OFST+0,sp),a
3676  040f 2002          	jra	L7371
3677  0411               L5371:
3678                     ; 1085     bitstatus = RESET;
3680  0411 0f02          	clr	(OFST+0,sp)
3681  0413               L7371:
3682                     ; 1087   return (FlagStatus)bitstatus;
3684  0413 7b02          	ld	a,(OFST+0,sp)
3687  0415 5b04          	addw	sp,#4
3688  0417 81            	ret
3723                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3723                     ; 1104 {
3724                     	switch	.text
3725  0418               _TIM2_ClearFlag:
3729                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3731                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3733  0418 9f            	ld	a,xl
3734  0419 43            	cpl	a
3735  041a c75302        	ld	21250,a
3736                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3738  041d 35ff5303      	mov	21251,#255
3739                     ; 1111 }
3742  0421 81            	ret
3806                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3806                     ; 1124 {
3807                     	switch	.text
3808  0422               _TIM2_GetITStatus:
3810  0422 88            	push	a
3811  0423 89            	pushw	x
3812       00000002      OFST:	set	2
3815                     ; 1125   ITStatus bitstatus = RESET;
3817                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3821                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3823                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3825  0424 c45302        	and	a,21250
3826  0427 6b01          	ld	(OFST-1,sp),a
3827                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3829  0429 c65301        	ld	a,21249
3830  042c 1403          	and	a,(OFST+1,sp)
3831  042e 6b02          	ld	(OFST+0,sp),a
3832                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3834  0430 0d01          	tnz	(OFST-1,sp)
3835  0432 270a          	jreq	L1102
3837  0434 0d02          	tnz	(OFST+0,sp)
3838  0436 2706          	jreq	L1102
3839                     ; 1137     bitstatus = SET;
3841  0438 a601          	ld	a,#1
3842  043a 6b02          	ld	(OFST+0,sp),a
3844  043c 2002          	jra	L3102
3845  043e               L1102:
3846                     ; 1141     bitstatus = RESET;
3848  043e 0f02          	clr	(OFST+0,sp)
3849  0440               L3102:
3850                     ; 1143   return (ITStatus)(bitstatus);
3852  0440 7b02          	ld	a,(OFST+0,sp)
3855  0442 5b03          	addw	sp,#3
3856  0444 81            	ret
3892                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3892                     ; 1157 {
3893                     	switch	.text
3894  0445               _TIM2_ClearITPendingBit:
3898                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3900                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3902  0445 43            	cpl	a
3903  0446 c75302        	ld	21250,a
3904                     ; 1163 }
3907  0449 81            	ret
3959                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3959                     ; 1182                        uint8_t TIM2_ICSelection,
3959                     ; 1183                        uint8_t TIM2_ICFilter)
3959                     ; 1184 {
3960                     	switch	.text
3961  044a               L3_TI1_Config:
3963  044a 89            	pushw	x
3964  044b 88            	push	a
3965       00000001      OFST:	set	1
3968                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3970  044c 72115308      	bres	21256,#0
3971                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3971                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3973  0450 7b06          	ld	a,(OFST+5,sp)
3974  0452 97            	ld	xl,a
3975  0453 a610          	ld	a,#16
3976  0455 42            	mul	x,a
3977  0456 9f            	ld	a,xl
3978  0457 1a03          	or	a,(OFST+2,sp)
3979  0459 6b01          	ld	(OFST+0,sp),a
3980  045b c65305        	ld	a,21253
3981  045e a40c          	and	a,#12
3982  0460 1a01          	or	a,(OFST+0,sp)
3983  0462 c75305        	ld	21253,a
3984                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3986  0465 0d02          	tnz	(OFST+1,sp)
3987  0467 2706          	jreq	L1602
3988                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3990  0469 72125308      	bset	21256,#1
3992  046d 2004          	jra	L3602
3993  046f               L1602:
3994                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3996  046f 72135308      	bres	21256,#1
3997  0473               L3602:
3998                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4000  0473 72105308      	bset	21256,#0
4001                     ; 1203 }
4004  0477 5b03          	addw	sp,#3
4005  0479 81            	ret
4057                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4057                     ; 1222                        uint8_t TIM2_ICSelection,
4057                     ; 1223                        uint8_t TIM2_ICFilter)
4057                     ; 1224 {
4058                     	switch	.text
4059  047a               L5_TI2_Config:
4061  047a 89            	pushw	x
4062  047b 88            	push	a
4063       00000001      OFST:	set	1
4066                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4068  047c 72195308      	bres	21256,#4
4069                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4069                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4071  0480 7b06          	ld	a,(OFST+5,sp)
4072  0482 97            	ld	xl,a
4073  0483 a610          	ld	a,#16
4074  0485 42            	mul	x,a
4075  0486 9f            	ld	a,xl
4076  0487 1a03          	or	a,(OFST+2,sp)
4077  0489 6b01          	ld	(OFST+0,sp),a
4078  048b c65306        	ld	a,21254
4079  048e a40c          	and	a,#12
4080  0490 1a01          	or	a,(OFST+0,sp)
4081  0492 c75306        	ld	21254,a
4082                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4084  0495 0d02          	tnz	(OFST+1,sp)
4085  0497 2706          	jreq	L3112
4086                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4088  0499 721a5308      	bset	21256,#5
4090  049d 2004          	jra	L5112
4091  049f               L3112:
4092                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4094  049f 721b5308      	bres	21256,#5
4095  04a3               L5112:
4096                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4098  04a3 72185308      	bset	21256,#4
4099                     ; 1245 }
4102  04a7 5b03          	addw	sp,#3
4103  04a9 81            	ret
4155                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4155                     ; 1262                        uint8_t TIM2_ICFilter)
4155                     ; 1263 {
4156                     	switch	.text
4157  04aa               L7_TI3_Config:
4159  04aa 89            	pushw	x
4160  04ab 88            	push	a
4161       00000001      OFST:	set	1
4164                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4166  04ac 72115309      	bres	21257,#0
4167                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4167                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4169  04b0 7b06          	ld	a,(OFST+5,sp)
4170  04b2 97            	ld	xl,a
4171  04b3 a610          	ld	a,#16
4172  04b5 42            	mul	x,a
4173  04b6 9f            	ld	a,xl
4174  04b7 1a03          	or	a,(OFST+2,sp)
4175  04b9 6b01          	ld	(OFST+0,sp),a
4176  04bb c65307        	ld	a,21255
4177  04be a40c          	and	a,#12
4178  04c0 1a01          	or	a,(OFST+0,sp)
4179  04c2 c75307        	ld	21255,a
4180                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4182  04c5 0d02          	tnz	(OFST+1,sp)
4183  04c7 2706          	jreq	L5412
4184                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4186  04c9 72125309      	bset	21257,#1
4188  04cd 2004          	jra	L7412
4189  04cf               L5412:
4190                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4192  04cf 72135309      	bres	21257,#1
4193  04d3               L7412:
4194                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4196  04d3 72105309      	bset	21257,#0
4197                     ; 1283 }
4200  04d7 5b03          	addw	sp,#3
4201  04d9 81            	ret
4214                     	xdef	_TIM2_ClearITPendingBit
4215                     	xdef	_TIM2_GetITStatus
4216                     	xdef	_TIM2_ClearFlag
4217                     	xdef	_TIM2_GetFlagStatus
4218                     	xdef	_TIM2_GetPrescaler
4219                     	xdef	_TIM2_GetCounter
4220                     	xdef	_TIM2_GetCapture3
4221                     	xdef	_TIM2_GetCapture2
4222                     	xdef	_TIM2_GetCapture1
4223                     	xdef	_TIM2_SetIC3Prescaler
4224                     	xdef	_TIM2_SetIC2Prescaler
4225                     	xdef	_TIM2_SetIC1Prescaler
4226                     	xdef	_TIM2_SetCompare3
4227                     	xdef	_TIM2_SetCompare2
4228                     	xdef	_TIM2_SetCompare1
4229                     	xdef	_TIM2_SetAutoreload
4230                     	xdef	_TIM2_SetCounter
4231                     	xdef	_TIM2_SelectOCxM
4232                     	xdef	_TIM2_CCxCmd
4233                     	xdef	_TIM2_OC3PolarityConfig
4234                     	xdef	_TIM2_OC2PolarityConfig
4235                     	xdef	_TIM2_OC1PolarityConfig
4236                     	xdef	_TIM2_GenerateEvent
4237                     	xdef	_TIM2_OC3PreloadConfig
4238                     	xdef	_TIM2_OC2PreloadConfig
4239                     	xdef	_TIM2_OC1PreloadConfig
4240                     	xdef	_TIM2_ARRPreloadConfig
4241                     	xdef	_TIM2_ForcedOC3Config
4242                     	xdef	_TIM2_ForcedOC2Config
4243                     	xdef	_TIM2_ForcedOC1Config
4244                     	xdef	_TIM2_PrescalerConfig
4245                     	xdef	_TIM2_SelectOnePulseMode
4246                     	xdef	_TIM2_UpdateRequestConfig
4247                     	xdef	_TIM2_UpdateDisableConfig
4248                     	xdef	_TIM2_ITConfig
4249                     	xdef	_TIM2_Cmd
4250                     	xdef	_TIM2_PWMIConfig
4251                     	xdef	_TIM2_ICInit
4252                     	xdef	_TIM2_OC3Init
4253                     	xdef	_TIM2_OC2Init
4254                     	xdef	_TIM2_OC1Init
4255                     	xdef	_TIM2_TimeBaseInit
4256                     	xdef	_TIM2_DeInit
4275                     	end
