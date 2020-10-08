LXI H,2500H; Store 2500H in HL register Pair, pointing N numbers

MVI C, 00H;  Initiate Carry count
LDA 2200H; loading N into Accumulator

MOV B, A; Move N to B register

XRA A; Exclusive OR Accumulator with itself to clear it's value

LOOP1: ADD M; Add Content of Memory location pointed by HL pair

DAA;  Decimal adjust after addition for BCD conversion

JNC NOCARRY; Check if carry generated
INR C; 
NOCARRY: INX H; Increment the HL pair( Extended register pair).
DCR B; Decrement the N by 1
JNZ LOOP1; If Zero flag is set, i.e. N is zero, we are done adding.

STA 2300H; Store Sum into 2300H
MOV A,C; 

STA 2301H; Store Carry into 2301H
HLT;
