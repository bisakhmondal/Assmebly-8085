LDA 2500H; Load Content from 2500H into accumulator  

; fist have to achieve the binary representation of the BCD

MVI D, 00H; Most sig bit of The BCD
MOV C, A; Move hex to C reg

XRA A; Clear Accumulator

LOOP: ADI 01; ADD immediate 01 with the Accumulator for the value Stored in C

DAA; Subsequently it will convert into BCD
JNC NOCARRY;
INR D;
NOCARRY: DCR C;
JNZ LOOP;
ADD D; As a contains any overflowing bits;

;A now contains the BCD 
MOV D,A; keeping bakup due to multiple AND operation

ANI 00FH; AND operation with least 4 set bits( 0FH = 15( Decimal)= 00001111(Binary))
MOV C,A; Cache least 4 bits into C register

MOV A,D; Since content changed, load Accumulator freshly from backup

ANI 0F0H; AND immediate with F0H ie (11110000) to extract the most sig 4 bits

JZ SKIP; if zero flag is set i.e. the number is less than 32 no need to rotate the content just to get 0

RLC;
RLC;
RLC;
RLC;

SKIP: ADD C; Add 4bit MSB to 4 bit LSB 

STA 2550H; Store the result in 2550H
HLT;
