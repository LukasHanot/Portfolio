#!/bin/sh
E=1
while [ $E != 100 ]
do 
echo -n "F\b"
sleep 0.2
echo -n "U\b"
sleep 0.2
echo -n "C\b"
sleep 0.2
echo -n "K\b"
sleep 0.2
E=$E+1
done
read x



