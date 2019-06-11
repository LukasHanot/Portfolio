#!/bin/bash
if [[ ! -z "$1" ]]
then
echo "$1"
PID=`top -b -n 1 | grep "$1" | cut -d' ' -f2`
if [ ! -z $PID ]
then
read -p "Het proces draait wilt u het sluiten? [y/n]" INPUT
if [[ $INPUT =~ ^y || $INPUT =~ ^Y ]]
then
kill $PID
echo "Het proces \"$1\" met PID $PID is gesloten"
fi
else
echo "Het proces \"$1\" bestaat niet"
fi
else
#Lege invoer
echo "Gelieve een parameter in te voeren"
fi
exit 1
