LXI H, 2050H;
LXI D, 2100H; For even numbers


LDA 204FH;
MOV C, A; Number of elements

MOV B,C;

LOOP: MOV A, M;
ANI 001H; to check the LSB
JNZ NOTEVEN;
MOV A,M;
STAX D;
INX D;
NOTEVEN: INX H;
DCR B;
JNZ LOOP;

LXI H, 2050H;
LXI D, 2200H; For odd numbers
MOV B,C;


LOOP1: MOV A, M;
ANI 001H; to check the LSB
JZ EVEN;
MOV A,M;
STAX D;
INX D;
EVEN: INX H;
DCR B;
JNZ LOOP1;

HLT;