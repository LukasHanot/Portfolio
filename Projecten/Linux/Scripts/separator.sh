#!/bin/bash
IFS=$'\n'
bestand="users.csv"
echo "jcelis,Jan Celis" > $bestand
echo "pboedt,Piet Boedt" >> $bestand
for lijn in `cat $bestand`; do echo $lijn;done
