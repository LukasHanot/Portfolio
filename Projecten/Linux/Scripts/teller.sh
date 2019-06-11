#!/bin/bash

if [ -z $1 ]
then
teller=12
else
teller=$1
fi


while [ $teller -gt 10 ]
do
let teller=$teller-1
echo -ne "\b\b$teller"
sleep 1
done
while [ $teller -gt 0 ]
do
let teller=$teller-1
echo -ne "\b\b0$teller"
sleep 1
if [ teller -eq 1 ]
then 
teller=$1
fi
done
echo ""
