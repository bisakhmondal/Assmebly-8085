LOOP: LXI H, 204FH; Store 204FH in HL register pair, the m/m location where consecutive numbers are stored along with N.
MOV C,M; Move the number of elements(N) to C register.
INX H;  Increment the HL pair( Extended register pair)
DCR C; Decrease N by 1 to make it ready for counting.
MVI E, 00H; Register E is working somewhat like flag to check if the list got sorted or not

LOOP2: MOV A, M; Move Content pointed of HL m/m location to accumulator.
INX H; increament H
CMP M; Compare with next number ( consecuive 2 nums)

JNC AISGREATER; if carry is generated A>M

;else swapping the 2 consecutives.
MOV D, M;
MOV M,A;
DCX H;
MOV M,D;
INX H;

MVI E, 01H; Set E flag that swapping occured.
AISGREATER: DCR C; Decrease loop count.
JNZ LOOP2; if zero flag is not set continue looping.

MOV A, E;
RRC;  Right rotate accumulator;
JC LOOP; is E has 01H RRC sets the CY flag, i.e need to be traverse the list again. 
HLT;
