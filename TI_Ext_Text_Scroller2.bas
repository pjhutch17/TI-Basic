10 REM TI EXT BASIC Text Scoller
100 CALL SCROLLWORDS(24,10,7
,"TI HOME COMPUTER")
110 FOR D=1 TO 1000 :: NEXT D
120 END
130 SUB SCROLLWORDS(R,C,L,M$)
140 M$=RPT$(" ",7)&M$&RPT$(" ",7)
150 IF LEN(M$)<L THEN SUBEXIT
160 FOR A=1 TO LEN(M$)=L+1
170 DISPLAY AT(R,C)SIZE(L):S
EG$(M$,A,L)
180 FOR B=l T0 14 :: NEXT B
190 NEXT A :: SUBEND 