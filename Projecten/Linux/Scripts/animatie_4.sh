#!/bin/bash
E=0
I=1
X=1
K=0
IFS='%'
reset='\e[0m'    # Vergeet NIET te resetten of alles blijft gekleurd!
rood='\e[0;31m' 
blauw='\e[0;34m'
geel='\e[1;33m'
cyan='\e[0;36m'
whotest[0]='test' || (echo 'Failure: arrays not supported in this version of
bash.' && exit 2)
kleuren=($rood
	$blauw
	$geel
	$cyan
	)

read INPUT
LENGTH=${#INPUT}
while [ $E != 20 ]
do 
if [ $K -ge ${#kleuren[@]} ] ; then 
K=0
fi 
while [ $I -le $LENGTH ]
do
LETTER=`echo $INPUT | cut -c$I` #haal de huidige letter uit string
echo -en "${kleuren[$K]}$LETTER$reset"
sleep 0.2
CLEAR="$CLEAR\b" #voegt het aantal backspaces toe om te clearen
I=`expr $I + 1`
done
echo -en "$CLEAR" #spring terug om te overschrijven met spaties
while [ $X -le $LENGTH ]
do
echo -n " "
X=`expr $X + 1`
done
echo -en "$CLEAR" #Spring terug naar de start positie
E=`expr $E + 1`
I=1
X=1
K=`expr $K + 1`
done



