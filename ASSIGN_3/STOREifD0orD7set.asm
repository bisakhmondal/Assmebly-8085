LXI H, 2500H; Store the starting address 2500H in HL register pair. 
MOV D, M; Move the Content pointed by HL pair to D register. (N)

INX H; Increment H, The consecutive numbers.
LXI B, 2600H; Store the starting address 2600H in BC register pair. 

LOOP: MOV A, M; Move the the value (HL) into Accumulator.
ANI 081H; AND Immediate with 81H i.e 128+1 (D7 and D0 set bit)

JZ NOSETBIT; If zero flag is set then neither two bits were set.

; If Not store the value into memory location pointed by BC pair
MOV A, M;
STAX B;
INX B

NOSETBIT: INX H; Increment H
DCR D; Decrease D
JNZ LOOP; Zero FLag Set, close loop

HLT