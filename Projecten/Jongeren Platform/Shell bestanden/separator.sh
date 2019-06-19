#!/bin/bash 
OLD_IFS=$"$IFS"
bestand="users.csv" 
echo "jcelis,Jan Celis" > $bestand 
echo "pboedt,Piet Boedt" >> $bestand 
for lijn in `cat $bestand`; do echo $lijn;done 
OLD_IFS="$IFS"
IFS=$'\n'
echo -e "\nGOEDE WEERGAVE"
for lijn in `cat $bestand`; do echo $lijn;done 
IFS="$OLD_IFS"


