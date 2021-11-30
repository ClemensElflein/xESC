EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
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
L Device:C C?
U 1 1 61A9BC8B
P 6550 3650
AR Path="/61A3F4E8/61A9BC8B" Ref="C?"  Part="1" 
AR Path="/61AC26FB/61A9BC8B" Ref="C15"  Part="1" 
F 0 "C15" H 6665 3696 50  0000 L CNN
F 1 "100nF/100V" H 6665 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6588 3500 50  0001 C CNN
F 3 "~" H 6550 3650 50  0001 C CNN
	1    6550 3650
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
Wire Wire Line
	3450 1500 3450 1150
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
P 5050 2950
F 0 "Y1" H 5050 3218 50  0000 C CNN
F 1 "Crystal" H 5050 3127 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_HC49-SD" H 5050 2950 50  0001 C CNN
F 3 "~" H 5050 2950 50  0001 C CNN
	1    5050 2950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
