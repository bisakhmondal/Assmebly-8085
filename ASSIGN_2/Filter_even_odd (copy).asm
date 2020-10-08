LXI SP, 4500H; Store Stack Pointer with 4500H

LXI H, 2050H; Store 2500H in HL pair the m/m where numbers are stored.
LXI B, 2100H; For even numbers storing purpose
LXI D, 2200H; For odd numbers storing purpose

LDA 204FH; Load Accumulator with N(number of element)
PUSH PSW; Push Acc and Flags to SP, since I already exhausted all registers.

LOOP: MOV A, M; Move content of HL Pair to Accumulator.

ANI 001H; To check the LSB if zero flag is set it's even else odd.
MOV A,M; Move original content to Acc

JNZ NOTEVEN; 

; If even store it into location pointed by BC pair
STAX B;
INX B; Increment BC pair
JMP REGULAR; No need to execute the odd part, jump regular execution

; If odd store it into location pointed by DE pair
NOTEVEN: STAX D;
INX D;

;pop Proecess status word or Accumulator + Flags into the same
REGULAR: POP PSW;
INX H; Increment HL pair
DCR A; Decrease Accumulator

PUSH PSW; Repush wuth updates
JNZ LOOP; If N is not 0 keep looping.

MOV A,C;
STA 2300H; Store C, which denotes number of Even writes. 
MOV A, E;
STA 2301H; Store E, which denotes number of Even writes. 
HLT;