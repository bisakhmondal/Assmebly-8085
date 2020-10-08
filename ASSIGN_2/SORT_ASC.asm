LDA 204FH;

MOV C,A;
DCR C;
MVI B,00H;

LOOP: LXI H, 2050H; first pointer
DAD B; moving to second pointer

;count 2nd loop iter
MOV D, C;
DCR D;

MOV A,M;
INX H;

LOOP2: CMP M;

JC AISNOTGREATER
MOV E,A;
MOV A, M;
MOV M,E;
AISNOTGREATER: INX H;
DCR D;
JNZ LOOP2;

LXI H, 2050H; first pointer
DAD B;
STA 2057H;
MOV M,A;
INR B;
DCR C;
JNZ LOOP;

HLT;
