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
Text HLabel 5750 1650 2    50   Output ~ 0
V_IN
Text HLabel 5750 1800 2    50   UnSpc ~ 0
GND
Text HLabel 5750 2850 2    50   Input ~ 0
HALL_V+
Text HLabel 5750 2400 2    50   Output ~ 0
HALL_U
Text HLabel 5750 2550 2    50   Output ~ 0
HALL_V
Text HLabel 5750 2700 2    50   Output ~ 0
HALL_W
Text HLabel 5750 3200 2    50   Input ~ 0
TXD
Text HLabel 5750 3350 2    50   Output ~ 0
RXD
Text Notes 2100 3000 0    50   ~ 0
TODO:\nAdd daisy chaining,\nadd pads for connectors\nadd programming header\nadd arduino uart header
Text HLabel 5750 3650 2    50   Output ~ 0
INPUT_PWM
Text HLabel 5750 4000 2    50   Input ~ 0
U
Text HLabel 5750 4150 2    50   Input ~ 0
V
Text HLabel 5750 4300 2    50   Input ~ 0
W
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
Wire Wire Line
	4150 3350 5750 3350
Text HLabel 5750 4750 2    50   Input ~ 0
RESET
Text HLabel 5750 4900 2    50   Input ~ 0
MISO
Text HLabel 5750 5050 2    50   Input ~ 0
MOSI
Text HLabel 5750 5250 2    50   Input ~ 0
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
	5750 2850 5250 2850
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
	3950 4150 3950 4650
Wire Wire Line
	3750 4250 4050 4250
Wire Wire Line
	4050 4250 4050 3750
Wire Wire Line
	3750 3750 4050 3750
Connection ~ 4050 3750
Wire Wire Line
	5750 1500 4050 1500
Wire Wire Line
	4050 1500 4050 3750
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
L Device:R R?
U 1 1 61BF443C
P 4900 3650
F 0 "R?" V 5107 3650 50  0000 C CNN
F 1 "1kR" V 5016 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 3650 50  0001 C CNN
F 3 "~" H 4900 3650 50  0001 C CNN
	1    4900 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61BF524C
P 4900 4150
F 0 "R?" V 5107 4150 50  0000 C CNN
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
$EndSCHEMATC
