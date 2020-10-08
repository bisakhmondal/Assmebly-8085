LXI H, 2200H;Store the starting address 2200H in HL register pair. 

LDA 21FFH; Load Accumulator with N(number of elements)

MOV B, A; Move Acc with B, i.e loading the loop counter
MVI C, 00; For Carry
MVI D, 00; For Sum
MVI E, 081H; To compare to check if both bits are set
; 81H i.e 128+1 (D7 and D0 set bit)

LOOP: MOV A, M; Move the content pointed by HL pair to Acc
ANA E; And Immediate with 81H (reason stated above)

CMP E; Compare with 81H, if both bits are set after and Operation.
JNZ NOSETBIT; If No zero flag they are not equal
; Sum 
MOV A,D;
ADD M;
JNC NOCARRY; Checking for carry.
INR C;
NOCARRY: MOV D,A;

NOSETBIT: INX H; Increment H
DCR B; Decrase B the loop counter.

JNZ LOOP; If zero flag is set stop Looping

; Storing sum through dumping through HL pair.
MOV L, D;
MOV H, C;
SHLD 2500H;
HLT
