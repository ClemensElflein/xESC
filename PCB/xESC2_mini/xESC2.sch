EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title "xESC BLDC Controller"
Date "2021-12-01"
Rev "2.0"
Comp "Clemens Elflein"
Comment1 "Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
Comment2 "Licensed under "
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8800 1400 1500 3250
U 61A3F4E8
F0 "Power" 50
F1 "Power.sch" 50
F2 "DRV_ENABLE" I L 8800 2050 50 
F3 "NCS" I L 8800 2150 50 
F4 "SCK" I L 8800 2250 50 
F5 "MOSI" I L 8800 2350 50 
F6 "MISO" O L 8800 2450 50 
F7 "UH" I L 8800 2700 50 
F8 "UL" I L 8800 2800 50 
F9 "VH" I L 8800 2900 50 
F10 "VL" I L 8800 3000 50 
F11 "WH" I L 8800 3100 50 
F12 "WL" I L 8800 3200 50 
F13 "FAULT" O L 8800 3400 50 
F14 "CURU_5V" O L 8800 3550 50 
F15 "CURV_5V" O L 8800 3650 50 
F16 "CURW_5V" O L 8800 3750 50 
F17 "VCCIO" I L 8800 1850 50 
F18 "VM" O L 8800 1550 50 
F19 "PHASE_U" O L 8800 4050 50 
F20 "PHASE_V" O L 8800 4150 50 
F21 "PHASE_W" O L 8800 4250 50 
F22 "TEMP" O L 8800 4400 50 
$EndSheet
$Sheet
S 8800 4850 1000 1150
U 61E7227A
F0 "VREG" 50
F1 "VREG.sch" 50
$EndSheet
$Sheet
S 4550 1400 1650 3800
U 61AC26FB
F0 "MCU" 50
F1 "MCU.sch" 50
F2 "Reset" I L 4550 1800 50 
F3 "SWDIO" B L 4550 1700 50 
F4 "SWDCLK" I L 4550 1600 50 
F5 "WH" O R 6200 3100 50 
F6 "VH" O R 6200 2900 50 
F7 "UH" O R 6200 2700 50 
F8 "WL" O R 6200 3200 50 
F9 "VL" O R 6200 3000 50 
F10 "UL" O R 6200 2800 50 
F11 "CUR_W" I R 6200 3750 50 
F12 "CUR_V" I R 6200 3650 50 
F13 "CUR_U" I R 6200 3550 50 
F14 "PHASE_U" I R 6200 4050 50 
F15 "PHASE_V" I R 6200 4150 50 
F16 "PHASE_W" I R 6200 4250 50 
F17 "PCB_TEMP" I R 6200 4400 50 
F18 "USB_DM" B L 4550 2350 50 
F19 "USDP_DP" B L 4550 2450 50 
F20 "LED_GREEN" O L 4550 2800 50 
F21 "LED_RED" O L 4550 2900 50 
F22 "DRV_ENABLE" O R 6200 2050 50 
F23 "SERVO" I L 4550 3200 50 
F24 "FAULT" I R 6200 3400 50 
F25 "CAN_RX" I L 4550 3550 50 
F26 "CAN_TX" O L 4550 3650 50 
F27 "DRV_MISO" I R 6200 2450 50 
F28 "DRV_MOSI" O R 6200 2350 50 
F29 "DRV_NCS" O R 6200 2150 50 
F30 "DRV_SCK" O R 6200 2250 50 
F31 "AN_IN" I L 4550 3900 50 
F32 "TEMP_MOTOR" I L 4550 4100 50 
F33 "HALL_3" I L 4550 4400 50 
F34 "HALL_2" I L 4550 4300 50 
F35 "HALL_1" I L 4550 4200 50 
F36 "SCK_EXT" O L 4550 4850 50 
F37 "MISO_EXT" I L 4550 4650 50 
F38 "TX_MOSI_EXT" O L 4550 4750 50 
F39 "RX_NCS_EXT" I L 4550 4950 50 
$EndSheet
Wire Wire Line
	8550 1550 8800 1550
Wire Wire Line
	8800 2700 6200 2700
Wire Wire Line
	6200 2800 8800 2800
Wire Wire Line
	8800 2900 6200 2900
Wire Wire Line
	8800 3000 6200 3000
Wire Wire Line
	6200 3100 8800 3100
Wire Wire Line
	8800 3200 6200 3200
$Comp
L Device:R R17
U 1 1 61B0324E
P 1050 6400
F 0 "R17" H 1120 6446 50  0000 L CNN
F 1 "1k5" H 1120 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 980 6400 50  0001 C CNN
F 3 "~" H 1050 6400 50  0001 C CNN
	1    1050 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 61B03C66
P 1050 7000
F 0 "R18" H 1120 7046 50  0000 L CNN
F 1 "2k2" H 1120 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 980 7000 50  0001 C CNN
F 3 "~" H 1050 7000 50  0001 C CNN
	1    1050 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 61B06D1C
P 1500 6400
F 0 "R19" H 1570 6446 50  0000 L CNN
F 1 "1k5" H 1570 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 6400 50  0001 C CNN
F 3 "~" H 1500 6400 50  0001 C CNN
	1    1500 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 61B06D22
P 1500 7000
F 0 "R20" H 1570 7046 50  0000 L CNN
F 1 "2k2" H 1570 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 7000 50  0001 C CNN
F 3 "~" H 1500 7000 50  0001 C CNN
	1    1500 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 61B0752A
P 1900 6400
F 0 "R21" H 1970 6446 50  0000 L CNN
F 1 "1k5" H 1970 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1830 6400 50  0001 C CNN
F 3 "~" H 1900 6400 50  0001 C CNN
	1    1900 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 61B07530
P 1900 7000
F 0 "R22" H 1970 7046 50  0000 L CNN
F 1 "2k2" H 1970 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1830 7000 50  0001 C CNN
F 3 "~" H 1900 7000 50  0001 C CNN
	1    1900 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3550 7900 3550
Wire Wire Line
	1050 5800 1050 6250
Wire Wire Line
	6200 3550 7000 3550
Wire Wire Line
	6200 3650 7000 3650
Wire Wire Line
	6200 3750 7000 3750
Wire Wire Line
	1050 7150 1050 7400
Wire Wire Line
	1900 7400 1900 7150
Wire Wire Line
	1500 7150 1500 7400
Connection ~ 1500 7400
$Comp
L power:GND #PWR0125
U 1 1 61B116A0
P 1500 7550
F 0 "#PWR0125" H 1500 7300 50  0001 C CNN
F 1 "GND" H 1505 7377 50  0000 C CNN
F 2 "" H 1500 7550 50  0001 C CNN
F 3 "" H 1500 7550 50  0001 C CNN
	1    1500 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 7550 1500 7400
Wire Wire Line
	8800 3650 7900 3650
Wire Wire Line
	1500 5900 1500 6250
Wire Wire Line
	8800 3750 7900 3750
Wire Wire Line
	1900 6000 1900 6250
$Comp
L power:+3.3V #PWR0126
U 1 1 61B28E77
P 8450 1800
F 0 "#PWR0126" H 8450 1650 50  0001 C CNN
F 1 "+3.3V" H 8465 1973 50  0000 C CNN
F 2 "" H 8450 1800 50  0001 C CNN
F 3 "" H 8450 1800 50  0001 C CNN
	1    8450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1850 8450 1800
Wire Wire Line
	8450 1850 8800 1850
Wire Wire Line
	1050 6550 1050 6600
Wire Wire Line
	1500 6550 1500 6700
Wire Wire Line
	1900 6550 1900 6800
Text Label 1050 5800 0    50   ~ 0
CURU_5V
Text Label 1500 5900 0    50   ~ 0
CURV_5V
Text Label 1900 6000 0    50   ~ 0
CURW_5V
Text Label 7900 3550 0    50   ~ 0
CURU_5V
Text Label 7900 3650 0    50   ~ 0
CURV_5V
Text Label 7900 3750 0    50   ~ 0
CURW_5V
Wire Wire Line
	1050 6600 700  6600
Connection ~ 1050 6600
Wire Wire Line
	1050 6600 1050 6850
Wire Wire Line
	1500 6700 700  6700
Connection ~ 1500 6700
Wire Wire Line
	1500 6700 1500 6850
Connection ~ 1900 6800
Wire Wire Line
	1900 6800 1900 6850
Text Label 700  6600 0    50   ~ 0
CUR_U
Text Label 700  6700 0    50   ~ 0
CUR_V
Text Label 700  6800 0    50   ~ 0
CUR_W
Text Label 7000 3550 2    50   ~ 0
CUR_U
Text Label 7000 3650 2    50   ~ 0
CUR_V
Text Label 7000 3750 2    50   ~ 0
CUR_W
Wire Wire Line
	8800 4050 7900 4050
Wire Wire Line
	8800 4150 7900 4150
Wire Wire Line
	8800 4250 7900 4250
Text Label 7900 4050 0    50   ~ 0
PHASE_U_RAW
Text Label 7900 4150 0    50   ~ 0
PHASE_V_RAW
Text Label 7900 4250 0    50   ~ 0
PHASE_W_RAW
$Comp
L Device:C C28
U 1 1 61B6E6FE
P 2100 7000
F 0 "C28" H 2215 7046 50  0000 L CNN
F 1 "DNP" H 2215 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2138 6850 50  0001 C CNN
F 3 "~" H 2100 7000 50  0001 C CNN
	1    2100 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 61B71655
P 1700 7000
F 0 "C27" H 1815 7046 50  0000 L CNN
F 1 "DNP" H 1815 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1738 6850 50  0001 C CNN
F 3 "~" H 1700 7000 50  0001 C CNN
	1    1700 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 61B7234E
P 1250 7000
F 0 "C15" H 1365 7046 50  0000 L CNN
F 1 "DNP" H 1365 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1288 6850 50  0001 C CNN
F 3 "~" H 1250 7000 50  0001 C CNN
	1    1250 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 7400 1700 7400
Wire Wire Line
	1900 6800 700  6800
Wire Wire Line
	1050 7400 1250 7400
Wire Wire Line
	1250 6850 1050 6850
Connection ~ 1050 6850
Wire Wire Line
	1250 7150 1250 7400
Connection ~ 1250 7400
Wire Wire Line
	1250 7400 1500 7400
Wire Wire Line
	1500 6850 1700 6850
Connection ~ 1500 6850
Wire Wire Line
	1700 7150 1700 7400
Connection ~ 1700 7400
Wire Wire Line
	1700 7400 1900 7400
Wire Wire Line
	1900 6850 2100 6850
Connection ~ 1900 6850
Wire Wire Line
	2100 7150 2100 7400
Wire Wire Line
	2100 7400 1900 7400
Connection ~ 1900 7400
$Comp
L Device:R R23
U 1 1 61B9C5E4
P 3450 6400
F 0 "R23" H 3520 6446 50  0000 L CNN
F 1 "22k" H 3520 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3380 6400 50  0001 C CNN
F 3 "~" H 3450 6400 50  0001 C CNN
	1    3450 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 61B9C5EA
P 3450 7000
F 0 "R24" H 3520 7046 50  0000 L CNN
F 1 "1k5" H 3520 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3380 7000 50  0001 C CNN
F 3 "~" H 3450 7000 50  0001 C CNN
	1    3450 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 61B9C5F0
P 3900 6400
F 0 "R25" H 3970 6446 50  0000 L CNN
F 1 "22k" H 3970 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3830 6400 50  0001 C CNN
F 3 "~" H 3900 6400 50  0001 C CNN
	1    3900 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R26
U 1 1 61B9C5F6
P 3900 7000
F 0 "R26" H 3970 7046 50  0000 L CNN
F 1 "1k5" H 3970 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3830 7000 50  0001 C CNN
F 3 "~" H 3900 7000 50  0001 C CNN
	1    3900 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R27
U 1 1 61B9C5FC
P 4300 6400
F 0 "R27" H 4370 6446 50  0000 L CNN
F 1 "22k" H 4370 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 6400 50  0001 C CNN
F 3 "~" H 4300 6400 50  0001 C CNN
	1    4300 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R28
U 1 1 61B9C602
P 4300 7000
F 0 "R28" H 4370 7046 50  0000 L CNN
F 1 "1k5" H 4370 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 7000 50  0001 C CNN
F 3 "~" H 4300 7000 50  0001 C CNN
	1    4300 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5800 3450 6250
Wire Wire Line
	3450 7150 3450 7400
Wire Wire Line
	4300 7400 4300 7150
Wire Wire Line
	3900 7150 3900 7400
Connection ~ 3900 7400
$Comp
L power:GND #PWR0127
U 1 1 61B9C60D
P 3900 7550
F 0 "#PWR0127" H 3900 7300 50  0001 C CNN
F 1 "GND" H 3905 7377 50  0000 C CNN
F 2 "" H 3900 7550 50  0001 C CNN
F 3 "" H 3900 7550 50  0001 C CNN
	1    3900 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 7550 3900 7400
Wire Wire Line
	3900 5900 3900 6250
Wire Wire Line
	4300 6000 4300 6250
Wire Wire Line
	3450 6550 3450 6600
Wire Wire Line
	3900 6550 3900 6700
Wire Wire Line
	4300 6550 4300 6800
Text Label 3450 5800 0    50   ~ 0
PHASE_U_RAW
Text Label 3900 5900 0    50   ~ 0
PHASE_V_RAW
Text Label 4300 6000 0    50   ~ 0
PHASE_W_RAW
Wire Wire Line
	3450 6600 2550 6600
Connection ~ 3450 6600
Wire Wire Line
	3450 6600 3450 6850
Wire Wire Line
	3900 6700 2550 6700
Connection ~ 3900 6700
Wire Wire Line
	3900 6700 3900 6850
Connection ~ 4300 6800
Wire Wire Line
	4300 6800 4300 6850
Text Label 2550 6600 0    50   ~ 0
PHASE_U_FILTERED
Text Label 2550 6700 0    50   ~ 0
PHASE_V_FILTERED
Text Label 2550 6800 0    50   ~ 0
PHASE_W_FILTERED
$Comp
L Device:C C31
U 1 1 61B9C627
P 4500 7000
F 0 "C31" H 4615 7046 50  0000 L CNN
F 1 "DNP" H 4615 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4538 6850 50  0001 C CNN
F 3 "~" H 4500 7000 50  0001 C CNN
	1    4500 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C30
U 1 1 61B9C62D
P 4100 7000
F 0 "C30" H 4215 7046 50  0000 L CNN
F 1 "DNP" H 4215 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4138 6850 50  0001 C CNN
F 3 "~" H 4100 7000 50  0001 C CNN
	1    4100 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C29
U 1 1 61B9C633
P 3650 7000
F 0 "C29" H 3765 7046 50  0000 L CNN
F 1 "DNP" H 3765 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3688 6850 50  0001 C CNN
F 3 "~" H 3650 7000 50  0001 C CNN
	1    3650 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 7400 4100 7400
Wire Wire Line
	4300 6800 2550 6800
Wire Wire Line
	3450 7400 3650 7400
Wire Wire Line
	3650 6850 3450 6850
Connection ~ 3450 6850
Wire Wire Line
	3650 7150 3650 7400
Connection ~ 3650 7400
Wire Wire Line
	3650 7400 3900 7400
Wire Wire Line
	3900 6850 4100 6850
Connection ~ 3900 6850
Wire Wire Line
	4100 7150 4100 7400
Connection ~ 4100 7400
Wire Wire Line
	4100 7400 4300 7400
Wire Wire Line
	4300 6850 4500 6850
Connection ~ 4300 6850
Wire Wire Line
	4500 7150 4500 7400
Wire Wire Line
	4500 7400 4300 7400
Connection ~ 4300 7400
Wire Wire Line
	6200 4050 7000 4050
Wire Wire Line
	6200 4150 7000 4150
Text Label 7000 4050 2    50   ~ 0
PHASE_U_FILTERED
Text Label 7000 4150 2    50   ~ 0
PHASE_V_FILTERED
Text Label 7000 4250 2    50   ~ 0
PHASE_W_FILTERED
Wire Wire Line
	6200 4250 7000 4250
Wire Wire Line
	8800 2050 6200 2050
Wire Wire Line
	6200 2150 8800 2150
Wire Wire Line
	8800 2250 6200 2250
Wire Wire Line
	6200 2350 8800 2350
Wire Wire Line
	8800 2450 6200 2450
Wire Wire Line
	6200 3400 8800 3400
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 61AA0813
P 850 4550
F 0 "J1" H 958 4931 50  0000 C CNN
F 1 "Conn_01x06_Male" H 958 4840 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 850 4550 50  0001 C CNN
F 3 "~" H 850 4550 50  0001 C CNN
	1    850  4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4350 1250 4350
Wire Wire Line
	1250 4350 1250 3750
$Comp
L power:+5V #PWR0133
U 1 1 61AA8B5C
P 1250 3550
F 0 "#PWR0133" H 1250 3400 50  0001 C CNN
F 1 "+5V" H 1265 3723 50  0000 C CNN
F 2 "" H 1250 3550 50  0001 C CNN
F 3 "" H 1250 3550 50  0001 C CNN
	1    1250 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4850 1250 4850
Wire Wire Line
	1250 4850 1250 5150
$Comp
L power:GND #PWR0134
U 1 1 61AAE7ED
P 1250 5350
F 0 "#PWR0134" H 1250 5100 50  0001 C CNN
F 1 "GND" H 1255 5177 50  0000 C CNN
F 2 "" H 1250 5350 50  0001 C CNN
F 3 "" H 1250 5350 50  0001 C CNN
	1    1250 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4750 2050 4750
Wire Wire Line
	2250 4650 1850 4650
Wire Wire Line
	1050 4550 1650 4550
Wire Wire Line
	2250 4450 1450 4450
$Comp
L Device:C C?
U 1 1 61AC0036
P 1450 5000
AR Path="/61A3F4E8/61AC0036" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61AC0036" Ref="C?"  Part="1" 
AR Path="/61AC0036" Ref="C44"  Part="1" 
F 0 "C44" H 1565 5046 50  0000 L CNN
F 1 "100nF/50V" H 1565 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 4850 50  0001 C CNN
F 3 "~" H 1450 5000 50  0001 C CNN
	1    1450 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 5150 1250 5150
Connection ~ 1250 5150
Wire Wire Line
	1250 5150 1250 5350
Wire Wire Line
	1450 4850 1450 4450
Connection ~ 1450 4450
Wire Wire Line
	1450 4450 1050 4450
$Comp
L Device:R R30
U 1 1 61ACD60D
P 1450 4250
F 0 "R30" H 1520 4296 50  0000 L CNN
F 1 "10k" H 1520 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1380 4250 50  0001 C CNN
F 3 "~" H 1450 4250 50  0001 C CNN
	1    1450 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4450 1450 4400
Wire Wire Line
	1450 4100 1450 3550
$Comp
L power:+3.3V #PWR0135
U 1 1 61ADBBE2
P 1450 3550
F 0 "#PWR0135" H 1450 3400 50  0001 C CNN
F 1 "+3.3V" H 1465 3723 50  0000 C CNN
F 2 "" H 1450 3550 50  0001 C CNN
F 3 "" H 1450 3550 50  0001 C CNN
	1    1450 3550
	1    0    0    -1  
$EndComp
Text Label 2250 4750 0    50   ~ 0
HALL3
Text Label 2250 4650 0    50   ~ 0
HALL2
Text Label 2250 4550 0    50   ~ 0
HALL1
Text Label 2250 4450 0    50   ~ 0
TEMP_MOTOR
Text Label 3850 4400 0    50   ~ 0
HALL3
Text Label 3850 4300 0    50   ~ 0
HALL2
Text Label 3850 4200 0    50   ~ 0
HALL1
Text Label 3850 4100 0    50   ~ 0
TEMP_MOTOR
Wire Wire Line
	3850 4100 4550 4100
Wire Wire Line
	4550 4200 3850 4200
Wire Wire Line
	3850 4300 4550 4300
Wire Wire Line
	4550 4400 3850 4400
$Comp
L Device:R R33
U 1 1 61B2ACFB
P 1650 4250
F 0 "R33" H 1720 4296 50  0000 L CNN
F 1 "2k2" H 1720 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1580 4250 50  0001 C CNN
F 3 "~" H 1650 4250 50  0001 C CNN
	1    1650 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R34
U 1 1 61B2EB5C
P 1850 4250
F 0 "R34" H 1920 4296 50  0000 L CNN
F 1 "2k2" H 1920 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1780 4250 50  0001 C CNN
F 3 "~" H 1850 4250 50  0001 C CNN
	1    1850 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R35
U 1 1 61B36A6A
P 2050 4250
F 0 "R35" H 2120 4296 50  0000 L CNN
F 1 "2k2" H 2120 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1980 4250 50  0001 C CNN
F 3 "~" H 2050 4250 50  0001 C CNN
	1    2050 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3750 1650 3750
Wire Wire Line
	2050 3750 2050 4100
Connection ~ 1250 3750
Wire Wire Line
	1250 3750 1250 3550
Wire Wire Line
	1850 4100 1850 3750
Connection ~ 1850 3750
Wire Wire Line
	1850 3750 2050 3750
Wire Wire Line
	1650 4100 1650 3750
Connection ~ 1650 3750
Wire Wire Line
	1650 3750 1850 3750
Wire Wire Line
	1650 4400 1650 4550
Connection ~ 1650 4550
Wire Wire Line
	1650 4550 2250 4550
Wire Wire Line
	1850 4400 1850 4650
Connection ~ 1850 4650
Wire Wire Line
	1850 4650 1050 4650
Wire Wire Line
	2050 4400 2050 4750
Connection ~ 2050 4750
Wire Wire Line
	2050 4750 2250 4750
$Comp
L Device:C C47
U 1 1 61B5ED85
P 2050 5000
F 0 "C47" H 2165 5046 50  0000 L CNN
F 1 "DNP" H 2165 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2088 4850 50  0001 C CNN
F 3 "~" H 2050 5000 50  0001 C CNN
	1    2050 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C46
U 1 1 61B63C43
P 1850 5000
F 0 "C46" H 1965 5046 50  0000 L CNN
F 1 "DNP" H 1965 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 4850 50  0001 C CNN
F 3 "~" H 1850 5000 50  0001 C CNN
	1    1850 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C45
U 1 1 61B68B12
P 1650 5000
F 0 "C45" H 1765 5046 50  0000 L CNN
F 1 "DNP" H 1765 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1688 4850 50  0001 C CNN
F 3 "~" H 1650 5000 50  0001 C CNN
	1    1650 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4750 2050 4850
Wire Wire Line
	1850 4650 1850 4850
Wire Wire Line
	1650 4550 1650 4850
Wire Wire Line
	1650 5150 1450 5150
Connection ~ 1450 5150
Wire Wire Line
	1650 5150 1850 5150
Connection ~ 1650 5150
Wire Wire Line
	1850 5150 2050 5150
Connection ~ 1850 5150
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 61B8D4CB
P 3350 1600
F 0 "J3" H 3458 1981 50  0000 C CNN
F 1 "Conn_01x05_Male" H 3458 1890 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3350 1600 50  0001 C CNN
F 3 "~" H 3350 1600 50  0001 C CNN
	1    3350 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0136
U 1 1 61B8E65A
P 3750 1100
F 0 "#PWR0136" H 3750 950 50  0001 C CNN
F 1 "+3.3V" H 3765 1273 50  0000 C CNN
F 2 "" H 3750 1100 50  0001 C CNN
F 3 "" H 3750 1100 50  0001 C CNN
	1    3750 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1600 3750 1600
Wire Wire Line
	3750 1600 3750 1950
$Comp
L power:GND #PWR0137
U 1 1 61BB20D8
P 3750 1950
F 0 "#PWR0137" H 3750 1700 50  0001 C CNN
F 1 "GND" H 3755 1777 50  0000 C CNN
F 2 "" H 3750 1950 50  0001 C CNN
F 3 "" H 3750 1950 50  0001 C CNN
	1    3750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1800 4550 1800
Wire Wire Line
	3550 1700 4550 1700
Wire Wire Line
	3550 1400 3750 1400
Wire Wire Line
	3750 1400 3750 1100
Wire Wire Line
	3550 1500 4350 1500
Wire Wire Line
	4350 1500 4350 1600
Wire Wire Line
	4350 1600 4550 1600
$Comp
L U254-051T-4BH83-F1S:U254-051T-4BH83-F1S J2
U 1 1 61C21E24
P 2500 1800
F 0 "J2" H 2730 1846 50  0000 L CNN
F 1 "U254-051T-4BH83-F1S" H 2730 1755 50  0000 L CNN
F 2 "USB:XKB_U254-051T-4BH83-F1S" H 2500 1800 50  0001 L BNN
F 3 "" H 2500 1800 50  0001 L BNN
F 4 "A0" H 2500 1800 50  0001 L BNN "PARTREV"
F 5 "2.98mm" H 2500 1800 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "XKB INDUSTRIAL PRECISION" H 2500 1800 50  0001 L BNN "MANUFACTURER"
F 7 "Manufacturer recommendations" H 2500 1800 50  0001 L BNN "STANDARD"
	1    2500 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2100 1900 2100
Wire Wire Line
	1900 2100 1900 2350
Wire Wire Line
	2100 1900 1900 1900
Wire Wire Line
	1900 1900 1900 2100
Connection ~ 1900 2100
Wire Wire Line
	2100 1500 1900 1500
Wire Wire Line
	1900 1500 1900 1250
$Comp
L power:+5V #PWR0138
U 1 1 61C36EE9
P 1900 900
F 0 "#PWR0138" H 1900 750 50  0001 C CNN
F 1 "+5V" H 1915 1073 50  0000 C CNN
F 2 "" H 1900 900 50  0001 C CNN
F 3 "" H 1900 900 50  0001 C CNN
	1    1900 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 61C3DD58
P 1900 1100
F 0 "D3" V 1854 1180 50  0000 L CNN
F 1 "D_Schottky" V 1945 1180 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 1900 1100 50  0001 C CNN
F 3 "~" H 1900 1100 50  0001 C CNN
	1    1900 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 950  1900 900 
Wire Wire Line
	2100 1600 1750 1600
Wire Wire Line
	2100 1700 1750 1700
NoConn ~ 2100 1800
$Comp
L Device:R R32
U 1 1 61C6A0DC
P 1600 1700
F 0 "R32" H 1670 1746 50  0000 L CNN
F 1 "22R" H 1670 1655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1530 1700 50  0001 C CNN
F 3 "~" H 1600 1700 50  0001 C CNN
	1    1600 1700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R31
U 1 1 61C6A0E2
P 1600 1600
F 0 "R31" H 1670 1646 50  0000 L CNN
F 1 "22R" H 1670 1555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1530 1600 50  0001 C CNN
F 3 "~" H 1600 1600 50  0001 C CNN
	1    1600 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1450 1600 1050 1600
Wire Wire Line
	1450 1700 1050 1700
$Comp
L power:GND #PWR0139
U 1 1 61C88B80
P 1900 2350
F 0 "#PWR0139" H 1900 2100 50  0001 C CNN
F 1 "GND" H 1905 2177 50  0000 C CNN
F 2 "" H 1900 2350 50  0001 C CNN
F 3 "" H 1900 2350 50  0001 C CNN
	1    1900 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2450 3850 2450
Wire Wire Line
	3850 2350 4550 2350
Text Label 3850 2350 0    50   ~ 0
USB_DM
Text Label 3850 2450 0    50   ~ 0
USB_DP
Text Label 1050 1600 0    50   ~ 0
USB_DM
Text Label 1050 1700 0    50   ~ 0
USB_DP
$Comp
L Connector:Conn_01x05_Male J4
U 1 1 61D00AD0
P 3850 4850
F 0 "J4" H 3958 5231 50  0000 C CNN
F 1 "Conn_01x05_Male" H 3958 5140 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3850 4850 50  0001 C CNN
F 3 "~" H 3850 4850 50  0001 C CNN
	1    3850 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4650 4550 4650
Wire Wire Line
	4550 4750 4050 4750
Wire Wire Line
	4050 4850 4550 4850
Wire Wire Line
	4550 4950 4050 4950
Wire Wire Line
	4050 5050 4150 5050
Wire Wire Line
	4150 5050 4150 5200
$Comp
L power:GND #PWR0140
U 1 1 61D2F1BC
P 4150 5200
F 0 "#PWR0140" H 4150 4950 50  0001 C CNN
F 1 "GND" H 4155 5027 50  0000 C CNN
F 2 "" H 4150 5200 50  0001 C CNN
F 3 "" H 4150 5200 50  0001 C CNN
	1    4150 5200
	1    0    0    -1  
$EndComp
$Comp
L Interface_CAN_LIN:SN65HVD232 U5
U 1 1 61D495A6
P 2850 3300
F 0 "U5" H 2850 3781 50  0000 C CNN
F 1 "SN65HVD232" H 2850 3690 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2850 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn65hvd230.pdf" H 2750 3700 50  0001 C CNN
	1    2850 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3700 2850 3750
$Comp
L power:GND #PWR0141
U 1 1 61D5A8A4
P 2850 3900
F 0 "#PWR0141" H 2850 3650 50  0001 C CNN
F 1 "GND" H 2855 3727 50  0000 C CNN
F 2 "" H 2850 3900 50  0001 C CNN
F 3 "" H 2850 3900 50  0001 C CNN
	1    2850 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0142
U 1 1 61D62C33
P 2850 2800
F 0 "#PWR0142" H 2850 2650 50  0001 C CNN
F 1 "+3.3V" H 2865 2973 50  0000 C CNN
F 2 "" H 2850 2800 50  0001 C CNN
F 3 "" H 2850 2800 50  0001 C CNN
	1    2850 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3650 3500 3650
Wire Wire Line
	3500 3650 3500 2650
Wire Wire Line
	3500 2650 2300 2650
Wire Wire Line
	2300 2650 2300 3200
Wire Wire Line
	2300 3200 2450 3200
Wire Wire Line
	2450 3300 2250 3300
Wire Wire Line
	2250 3300 2250 2600
Wire Wire Line
	2250 2600 3550 2600
Wire Wire Line
	3550 2600 3550 3550
Wire Wire Line
	3550 3550 4550 3550
Wire Wire Line
	2850 2800 2850 3000
Wire Wire Line
	3250 3300 3400 3300
Wire Wire Line
	3400 3300 3400 3150
Wire Wire Line
	3400 3150 3700 3150
Wire Wire Line
	3250 3400 3400 3400
Wire Wire Line
	3400 3400 3400 3450
Wire Wire Line
	3400 3450 3700 3450
$Comp
L Device:R R36
U 1 1 61DB55C6
P 3700 3300
F 0 "R36" H 3770 3346 50  0000 L CNN
F 1 "120R" H 3770 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3630 3300 50  0001 C CNN
F 3 "~" H 3700 3300 50  0001 C CNN
	1    3700 3300
	1    0    0    -1  
$EndComp
Connection ~ 3700 3150
Wire Wire Line
	3700 3150 4000 3150
Connection ~ 3700 3450
Wire Wire Line
	3700 3450 3900 3450
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 61DBF697
P 4200 3250
F 0 "J5" H 4172 3182 50  0000 R CNN
F 1 "Conn_01x03_Male" H 4172 3273 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4200 3250 50  0001 C CNN
F 3 "~" H 4200 3250 50  0001 C CNN
	1    4200 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 3250 3900 3250
Wire Wire Line
	3900 3250 3900 3450
Wire Wire Line
	4000 3350 4000 3750
Wire Wire Line
	4000 3750 2850 3750
Connection ~ 2850 3750
Wire Wire Line
	2850 3750 2850 3900
Wire Wire Line
	4550 2800 3850 2800
Wire Wire Line
	4550 2900 3850 2900
Text Label 3850 2800 0    50   ~ 0
LED_GREEN
Text Label 3850 2900 0    50   ~ 0
LED_RED
$Comp
L Device:R R?
U 1 1 61E2E71B
P 6950 5500
AR Path="/61A3F4E8/61E2E71B" Ref="R?"  Part="1" 
AR Path="/61E2E71B" Ref="R37"  Part="1" 
F 0 "R37" H 7020 5546 50  0000 L CNN
F 1 "150R" H 7020 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6880 5500 50  0001 C CNN
F 3 "~" H 6950 5500 50  0001 C CNN
	1    6950 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 5350 6950 5050
Text Label 6950 5050 1    50   ~ 0
LED_GREEN
$Comp
L Device:LED D?
U 1 1 61E2E723
P 6950 6050
AR Path="/61A3F4E8/61E2E723" Ref="D?"  Part="1" 
AR Path="/61E2E723" Ref="D4"  Part="1" 
F 0 "D4" V 6989 5932 50  0000 R CNN
F 1 "LED" V 6898 5932 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6950 6050 50  0001 C CNN
F 3 "~" H 6950 6050 50  0001 C CNN
	1    6950 6050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 5900 6950 5650
Wire Wire Line
	6950 6200 6950 6300
$Comp
L Device:R R?
U 1 1 61E39472
P 7300 5500
AR Path="/61A3F4E8/61E39472" Ref="R?"  Part="1" 
AR Path="/61E39472" Ref="R38"  Part="1" 
F 0 "R38" H 7370 5546 50  0000 L CNN
F 1 "150R" H 7370 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7230 5500 50  0001 C CNN
F 3 "~" H 7300 5500 50  0001 C CNN
	1    7300 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5350 7300 5050
Text Label 7300 5050 1    50   ~ 0
LED_RED
$Comp
L Device:LED D?
U 1 1 61E3947A
P 7300 6050
AR Path="/61A3F4E8/61E3947A" Ref="D?"  Part="1" 
AR Path="/61E3947A" Ref="D5"  Part="1" 
F 0 "D5" V 7339 5932 50  0000 R CNN
F 1 "LED" V 7248 5932 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 7300 6050 50  0001 C CNN
F 3 "~" H 7300 6050 50  0001 C CNN
	1    7300 6050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7300 5900 7300 5650
Wire Wire Line
	7300 6200 7300 6300
Wire Wire Line
	6950 6300 7150 6300
$Comp
L power:GND #PWR0143
U 1 1 61E4FC2A
P 7150 6450
F 0 "#PWR0143" H 7150 6200 50  0001 C CNN
F 1 "GND" H 7155 6277 50  0000 C CNN
F 2 "" H 7150 6450 50  0001 C CNN
F 3 "" H 7150 6450 50  0001 C CNN
	1    7150 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 6450 7150 6300
Connection ~ 7150 6300
Wire Wire Line
	7150 6300 7300 6300
$Comp
L Device:R R39
U 1 1 61BE05DB
P 5100 6400
F 0 "R39" H 5170 6446 50  0000 L CNN
F 1 "22k" H 5170 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5030 6400 50  0001 C CNN
F 3 "~" H 5100 6400 50  0001 C CNN
	1    5100 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R40
U 1 1 61BEBE83
P 5100 7000
F 0 "R40" H 5170 7046 50  0000 L CNN
F 1 "1k5" H 5170 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5030 7000 50  0001 C CNN
F 3 "~" H 5100 7000 50  0001 C CNN
	1    5100 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 7400 5100 7150
Wire Wire Line
	5100 7400 4500 7400
Connection ~ 4500 7400
Wire Wire Line
	5100 6850 5100 6650
Wire Wire Line
	5100 6250 5100 6100
Wire Wire Line
	8550 1550 8550 1200
Text Label 8550 1200 0    50   ~ 0
VM
Text Label 5100 6100 0    50   ~ 0
VM
Wire Wire Line
	4550 3900 3850 3900
Wire Wire Line
	5100 6650 5750 6650
Connection ~ 5100 6650
Wire Wire Line
	5100 6650 5100 6550
Text Label 5750 6650 0    50   ~ 0
V_M_FILTERED
Text Label 3850 3900 0    50   ~ 0
V_M_FILTERED
Text Notes 1150 700  0    197  ~ 39
TODO: add 5v in
$Comp
L Device:Thermistor_NTC TH1
U 1 1 61E35322
P 6400 5850
F 0 "TH1" H 6498 5896 50  0000 L CNN
F 1 "Thermistor_NTC" H 6498 5805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 5900 50  0001 C CNN
F 3 "~" H 6400 5900 50  0001 C CNN
	1    6400 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R41
U 1 1 61E36173
P 6400 6400
F 0 "R41" H 6470 6446 50  0000 L CNN
F 1 "10k" H 6470 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6330 6400 50  0001 C CNN
F 3 "~" H 6400 6400 50  0001 C CNN
	1    6400 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5700 6400 5500
Wire Wire Line
	6400 6000 6400 6100
Wire Wire Line
	6400 6550 6400 6800
$Comp
L power:GND #PWR0121
U 1 1 61E5F5CE
P 6400 6800
F 0 "#PWR0121" H 6400 6550 50  0001 C CNN
F 1 "GND" H 6405 6627 50  0000 C CNN
F 2 "" H 6400 6800 50  0001 C CNN
F 3 "" H 6400 6800 50  0001 C CNN
	1    6400 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0122
U 1 1 61E698E4
P 6400 5500
F 0 "#PWR0122" H 6400 5350 50  0001 C CNN
F 1 "+3.3V" H 6415 5673 50  0000 C CNN
F 2 "" H 6400 5500 50  0001 C CNN
F 3 "" H 6400 5500 50  0001 C CNN
	1    6400 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4400 7000 4400
Wire Wire Line
	6400 6100 5800 6100
Connection ~ 6400 6100
Wire Wire Line
	6400 6100 6400 6250
Text Label 5800 6100 0    50   ~ 0
PCB_TEMP
Text Label 7000 4400 2    50   ~ 0
PCB_TEMP
$EndSCHEMATC
