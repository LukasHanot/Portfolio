#!/bin/sh
E=1
while [ $E != 100 ]
do 
echo -n "F"
sleep 0.2
echo -n "U"
sleep 0.2
echo -n "C"
sleep 0.2
echo -n "K"
sleep 0.2
echo -n " "
sleep 0.2
echo -n "Y"
sleep 0.2
echo -n "O"
sleep 0.2
echo -n "U"
sleep 0.2
echo -n "\b\b\b\b\b\b\b\b        "
sleep 0.2
echo -n "\b\b\b\b\b\b\b\b"
E=$E+1
done
read x



