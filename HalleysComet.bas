



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
       210 IF DIR(3)THEN PRINT "South ":
       220 IF DIR(5)THEN PRINT "West ":
       230 IF DIR(7)THEN PRINT "East ":
       240 PRINT :: INPUT ">":C1$ :: C$=""
       270 FOR C=1 TO LEN(C1$)
       280 CH$=SEG$(C1$,C,1):: IF CH$>="A" AND CH$<="Z" THEN C$=C$&CHR$(ASC(
       CH$)+32)ELSE C$=C$&CH$
       290 NEXT C
       300 OB$="" :: SPC=POS(C$," ",1)! Get object
       310 IF SPC THEN OB$=SEG$(C$,SPC+1,LEN(C$)-SPC):: C$=SEG$(C$,1,SPC-1)
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
       1110 IF L=61 AND OB$="money" AND TST(5)THEN PRINT "The man accepts th
       e money   and disappears." :: F$=SET$(15):: RETURN
       1120 PRINT "Give what,silly?" :: RETURN
       1130 TIME=3 :: GOSUB 1690
       1140 IF L=31 AND OB$="glass" THEN PRINT "You break the glass with a  
       nearby chair." :: F$=SET$(13):: RETURN
       1150 IF L=35 AND OB$="glass" AND TST(7)THEN PRINT "You smash the case
        with the axe, glass is everywhere!" :: F$=SET$(14):: RETURN
       1160 PRINT "It doesn`t break!" :: RETURN
       1170 RESTORE 1180 :: C=0
       1180 DATA key,mirror,card,meat,money,jack,axe,crystal,rope
       1190 REM
       1200 PRINT "You are carrying :"
       1210 FOR FLAG=1 TO 9 :: READ A$
       1220 IF TST(FLAG)THEN PRINT TAB(5);"a ";A$ :: C=C+1
       1230 NEXT FLAG
       1240 IF C=0 THEN PRINT TAB(5);"Nothing"
       1250 TIME=3 :: GOSUB 1690 :: RETURN
       1270 REM >> Location Data <<
       1280 DATA 00040002,A office with a cluttered   desk & pictures on the


        walls.,00000103
       1290 DATA On a balcony,00000200,On a balcony.,01000000,On a balcony w
       ith stairs to the south.
       1300 DATA 00100006,At the eye piece of the telescope.,00110500,Here i
       s a large telescope.,00000008
       1310 DATA "At the cliff egde, suddenly, the ground gives way & you fa
       ll!",00120709,"In a car park, a car boot is open."
       1320 DATA 00000810,"In the Observatory hall, some stairs going up.",0
       5000911
       1330 DATA Beside the telescope there`s a collection of fine mirrors.,
       06001000,Here is a large telescope.
       1340 DATA 08130000,On a steep road.,12140000,On a steep road.,1318001
       5
       1350 DATA "On a steep road, a house to the east.",00191416,A path lea
       ding to a door.,00201517
       1360 DATA "In the house`s hall, you see a coat.",00211600,"In the kit
       chen, on the table is a dish of meat.",14220000
       1370 DATA On a road.,15000000,In a beautiful garden of    roses.,1600
       0021
       1380 DATA "In the lounge, a picture of a woman hangs above the fire."
       ,17002000,In the dining room.
       1390 DATA 18240000,On a road.,00000024,On a road going towards a town
       .,22372325,At the cross roads.
       1400 DATA 00002426,On a east-west road.,00002527,On a road.,00382628,
       "On a road, there`s a path to the south."
       1410 DATA 00002729,At the gates of a Geology museum.,00002830,On a pa
       th to the Museum.,00002933
       1420 DATA "Near the gates, two watch   dogs bark ferociously at you."
       ,00000032
       1430 DATA Above a mineral display     there`s an axe in a glass   cas
       e.,00343100,The display show cases some gems!
       1440 DATA 00003034,In the museum`s entrance    hall.,32363300,There a
       re hundreds of fossils here!
       1450 DATA 00000036,At the entrance of the room there`s a glass case w
       ith a crystal in it.,34003500
       1460 DATA Here are lots of different  minerals & ores.,24390000,On a 
       N-S road.,27400000,On a narrow track.,37410000
       1470 DATA "There is a lorry here, the  driver kicks a punctured    ty
       re.",38440000,"On a track, a wood on the   south."
       1480 DATA 39470042,"On a road, a path leads to a wood.",00004143,On a
        pathway.,00484244
       1490 DATA In a dense wood.,40004345,"In a dense wood, you see    some
        bluebells.",00504446,On a pathway.,00514500
       1500 DATA At the edge of the wood.,41000000,On a road leading south.,
       43300000,There are some Holly bushes here.
       1510 DATA 00000050,"In the hut, you see a rope & some money in a jar.
       ",45554951,There`s a hut to the west.
       1520 DATA 46565000,There`s a ladder going down into a quarry.,0057000
       0,"In a quarry, you see a ladder.",48600054
       1530 DATA "In a wood, a river to the   south.",00615355,"On a pathway
       , a bridge to the south.",50625456
       1540 DATA On a pathway.,51005500,There`s a quarry to the east.,520000
       58
       1550 DATA "In a quarry, there`s a track here.",00635700,On a track go
       ing south.,00000060,At the bank of a river.
       1560 DATA 53005961,"At the river, there`s a bridge to the east.",5464
       6062
       1570 DATA "At a toll bridge, a man asks for payment.",55006100,"At th
       e river side, you see a bridge."
       1580 DATA 58650000,On a track.,61660000,"On a pathway, bridge to the 
       north.",63700000,On a track.
       1590 DATA 64000067,On a path.,00006668,On a pathway.,00006769,On a pa
       thway.,00006870
       1600 DATA On a path.,65726971,"At a circle of stones, a    druid in w
       hite stops you."
       1610 DATA 00737000,"You see standing stones 20ft high.",70000073,You 
       find some stones here.
       1620 DATA 71007200,"You are at the central alter stone."
       1630 REM >> Instructions <<
       1640 DATA north,south,west,east,up,down,climb,descend,open,unlock
       1650 DATA enter,fix,mend,replace,take,get,attack,kill,destroy,examine
       ,time
       1660 DATA insert,place,put,pay,give,smash,break,inventory
       1670 REM
       1680 REM >> Time routine <<
       1690 MINS=MINS+TIME
       1700 IF MINS>=60 THEN HOUR=HOUR+1 :: MINS=MINS-60


       1710 IF HOUR=12 THEN PRINT :"The evil Sauron is free and Earth is doo
       med.":"You have failed."
       1720 RETURN