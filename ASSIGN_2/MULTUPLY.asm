LHLD 2050H; Load HL pair with direct addressing from memory 2050H (the 2 numbers)

MVI A, 00H; initiating accumulator with 0 to store the mul
MOV D, L; for Subsequent adding (as No Multiplication is supported in 8085)
MVI C,00H; Initiating the Carry count

LOOP1: ADD D; Add D with Accumulator
JNC NOCARRY; Check if carry is generated.
INR C; Increase Carry count
NOCARRY: DCR H; H contains BH ( number of times) A should be added.
JNZ LOOP1;

MOV L,A; Move Accumulator to L register
MOV H,C; Move Carry to H register

SHLD 2052H; Store to content by HL pair pointed to 2052H
HLT;
