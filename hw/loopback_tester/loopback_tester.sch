EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
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
L Connector_Generic:Conn_02x25_Odd_Even J2
U 1 1 5EF63F70
P 3550 2100
F 0 "J2" H 3600 675 50  0000 C CNN
F 1 "Conn_02x25_Odd_Even" H 3600 766 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 3550 2100 50  0001 C CNN
F 3 "~" H 3550 2100 50  0001 C CNN
F 4 "C40024" H 3550 2100 50  0001 C CNN "LCSC"
	1    3550 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 2400 2350 2300
Wire Wire Line
	2350 2400 2450 2400
Wire Wire Line
	2450 2400 2450 2300
Wire Wire Line
	2450 2400 2550 2400
Wire Wire Line
	2550 2400 2550 2300
Connection ~ 2450 2400
Wire Wire Line
	2550 2400 2650 2400
Wire Wire Line
	2650 2400 2650 2300
Connection ~ 2550 2400
Wire Wire Line
	2650 2400 2750 2400
Wire Wire Line
	2750 2400 2750 2300
Connection ~ 2650 2400
Wire Wire Line
	2750 2400 2850 2400
Wire Wire Line
	2850 2400 2850 2300
Connection ~ 2750 2400
Wire Wire Line
	2850 2400 2950 2400
Wire Wire Line
	2950 2400 2950 2300
Connection ~ 2850 2400
Wire Wire Line
	2950 2400 3050 2400
Wire Wire Line
	3050 2400 3050 2300
Connection ~ 2950 2400
Wire Wire Line
	3050 2400 3150 2400
Wire Wire Line
	3150 2400 3150 2300
Connection ~ 3050 2400
Wire Wire Line
	3150 2400 3250 2400
Wire Wire Line
	3250 2400 3250 2300
Connection ~ 3150 2400
Wire Wire Line
	3250 2400 3350 2400
Wire Wire Line
	3350 2400 3350 2300
Connection ~ 3250 2400
Wire Wire Line
	3350 2400 3450 2400
Wire Wire Line
	3450 2400 3450 2300
Connection ~ 3350 2400
Wire Wire Line
	3450 2400 3650 2400
Wire Wire Line
	3650 2400 3650 2300
Connection ~ 3450 2400
Wire Wire Line
	3650 2400 3750 2400
Wire Wire Line
	3750 2400 3750 2300
Connection ~ 3650 2400
Wire Wire Line
	3750 2400 3850 2400
Wire Wire Line
	3850 2400 3850 2300
Connection ~ 3750 2400
Wire Wire Line
	3850 2400 3950 2400
Wire Wire Line
	3950 2400 3950 2300
Connection ~ 3850 2400
Wire Wire Line
	3950 2400 4050 2400
Wire Wire Line
	4050 2400 4050 2300
Connection ~ 3950 2400
Wire Wire Line
	4050 2400 4150 2400
Wire Wire Line
	4150 2400 4150 2300
Connection ~ 4050 2400
Wire Wire Line
	4150 2400 4250 2400
Wire Wire Line
	4250 2400 4250 2300
Connection ~ 4150 2400
Wire Wire Line
	4250 2400 4350 2400
Wire Wire Line
	4350 2400 4350 2300
Connection ~ 4250 2400
Wire Wire Line
	4350 2400 4450 2400
Wire Wire Line
	4450 2400 4450 2300
Connection ~ 4350 2400
Wire Wire Line
	4450 2400 4550 2400
Wire Wire Line
	4550 2400 4550 2300
Connection ~ 4450 2400
Wire Wire Line
	4550 2400 4650 2400
Wire Wire Line
	4650 2400 4650 2300
Connection ~ 4550 2400
Wire Wire Line
	4650 2400 4750 2400
Wire Wire Line
	4750 2400 4750 2300
Connection ~ 4650 2400
Text GLabel 2350 1800 1    50   BiDi ~ 0
C-D0
Text GLabel 2450 1800 1    50   BiDi ~ 0
C-D1
Text GLabel 2550 1800 1    50   BiDi ~ 0
C-D2
Text GLabel 2650 1800 1    50   BiDi ~ 0
C-D3
Text GLabel 2750 1800 1    50   BiDi ~ 0
C-D4
Text GLabel 2850 1800 1    50   BiDi ~ 0
C-D5
Text GLabel 2950 1800 1    50   BiDi ~ 0
C-D6
Text GLabel 3050 1800 1    50   BiDi ~ 0
C-D7
Text GLabel 3150 1800 1    50   BiDi ~ 0
C-DP
Text GLabel 3250 1800 1    50   BiDi ~ 0
GND
Text GLabel 3350 1800 1    50   BiDi ~ 0
GND
Text GLabel 3450 1800 1    50   BiDi ~ 0
GND
Text GLabel 3650 1800 1    50   BiDi ~ 0
GND
Text GLabel 3750 1800 1    50   BiDi ~ 0
GND
Text GLabel 3850 1800 1    50   BiDi ~ 0
C-ATN
Text GLabel 4050 1800 1    50   BiDi ~ 0
C-BSY
Text GLabel 4150 1800 1    50   BiDi ~ 0
C-ACK
Text GLabel 4250 1800 1    50   BiDi ~ 0
C-RST
Text GLabel 4350 1800 1    50   BiDi ~ 0
C-MSG
Text GLabel 4450 1800 1    50   BiDi ~ 0
C-SEL
Text GLabel 4550 1800 1    50   BiDi ~ 0
C-C_D
Text GLabel 4650 1800 1    50   BiDi ~ 0
C-REQ
Text GLabel 4750 1800 1    50   BiDi ~ 0
C-I_O
NoConn ~ 3550 2300
NoConn ~ 3950 1800
Wire Notes Line
	2000 4900 3900 4900
Text Notes 2100 4850 0    50   ~ 0
DB-25 SCSI Connector
Text Notes 2150 2650 0    50   ~ 0
SCSI Ribbon Cable
Wire Notes Line
	2000 1300 5250 1300
$Comp
L power:GND #PWR09
U 1 1 5F3086C0
P 4750 2400
F 0 "#PWR09" H 4750 2150 50  0001 C CNN
F 1 "GND" H 4755 2227 50  0000 C CNN
F 2 "" H 4750 2400 50  0001 C CNN
F 3 "" H 4750 2400 50  0001 C CNN
	1    4750 2400
	1    0    0    -1  
$EndComp
Connection ~ 4750 2400
Text GLabel 2400 3900 0    50   BiDi ~ 0
C-D0
Text GLabel 3400 3900 2    50   BiDi ~ 0
C-D1
Text GLabel 3400 4000 2    50   BiDi ~ 0
C-D2
Text GLabel 2400 4100 0    50   BiDi ~ 0
C-D3
Text GLabel 3400 4100 2    50   BiDi ~ 0
C-D4
Text GLabel 2400 4200 0    50   BiDi ~ 0
C-D5
Text GLabel 2400 4300 0    50   BiDi ~ 0
C-D6
Text GLabel 2400 4400 0    50   BiDi ~ 0
C-D7
Text GLabel 3400 3800 2    50   BiDi ~ 0
C-DP
Text GLabel 3400 3500 2    50   BiDi ~ 0
C-ATN
Text GLabel 2400 3700 0    50   BiDi ~ 0
C-BSY
Text GLabel 2400 3600 0    50   BiDi ~ 0
C-ACK
Text GLabel 2400 3500 0    50   BiDi ~ 0
C-RST
Text GLabel 2400 3300 0    50   BiDi ~ 0
C-MSG
Text GLabel 3400 3700 2    50   BiDi ~ 0
C-SEL
Text GLabel 3400 3300 2    50   BiDi ~ 0
C-C_D
Text GLabel 2400 3200 0    50   BiDi ~ 0
C-REQ
Text GLabel 2400 3400 0    50   BiDi ~ 0
C-I_O
Text GLabel 3400 4300 2    50   BiDi ~ 0
TERMPOW
$Comp
L power:GND #PWR04
U 1 1 5F436924
P 2900 4700
F 0 "#PWR04" H 2900 4450 50  0001 C CNN
F 1 "GND" V 2905 4572 50  0000 R CNN
F 2 "" H 2900 4700 50  0001 C CNN
F 3 "" H 2900 4700 50  0001 C CNN
	1    2900 4700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F460701
P 3400 3200
F 0 "#PWR05" H 3400 2950 50  0001 C CNN
F 1 "GND" V 3405 3072 50  0000 R CNN
F 2 "" H 3400 3200 50  0001 C CNN
F 3 "" H 3400 3200 50  0001 C CNN
	1    3400 3200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F460CF4
P 3400 3400
F 0 "#PWR06" H 3400 3150 50  0001 C CNN
F 1 "GND" V 3405 3272 50  0000 R CNN
F 2 "" H 3400 3400 50  0001 C CNN
F 3 "" H 3400 3400 50  0001 C CNN
	1    3400 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F460F07
P 3400 3600
F 0 "#PWR07" H 3400 3350 50  0001 C CNN
F 1 "GND" V 3405 3472 50  0000 R CNN
F 2 "" H 3400 3600 50  0001 C CNN
F 3 "" H 3400 3600 50  0001 C CNN
	1    3400 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F46110C
P 2400 3800
F 0 "#PWR01" H 2400 3550 50  0001 C CNN
F 1 "GND" V 2405 3672 50  0000 R CNN
F 2 "" H 2400 3800 50  0001 C CNN
F 3 "" H 2400 3800 50  0001 C CNN
	1    2400 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F4617B9
P 2400 4000
F 0 "#PWR02" H 2400 3750 50  0001 C CNN
F 1 "GND" V 2405 3872 50  0000 R CNN
F 2 "" H 2400 4000 50  0001 C CNN
F 3 "" H 2400 4000 50  0001 C CNN
	1    2400 4000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5F461986
P 3400 4200
F 0 "#PWR08" H 3400 3950 50  0001 C CNN
F 1 "GND" V 3405 4072 50  0000 R CNN
F 2 "" H 3400 4200 50  0001 C CNN
F 3 "" H 3400 4200 50  0001 C CNN
	1    3400 4200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F462686
P 2900 2900
F 0 "#PWR03" H 2900 2650 50  0001 C CNN
F 1 "GND" V 2905 2772 50  0000 R CNN
F 2 "" H 2900 2900 50  0001 C CNN
F 3 "" H 2900 2900 50  0001 C CNN
	1    2900 2900
	0    -1   -1   0   
$EndComp
$Comp
L SamacSys_Parts:Logo X1
U 1 1 5EFCC51E
P 2250 6100
F 0 "X1" H 2100 6200 50  0000 L CNN
F 1 "Mac" H 2300 6200 50  0000 L CNN
F 2 "SamacSys_Parts:mac_happy_small" H 2250 6100 50  0001 C CNN
F 3 "" H 2250 6100 50  0001 C CNN
	1    2250 6100
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:Logo X2
U 1 1 5EFCD6CA
P 2250 6200
F 0 "X2" H 2100 6300 50  0000 L CNN
F 1 "Dogcow" H 2300 6300 50  0000 L CNN
F 2 "SamacSys_Parts:dogcow" H 2250 6200 50  0001 C CNN
F 3 "" H 2250 6200 50  0001 C CNN
	1    2250 6200
	1    0    0    -1  
$EndComp
Wire Notes Line
	2000 5900 3900 5900
Wire Notes Line
	3900 6450 2000 6450
Text Notes 2050 6400 0    50   ~ 0
Images
$Comp
L SamacSys_Parts:L717SDB25PA4CH4F J1
U 1 1 5FA017A4
P 2900 2900
F 0 "J1" V 2719 2900 50  0000 C CNN
F 1 "CONFLY DB25" V 2810 2900 50  0000 C CNN
F 2 "L717SDB25PA4CH4F" H 4550 3200 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/L717SDB25PA4CH4F.pdf" H 4550 3100 50  0001 L CNN
F 4 "D-Sub Standard Connectors 25P Size B Stamped Male DSub Contact SD" H 4550 3000 50  0001 L CNN "Description"
F 5 "12.55" H 4550 2900 50  0001 L CNN "Height"
F 6 "523-L717SDB25PA4CH4F" H 4550 2800 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=523-L717SDB25PA4CH4F" H 4550 2700 50  0001 L CNN "Mouser Price/Stock"
F 8 "Amphenol" H 4550 2600 50  0001 L CNN "Manufacturer_Name"
F 9 "L717SDB25PA4CH4F" H 4550 2500 50  0001 L CNN "Manufacturer_Part_Number"
F 10 "C77838" V 2900 2900 50  0001 C CNN "LCSC"
	1    2900 2900
	0    -1   1    0   
$EndComp
Text Notes 6750 7760 0    87   ~ 17
RaSCSI Daisy Chain Board
Text Notes 9900 7890 0    79   ~ 16
2.2
Text Notes 7450 7870 0    59   ~ 12
19-Aug-2020
Wire Notes Line
	2000 2700 5250 2700
Text GLabel 3550 1800 1    50   BiDi ~ 0
TERMPOW
Wire Notes Line
	5250 1300 5250 2700
Text GLabel 5900 3800 0    50   BiDi ~ 0
C-D0
Text GLabel 5900 4850 0    50   BiDi ~ 0
C-D3
Text GLabel 5900 5550 0    50   BiDi ~ 0
C-D5
Text GLabel 5900 5900 0    50   BiDi ~ 0
C-D6
Text GLabel 5900 6250 0    50   BiDi ~ 0
C-D7
Text GLabel 6900 3450 2    50   BiDi ~ 0
C-BSY
Text GLabel 6900 3800 2    50   BiDi ~ 0
C-ACK
Text GLabel 6900 4850 2    50   BiDi ~ 0
C-RST
Text GLabel 6900 5900 2    50   BiDi ~ 0
C-MSG
Text GLabel 6900 6250 2    50   BiDi ~ 0
C-REQ
Text GLabel 6900 5550 2    50   BiDi ~ 0
C-I_O
Text GLabel 5900 4150 0    50   BiDi ~ 0
C-D1
Text GLabel 5900 4500 0    50   BiDi ~ 0
C-D2
Text GLabel 5900 5200 0    50   BiDi ~ 0
C-D4
Text GLabel 5900 3450 0    50   BiDi ~ 0
C-DP
Text GLabel 6900 4500 2    50   BiDi ~ 0
C-ATN
Text GLabel 6900 4150 2    50   BiDi ~ 0
C-SEL
Text GLabel 6900 5200 2    50   BiDi ~ 0
C-C_D
Wire Wire Line
	5900 6250 6050 6250
Wire Wire Line
	5900 5900 6050 5900
Wire Wire Line
	5900 5550 6050 5550
Wire Wire Line
	5900 5200 6050 5200
Wire Wire Line
	5900 4850 6050 4850
Wire Wire Line
	5900 4500 6050 4500
Wire Wire Line
	5900 4150 6050 4150
Wire Wire Line
	5900 3450 6050 3450
$Comp
L Device:R_Small R1
U 1 1 60ABA354
P 7500 2550
F 0 "R1" H 7559 2596 50  0000 L CNN
F 1 "1k" H 7559 2505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 7500 2550 50  0001 C CNN
F 3 "~" H 7500 2550 50  0001 C CNN
F 4 "C17513" H 7500 2550 50  0001 C CNN "LCSC"
	1    7500 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 60ABA82D
P 7500 2850
F 0 "D1" V 7546 2780 50  0000 R CNN
F 1 "Green" V 7455 2780 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 7500 2850 50  0001 C CNN
F 3 "~" V 7500 2850 50  0001 C CNN
F 4 "C2297" V 7500 2850 50  0001 C CNN "LCSC"
	1    7500 2850
	0    -1   -1   0   
$EndComp
Text GLabel 7500 2200 0    50   BiDi ~ 0
TERMPOW
$Comp
L power:GND #PWR010
U 1 1 60ABC7DD
P 7500 3050
F 0 "#PWR010" H 7500 2800 50  0001 C CNN
F 1 "GND" V 7505 2922 50  0000 R CNN
F 2 "" H 7500 3050 50  0001 C CNN
F 3 "" H 7500 3050 50  0001 C CNN
	1    7500 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2200 7500 2450
Wire Wire Line
	7500 2650 7500 2750
Wire Wire Line
	7500 2950 7500 3050
Wire Notes Line
	2000 1300 2000 6450
Wire Notes Line
	3900 6450 3900 2700
$Comp
L Device:Jumper JP1
U 1 1 60AAED79
P 6350 3450
F 0 "JP1" H 6350 3714 50  0000 C CNN
F 1 "Jumper" H 6350 3623 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 3450 50  0001 C CNN
F 3 "~" H 6350 3450 50  0001 C CNN
	1    6350 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP2
U 1 1 60AB214C
P 6350 3800
F 0 "JP2" H 6350 4064 50  0000 C CNN
F 1 "Jumper" H 6350 3973 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 3800 50  0001 C CNN
F 3 "~" H 6350 3800 50  0001 C CNN
	1    6350 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP3
U 1 1 60AB2D71
P 6350 4150
F 0 "JP3" H 6350 4414 50  0000 C CNN
F 1 "Jumper" H 6350 4323 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 4150 50  0001 C CNN
F 3 "~" H 6350 4150 50  0001 C CNN
	1    6350 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP4
U 1 1 60AB396E
P 6350 4500
F 0 "JP4" H 6350 4764 50  0000 C CNN
F 1 "Jumper" H 6350 4673 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 4500 50  0001 C CNN
F 3 "~" H 6350 4500 50  0001 C CNN
	1    6350 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP5
U 1 1 60AB4643
P 6350 4850
F 0 "JP5" H 6350 5114 50  0000 C CNN
F 1 "Jumper" H 6350 5023 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 4850 50  0001 C CNN
F 3 "~" H 6350 4850 50  0001 C CNN
	1    6350 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP6
U 1 1 60AB5236
P 6350 5200
F 0 "JP6" H 6350 5464 50  0000 C CNN
F 1 "Jumper" H 6350 5373 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 5200 50  0001 C CNN
F 3 "~" H 6350 5200 50  0001 C CNN
	1    6350 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP7
U 1 1 60AB5E2E
P 6350 5550
F 0 "JP7" H 6350 5814 50  0000 C CNN
F 1 "Jumper" H 6350 5723 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 5550 50  0001 C CNN
F 3 "~" H 6350 5550 50  0001 C CNN
	1    6350 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP8
U 1 1 60AB6A41
P 6350 5900
F 0 "JP8" H 6350 6164 50  0000 C CNN
F 1 "Jumper" H 6350 6073 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 5900 50  0001 C CNN
F 3 "~" H 6350 5900 50  0001 C CNN
	1    6350 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP9
U 1 1 60AB7793
P 6350 6250
F 0 "JP9" H 6350 6514 50  0000 C CNN
F 1 "Jumper" H 6350 6423 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 6350 6250 50  0001 C CNN
F 3 "~" H 6350 6250 50  0001 C CNN
	1    6350 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3800 6050 3800
Wire Wire Line
	6650 3450 6900 3450
Wire Wire Line
	6650 3800 6900 3800
Wire Wire Line
	6650 4150 6900 4150
Wire Wire Line
	6650 4500 6900 4500
Wire Wire Line
	6650 4850 6900 4850
Wire Wire Line
	6650 5200 6900 5200
Wire Wire Line
	6900 5900 6650 5900
Wire Wire Line
	6650 6250 6900 6250
Wire Wire Line
	6650 5550 6900 5550
$EndSCHEMATC
