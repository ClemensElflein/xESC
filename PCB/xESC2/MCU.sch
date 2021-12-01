EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title "xESC BLDC Controller"
Date "2021-12-01"
Rev "2.0"
Comp "Clemens Elflein"
Comment1 "Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
Comment2 "Licensed under "
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32F4:STM32F405RGTx U4
U 1 1 61AC298C
P 3350 3350
F 0 "U4" H 3350 1461 50  0000 C CNN
F 1 "STM32F405RGTx" H 3350 1370 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 2750 1650 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 3350 3350 50  0001 C CNN
	1    3350 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5150 3250 5600
Wire Wire Line
	3250 5600 3350 5600
Wire Wire Line
	3450 5600 3450 5150
Wire Wire Line
	3350 5150 3350 5600
Connection ~ 3350 5600
Wire Wire Line
	3350 5600 3450 5600
Wire Wire Line
	3350 5600 3350 5850
$Comp
L power:GND #PWR0123
U 1 1 61A9A167
P 3350 5850
F 0 "#PWR0123" H 3350 5600 50  0001 C CNN
F 1 "GND" H 3355 5677 50  0000 C CNN
F 2 "" H 3350 5850 50  0001 C CNN
F 3 "" H 3350 5850 50  0001 C CNN
	1    3350 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61A9F4B2
P 3400 750
AR Path="/61A9F4B2" Ref="#PWR?"  Part="1" 
AR Path="/61AC26FB/61A9F4B2" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 3400 600 50  0001 C CNN
F 1 "+3.3V" H 3415 923 50  0000 C CNN
F 2 "" H 3400 750 50  0001 C CNN
F 3 "" H 3400 750 50  0001 C CNN
	1    3400 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 750  3400 1150
Wire Wire Line
	3150 1550 3150 1150
Wire Wire Line
	3400 1150 3450 1150
Wire Wire Line
	3650 1150 3650 1550
Connection ~ 3400 1150
Wire Wire Line
	3550 1550 3550 1150
Connection ~ 3550 1150
Wire Wire Line
	3550 1150 3650 1150
Connection ~ 3450 1150
Wire Wire Line
	3450 1150 3550 1150
Wire Wire Line
	3350 1550 3350 1150
Connection ~ 3350 1150
Wire Wire Line
	3350 1150 3400 1150
Wire Wire Line
	3250 1550 3250 1150
Wire Wire Line
	3150 1150 3250 1150
Connection ~ 3250 1150
Wire Wire Line
	3250 1150 3350 1150
$Comp
L Device:Crystal Y1
U 1 1 61AA35C8
P 1000 3050
F 0 "Y1" H 1000 3318 50  0000 C CNN
F 1 "Crystal" H 1000 3227 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_HC49-SD" H 1000 3050 50  0001 C CNN
F 3 "~" H 1000 3050 50  0001 C CNN
	1    1000 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A6C9CC
P 2100 2400
AR Path="/61A3F4E8/61A6C9CC" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A6C9CC" Ref="C36"  Part="1" 
F 0 "C36" H 2215 2446 50  0000 L CNN
F 1 "2.2uF/50V" H 2215 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2138 2250 50  0001 C CNN
F 3 "~" H 2100 2400 50  0001 C CNN
	1    2100 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 1150 3450 1550
$Comp
L Device:C C?
U 1 1 61A6DF2F
P 6700 1150
AR Path="/61A3F4E8/61A6DF2F" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A6DF2F" Ref="C40"  Part="1" 
F 0 "C40" H 6815 1196 50  0000 L CNN
F 1 "100nF/50V" H 6815 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6738 1000 50  0001 C CNN
F 3 "~" H 6700 1150 50  0001 C CNN
	1    6700 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A6E1B7
P 7000 1150
AR Path="/61A3F4E8/61A6E1B7" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A6E1B7" Ref="C41"  Part="1" 
F 0 "C41" H 7115 1196 50  0000 L CNN
F 1 "100nF/50V" H 7115 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7038 1000 50  0001 C CNN
F 3 "~" H 7000 1150 50  0001 C CNN
	1    7000 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A6E65E
P 7300 1150
AR Path="/61A3F4E8/61A6E65E" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A6E65E" Ref="C42"  Part="1" 
F 0 "C42" H 7415 1196 50  0000 L CNN
F 1 "100nF/50V" H 7415 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7338 1000 50  0001 C CNN
F 3 "~" H 7300 1150 50  0001 C CNN
	1    7300 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A6E9CB
P 7550 1150
AR Path="/61A3F4E8/61A6E9CB" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A6E9CB" Ref="C43"  Part="1" 
F 0 "C43" H 7665 1196 50  0000 L CNN
F 1 "100nF/50V" H 7665 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7588 1000 50  0001 C CNN
F 3 "~" H 7550 1150 50  0001 C CNN
	1    7550 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61A71A13
P 7150 600
AR Path="/61A71A13" Ref="#PWR?"  Part="1" 
AR Path="/61AC26FB/61A71A13" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 7150 450 50  0001 C CNN
F 1 "+3.3V" H 7165 773 50  0000 C CNN
F 2 "" H 7150 600 50  0001 C CNN
F 3 "" H 7150 600 50  0001 C CNN
	1    7150 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 600  7150 850 
Wire Wire Line
	6700 1000 6700 850 
Wire Wire Line
	6700 850  7000 850 
Wire Wire Line
	7150 850  7300 850 
Wire Wire Line
	7550 850  7550 1000
Connection ~ 7150 850 
Wire Wire Line
	7300 1000 7300 850 
Connection ~ 7300 850 
Wire Wire Line
	7300 850  7550 850 
Wire Wire Line
	7000 1000 7000 850 
Connection ~ 7000 850 
Wire Wire Line
	7000 850  7150 850 
Wire Wire Line
	6700 1300 6700 1550
Wire Wire Line
	6700 1550 7000 1550
Wire Wire Line
	7550 1550 7550 1300
Wire Wire Line
	7300 1300 7300 1550
Connection ~ 7300 1550
Wire Wire Line
	7300 1550 7550 1550
Wire Wire Line
	7000 1550 7000 1300
Connection ~ 7000 1550
Wire Wire Line
	7000 1550 7150 1550
Wire Wire Line
	7150 1550 7150 1900
Connection ~ 7150 1550
Wire Wire Line
	7150 1550 7300 1550
$Comp
L power:GND #PWR0129
U 1 1 61A75A20
P 7150 1900
F 0 "#PWR0129" H 7150 1650 50  0001 C CNN
F 1 "GND" H 7155 1727 50  0000 C CNN
F 2 "" H 7150 1900 50  0001 C CNN
F 3 "" H 7150 1900 50  0001 C CNN
	1    7150 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A7737F
P 1750 2300
AR Path="/61A3F4E8/61A7737F" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A7737F" Ref="C35"  Part="1" 
F 0 "C35" H 1865 2346 50  0000 L CNN
F 1 "2.2uF/50V" H 1865 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1788 2150 50  0001 C CNN
F 3 "~" H 1750 2300 50  0001 C CNN
	1    1750 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 2250 2100 2250
Wire Wire Line
	2650 2150 1750 2150
Wire Wire Line
	1750 2450 1750 2550
Wire Wire Line
	1750 2550 1950 2550
Wire Wire Line
	1950 2550 1950 2650
Connection ~ 1950 2550
Wire Wire Line
	1950 2550 2100 2550
$Comp
L power:GND #PWR0130
U 1 1 61A7AE19
P 1950 2650
F 0 "#PWR0130" H 1950 2400 50  0001 C CNN
F 1 "GND" H 1955 2477 50  0000 C CNN
F 2 "" H 1950 2650 50  0001 C CNN
F 3 "" H 1950 2650 50  0001 C CNN
	1    1950 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A7B997
P 6350 1150
AR Path="/61A3F4E8/61A7B997" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A7B997" Ref="C39"  Part="1" 
F 0 "C39" H 6465 1196 50  0000 L CNN
F 1 "2.2uF/50V" H 6465 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6388 1000 50  0001 C CNN
F 3 "~" H 6350 1150 50  0001 C CNN
	1    6350 1150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 61A7C449
P 6050 1150
AR Path="/61A3F4E8/61A7C449" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A7C449" Ref="C38"  Part="1" 
F 0 "C38" H 6165 1196 50  0000 L CNN
F 1 "2.2uF/50V" H 6165 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6088 1000 50  0001 C CNN
F 3 "~" H 6050 1150 50  0001 C CNN
	1    6050 1150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 61A7D515
P 5750 1150
AR Path="/61A3F4E8/61A7D515" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A7D515" Ref="C37"  Part="1" 
F 0 "C37" H 5865 1196 50  0000 L CNN
F 1 "100nF/50V" H 5865 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5788 1000 50  0001 C CNN
F 3 "~" H 5750 1150 50  0001 C CNN
	1    5750 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1000 5750 850 
Wire Wire Line
	5750 850  6050 850 
Connection ~ 6700 850 
Wire Wire Line
	6350 1000 6350 850 
Connection ~ 6350 850 
Wire Wire Line
	6350 850  6700 850 
Wire Wire Line
	6050 1000 6050 850 
Connection ~ 6050 850 
Wire Wire Line
	6050 850  6350 850 
Wire Wire Line
	5750 1300 5750 1550
Wire Wire Line
	5750 1550 6050 1550
Connection ~ 6700 1550
Wire Wire Line
	6350 1300 6350 1550
Connection ~ 6350 1550
Wire Wire Line
	6350 1550 6700 1550
Wire Wire Line
	6050 1300 6050 1550
Connection ~ 6050 1550
Wire Wire Line
	6050 1550 6350 1550
Wire Notes Line
	5600 700  5600 1850
Wire Notes Line
	5600 1850 6550 1850
Wire Notes Line
	6550 1850 6550 700 
Wire Notes Line
	6550 700  5600 700 
Text Notes 5700 1750 0    50   ~ 0
Place near VDDA
Wire Notes Line
	6600 700  6600 1850
Wire Notes Line
	6600 1850 7700 1850
Wire Notes Line
	7700 1850 7700 700 
Wire Notes Line
	7700 700  6600 700 
Text Notes 6650 1750 0    50   ~ 0
Place Near VDD Pins
$Comp
L Device:C C?
U 1 1 61A8999F
P 1550 1900
AR Path="/61A3F4E8/61A8999F" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A8999F" Ref="C34"  Part="1" 
F 0 "C34" H 1665 1946 50  0000 L CNN
F 1 "100nF/50V" H 1665 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1588 1750 50  0001 C CNN
F 3 "~" H 1550 1900 50  0001 C CNN
	1    1550 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	2650 1750 1550 1750
Wire Wire Line
	1550 2050 1550 2550
Wire Wire Line
	1550 2550 1750 2550
Connection ~ 1750 2550
$Comp
L Device:C C32
U 1 1 61A8FC92
P 800 3300
F 0 "C32" H 915 3346 50  0000 L CNN
F 1 "15pF" H 915 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 838 3150 50  0001 C CNN
F 3 "~" H 800 3300 50  0001 C CNN
	1    800  3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C33
U 1 1 61A90FA7
P 1200 3300
F 0 "C33" H 1315 3346 50  0000 L CNN
F 1 "15pF" H 1315 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1238 3150 50  0001 C CNN
F 3 "~" H 1200 3300 50  0001 C CNN
	1    1200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3050 1200 3050
Wire Wire Line
	1200 3050 1200 3150
Wire Wire Line
	1200 3450 1200 3500
Wire Wire Line
	1200 3500 950  3500
Wire Wire Line
	800  3500 800  3450
Wire Wire Line
	850  3050 800  3050
Wire Wire Line
	800  3050 800  3150
$Comp
L power:GND #PWR0131
U 1 1 61A96857
P 950 3500
F 0 "#PWR0131" H 950 3250 50  0001 C CNN
F 1 "GND" H 955 3327 50  0000 C CNN
F 2 "" H 950 3500 50  0001 C CNN
F 3 "" H 950 3500 50  0001 C CNN
	1    950  3500
	1    0    0    -1  
$EndComp
Connection ~ 950  3500
Wire Wire Line
	950  3500 800  3500
Wire Wire Line
	800  2950 800  3050
Connection ~ 800  3050
Connection ~ 1200 3050
Text HLabel 2550 1750 1    50   Input ~ 0
Reset
Text HLabel 4950 3050 2    50   BiDi ~ 0
SWDIO
Text HLabel 4950 3150 2    50   Input ~ 0
SWDCLK
Wire Wire Line
	4050 3150 4950 3150
Wire Wire Line
	4950 3050 4050 3050
$Comp
L power:GND #PWR0132
U 1 1 61AB23EE
P 2350 1950
F 0 "#PWR0132" H 2350 1700 50  0001 C CNN
F 1 "GND" H 2355 1777 50  0000 C CNN
F 2 "" H 2350 1950 50  0001 C CNN
F 3 "" H 2350 1950 50  0001 C CNN
	1    2350 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 1950 2650 1950
Wire Wire Line
	800  2950 2650 2950
Wire Wire Line
	1200 3050 2650 3050
NoConn ~ 2650 3250
NoConn ~ 2650 4750
NoConn ~ 4050 3650
NoConn ~ 2650 4850
NoConn ~ 2650 4950
NoConn ~ 4050 3250
Text HLabel 4050 2550 2    50   Output ~ 0
WH
Text HLabel 4050 2650 2    50   Output ~ 0
VH
Text HLabel 4050 2750 2    50   Output ~ 0
UH
Text HLabel 4050 4750 2    50   Output ~ 0
WL
Text HLabel 4050 4850 2    50   Output ~ 0
VL
Text HLabel 4050 4950 2    50   Output ~ 0
UL
Text HLabel 2650 3450 0    50   Input ~ 0
CUR_W
Text HLabel 2650 3550 0    50   Input ~ 0
CUR_V
Text HLabel 2650 3650 0    50   Input ~ 0
CUR_U
Text HLabel 4050 1950 2    50   Input ~ 0
PHASE_U
Text HLabel 4050 1850 2    50   Input ~ 0
PHASE_V
Text HLabel 4050 1750 2    50   Input ~ 0
PHASE_W
Text HLabel 4050 2050 2    50   Input ~ 0
PCB_TEMP
NoConn ~ 4050 2150
Text HLabel 4050 2850 2    50   BiDi ~ 0
USB_DM
Text HLabel 4050 2950 2    50   BiDi ~ 0
USDP_DP
Text HLabel 4050 3450 2    50   Output ~ 0
LED_GREEN
Text HLabel 4050 3550 2    50   Output ~ 0
LED_RED
Text HLabel 4050 3950 2    50   Output ~ 0
DRV_ENABLE
Text HLabel 4050 4050 2    50   Input ~ 0
SERVO
Text HLabel 4050 4150 2    50   Input ~ 0
FAULT
Text HLabel 4050 4250 2    50   Input ~ 0
CAN_RX
Text HLabel 4050 4350 2    50   Output ~ 0
CAN_TX
Text HLabel 4050 3750 2    50   Input ~ 0
DRV_MISO
Text HLabel 4050 3850 2    50   Output ~ 0
DRV_MOSI
Text HLabel 2650 4350 0    50   Output ~ 0
DRV_NCS
Text HLabel 2650 4450 0    50   Output ~ 0
DRV_SCK
Text HLabel 2650 3750 0    50   Input ~ 0
AN_IN
Text HLabel 2650 3850 0    50   Input ~ 0
TEMP_MOTOR
NoConn ~ 2650 3950
Text HLabel 2650 4050 0    50   Input ~ 0
HALL_3
Text HLabel 2650 4150 0    50   Input ~ 0
HALL_2
Text HLabel 2650 4250 0    50   Input ~ 0
HALL_1
NoConn ~ 2650 4550
NoConn ~ 2650 4650
Text HLabel 4050 2250 2    50   Output ~ 0
SCK_EXT
Text HLabel 4050 2350 2    50   Input ~ 0
MISO_EXT
Text HLabel 4950 2450 2    50   Output ~ 0
TX_MOSI_EXT
Wire Wire Line
	4950 2450 4700 2450
Wire Wire Line
	4050 4450 4700 4450
Wire Wire Line
	4700 4450 4700 2450
Connection ~ 4700 2450
Wire Wire Line
	4700 2450 4050 2450
Text HLabel 4050 4550 2    50   Input ~ 0
RX_NCS_EXT
NoConn ~ 4050 4650
$EndSCHEMATC
