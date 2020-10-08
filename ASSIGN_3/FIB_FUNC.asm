LXI H, 2060H; Store memory location 2060H in HL pair(the location contains N).

CALL FIB; The Subroutine FIB is going to be executed. 
MOV A, L; Move content of Register L to Accumulator(which got stored during function Execution).
STA 2050H; Store the Ans in 2050H
HLT ; Stop execution.

;fib function for evaluating fib sequence
FIB: MVI C, 00H; Initiate C register with 0H for fib seq calculation.
MVI D, 01H; Initiate D register with 1H for fib seq calculation.
MOV B, M; move Current N to B register.
; calculation D=C+D and C = OLD_D 
LOOP: MOV A, C; 
ADD D;
MOV C, D;
MOV D,A;
DCR B; 
JNZ LOOP; Looping till N.

MOV L,C; Loading the Ans to L register of HL Pair.
RET ; Return from Subroutine.