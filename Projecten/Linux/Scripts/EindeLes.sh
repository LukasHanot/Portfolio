#!/bin/bash
#Lukas Hanot INF 102A
TELLER=6000
echo "fill in time when this lesson ends as followed (hh:mm)"
INPUT1=$(date "+%Y-%m-%d") #een les gaat nooit tot de volgende dag duren dus de datum is altijd vandaag
read INPUT2 #input van de tijd
INPUT="$INPUT1 $INPUT2" #datum en uur worden samen gevoegd als input voor verder in het script
while [ $TELLER -ge 0 ]
do
TIJD=`date +%s` #het aantal seconden sinds "UNIX epoch" begon
TOTTIJD=`date -d "$INPUT" +%s` #tijdstip einde les
NOGTEGAAN=`expr $TOTTIJD - $TIJD`
INMINUTEN=`expr  $NOGTEGAAN / 60 + 1 `
echo "You'll have to survive for another" $INMINUTEN minutes or $NOGTEGAAN seconds
echo ""
if [ $NOGTEGAAN -le 0 ] #-le = less or equal
then
echo ALARM!! ALARM!! ALARM!!
read x
exit 0
fi
sleep 15
TELLER=`expr $TELLER - 1`
done

