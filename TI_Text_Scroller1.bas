10 REM TI BASIC Text Scroller
100 H$="TI HOME COMPUTER"
110 ROW=24
120 COL=10
130 LENGTH=7
140 GOSUB 190
150 CALL CLEAR
160 FOR D=1 T0 700
170 NEXT D
180 END
182 FOR J=1 TO LENGTH
184 SP$=SP$&" "
190 NEXT J
200 M$=SP$&M$&SP$
210 FOR A=l TO LEN(M$)-LENGTH+l
220 M1$=SEG$(M$,A,LENGTH)
230 FOR B=1 TO LEN(M1$)
240 CALL HCHAR(ROW,COL+B-1,ASC(SEG$(M1$,
B,1)))
250 NEXT B
260 NEXT A
270 RETURN