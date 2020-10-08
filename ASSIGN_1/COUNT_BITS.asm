LDA 2500H; Load accumulator with the Number.

MOV B, A; Keeping a backup in B register
MVI C, 008H; Move Immediate 08 ( the number of bits) to C

MVI D,00H; Initiating with 0 to count set bits

LOOP: ANI 001H; And operation with 01 to check the LSB is it set or not?
JZ NOSETBIT; is Zero flag is set, The the bit was not set
INR D; Increase set bit count
NOSETBIT: MOV A,B; Reloading the number to Accumulator

RLC; Rotate left accumulator by 1 bit.
MOV B,A; Store the new number to B for next use.
DCR C; Decrease counter. 
JNZ LOOP;

MVI A, 008H; For number of unset bits.
SUB D; Substract the number of set bits from a byte(8 bit)
STA 2510H; Store the unset bits count in 2610H
MOV A, D; Mov D accumulator content to Accumulator.
STA 2511H; Store set bits into 2511H

HLT;
