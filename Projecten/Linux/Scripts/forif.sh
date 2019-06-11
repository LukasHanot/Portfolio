#!/bin/bash

echo "Gewone gebruikers op het systeem:"
for LINE in `cat /etc/passwd`
do
number=`echo $LINE | cut -d: -f3`
if [ $number -ge 1000 ] 2> /dev/null
then
echo "${number} `echo $LINE | cut -d: -f1`"
fi
done
