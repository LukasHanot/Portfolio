#!/bin/bash
#
#
REGEX='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:[0-9]+'
lijst=`netstat -tulpn | grep tcp | grep LISTEN`
echo "TCP poorten:"
for txt in $lijst
do
if [[ $txt =~ $REGEX ]]
then
poort=`echo $txt | cut -d ":" -f 2`
echo $poort
fi
done
