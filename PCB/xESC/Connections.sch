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
Text HLabel 5750 2250 2    50   Input ~ 0
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
INPUT
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
$EndSCHEMATC
