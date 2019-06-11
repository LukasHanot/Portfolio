#!/bin/sh
E=0
I=1
X=1
K=1
IFS='%'
CLEAR=""
reset='\e[0m'    # Vergeet NIET te resetten of alles blijft gekleurd!
rood='\e[0;31m' 
blauw='\e[0;34m'
geel='\e[0;32m'
kleuren=($rood $blauw $geel)

read INPUT
LENGTH=${#INPUT}
while [ $E != 5 ]
do 
if $K==3 then K=0 
while [ $I -le $LENGTH ]
do
LETTER=`echo $INPUT | cut -c$I`
echo -n "${kleuren[$K]} $LETTER"
sleep 0.2
CLEAR="$CLEAR\b"
I=`expr $I + 1`
done
echo -n "$CLEAR"
while [ $X -le $LENGTH ]
do
echo -n " "
X=`expr $X + 1`
done
echo -n "$reset $CLEAR"
E=`expr $E + 1`
I=1
X=1
done



