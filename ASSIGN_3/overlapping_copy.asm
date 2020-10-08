LXI H, 2200H; Store the location 1 into HL register pair.
LXI D, 2204H; Store the location 2 into DE register pair.

LDA 201EH; Load N (number of bytes) in Accumulator.
MOV C, A; Move N (bytes data) to C register.
MVI B,00H; Clearing B with 00 for DAD.

DAD B; shifting HL pair to N bytes ( Double Add)
XCHG; Interchange HL and DE pair contents
DAD B; Shifting
XCHG; re interchange

;approach, copy from end to start to rewrite the overlap.
; but both HL pair & DL pair points required loc +1
DCX H;
DCX D;

;copying from the end to the start.
LOOP: MOV A, M;
STAX D;
DCX H;
DCX D;
DCR C;
JNZ LOOP;
; copy Done.
HLT;

