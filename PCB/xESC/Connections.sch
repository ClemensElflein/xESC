EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title "xESC BLDC Controller"
Date "2021-11-02"
Rev "0.1"
Comp "Clemens Elflein"
Comment1 "Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
Comment2 "Licensed under "
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7700 5400 2    50   Output ~ 0
V_IN
Text HLabel 5750 1800 2    50   UnSpc ~ 0
GND
Text HLabel 5750 2400 2    50   Output ~ 0
HALL_U
Text HLabel 5750 2550 2    50   Output ~ 0
HALL_V
Text HLabel 5750 2700 2    50   Output ~ 0
HALL_W
Text HLabel 5750 3200 2    50   Input ~ 0
TXD
Text Notes 2100 3000 0    50   ~ 0
TODO:\nAdd daisy chaining,\nadd pads for connectors\nadd programming header\nadd arduino uart header
Text HLabel 5750 3650 2    50   Output ~ 0
INPUT_PWM
Text HLabel 5750 1500 2    50   Input ~ 0
VCCIO
$Comp
L Device:R R16
U 1 1 61826336
P 5000 3200
F 0 "R16" V 5207 3200 50  0000 C CNN
F 1 "1kR" V 5116 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4930 3200 50  0001 C CNN
F 3 "~" H 5000 3200 50  0001 C CNN
	1    5000 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5750 3200 5150 3200
Wire Wire Line
	4850 3200 4600 3200
Text HLabel 4750 5800 2    50   Input ~ 0
RESET
Text HLabel 4750 5600 2    50   Input ~ 0
MISO
Text HLabel 4750 5700 2    50   Input ~ 0
MOSI
Text HLabel 4750 5500 2    50   Input ~ 0
SCK
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 61B78D2B
P 4950 2450
F 0 "J1" H 5058 2831 50  0000 C CNN
F 1 "Conn_01x05_Male" H 5058 2740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4950 2450 50  0001 C CNN
F 3 "~" H 4950 2450 50  0001 C CNN
	1    4950 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1800 5600 1800
Wire Wire Line
	5600 2250 5150 2250
Wire Wire Line
	5450 2400 5450 2350
Wire Wire Line
	5450 2350 5150 2350
Wire Wire Line
	5400 2550 5400 2450
Wire Wire Line
	5400 2450 5150 2450
Wire Wire Line
	5350 2700 5350 2550
Wire Wire Line
	5350 2550 5150 2550
Wire Wire Line
	5250 2850 5250 2650
Wire Wire Line
	5250 2650 5150 2650
Wire Wire Line
	5750 2700 5350 2700
Wire Wire Line
	5750 2550 5400 2550
Wire Wire Line
	5750 2400 5450 2400
Wire Wire Line
	5600 1800 5600 2250
Text HLabel 5750 3750 2    50   Output ~ 0
INPUT_ANALOG
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 61BD29C1
P 3550 3750
F 0 "J2" H 3658 4031 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3658 3940 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3550 3750 50  0001 C CNN
F 3 "~" H 3550 3750 50  0001 C CNN
	1    3550 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 61BD440A
P 3550 4250
F 0 "J3" H 3658 4531 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3658 4440 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3550 4250 50  0001 C CNN
F 3 "~" H 3550 4250 50  0001 C CNN
	1    3550 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 61BD4BA0
P 5600 2250
F 0 "#PWR0117" H 5600 2000 50  0001 C CNN
F 1 "GND" H 5605 2077 50  0000 C CNN
F 2 "" H 5600 2250 50  0001 C CNN
F 3 "" H 5600 2250 50  0001 C CNN
	1    5600 2250
	1    0    0    -1  
$EndComp
Connection ~ 5600 2250
Wire Wire Line
	3750 3650 3950 3650
Wire Wire Line
	3950 3650 3950 4150
Wire Wire Line
	3750 4150 3950 4150
Connection ~ 3950 4150
Wire Wire Line
	3950 4150 3950 4550
Wire Wire Line
	3750 4250 4050 4250
Wire Wire Line
	4050 4250 4050 3750
Wire Wire Line
	3750 3750 4050 3750
Wire Wire Line
	3750 3850 5150 3850
Wire Wire Line
	5150 3850 5150 3650
Wire Wire Line
	5150 3650 5750 3650
Wire Wire Line
	5750 3750 5250 3750
Wire Wire Line
	5250 3750 5250 4150
Wire Wire Line
	5250 4350 3750 4350
$Comp
L power:GND #PWR0118
U 1 1 61BD88B8
P 3950 4650
F 0 "#PWR0118" H 3950 4400 50  0001 C CNN
F 1 "GND" H 3955 4477 50  0000 C CNN
F 2 "" H 3950 4650 50  0001 C CNN
F 3 "" H 3950 4650 50  0001 C CNN
	1    3950 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 61BF443C
P 4900 3650
F 0 "R17" V 5107 3650 50  0000 C CNN
F 1 "1kR" V 5016 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 3650 50  0001 C CNN
F 3 "~" H 4900 3650 50  0001 C CNN
	1    4900 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 61BF524C
P 4900 4150
F 0 "R18" V 5107 4150 50  0000 C CNN
F 1 "1kR" V 5016 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 4150 50  0001 C CNN
F 3 "~" H 4900 4150 50  0001 C CNN
	1    4900 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 3650 5050 3650
Connection ~ 5150 3650
Wire Wire Line
	5050 4150 5250 4150
Connection ~ 5250 4150
Wire Wire Line
	5250 4150 5250 4350
Wire Wire Line
	4750 4150 3950 4150
Wire Wire Line
	4750 3650 3950 3650
Connection ~ 3950 3650
Wire Wire Line
	4550 1500 4550 2850
Wire Wire Line
	4550 2850 5250 2850
Connection ~ 4550 1500
Wire Wire Line
	4550 1500 4050 1500
Text HLabel 7700 5850 2    50   Input ~ 0
W
Text HLabel 7700 5700 2    50   Input ~ 0
V
Text HLabel 7700 5550 2    50   Input ~ 0
U
Text Notes 6550 5750 0    50   ~ 0
Phase is connected using\nmanually placed solder pads
$Comp
L Connector:TestPoint TP2
U 1 1 61D6B8CA
P 4600 3200
F 0 "TP2" H 4542 3226 50  0000 R CNN
F 1 "TestPoint" H 4542 3317 50  0000 R CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4800 3200 50  0001 C CNN
F 3 "~" H 4800 3200 50  0001 C CNN
	1    4600 3200
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 61D6DCA6
P 4500 5800
F 0 "TP6" H 4558 5918 50  0000 L CNN
F 1 "TestPoint" H 4558 5827 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4700 5800 50  0001 C CNN
F 3 "~" H 4700 5800 50  0001 C CNN
	1    4500 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 61D6E8CA
P 4500 5600
F 0 "TP5" H 4558 5718 50  0000 L CNN
F 1 "TestPoint" H 4558 5627 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4700 5600 50  0001 C CNN
F 3 "~" H 4700 5600 50  0001 C CNN
	1    4500 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 61D6F700
P 4400 5700
F 0 "TP4" H 4458 5818 50  0000 L CNN
F 1 "TestPoint" H 4458 5727 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4600 5700 50  0001 C CNN
F 3 "~" H 4600 5700 50  0001 C CNN
	1    4400 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 61D70C5B
P 4400 5500
F 0 "TP3" H 4458 5618 50  0000 L CNN
F 1 "TestPoint" H 4458 5527 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4600 5500 50  0001 C CNN
F 3 "~" H 4600 5500 50  0001 C CNN
	1    4400 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5800 4500 5800
Wire Wire Line
	4500 5600 4750 5600
Wire Wire Line
	4750 5700 4400 5700
Wire Wire Line
	4400 5500 4750 5500
$Comp
L Connector:TestPoint TP7
U 1 1 61D76261
P 3950 4550
F 0 "TP7" H 4008 4668 50  0000 L CNN
F 1 "TestPoint" H 4008 4577 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4150 4550 50  0001 C CNN
F 3 "~" H 4150 4550 50  0001 C CNN
	1    3950 4550
	0    -1   -1   0   
$EndComp
Connection ~ 3950 4550
Wire Wire Line
	3950 4550 3950 4650
Wire Wire Line
	4550 1500 5750 1500
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 61DB3B50
P 3550 3100
F 0 "J4" H 3658 3381 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3658 3290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3550 3100 50  0001 C CNN
F 3 "~" H 3550 3100 50  0001 C CNN
	1    3550 3100
	1    0    0    -1  
$EndComp
Connection ~ 4050 3750
$Comp
L Connector:TestPoint TP1
U 1 1 61D6C509
P 4150 3100
F 0 "TP1" H 4208 3218 50  0000 L CNN
F 1 "TestPoint" H 4208 3127 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4350 3100 50  0001 C CNN
F 3 "~" H 4350 3100 50  0001 C CNN
	1    4150 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1500 4050 3750
Wire Wire Line
	4150 3100 5750 3100
Text HLabel 5750 3100 2    50   Output ~ 0
RXD
Wire Wire Line
	4150 3100 3750 3100
Connection ~ 4150 3100
Wire Wire Line
	4600 3200 3750 3200
Connection ~ 4600 3200
Wire Wire Line
	3750 3000 3950 3000
Wire Wire Line
	3950 3000 3950 3650
Text HLabel 4800 6100 2    50   Input ~ 0
SS_EXT_SPI
$Comp
L Connector:TestPoint TP8
U 1 1 61DD08D4
P 4550 6100
F 0 "TP8" H 4608 6218 50  0000 L CNN
F 1 "TestPoint" H 4608 6127 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 4750 6100 50  0001 C CNN
F 3 "~" H 4750 6100 50  0001 C CNN
	1    4550 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6100 4550 6100
$Comp
L Connector:TestPoint TP9
U 1 1 61E1451D
P 3400 1450
F 0 "TP9" H 3458 1568 50  0000 L CNN
F 1 "TestPoint" H 3458 1477 50  0000 L CNN
F 2 "xESC:TestPoint_Pad_1.5x1.5mm" H 3600 1450 50  0001 C CNN
F 3 "~" H 3600 1450 50  0001 C CNN
	1    3400 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 61E15E2F
P 3700 1500
F 0 "D2" H 3700 1283 50  0000 C CNN
F 1 "D_Schottky" H 3700 1374 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 1500 50  0001 C CNN
F 3 "~" H 3700 1500 50  0001 C CNN
	1    3700 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 1500 3850 1500
Connection ~ 4050 1500
Wire Wire Line
	3550 1500 3400 1500
Wire Wire Line
	3400 1500 3400 1450
$EndSCHEMATC
