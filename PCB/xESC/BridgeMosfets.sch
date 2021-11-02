EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title "xESC BLDC Controller"
Date "2021-11-02"
Rev "0.1"
Comp "Clemens Elflein"
Comment1 "Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
Comment2 "Licensed under "
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_FET:BSC440N10NS3G Q1
U 1 1 618746CC
P 3500 2350
AR Path="/6183112C/61874129/618746CC" Ref="Q1"  Part="1" 
AR Path="/6183112C/618D9FC1/618746CC" Ref="Q3"  Part="1" 
AR Path="/6183112C/618DC168/618746CC" Ref="Q5"  Part="1" 
F 0 "Q1" H 3704 2396 50  0000 L CNN
F 1 "BSC440N10NS3G" H 3704 2305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TDSON-8-1" H 3700 2275 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BSC440N10NS3-DS-v02_04-en.pdf?fileId=db3a30432239cccd0122604520d47f56" V 3500 2350 50  0001 L CNN
	1    3500 2350
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSC440N10NS3G Q2
U 1 1 6187B610
P 3500 3450
AR Path="/6183112C/61874129/6187B610" Ref="Q2"  Part="1" 
AR Path="/6183112C/618D9FC1/6187B610" Ref="Q4"  Part="1" 
AR Path="/6183112C/618DC168/6187B610" Ref="Q6"  Part="1" 
F 0 "Q2" H 3704 3496 50  0000 L CNN
F 1 "BSC440N10NS3G" H 3704 3405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TDSON-8-1" H 3700 3375 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BSC440N10NS3-DS-v02_04-en.pdf?fileId=db3a30432239cccd0122604520d47f56" V 3500 3450 50  0001 L CNN
	1    3500 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3250 3600 2550
Wire Wire Line
	3600 2150 3600 1500
Wire Wire Line
	3600 3650 3600 4300
Text HLabel 3600 1500 0    50   UnSpc ~ 0
VIN
Text HLabel 3600 4300 0    50   UnSpc ~ 0
GND
Text HLabel 3600 2900 0    50   UnSpc ~ 0
PHASE
Text HLabel 2550 2350 0    50   Input ~ 0
HS_GATE
Text HLabel 2550 3450 0    50   Input ~ 0
LS_GATE
$Comp
L Device:R R1
U 1 1 619384E2
P 2900 2350
AR Path="/6183112C/61874129/619384E2" Ref="R1"  Part="1" 
AR Path="/6183112C/618D9FC1/619384E2" Ref="R3"  Part="1" 
AR Path="/6183112C/618DC168/619384E2" Ref="R5"  Part="1" 
F 0 "R1" V 2693 2350 50  0000 C CNN
F 1 "DNP" V 2784 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2830 2350 50  0001 C CNN
F 3 "~" H 2900 2350 50  0001 C CNN
	1    2900 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 2350 2700 2350
Wire Wire Line
	3050 2350 3100 2350
Wire Wire Line
	3300 3450 3100 3450
Wire Wire Line
	2750 3450 2700 3450
$Comp
L Device:R R2
U 1 1 6193ABD6
P 2900 3450
AR Path="/6183112C/61874129/6193ABD6" Ref="R2"  Part="1" 
AR Path="/6183112C/618D9FC1/6193ABD6" Ref="R4"  Part="1" 
AR Path="/6183112C/618DC168/6193ABD6" Ref="R6"  Part="1" 
F 0 "R2" V 2693 3450 50  0000 C CNN
F 1 "DNP" V 2784 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2830 3450 50  0001 C CNN
F 3 "~" H 2900 3450 50  0001 C CNN
	1    2900 3450
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 6193ADCE
P 2900 2600
AR Path="/6183112C/61874129/6193ADCE" Ref="JP2"  Part="1" 
AR Path="/6183112C/618D9FC1/6193ADCE" Ref="JP4"  Part="1" 
AR Path="/6183112C/618DC168/6193ADCE" Ref="JP6"  Part="1" 
F 0 "JP2" H 2900 2805 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 2900 2714 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 2900 2600 50  0001 C CNN
F 3 "~" H 2900 2600 50  0001 C CNN
	1    2900 2600
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP3
U 1 1 6193C72B
P 2900 3700
AR Path="/6183112C/61874129/6193C72B" Ref="JP3"  Part="1" 
AR Path="/6183112C/618D9FC1/6193C72B" Ref="JP5"  Part="1" 
AR Path="/6183112C/618DC168/6193C72B" Ref="JP7"  Part="1" 
F 0 "JP3" H 2900 3905 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 2900 3814 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 2900 3700 50  0001 C CNN
F 3 "~" H 2900 3700 50  0001 C CNN
	1    2900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2600 3100 2600
Wire Wire Line
	3100 2600 3100 2350
Connection ~ 3100 2350
Wire Wire Line
	3100 2350 3300 2350
Wire Wire Line
	2750 2600 2700 2600
Wire Wire Line
	2700 2600 2700 2350
Connection ~ 2700 2350
Wire Wire Line
	2700 2350 2750 2350
Wire Wire Line
	2750 3700 2700 3700
Wire Wire Line
	2700 3700 2700 3450
Connection ~ 2700 3450
Wire Wire Line
	2700 3450 2550 3450
Wire Wire Line
	3050 3700 3100 3700
Wire Wire Line
	3100 3700 3100 3450
Connection ~ 3100 3450
Wire Wire Line
	3100 3450 3050 3450
$EndSCHEMATC
