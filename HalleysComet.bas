



       10 REM ** Halley`s Comet MkII **
       20 REM ** By P Hutchison 27/1/86 **
       30 REM
       40 REM >> Initialise <<
       50 CALL SCREEN(4):: CALL CLEAR
       60 PRINT "PLEASE WAIT...": :
       70 DIM L$(73,2),I$(29)
       80 F$=RPT$("0",16)
       90 DEF SET$(FLAG)=SEG$(F$,1,FLAG-1)&"1"&SEG$(F$,FLAG+1,16-FLAG)
       100 DEF TST(FLAG)=VAL(SEG$(F$,FLAG,1))
       110 DEF DIR(POSN)=VAL(SEG$(L$(L,1),POSN,2))
       120 MINS,DEAD=0 :: HOUR=3 :: L=6 :: RESTORE 1280
       130 FOR C=1 TO 73 :: READ L$(C,1),L$(C,2):: NEXT C
       140 FOR C=1 TO 29 :: READ I$(C):: NEXT C
       170 REM >> Main Program <<
       180 IF DEAD OR HOUR=12 THEN END
       190 PRINT :L$(L,2):"Possible routes are :-"
       200 IF DIR(1)THEN PRINT "North ":
       210 IF DIR(2)THEN PRINT "South ":
       220 IF DIR(3)THEN PRINT "West ":
       230 IF DIR(4)THEN PRINT "East ":
       240 PRINT :: INPUT ">":C1$ :: C$=""
       250 FOR C=1 TO LEN(C1$)
       260 CH$=SEG$(C$,C,1):: IF CH$>="A" AND CH$<="Z" THEN C$=C$+CHR$(ASC(C
       H$)+32)ELSE C$=C$+CH$
       270 NEXT C
       280 REM
       290 REM
       300 OB$="" :: SPC=POS(C$," ",1)! Get object
       310 IF SPC THEN OB$=SEG$(C$,SPC+1,LEN(C$)=SPC):: C$=SEG$(C$,1,SPC-1)
       320 FOUND=0
       330 FOR C=1 TO 29
       340 IF SEG$(I$(C),1,LEN(C$))=C$ THEN FOUND=C :: C=29
       350 NEXT C
       360 IF FOUND=0 THEN PRINT "Pardon?" :: GOTO 240
       370 IF FOUND>14 THEN 400
       380 ON FOUND GOSUB 420,450,480,520,560,610,560,610,660,660,710,710,71
       0
       390 GOTO 180
       400 ON FOUND-14 GOSUB 740,740,850,850,850,900,970,990,1020,1020,1060,
       1090,1130,1130,1170
       410 GOTO 180
       420 IF DIR(1)=0 THEN 550
       430 L=DIR(1):: TIME=5 :: GOSUB 1690 :: RETURN
       440 REM
       450 IF DIR(3)=0 OR L=61 AND TST(15)=0 OR L=70 AND TST(16)=0 THEN 550
       460 L=DIR(3):: TIME=5 :: GOSUB 1690 :: RETURN
       470 REM
       480 IF DIR(5)=0 THEN 550
       490 IF DIR(5)=7 THEN PRINT L$(7,2):: DEAD=1 :: RETURN
       500 L=DIR(5):: TIME=5 :: GOSUB 1690 :: RETURN
       510 REM
       520 IF DIR(7)=0 OR L=15 AND TEST(10)=0 OR L=28 AND TST(12)=0 OR L=70 
       AND TST(16)=0 OR L=30 AND TST(11)=0 THEN 550
       530 L=DIR(7):: TIME=5 :: GOSUB 1690 :: RETURN
       540 REM
       550 PRINT "This way is blocked!" :: RETURN
       560 TIME=7 :: GOSUB 1690
       570 IF (L=52 OR L=57)AND TST(9)THEN PRINT "You climb out of the quarr
       y using the rope." :: L=L-1 :: RETURN
       580 IF L=52 AND TST(9)=0 THEN PRINT "You climb the ladder but it brea
       ks & you fall to your    death!" :: DEAD=1 :: RETURN
       590 IF L=9 THEN PRINT "You climb the stairs up onto the balcony." :: 
       L=4 :: RETURN
       600 PRINT "There is nothing to climb   here!" :: RETURN
       610 TIME=7 :: GOSUB 1690
       620 IF L=4 THEN PRINT "You descend to the ground   floor." :: L=9 :: 
       RETURN
       630 IF (L=51 OR L=56)AND TST(9)THEN PRINT "You climb into the quarry 
       using the rope!" :: L=L+1 :: RETURN
       640 IF L=51 AND TST(9)=0 THEN PRINT "You climb down the ladder   but 
       it breaks & you falll to your death!" :: DEAD=1 :: RETURN
       650 PRINT "You cannot go down here!" :: RETURN
       660 TIME=2 :: GOSUB 1690
       670 IF L=15 AND TST(1)AND(OB$="door" OR OB$="house")THEN PRINT "The d
       oor opens with a creak." :: F$=SET$(10):: RETURN


       680 IF L=20 AND OB$="safe" THEN PRINT "You twiddle with it but the al
       arm goes off, the owner   catches you." :: DEAD=1 :: RETURN
       690 IF L=28 AND TST(3)THEN PRINT "You insert the card and the gate op
       ens." :: F$=SET$(12):: RETURN
       700 PRINT "What is there to open?" :: RETURN
       710 IF L=39 AND TST(6)AND OB$="tyre" THEN PRINT "You jack up the lorr
       y & fix it,the driver rewards you." :: F$=SET$(5):: RETURN
       720 PRINT "There is nothing to fix." :: RETURN
       740 IF L=1 AND OB$="key" THEN F$=SET$(1):: GOTO 840
       750 IF L=8 AND OB$="jack" THEN F$=SET$(6):: GOTO 840
       760 IF L=10 AND OB$="mirror" THEN F$=SET$(2):: GOTO 840
       770 IF L=16 AND OB$="card" THEN F$=SET$(3):: GOTO 840
       780 IF L=17 AND OB$="meat" THEN F$=SET$(4):: GOTO 840
       790 IF L=31 AND OB$="axe" AND TST(13)THEN F$=SET$(7):: GOTO 840
       800 IF L=35 AND OB$="crystal" AND TST(14)THEN F$=SET$(8):: GOTO 840
       810 IF L=49 AND OB$="rope" THEN F$=SET$(9):: GOTO 840
       820 IF L=49 AND OB$="money" THEN PRINT "You take the money but its  o
       wner comes in and bashes   you." :: DEAD=1 :: RETURN
       830 PRINT "That can't be taken." :: RETURN
       840 PRINT "You put the ";OB$;" in your backpack." :: TIME=1 :: GOSUB 
       1690 :: RETURN
       850 TIME=3 :: GOSUB 1690
       860 IF L=30 AND OB$="dogs" THEN PRINT "You attack them but they overw
       helm you & kill you." :: DEAD=1 :: RETURN
       870 IF L=70 AND OB$="druid" AND TST(2)THEN PRINT "You attack him but 
       he casts a spell but it bounces off  your mirror, killing him!" :: F$
       =SET$(16):: RETURN
       890 PRINT "You can't kill that, silly!" :: RETURN
       900 TIME=1 :: GOSUB 1690
       910 IF L=1 AND OB$="desk" THEN PRINT "Amongst the papers and      dra
       wings you find a key." :: RETURN
       920 IF L=8 AND(OB$="car" OR OB$="boot")THEN PRINT "Inside the boot yo
       u find an id card." :: RETURN
       930 IF L=16 AND OB$="coat" THEN PRINT "Inside a pocket you find an ID
        card." :: RETURN
       940 IF L=20 AND OB$="picture" THEN PRINT "Behind the picture you find
        a safe." :: RETURN
       950 IF (L=51 OR L=52)AND OB$="ladder" THEN PRINT "The ladder is wet a
       nd old." :: RETURN
       960 PRINT "You see a ";OB$ :: RETURN
       970 PRINT USING "On your watch it says ##:##":HOURS,MINS :: RETURN
       980 REM
       990 TIME=1 :: GOSUB 1690
       1000 IF L=28 AND OB$="card" AND TST(3)THEN PRINT "The gates swing ope
       n auto-  matically." :: F$=SET$(12):: RETURN
       1010 PRINT "Insert what?" :: RETURN
       1020 TIME=1 :: GOSUB 1690
       1030 IF L=73 AND OB$="crystal" AND TST(8)THEN 1040 ELSE PRINT "You ca
       n`t put it here!" :: RETURN
       1040 PRINT TAB(4):"**CONGRATULATIONS**":"The evil Sauron has fled and
        Halley`s Comet passes gloriously overhead."
       1050 HOUR=12 :: RETURN
       1060 TIME=1 :: GOSUB 1690
       1070 IF L=61 AND OB$="toll" AND TST(5)THEN PRINT "You give the money 
       to the man `you may cross, Sir." :: F$=SET$(15):: RETURN
       1080 PRINT "You have nothing to give!" :: RETURN
       1090 TIME=1 :: GOSUB 1690
       1100 IF L=30 AND OB$="meat" AND TST(4)THEN PRINT "The dogs happily ch
       ew at it totally ignoring you!" :: F$=SET$(11):: RETURN