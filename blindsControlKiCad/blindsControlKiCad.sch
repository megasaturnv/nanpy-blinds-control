EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:switches
LIBS:blindsControlKiCad-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Blinds Control KiCad"
Date "2018-03-03"
Rev "1"
Comp "By Megasaturnv"
Comment1 "For Veroboard / Stripboard"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328-PU U1
U 1 1 5A04A949
P 4250 3350
F 0 "U1" H 3500 4600 50  0000 L BNN
F 1 "ATMEGA328-PU" H 4650 1950 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 4250 3350 50  0001 C CIN
F 3 "" H 4250 3350 50  0001 C CNN
	1    4250 3350
	1    0    0    -1  
$EndComp
$Comp
L NE555 U2
U 1 1 5A04ABB3
P 8650 2450
F 0 "U2" H 8250 2800 50  0000 L CNN
F 1 "NE555" H 8250 2100 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 8650 2450 50  0001 C CNN
F 3 "" H 8650 2450 50  0001 C CNN
	1    8650 2450
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_CBE Q2
U 1 1 5A04AEEB
P 9650 2250
F 0 "Q2" H 9850 2300 50  0000 L CNN
F 1 "Q_NPN_CBE" H 9850 2200 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 9850 2350 50  0001 C CNN
F 3 "" H 9650 2250 50  0001 C CNN
	1    9650 2250
	1    0    0    -1  
$EndComp
$Comp
L R_Pack08 RN1
U 1 1 5A04B0CB
P 6100 2550
F 0 "RN1" V 5600 2550 50  0000 C CNN
F 1 "330R_Pack08" V 6500 2550 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" V 6575 2550 50  0001 C CNN
F 3 "" H 6100 2550 50  0001 C CNN
	1    6100 2550
	0    1    -1   0   
$EndComp
$Comp
L R R5
U 1 1 5A04B302
P 9300 2650
F 0 "R5" V 9380 2650 50  0000 C CNN
F 1 "27kR" V 9300 2650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P15.24mm_Horizontal" V 9230 2650 50  0001 C CNN
F 3 "" H 9300 2650 50  0001 C CNN
	1    9300 2650
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5A04B338
P 9300 2250
F 0 "R4" V 9380 2250 50  0000 C CNN
F 1 "3.3kR" V 9300 2250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9230 2250 50  0001 C CNN
F 3 "" H 9300 2250 50  0001 C CNN
	1    9300 2250
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5A04B365
P 9900 2050
F 0 "R6" V 9980 2050 50  0000 C CNN
F 1 "160R" V 9900 2050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9830 2050 50  0001 C CNN
F 3 "" H 9900 2050 50  0001 C CNN
	1    9900 2050
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 5A04B3E8
P 7600 2450
F 0 "C4" H 7625 2550 50  0000 L CNN
F 1 "100nF" V 7750 2200 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 7638 2300 50  0001 C CNN
F 3 "" H 7600 2450 50  0001 C CNN
	1    7600 2450
	0    1    1    0   
$EndComp
$Comp
L C C7
U 1 1 5A04B41E
P 9750 1450
F 0 "C7" H 9775 1550 50  0000 L CNN
F 1 "10uF" H 9775 1350 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 9788 1300 50  0001 C CNN
F 3 "" H 9750 1450 50  0001 C CNN
	1    9750 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5A054554
P 5850 3700
F 0 "#PWR01" H 5850 3450 50  0001 C CNN
F 1 "GND" H 5850 3550 50  0000 C CNN
F 2 "" H 5850 3700 50  0001 C CNN
F 3 "" H 5850 3700 50  0001 C CNN
	1    5850 3700
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 5A0549A3
P 2000 2150
F 0 "R1" V 2080 2150 50  0000 C CNN
F 1 "10kR" V 2000 2150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1930 2150 50  0001 C CNN
F 3 "" H 2000 2150 50  0001 C CNN
	1    2000 2150
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 5A054D28
P 2000 2000
F 0 "#PWR02" H 2000 1850 50  0001 C CNN
F 1 "VCC" H 2000 2150 50  0000 C CNN
F 2 "" H 2000 2000 50  0001 C CNN
F 3 "" H 2000 2000 50  0001 C CNN
	1    2000 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5A054DDF
P 3350 4550
F 0 "#PWR03" H 3350 4300 50  0001 C CNN
F 1 "GND" H 3350 4400 50  0000 C CNN
F 2 "" H 3350 4550 50  0001 C CNN
F 3 "" H 3350 4550 50  0001 C CNN
	1    3350 4550
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 5A054E1D
P 3350 2250
F 0 "#PWR04" H 3350 2100 50  0001 C CNN
F 1 "VCC" H 3350 2400 50  0000 C CNN
F 2 "" H 3350 2250 50  0001 C CNN
F 3 "" H 3350 2250 50  0001 C CNN
	1    3350 2250
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5A056A5F
P 10100 1450
F 0 "R7" V 10180 1450 50  0000 C CNN
F 1 "2kR" V 10100 1450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 10030 1450 50  0001 C CNN
F 3 "" H 10100 1450 50  0001 C CNN
	1    10100 1450
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR05
U 1 1 5A05574C
P 8850 800
F 0 "#PWR05" H 8850 650 50  0001 C CNN
F 1 "+12V" H 8850 940 50  0000 C CNN
F 2 "" H 8850 800 50  0001 C CNN
F 3 "" H 8850 800 50  0001 C CNN
	1    8850 800 
	1    0    0    -1  
$EndComp
$Comp
L Q_PNP_ECB Q1
U 1 1 5A04AD86
P 10250 2050
F 0 "Q1" H 10450 2100 50  0000 L CNN
F 1 "Q_PNP_ECB" H 10450 2000 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-126_Vertical" H 10450 2150 50  0001 C CNN
F 3 "" H 10250 2050 50  0001 C CNN
	1    10250 2050
	1    0    0    1   
$EndComp
$Comp
L GND #PWR06
U 1 1 5A05B77F
P 8650 2850
F 0 "#PWR06" H 8650 2600 50  0001 C CNN
F 1 "GND" H 8650 2700 50  0000 C CNN
F 2 "" H 8650 2850 50  0001 C CNN
F 3 "" H 8650 2850 50  0001 C CNN
	1    8650 2850
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A05B827
P 8150 2900
F 0 "R3" V 8230 2900 50  0000 C CNN
F 1 "1.2kR" V 8150 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8080 2900 50  0001 C CNN
F 3 "" H 8150 2900 50  0001 C CNN
	1    8150 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5A05D0A4
P 7450 2450
F 0 "#PWR07" H 7450 2200 50  0001 C CNN
F 1 "GND" H 7450 2300 50  0000 C CNN
F 2 "" H 7450 2450 50  0001 C CNN
F 3 "" H 7450 2450 50  0001 C CNN
	1    7450 2450
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR08
U 1 1 5A05DD48
P 8650 2050
F 0 "#PWR08" H 8650 1900 50  0001 C CNN
F 1 "VCC" H 8650 2200 50  0000 C CNN
F 2 "" H 8650 2050 50  0001 C CNN
F 3 "" H 8650 2050 50  0001 C CNN
	1    8650 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5A05E92D
P 9150 3050
F 0 "#PWR09" H 9150 2800 50  0001 C CNN
F 1 "GND" H 9150 2900 50  0000 C CNN
F 2 "" H 9150 3050 50  0001 C CNN
F 3 "" H 9150 3050 50  0001 C CNN
	1    9150 3050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR010
U 1 1 5A05EA00
P 9450 2650
F 0 "#PWR010" H 9450 2500 50  0001 C CNN
F 1 "VCC" H 9450 2800 50  0000 C CNN
F 2 "" H 9450 2650 50  0001 C CNN
F 3 "" H 9450 2650 50  0001 C CNN
	1    9450 2650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR011
U 1 1 5A05F167
P 7750 1850
F 0 "#PWR011" H 7750 1700 50  0001 C CNN
F 1 "VCC" H 7750 2000 50  0000 C CNN
F 2 "" H 7750 1850 50  0001 C CNN
F 3 "" H 7750 1850 50  0001 C CNN
	1    7750 1850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 5A064956
P 1250 2000
F 0 "#PWR012" H 1250 1850 50  0001 C CNN
F 1 "VCC" H 1250 2150 50  0000 C CNN
F 2 "" H 1250 2000 50  0001 C CNN
F 3 "" H 1250 2000 50  0001 C CNN
	1    1250 2000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 5A064990
P 1250 1800
F 0 "#PWR013" H 1250 1550 50  0001 C CNN
F 1 "GND" H 1250 1650 50  0000 C CNN
F 2 "" H 1250 1800 50  0001 C CNN
F 3 "" H 1250 1800 50  0001 C CNN
	1    1250 1800
	0    -1   -1   0   
$EndComp
Text Label 1200 2200 0    60   ~ 0
TX
Text Label 1200 2100 0    60   ~ 0
RX
Text Label 1200 2300 0    60   ~ 0
DTR
Text Label 5250 3850 0    60   ~ 0
RX
Text Label 5250 3950 0    60   ~ 0
TX
$Comp
L C C1
U 1 1 5A06341E
P 3200 2850
F 0 "C1" H 3225 2950 50  0000 L CNN
F 1 "100nF" H 3225 2750 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 3238 2700 50  0001 C CNN
F 3 "" H 3200 2850 50  0001 C CNN
	1    3200 2850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR014
U 1 1 5A06345F
P 3050 2850
F 0 "#PWR014" H 3050 2600 50  0001 C CNN
F 1 "GND" H 3050 2700 50  0000 C CNN
F 2 "" H 3050 2850 50  0001 C CNN
F 3 "" H 3050 2850 50  0001 C CNN
	1    3050 2850
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5A07044C
P 7750 2000
F 0 "R2" V 7830 2000 50  0000 C CNN
F 1 "1kR" V 7750 2000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7680 2000 50  0001 C CNN
F 3 "" H 7750 2000 50  0001 C CNN
	1    7750 2000
	1    0    0    -1  
$EndComp
Text Label 6300 2250 0    60   ~ 0
9
Text Label 6300 2350 0    60   ~ 0
10
Text Label 6300 2450 0    60   ~ 0
11
Text Label 6300 2550 0    60   ~ 0
12
Text Label 6300 2650 0    60   ~ 0
13
Text Label 6300 2750 0    60   ~ 0
14
Text Label 6300 2850 0    60   ~ 0
15
Text Label 6300 2950 0    60   ~ 0
16
$Comp
L GND #PWR015
U 1 1 5A073CAC
P 8150 3050
F 0 "#PWR015" H 8150 2800 50  0001 C CNN
F 1 "GND" H 8150 2900 50  0000 C CNN
F 2 "" H 8150 3050 50  0001 C CNN
F 3 "" H 8150 3050 50  0001 C CNN
	1    8150 3050
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW5
U 1 1 5A07866F
P 8000 2050
F 0 "SW5" H 8050 2150 50  0000 L CNN
F 1 "SW_TRIG" H 8000 1990 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 8000 2250 50  0001 C CNN
F 3 "" H 8000 2250 50  0001 C CNN
	1    8000 2050
	0    1    1    0   
$EndComp
$Comp
L SW_Push SW1
U 1 1 5A0786E0
P 6650 1300
F 0 "SW1" H 6700 1400 50  0000 L CNN
F 1 "SW_M1CW" H 6650 1240 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 6650 1500 50  0001 C CNN
F 3 "" H 6650 1500 50  0001 C CNN
	1    6650 1300
	0    -1   -1   0   
$EndComp
$Comp
L SW_Push SW3
U 1 1 5A078735
P 7150 1300
F 0 "SW3" H 7200 1400 50  0000 L CNN
F 1 "SW_M2CW" H 7150 1240 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 7150 1500 50  0001 C CNN
F 3 "" H 7150 1500 50  0001 C CNN
	1    7150 1300
	0    -1   -1   0   
$EndComp
$Comp
L SW_Push SW4
U 1 1 5A078950
P 7400 1300
F 0 "SW4" H 7450 1400 50  0000 L CNN
F 1 "SW_M2ACW" H 7400 1240 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 7400 1500 50  0001 C CNN
F 3 "" H 7400 1500 50  0001 C CNN
	1    7400 1300
	0    -1   -1   0   
$EndComp
$Comp
L SW_Push SW2
U 1 1 5A0789A5
P 6900 1300
F 0 "SW2" H 6950 1400 50  0000 L CNN
F 1 "SW_M1ACW" H 6900 1240 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 6900 1500 50  0001 C CNN
F 3 "" H 6900 1500 50  0001 C CNN
	1    6900 1300
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR016
U 1 1 5A0793AF
P 7400 3450
F 0 "#PWR016" H 7400 3300 50  0001 C CNN
F 1 "VCC" H 7400 3600 50  0000 C CNN
F 2 "" H 7400 3450 50  0001 C CNN
F 3 "" H 7400 3450 50  0001 C CNN
	1    7400 3450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR017
U 1 1 5A07B0A3
P 6650 1100
F 0 "#PWR017" H 6650 950 50  0001 C CNN
F 1 "VCC" H 6650 1250 50  0000 C CNN
F 2 "" H 6650 1100 50  0001 C CNN
F 3 "" H 6650 1100 50  0001 C CNN
	1    6650 1100
	1    0    0    -1  
$EndComp
$Comp
L CP C6
U 1 1 5A07E62A
P 9150 2900
F 0 "C6" H 9175 3000 50  0000 L CNN
F 1 "1000uF" H 9175 2800 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 9188 2750 50  0001 C CNN
F 3 "" H 9150 2900 50  0001 C CNN
	1    9150 2900
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW6
U 1 1 5A07F724
P 7400 2950
F 0 "SW6" H 7450 3050 50  0000 L CNN
F 1 "SW_RST" H 7400 2890 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 7400 3150 50  0001 C CNN
F 3 "" H 7400 3150 50  0001 C CNN
	1    7400 2950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR018
U 1 1 5A08209F
P 8000 1850
F 0 "#PWR018" H 8000 1600 50  0001 C CNN
F 1 "GND" H 8000 1700 50  0000 C CNN
F 2 "" H 8000 1850 50  0001 C CNN
F 3 "" H 8000 1850 50  0001 C CNN
	1    8000 1850
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR019
U 1 1 5A089038
P 5850 3800
F 0 "#PWR019" H 5850 3650 50  0001 C CNN
F 1 "VCC" H 5850 3950 50  0000 C CNN
F 2 "" H 5850 3800 50  0001 C CNN
F 3 "" H 5850 3800 50  0001 C CNN
	1    5850 3800
	-1   0    0    1   
$EndComp
$Comp
L C C2
U 1 1 5A09BAFC
P 2050 4050
F 0 "C2" H 1900 4150 50  0000 L CNN
F 1 "22pF" H 1850 3950 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 2088 3900 50  0001 C CNN
F 3 "" H 2050 4050 50  0001 C CNN
	1    2050 4050
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5A09BB68
P 2350 4050
F 0 "C3" H 2375 4150 50  0000 L CNN
F 1 "22pF" H 2375 3950 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 2388 3900 50  0001 C CNN
F 3 "" H 2350 4050 50  0001 C CNN
	1    2350 4050
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 5A09BBD7
P 2200 3700
F 0 "Y1" H 2200 3850 50  0000 C CNN
F 1 "Crystal" H 2200 3550 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-4H_Vertical" H 2200 3700 50  0001 C CNN
F 3 "" H 2200 3700 50  0001 C CNN
	1    2200 3700
	1    0    0    -1  
$EndComp
Text Label 5250 2850 0    60   ~ 0
OSC1
Text Label 5250 2950 0    60   ~ 0
OSC2
Text Label 2050 3500 0    60   ~ 0
OSC1
Text Label 2350 3500 0    60   ~ 0
OSC2
$Comp
L GND #PWR020
U 1 1 5A09E5AB
P 2200 4200
F 0 "#PWR020" H 2200 3950 50  0001 C CNN
F 1 "GND" H 2200 4050 50  0000 C CNN
F 2 "" H 2200 4200 50  0001 C CNN
F 3 "" H 2200 4200 50  0001 C CNN
	1    2200 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3300 5900 2950
Wire Wire Line
	5250 3200 5900 2850
Wire Wire Line
	5250 3100 5900 2750
Wire Wire Line
	5250 2750 5900 2650
Wire Wire Line
	5250 2650 5900 2550
Wire Wire Line
	5250 2550 5900 2450
Wire Wire Line
	5250 2450 5900 2350
Wire Wire Line
	5250 2350 5900 2250
Wire Wire Line
	7750 2150 7750 2250
Wire Wire Line
	1200 1800 1250 1800
Wire Wire Line
	1200 1900 1200 1800
Wire Wire Line
	1200 2000 1250 2000
Connection ~ 9150 2650
Wire Wire Line
	9150 2450 9150 2750
Wire Wire Line
	8850 900  8950 900 
Wire Wire Line
	8850 800  8850 900 
Wire Wire Line
	10350 900  9750 900 
Wire Wire Line
	10350 1850 10350 900 
Wire Wire Line
	9750 900  9750 1000
Wire Wire Line
	8950 900  8950 1000
Wire Wire Line
	10350 2400 10350 2250
Wire Wire Line
	5850 3600 5250 3600
Wire Wire Line
	3350 4450 3350 4550
Wire Wire Line
	3350 2550 3350 2250
Wire Wire Line
	5850 3500 5250 3500
Wire Wire Line
	6300 2350 7250 2350
Wire Wire Line
	7250 2350 7250 2750
Wire Wire Line
	6300 2450 6950 2450
Wire Wire Line
	6850 2550 6300 2550
Wire Wire Line
	6300 2650 6750 2650
Wire Wire Line
	6650 2750 6300 2750
Wire Wire Line
	7250 2750 8150 2750
Connection ~ 7400 2750
Wire Wire Line
	6650 1100 7400 1100
Connection ~ 6900 1100
Connection ~ 7150 1100
Wire Wire Line
	6650 1500 6650 2850
Wire Wire Line
	6750 1500 6750 2850
Wire Wire Line
	6850 1600 6850 2850
Wire Wire Line
	6950 1700 6950 2850
Connection ~ 6650 2750
Wire Wire Line
	6900 1500 6750 1500
Connection ~ 6750 2650
Wire Wire Line
	7150 1500 7150 1600
Wire Wire Line
	7150 1600 6850 1600
Connection ~ 6850 2550
Wire Wire Line
	7400 1500 7400 1700
Wire Wire Line
	7400 1700 6950 1700
Connection ~ 6950 2450
Wire Wire Line
	6300 2250 7450 2250
Wire Wire Line
	7750 2250 8150 2250
Connection ~ 8000 2250
Wire Wire Line
	7750 2450 8150 2450
Wire Wire Line
	8150 2750 8150 2650
Wire Wire Line
	2050 3500 2050 3900
Wire Wire Line
	2350 3500 2350 3900
Connection ~ 2350 3700
Connection ~ 2050 3700
Wire Wire Line
	2050 4200 2350 4200
Connection ~ 2200 4200
Wire Wire Line
	9750 1600 10100 1600
$Comp
L GND #PWR021
U 1 1 5A0B1423
P 9750 1700
F 0 "#PWR021" H 9750 1450 50  0001 C CNN
F 1 "GND" H 9750 1550 50  0000 C CNN
F 2 "" H 9750 1700 50  0001 C CNN
F 3 "" H 9750 1700 50  0001 C CNN
	1    9750 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 1700 9750 1600
Wire Wire Line
	9750 1300 10100 1300
$Comp
L Conn_01x04 J3
U 1 1 5A075FF1
P 6850 3050
F 0 "J3" H 6850 3250 50  0000 C CNN
F 1 "Conn_MC" H 6850 2750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 6850 3050 50  0001 C CNN
F 3 "" H 6850 3050 50  0001 C CNN
	1    6850 3050
	0    1    1    0   
$EndComp
$Comp
L Conn_01x06 J1
U 1 1 5A076066
P 1000 2000
F 0 "J1" H 1000 2300 50  0000 C CNN
F 1 "Conn_SERIAL" H 1000 1600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06_Pitch2.54mm" H 1000 2000 50  0001 C CNN
F 3 "" H 1000 2000 50  0001 C CNN
	1    1000 2000
	-1   0    0    -1  
$EndComp
$Comp
L Conn_01x04 J2
U 1 1 5A0766AE
P 6050 3600
F 0 "J2" H 6050 3800 50  0000 C CNN
F 1 "Conn_I2C" H 6050 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 6050 3600 50  0001 C CNN
F 3 "" H 6050 3600 50  0001 C CNN
	1    6050 3600
	1    0    0    -1  
$EndComp
$Comp
L MAX471 U3
U 1 1 5A07A28D
P 9350 1100
F 0 "U3" H 9050 1450 50  0000 L CNN
F 1 "MAX471" H 9350 1450 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 9350 1100 50  0001 C CNN
F 3 "" H 9350 1100 50  0001 C CNN
	1    9350 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 5A07A542
P 8950 1500
F 0 "#PWR022" H 8950 1250 50  0001 C CNN
F 1 "GND" H 8950 1350 50  0000 C CNN
F 2 "" H 8950 1500 50  0001 C CNN
F 3 "" H 8950 1500 50  0001 C CNN
	1    8950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 1200 8950 1500
Wire Wire Line
	8950 1500 9350 1500
Text Label 10100 1300 0    60   ~ 0
15
Text Label 7100 4100 2    60   ~ 0
16
$Comp
L Conn_01x04 J5
U 1 1 5A07CDBD
P 7300 4200
F 0 "J5" H 7300 4400 50  0000 C CNN
F 1 "Conn_LightSensor" H 7300 3900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 7300 4200 50  0001 C CNN
F 3 "" H 7300 4200 50  0001 C CNN
	1    7300 4200
	1    0    0    -1  
$EndComp
NoConn ~ 7100 4200
NoConn ~ 5250 4550
NoConn ~ 5250 4450
NoConn ~ 5250 4350
NoConn ~ 5250 4250
NoConn ~ 5250 4150
NoConn ~ 5250 4050
NoConn ~ 5250 3400
NoConn ~ 5250 2250
NoConn ~ 9750 1200
$Comp
L GND #PWR023
U 1 1 5A07E123
P 7100 4300
F 0 "#PWR023" H 7100 4050 50  0001 C CNN
F 1 "GND" V 7100 4150 50  0000 C CNN
F 2 "" H 7100 4300 50  0001 C CNN
F 3 "" H 7100 4300 50  0001 C CNN
	1    7100 4300
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR024
U 1 1 5A07E177
P 7100 4400
F 0 "#PWR024" H 7100 4250 50  0001 C CNN
F 1 "VCC" V 7100 4550 50  0000 C CNN
F 2 "" H 7100 4400 50  0001 C CNN
F 3 "" H 7100 4400 50  0001 C CNN
	1    7100 4400
	0    -1   -1   0   
$EndComp
$Comp
L Screw_Terminal_01x02 J6
U 1 1 5A077B74
P 8300 750
F 0 "J6" H 8300 850 50  0000 C CNN
F 1 "Screw_Terminal_12V" H 8300 550 50  0000 C CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS1.5-2pol" H 8300 750 50  0001 C CNN
F 3 "" H 8300 750 50  0001 C CNN
	1    8300 750 
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR025
U 1 1 5A077F0B
P 8100 750
F 0 "#PWR025" H 8100 600 50  0001 C CNN
F 1 "+12V" H 8100 890 50  0000 C CNN
F 2 "" H 8100 750 50  0001 C CNN
F 3 "" H 8100 750 50  0001 C CNN
	1    8100 750 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 5A077FA3
P 8100 850
F 0 "#PWR026" H 8100 600 50  0001 C CNN
F 1 "GND" H 8100 700 50  0000 C CNN
F 2 "" H 8100 850 50  0001 C CNN
F 3 "" H 8100 850 50  0001 C CNN
	1    8100 850 
	0    1    1    0   
$EndComp
$Comp
L Screw_Terminal_01x02 J4
U 1 1 5A078333
P 10850 2500
F 0 "J4" H 10850 2600 50  0000 C CNN
F 1 "Screw_Terminal_MC_PWR" H 11150 2650 50  0000 C CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS1.5-2pol" H 10850 2500 50  0001 C CNN
F 3 "" H 10850 2500 50  0001 C CNN
	1    10850 2500
	1    0    0    1   
$EndComp
$Comp
L Fuse F1
U 1 1 5A079565
P 10500 2400
F 0 "F1" V 10580 2400 50  0000 C CNN
F 1 "1A" V 10425 2400 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" V 10430 2400 50  0001 C CNN
F 3 "" H 10500 2400 50  0001 C CNN
	1    10500 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	10650 2500 9750 2500
Wire Wire Line
	9750 2500 9750 2450
$Comp
L GND #PWR027
U 1 1 5A079839
P 9750 2500
F 0 "#PWR027" H 9750 2250 50  0001 C CNN
F 1 "GND" H 9750 2350 50  0000 C CNN
F 2 "" H 9750 2500 50  0001 C CNN
F 3 "" H 9750 2500 50  0001 C CNN
	1    9750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2550 3050 2550
$Comp
L C C8
U 1 1 5A0E343C
P 3050 2700
F 0 "C8" H 3075 2800 50  0000 L CNN
F 1 "100uF" H 3075 2600 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 3088 2550 50  0001 C CNN
F 3 "" H 3050 2700 50  0001 C CNN
	1    3050 2700
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 5A10A2A2
P 7400 3300
F 0 "R8" V 7480 3300 50  0000 C CNN
F 1 "300R" V 7400 3300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 7330 3300 50  0001 C CNN
F 3 "" H 7400 3300 50  0001 C CNN
	1    7400 3300
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 5A10BC5D
P 7600 2250
F 0 "C5" H 7625 2350 50  0000 L CNN
F 1 "100nF" V 7550 1950 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 7638 2100 50  0001 C CNN
F 3 "" H 7600 2250 50  0001 C CNN
	1    7600 2250
	0    1    1    0   
$EndComp
Text Label 5250 3700 0    60   ~ 0
ATM_RES
Text Label 2150 2300 0    60   ~ 0
ATM_RES
Wire Wire Line
	1900 2300 2150 2300
$Comp
L SW_Push SW7
U 1 1 5A123275
P 2000 2600
F 0 "SW7" H 2050 2700 50  0000 L CNN
F 1 "SW_ATMRES" H 2000 2540 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 2000 2800 50  0001 C CNN
F 3 "" H 2000 2800 50  0001 C CNN
	1    2000 2600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR028
U 1 1 5A12354C
P 2000 2800
F 0 "#PWR028" H 2000 2550 50  0001 C CNN
F 1 "GND" H 2000 2650 50  0000 C CNN
F 2 "" H 2000 2800 50  0001 C CNN
F 3 "" H 2000 2800 50  0001 C CNN
	1    2000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2300 2000 2400
$Comp
L C C9
U 1 1 5A12394F
P 1750 2300
F 0 "C9" H 1775 2400 50  0000 L CNN
F 1 "100nF" H 1775 2200 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1788 2150 50  0001 C CNN
F 3 "" H 1750 2300 50  0001 C CNN
	1    1750 2300
	0    1    1    0   
$EndComp
Connection ~ 2000 2300
Wire Wire Line
	1200 2300 1600 2300
$EndSCHEMATC